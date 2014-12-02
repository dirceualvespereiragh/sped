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
      procedure ListaI100;
      procedure TelaIncluiI010;
      procedure  Salvar;
      procedure CopiaObjectList(lObjectList : TObjectList;lComboBox : TComboBox; lClasse : TClass);
      procedure LimpaStringGrid(lStringGrid : TStringGrid);
      procedure MontaTelaIncluiI010;
      Procedure MontaCamposTelaIncluiI010(var fcbIdentificadorOperacao : TComboBox;   flIdentificadorOperacao  : TLabel );
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
   fView.ModeloI010        := fModeloI010;
   fModelo.OnModeloMudou   := FView.ModeloMudou;
   FView.DoLista           := ListaSped;
   FView.DoListaI100       := ListaI100;
   fView.IncluiI010        := TelaIncluiI010;
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
   lSpeds, lI010 : TObjectList;
   I      : Integer;
begin
   fModeloSped.Empresa.ID :=  ( TEmpresa( fView.cbEmpresa.Items.Objects[fView.cbEmpresa.ItemIndex]).ID);
   lSpeds := TobjectList.create;
   lSpeds := fModeloSped.TodosDaEmpresa;
   LimpaStringGrid(fView.sgI010);
   // Teremos sempre somente um objeto SPED embora a arquitetura permita uma lista
   if ( Assigned(lSpeds)) then begin
      lI010 := TobjectList.create ;
      I := 0;
      lI010 :=  TSped(lSpeds[0]).I010s ;
      fView.lSpedID.Caption := 'Sped ID ' +   inttostr( TSped(lSpeds[0]).ID);
      fModeloSped.ID :=  TSped(lSpeds[0]).ID;
      if ( Assigned(lI010)) then begin
         fView.sgI010.Cells[0,0] := ' Indicador de Operações ';
         while (I < ( lI010.Count) ) do begin
            fView.sgI010.Cells[0,1+I]   :=                inttostr(TI010(lI010[I]).ID); // TI010(lI010[I]).IndicadorOperacoes.Descricao;
            fView.sgI010.Objects[0,1+I] :=   TI010(lI010[I]);

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

procedure TControle.TelaIncluiI010;
var
   cbIdentificadorOperacao : TComboBox;
   lIdentificadorOperacao  : TLabel;
   lIndicadorOperacoes     : TObjectList;
begin
   fModeloI010.Empresa.ID :=  fModeloSped.Empresa.ID;
   MontaTelaIncluiI010;
   MontaCamposTelaIncluiI010(cbIdentificadorOperacao,lIdentificadorOperacao);
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


procedure TControle.MontaTelaIncluiI010;
begin
   fViewInclusao := TViewInclusao.Create(nil);
   fViewInclusao.Initialize;
   fViewInclusao.Salvar    := Salvar;
   fViewInclusao.Height := 270;
   fViewInclusao.reTitulo.Clear;
   fViewInclusao.reTitulo.Lines.Add('Registro I010');
   fViewInclusao.reTitulo.Lines.Add('I010 - Identificação do Estabelecimento');
end;

procedure TControle.MontaCamposTelaIncluiI010(
  var fcbIdentificadorOperacao: TComboBox; flIdentificadorOperacao: TLabel);
begin
   flIdentificadorOperacao := Tlabel.Create (fViewInclusao);
   flIdentificadorOperacao.Parent :=  fViewInclusao.Panel3;
   flIdentificadorOperacao.Left   := 40;
   flIdentificadorOperacao.Top    := 55;
   flIdentificadorOperacao.Caption :=  'Identificador de Operações realizadas no período';
   fcbIdentificadorOperacao := TComboBox.Create(fViewInclusao);
   fcbIdentificadorOperacao.Name   := 'cbIdentificadorOperacao';
   fcbIdentificadorOperacao.Parent := fViewInclusao.Panel3;
   fcbIdentificadorOperacao.Left   := 288;
   fcbIdentificadorOperacao.Top    := 52;
   fcbIdentificadorOperacao.Width  := 470;

end;

procedure TControle.ListaI100;
var
   IndiceSelecionado : integer;
   lSpeds            : TObjectList;
begin
   fView.sgI100.Cells[0,1] :=  inttostr(fModeloI010.IndicadorOperacoes.ID );
end;

end.
