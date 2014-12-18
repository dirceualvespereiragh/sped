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
   lTipoDetalhamento.Descricao :=  'Contrapresta��es L�quidas / Pr�mios Retidos';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 2;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0502';
   lTipoDetalhamento.Descricao :=  'Varia��o das Provis�es T�cnicas de Opera��es de Assist�ncia � Sa�de � Revers�o';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 3;
   lTipodetalhamento.NumeroCampo.ID := 2  ;
   lTipoDetalhamento.Codigo    := 'R0503';
   lTipoDetalhamento.Descricao :=  'Receitas com Administra��o de Planos de Assist�ncia � Sa�de';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 4;
   lTipodetalhamento.NumeroCampo.ID := 2  ;
   lTipoDetalhamento.Codigo    := 'R0505';
   lTipoDetalhamento.Descricao :=  'Receitas com Resseguro';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 5;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0506';
   lTipoDetalhamento.Descricao :=  'Receitas Financeiras';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 6;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0507';
   lTipoDetalhamento.Descricao :=  'Receitas Patrimoniais';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 7;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0508';
   lTipoDetalhamento.Descricao :=  'Outras Receitas N�o Operacionais';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   
   lTipoDetalhamento.ID        := 8;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0512';
   lTipoDetalhamento.Descricao :=  'Outras Receitas Operacionais de Planos de Assist�ncia � Sa�de';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 9;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0598';
   lTipoDetalhamento.Descricao :=  'Ajustes Negativos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 10;
   lTipodetalhamento.NumeroCampo.ID := 2 ;
   lTipoDetalhamento.Codigo    := 'R0599';
   lTipoDetalhamento.Descricao :=  'Ajustes Positivos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 11;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0601';
   lTipoDetalhamento.Descricao :=  'Receita da Securitiza��o de Cr�ditos Imobili�rios';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 12;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0602';
   lTipoDetalhamento.Descricao :=  'Receita da Securitiza��o de Cr�ditos Financeiros';
   lTipoDetalhamentos.Add(lTipoDetalhamento);


   lTipoDetalhamento.ID        := 13;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0603';
   lTipoDetalhamento.Descricao :=  'Receita da Securitiza��o de Cr�ditos Agr�colas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);


   lTipoDetalhamento.ID        := 14;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0604';
   lTipoDetalhamento.Descricao :=  'Outras Receitas da Atividade';
   lTipoDetalhamentos.Add(lTipoDetalhamento);


   lTipoDetalhamento.ID        := 15;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0605';
   lTipoDetalhamento.Descricao :=  'Receitas N�o Operacionais';
   lTipoDetalhamentos.Add(lTipoDetalhamento);


   lTipoDetalhamento.ID        := 16;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0698';
   lTipoDetalhamento.Descricao :=  'Ajustes Negativos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);


   lTipoDetalhamento.ID        := 17;
   lTipodetalhamento.NumeroCampo.ID := 2;
   lTipoDetalhamento.Codigo    := 'R0699';
   lTipoDetalhamento.Descricao :=  'Ajustes Positivos de Receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 18;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0001';
   lTipoDetalhamento.Descricao :=  'Revers�es de provis�es';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 19;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0002';
   lTipoDetalhamento.Descricao :=  'Recupera��es de cr�ditos baixados como perda, limitados aos valores efetivamente baixados, que n�o representem ingresso de novas receitas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 20;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0003';
   lTipoDetalhamento.Descricao :=  'Resultado positivo da avalia��o de investimentos pelo valor do patrim�nio l�quido';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 21;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0004';
   lTipoDetalhamento.Descricao :=  'Lucros e dividendos derivados de investimentos avaliados pelo custo de aquisi��o, que tenham sido computados como receita';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 22;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0005';
   lTipoDetalhamento.Descricao :=  'Receita decorrente da venda de bens do ativo permanente';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 23;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0006';
   lTipoDetalhamento.Descricao :=  'Vendas canceladas, os descontos incondicionais concedidos, e o IPI e ICMS quando cobrado pelo vendedor dos bens ou prestador dos servi�os na condi��o de substituto tribut�rio';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 24;
   lTipodetalhamento.NumeroCampo.ID := 4;
   lTipoDetalhamento.Codigo    := 'D0090';
   lTipoDetalhamento.Descricao :=  'Outras dedu��es e exclus�es de car�ter geral';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 25;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0601';
   lTipoDetalhamento.Descricao :=  'Co-responsabilidades cedidas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 26;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0602';
   lTipoDetalhamento.Descricao :=  'Parcela das contrapresta��es pecuni�rias destinada � constitui��o de provis�es t�cnicas';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 27;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0603';
   lTipoDetalhamento.Descricao :=  'Valor referente �s indeniza��es correspondentes aos eventos ocorridos, efetivamente pago, deduzido das import�ncias recebidas a t�tulo de transfer�ncia de responsabilidades';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 28;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0690';
   lTipoDetalhamento.Descricao :=  'Outras dedu��es e exclus�es de car�ter espec�fico';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 29;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0698';
   lTipoDetalhamento.Descricao :=  'Ajustes Negativos das dedu��es e exclus�es de car�ter espec�fico';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   lTipoDetalhamento.ID        := 30;
   lTipodetalhamento.NumeroCampo.ID := 5;
   lTipoDetalhamento.Codigo    := 'D0699';
   lTipoDetalhamento.Descricao :=  'Ajustes Positivos das dedu��es e exclus�es de car�ter espec�fico';
   lTipoDetalhamentos.Add(lTipoDetalhamento);

   result :=  lTipoDetalhamentos;
end;

end.

