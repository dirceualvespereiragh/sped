unit uControleConfiguracoes;

interface

// a Unit do Controle conhece a View e conhece o Modelo (neste caso uEmpresa)

uses
   Contnrs,  StdCtrls      , SysUtils   , Grids,

   MVCInterfaces, uViewConfiguracoes, uViewInclusao,uEmpresa, uSped,
   uIndicadorOperacoes,uRegistro,UI010, UI100, UCST, uValidar,uExcecao;

type
   TControle = class(TInterfacedObject, IControle)
   private
      fView                       : TViewConfiguracoes;
      fViewInclusao               : TViewInclusao;
      fModelo                     : TEmpresa;
      fModeloSped                 : TSped;
      fModeloIndicadorOperacoes   : TIndicadorOperacoes;
      fModeloI010                 : TI010;
      fModeloI100                 : TI100;
      fModeloCST                  : TCST;
   public
      constructor Create; reintroduce;
      destructor  Destroy; override;
      procedure Initialize;
      procedure ListaEmpresas;
      procedure ListaSped;
      procedure ListaI100;
      procedure TelaIncluiI010;
      procedure TelaIncluiI100;
      procedure Salvar;
      procedure SalvarI100;
      procedure CopiaObjectList(lObjectList : TObjectList;lComboBox : TComboBox; lClasse : TClass);
      procedure LimpaStringGrid(lStringGrid : TStringGrid);
      procedure MontaTelaIncluiI010;
      procedure MontaTelaIncluiI100;
      Procedure MontaCamposTelaIncluiI010(var fcbIdentificadorOperacao : TComboBox;   flIdentificadorOperacao  : TLabel );
      Procedure MontaCamposTelaIncluiI100(var fcbCST : TComboBox;   flCST  : TLabel );
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
   fModeloI100   := TI100.create;
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
   fView.IncluiI100        := TelaIncluiI100;
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
      if lClasse = TCST then
         lComboBox.AddItem(   TCST(lObjectList.Items[x]).Descricao , (TCST(lObjectList.Items[x]) )  );
      inc(x);
   end;
   lComboBox.ItemIndex := 0;
end;


procedure TControle.ListaSped;
var
   lSpeds, lI010s : TObjectList;
   I      : Integer;
begin
   fModeloSped.Empresa.ID :=  ( TEmpresa( fView.cbEmpresa.Items.Objects[fView.cbEmpresa.ItemIndex]).ID);
   lSpeds := TobjectList.create;
   lSpeds := fModeloSped.TodosDaEmpresa;
   LimpaStringGrid(fView.sgI010);
   // Teremos sempre somente um objeto SPED embora a arquitetura permita uma lista
   if ( Assigned(lSpeds)) then begin
      fView.lSpedID.Caption := 'Sped ID ' +   inttostr( TSped(lSpeds[0]).ID);
      fModeloSped.ID        :=  TSped(lSpeds[0]).ID;
      lI010s := TobjectList.create ;
      I      := 0;
      lI010s := TSped(lSpeds[0]).I010s ;
      if ( Assigned(lI010s)) then begin
         fView.sgI010.Cells[0,0] := ' Indicador de Operações ';
         while (I < ( lI010s.Count) ) do begin
            fView.sgI010.Cells[0,1+I]   :=   TI010(lI010s[I]).IndicadorOperacoes.Descricao  ;
            fView.sgI010.Objects[0,1+I] :=   TI010(lI010s[I]);
            inc(I);
         END;
      end;
     // lI010s.Free;
     // lI010s := nil;
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
   I                 : Integer;
   lI100s            : TObjectList;
begin
   // fView.fLinhaSg010 é uma variável na VIEW para passar
   // a linha selecionada não sei se é correto mas não consegui implementar de outra maneira
   FModeloI010 :=  TI010( fView.sgI010.Objects [0,fView.fLinhaSg010] );
   fView.Label1.Caption := inttostr( TI010( fView.sgI010.Objects[0,fView.fLinhaSg010] ).Empresa.id );
   lI100s      := TobjectList.create;
   LimpaStringGrid(fView.sgI100);
   fModeloI100.I010.ID := fModeloI010.ID;
   lI100s      :=   fModeloI100.GetTodosdoI010;
   if ( Assigned(lI100s)) then begin
      fView.sgI100.Cells[0,0] := ' C.S. ';
      I := 0;
      while (I < ( lI100s.Count) ) do begin
         fView.sgI100.Cells[0,1+I]   :=   TI100(lI100s[I]).CST.Descricao;
         fView.sgI100.Objects[0,1+I] :=   TI100(lI100s[I]);
         inc(I);
      end;
   end;
end;

procedure TControle.TelaIncluiI100;
var
   cbCST                   : TComboBox;
   lCST                    : TLabel;
   lCSTs                   : TObjectList;
begin
   fModeloI100.Empresa.ID :=  fModeloSped.Empresa.ID;
   MontaTelaIncluiI100;
   MontaCamposTelaIncluiI100(cbCST,lCST);
   fModeloCST  := TCST.create;
   lCSTs :=  TObjectlist.create;
   lCSTs :=  fModeloCST.Todos;
   cbCST.Clear;
   CopiaObjectList(lCSTs,cbCST,TCST );
   fViewInclusao.ShowModal;
   fViewInclusao.Free  ;
   fViewInclusao := nil;
