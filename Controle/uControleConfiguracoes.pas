unit uControleConfiguracoes;

interface

// a Unit do Controle conhece a View e conhece o Modelo (neste caso uEmpresa)

uses
   Contnrs,  StdCtrls      , SysUtils   , Grids,

   MVCInterfaces, uViewConfiguracoes, uViewInclusao,uEmpresa, uSped, uIndicadorOperacoes,uRegistro,UI010;

type
   TControle = class(TInterfacedObject, IControle)
   private
      fView                       : TViewConfiguracoes;
      fViewInclusao               : TViewInclusao;
      fModelo                     : TEmpresa;
      fModeloSped                 : TSped;
      fModeloIndicadorOperacoes   : TIndicadorOperacoes;
      fModeloI010                 : TI010;
   public
      constructor Create; reintroduce;
      destructor  Destroy; override;
      procedure Initialize;
      procedure ListaEmpresas;
      procedure ListaSped;
      procedure IncluiI010;
      procedure  Salvar;
      procedure CopiaObjectList(lObjectList : TObjectList;lComboBox : TComboBox; lClasse : TClass);
      procedure LimpaStringGrid(lStringGrid : TStringGrid);
   end;

implementation

procedure TControle.ListaEmpresas;
var
   lEmpresas : TObjectList;
begin
   lEmpresas :=  TObjectlist.create;
   lEmpresas :=  fModelo.Todos;
   fView.cbEmpresa.Clear;
   CopiaObjectList(lEmpresas,fView.cbEmpresa, TEmpresa);
end;

constructor TControle.Create;
begin
   fModelo       := TEmpresa.Create;
   fModeloSped   := TSped.create;
   fModeloI010   := TI010.create;
   FView         := TViewConfiguracoes.Create(nil);

end;

destructor TControle.Destroy;
begin
   FView.Free;
   inherited;
end;

procedure TControle.Initialize;
begin
   FView.Modelo            := fModelo;
   fModelo.OnModeloMudou   := FView.ModeloMudou;
   FView.DoLista           := ListaSped;
   fView.IncluiI010        := IncluiI010;
   ListaEmpresas;
   FView.Initialize;
   FView.ShowModal;
   fView.Free;
   fView := nil;
   // precisa estudar para saber se assim esta correto como limpar a memoria
end;


procedure TControle.CopiaObjectList(lObjectList: TObjectList; lComboBox: TComboBox; lClasse : TClass );
var
   x         : Integer;
begin
   lComboBox.Clear;
   x := 0;
   while (x < (lObjectList.Count) ) do begin
      if lClasse =  TEmpresa then
         lComboBox.AddItem(   TEmpresa( lObjectList.Items[x] ).nome , (TEmpresa(lObjectList.Items[x]) )  );
      if lClasse =  TIndicadorOperacoes then
         lComboBox.AddItem(   TIndicadorOperacoes(lObjectList.Items[x]).Descricao , (TIndicadorOperacoes(lObjectList.Items[x]) )  );

      inc(x);
   end;
   lComboBox.ItemIndex := 0;
end;


procedure TControle.ListaSped;
var
   lSpeds, lI010            : TObjectList;
   I ,IndiceSelecionado     : Integer;
begin
   fModeloSped.Empresa.ID :=  ( TEmpresa( fView.cbEmpresa.Items.Objects[fView.cbEmpresa.ItemIndex]).ID);

   lSpeds := TobjectList.create;
   lSpeds := fModeloSped.TodosDaEmpresa;
   LimpaStringGrid(fView.sgI010);
   if ( Assigned(lSpeds)) then begin
      fModeloSped.ID :=  TSped(lSpeds[0]).ID;
      lI010 := TobjectList.create ;
      I := 0;
      lI010 :=  TSped(lSpeds[0]).I010s ;
      if ( Assigned(lI010)) then begin
         while (I < ( lI010.Count) ) do begin
            fView.sgI010.Cells[1+I,1] :=   TI010(lI010[I]).IndicadorOperacoes.Descricao;
            inc(I);
         END;
      end;
      lI010.Free;
      lI010 := nil;
   End;
   lSpeds.free;
   lSpeds := nil;
end;

procedure TControle.LimpaStringGrid(lStringGrid: TStringGrid);
var
   i : integer;
begin
   for I := 0 to lStringGrid.RowCount -1 do
      lStringGrid.Rows[I].Clear;
end;

procedure TControle.IncluiI010;
var
   cbIdentificadorOperacao : TComboBox;
   lIdentificadorOperacao  : TLabel;
   lIndicadorOperacoes     : TObjectList;
begin
   fModeloI010.Empresa.ID :=  fModeloSped.Empresa.ID;
   fViewInclusao := TViewInclusao.Create(nil);
   fViewInclusao.Initialize;
   fViewInclusao.Salvar    := Salvar;
   fViewInclusao.Height := 270;
   fViewInclusao.reTitulo.Clear;
   fViewInclusao.reTitulo.Lines.Add('Registro I010');
   fViewInclusao.reTitulo.Lines.Add('I010 - Identificação do Estabelecimento');
   lIdentificadorOperacao := Tlabel.Create (fViewInclusao);
   lIdentificadorOperacao.Parent :=  fViewInclusao.Panel3;
   lIdentificadorOperacao.Left   := 40;
   lIdentificadorOperacao.Top    := 55;
   lIdentificadorOperacao.Caption :=  'Identificador de Operações realizadas no período';
   cbIdentificadorOperacao := TComboBox.Create(fViewInclusao);
   cbIdentificadorOperacao.Name   := 'cbIdentificadorOperacao';
   cbIdentificadorOperacao.Parent := fViewInclusao.Panel3;
   cbIdentificadorOperacao.Left   := 288;
   cbIdentificadorOperacao.Top    := 52;
   cbIdentificadorOperacao.Width  := 470;
   fModeloIndicadorOperacoes := TIndicadorOperacoes.create;
   lIndicadorOperacoes :=  TObjectlist.create;
   lIndicadorOperacoes :=  fModeloIndicadorOperacoes.Todos;
   cbIdentificadorOperacao.Clear;
   CopiaObjectList(lIndicadorOperacoes,cbIdentificadorOperacao,TIndicadorOperacoes );
   fViewInclusao.ShowModal;
   fViewInclusao.Free  ;
   fViewInclusao := nil;
end;

procedure TControle.Salvar;
var
   IndiceSelecionado : integer;
   lSpeds            : TObjectList;
begin
   IndiceSelecionado         := (fViewInclusao.FindComponent('cbIdentificadorOperacao') as TComboBox).ItemIndex;
   fModeloIndicadorOperacoes :=  ( TIndicadorOperacoes ( (fViewInclusao.FindComponent('cbIdentificadorOperacao') as TComboBox).Items.Objects[IndiceSelecionado]));
   fModeloI010.IndicadorOperacoes :=  fModeloIndicadorOperacoes;
   fModeloI010.Sped               := fModeloSped.ID;   
   // Verificar se o SPED da Empresa esta gravado
   if (not  Assigned(fModeloSped.Procurar() ) )then begin
      fModeloSped.inserir();
   end;

   fModeloI010.Inserir();
end;

end.
