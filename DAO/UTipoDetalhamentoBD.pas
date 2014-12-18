unit UTipoDetalhamentoBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD  ;

type
   TTipoDetalhamentoBD = class(TRegistroBD)
      private

      public
         function Inserir           (const oRegistro : TRegistro) : Boolean;      override;
         function Alterar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Deletar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Procurar          (const oRegistro : TRegistro) : TRegistro;    override;
         function Todos             ()                            : TObjectList;  override ;
         function TodosDoNumeroCampo(const oRegistro : TRegistro) : TObjectList;

   end;

implementation

uses
   uTipoDetalhamento, uNumeroCampo;

function TTipoDetalhamentoBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TTipoDetalhamentoBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TTipoDetalhamentoBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TTipoDetalhamentoBD.Procurar(const oRegistro: TRegistro): TRegistro;
var
   lTipoDetalhamentos           : TObjectList;
   I : Integer;
begin
   lTipoDetalhamentos := TObjectList.Create;
   lTipoDetalhamentos := Todos;
   lTipoDetalhamentos.First;
   I := 0;
   result := nil;
   while (I < lTipoDetalhamentos.Count) do begin
      if  ( TTipoDetalhamento(oRegistro).ID = (TTipoDetalhamento(lTipoDetalhamentos[I]).ID) ) then begin
         result :=   TTipoDetalhamento(lTipoDetalhamentos[I]);
         I :=  lTipoDetalhamentos.Count;
      end;
      inc(I);
   end;
end;

function TTipoDetalhamentoBD.Todos(): TObjectList;
var
   lTipoDetalhamento            : TTipoDetalhamento;
   lTipoDetalhamentos           : TObjectList;
begin
   lTipoDetalhamentos := TObjectList.Create;

   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 1;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0501';
   lTipoDetalhamento.Descricao :=  'Contraprestações Líquidas / Prêmios Retidos';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 2;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0502';
   lTipoDetalhamento.Descricao :=  'Variação das Provisões Técnicas de Operações de Assistência à Saúde – Reversão';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 3;
   lTipodetalhamento.NumeroCampo.ID := 2  ;
   lTipoDetalhamento.Codigo    := 'R0503';
   lTipoDetalhamento.Descricao :=  'Receitas com Administração de Planos de Assistência à Saúde';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 4;
   lTipodetalhamento.NumeroCampo.ID := 2  ;
   lTipoDetalhamento.Codigo    := 'R0505';
   lTipoDetalhamento.Descricao :=  'Receitas com Resseguro';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 5;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0506';
   lTipoDetalhamento.Descricao :=  'Receitas Financeiras';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 6;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0507';
   lTipoDetalhamento.Descricao :=  'Receitas Patrimoniais';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 7;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0508';
   lTipoDetalhamento.Descricao :=  'Outras Receitas Não Operacionais';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;

   lTipoDetalhamento.ID        := 8;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0512';
   lTipoDetalhamento.Descricao :=  'Outras Receitas Operacionais de Planos de Assistência à Saúde';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 9;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0598';
   lTipoDetalhamento.Descricao :=  'Ajustes Negativos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 10;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0599';
   lTipoDetalhamento.Descricao :=  'Ajustes Positivos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 11;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0601';
   lTipoDetalhamento.Descricao :=  'Receita da Securitização de Créditos Imobiliários';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 12;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0602';
   lTipoDetalhamento.Descricao :=  'Receita da Securitização de Créditos Financeiros';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;

   lTipoDetalhamento.ID        := 13;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0603';
   lTipoDetalhamento.Descricao :=  'Receita da Securitização de Créditos Agrícolas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 14;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0604';
   lTipoDetalhamento.Descricao :=  'Outras Receitas da Atividade';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 15;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0605';
   lTipoDetalhamento.Descricao :=  'Receitas Não Operacionais';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 16;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0698';
   lTipoDetalhamento.Descricao :=  'Ajustes Negativos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 17;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0699';
   lTipoDetalhamento.Descricao :=  'Ajustes Positivos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 18;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0001';
   lTipoDetalhamento.Descricao :=  'Reversões de provisões';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 19;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0002';
   lTipoDetalhamento.Descricao :=  'Recuperações de créditos baixados como perda, limitados aos valores efetivamente baixados, que não representem ingresso de novas receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 20;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0003';
   lTipoDetalhamento.Descricao :=  'Resultado positivo da avaliação de investimentos pelo valor do patrimônio líquido';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 21;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0004';
   lTipoDetalhamento.Descricao :=  'Lucros e dividendos derivados de investimentos avaliados pelo custo de aquisição, que tenham sido computados como receita';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 22;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0005';
   lTipoDetalhamento.Descricao :=  'Receita decorrente da venda de bens do ativo permanente';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 23;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0006';
   lTipoDetalhamento.Descricao :=  'Vendas canceladas, os descontos incondicionais concedidos, e o IPI e ICMS quando cobrado pelo vendedor dos bens ou prestador dos serviços na condição de substituto tributário';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 24;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0090';
   lTipoDetalhamento.Descricao :=  'Outras deduções e exclusões de caráter geral';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 25;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0601';
   lTipoDetalhamento.Descricao :=  'Co-responsabilidades cedidas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 26;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0602';
   lTipoDetalhamento.Descricao :=  'Parcela das contraprestações pecuniárias destinada à constituição de provisões técnicas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 27;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0603';
   lTipoDetalhamento.Descricao :=  'Valor referente às indenizações correspondentes aos eventos ocorridos, efetivamente pago, deduzido das importâncias recebidas a título de transferência de responsabilidades';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 28;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0690';
   lTipoDetalhamento.Descricao :=  'Outras deduções e exclusões de caráter específico';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 29;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0698';
   lTipoDetalhamento.Descricao :=  'Ajustes Negativos das deduções e exclusões de caráter específico';
   lTipoDetalhamentos.Add(lTipoDetalhamento);
   lTipoDetalhamento := TTipoDetalhamento.Create;
   lTipoDetalhamento.ID        := 30;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0699';
   lTipoDetalhamento.Descricao :=  'Ajustes Positivos das deduções e exclusões de caráter específico';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   result :=  lTipoDetalhamentos;
end;

function TTipoDetalhamentoBD.TodosDoNumeroCampo(const oRegistro: TRegistro): TObjectList;
var
   lTipoDetalhamentos                : TObjectList;
   lTiposDetalhamentosDoNumeroCampo  : TObjectList;
   I,x : Integer;
begin
   lTiposDetalhamentosDoNumeroCampo  := TObjectList.Create;

   lTipoDetalhamentos                := TObjectList.Create;
   lTipoDetalhamentos := Todos;
   lTipoDetalhamentos.First;
   I := 0;
   result := nil;
   while (I < lTipoDetalhamentos.Count) do begin
      x :=  (TTipoDetalhamento(lTipoDetalhamentos[I]).ID) ;
      if  (  TTipoDetalhamento(oRegistro).NumeroCampo.ID = (TTipoDetalhamento(lTipoDetalhamentos[I]).NumeroCampo.ID) ) then begin
         lTiposDetalhamentosDoNumeroCampo.Add(  TTipoDetalhamento(lTipoDetalhamentos[I]) );
      end;
      inc(I);
   end;
   result :=  lTiposDetalhamentosDoNumeroCampo ;
end;
end.