end;

procedure TControle.MontaTelaIncluiI100;
begin
   fViewInclusao := TViewInclusao.Create(nil);
   fViewInclusao.Initialize;
   fViewInclusao.Salvar    := SalvarI100;
   fViewInclusao.Height := 270;
   fViewInclusao.reTitulo.Clear;
   fViewInclusao.reTitulo.Lines.Add('Registro I100');
   fViewInclusao.reTitulo.Lines.Add('I100 - Consolidação das Operações do Período');
end;

Procedure TControle.MontaCamposTelaIncluiI100(var fcbCST : TComboBox;   flCST  : TLabel );
var
  flAliquotaPIS       : Tlabel;
  flAliquotaCOFINS    : Tlabel;
  feditAliquotaPIS    : TEdit;
  feditAliquotaCOFINS : TEdit;
begin
   flCST := Tlabel.Create (fViewInclusao);
   flCST.Parent :=  fViewInclusao.Panel3;
   flCST.Left   := 32;
   flCST.Top    := 30;
   flCST.Caption :=  'Código de Situação Tributária';
   fcbCST := TComboBox.Create(fViewInclusao);
   fcbCST.Name   := 'cbCST';
   fcbCST.Parent := fViewInclusao.Panel3;
   fcbCST.Left   := 184;
   fcbCST.Top    := 24;
   fcbCST.Width  := 470;

   flAliquotaPIS         := Tlabel.Create (fViewInclusao);
   flAliquotaPIS.Parent  := fViewInclusao.Panel3;
   flAliquotaPIS.Left    := 32;
   flAliquotaPIS.Top     := 80;
   flAliquotaPIS.Caption := 'Alíquota do PIS/PASEP (em percentual)';

   feditAliquotaPIS        := Tedit.Create(fViewInclusao);
   feditAliquotaPIS.Parent := fViewInclusao.Panel3;
   feditAliquotaPIS.Left   := 235;
   feditAliquotaPIS.Top    := 75;
   feditAliquotaPIS.Width  := 90;
   feditAliquotaPIS.Name   := 'editAliquotaPIS';
   feditAliquotaPIS.text   := '';


   flAliquotaCOFINS :=   Tlabel.Create (fViewInclusao);
   flAliquotaCOFINS.Parent := fViewInclusao.Panel3;
   flAliquotaCOFINS.Left   := 344;
   flAliquotaCOFINS.Top    := 80;
   flAliquotaCOFINS.Caption := 'Alíquota da COFINS (em percentual)';


   feditAliquotaCOFINS        := Tedit.Create(fViewInclusao);
   feditAliquotaCOFINS.Parent := fViewInclusao.Panel3;
   feditAliquotaCOFINS.Left   := 530;
   feditAliquotaCOFINS.Top    := 75;
   feditAliquotaCOFINS.Width  := 90;
   feditAliquotaCOFINS.Name   := 'editAliquotaCOFINS';
   feditAliquotaCOFINS.Text   := '';
end;


procedure TControle.SalvarI100;
var
   IndiceSelecionado : integer;
   fValidar          : Tvalidar;
begin
   try
      TValidar.CampoObrigatorio((fViewInclusao.FindComponent('editAliquotaPIS') as TEdit).text,True,'Campo Aliquota PIS obrigatório!', (fViewInclusao.FindComponent('editAliquotaPIS') as TEdit));
      TValidar.CampoObrigatorio((fViewInclusao.FindComponent('editAliquotaCOFINS') as TEdit).text,True,'Campo Aliquota COFINS obrigatório!', (fViewInclusao.FindComponent('editAliquotaCOFINS') as TEdit));
      TValidar.CampoExtend((fViewInclusao.FindComponent('editAliquotaPIS') as TEdit).text,True,'Erro no preenchimento do campo Aliquota PIS!', (fViewInclusao.FindComponent('editAliquotaPIS') as TEdit));
      TValidar.CampoExtend((fViewInclusao.FindComponent('editAliquotaCOFINS') as TEdit).text,True,'Erro no preenchimento co campo Aliquota COFINS!', (fViewInclusao.FindComponent('editAliquotaCOFINS') as TEdit));
      fModeloI100.I010.ID := fModeloI010.ID;
      IndiceSelecionado   := (fViewInclusao.FindComponent('cbCST') as TComboBox).ItemIndex;
      fModeloCST          :=  ( TCST ( (fViewInclusao.FindComponent('cbCST') as TComboBox).Items.Objects[IndiceSelecionado]));
      fModeloI100.CST            :=  fModeloCST;
      fModeloI100.AliquotaPIS    :=  StrToFloat (  (fViewInclusao.FindComponent('editAliquotaPIS') as TEdit).text );
      fModeloI100.AliquotaCOFINS :=  StrToFloat (  (fViewInclusao.FindComponent('editAliquotaCOFINS') as TEdit).text );
      fModeloI100.Inserir();
   except
      on e:TConGeralExcecao do
          Raise
   end;

end;
end.

