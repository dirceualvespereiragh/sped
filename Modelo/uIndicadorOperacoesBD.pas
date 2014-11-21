unit uIndicadorOperacoesBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD  ;

type
   TIndicadorOperacoesBD = class(TRegistroBD)
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
   uIndicadorOperacoes;

function TIndicadorOperacoesBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TIndicadorOperacoesBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TIndicadorOperacoesBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TIndicadorOperacoesBD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TIndicadorOperacoesBD.Todos(): TObjectList;
var
   lIndicadorOperacoes                : TIndicadorOperacoes;
   lListaIndicadorOperacoes           : TObjectList;
begin
   lListaIndicadorOperacoes := TObjectList.Create;

   lIndicadorOperacoes := TCST.Create;
   lIndicadorOperacoes.ID        := 1;
   lIndicadorOperacoes.Codigo    := '01';
   lIndicadorOperacoes.Descricao :=  'Exclusivamente operações de Instituições Financeiras e Assemelhadas';
   lListaIndicadorOperacoes.add( lIndicadorOperacoes);
   lIndicadorOperacoes := TCST.Create;
   lIndicadorOperacoes.ID        := 2;
   lIndicadorOperacoes.Codigo    := '02';
   lIndicadorOperacoes.Descricao :=  'Exclusivamente operações de Seguros Privados';
   lListaIndicadorOperacoes.add( lIndicadorOperacoes);
   lIndicadorOperacoes := TCST.Create;
   lIndicadorOperacoes.ID        := 3;
   lIndicadorOperacoes.Codigo    := '03';
   lIndicadorOperacoes.Descricao :=  'Exclusivamente operações de Previdência Complementar';
   lListaIndicadorOperacoes.add( lIndicadorOperacoes);
   lIndicadorOperacoes := TCST.Create;
   lIndicadorOperacoes.ID        := 4;
   lIndicadorOperacoes.Codigo    := '04';
   lIndicadorOperacoes.Descricao :=  'Exclusivamente operações de Capitalização';
   lListaIndicadorOperacoes.add( lIndicadorOperacoes);
   lIndicadorOperacoes := TCST.Create;
   lIndicadorOperacoes.ID        := 5;
   lIndicadorOperacoes.Codigo    := '05';
   lIndicadorOperacoes.Descricao :=  'Exclusivamente operações de Planos de Assistência à Saúde';
   lListaIndicadorOperacoes.add( lIndicadorOperacoes);
   lIndicadorOperacoes := TCST.Create;
   lIndicadorOperacoes.ID        := 6;
   lIndicadorOperacoes.Codigo    := '06';
   lIndicadorOperacoes.Descricao :=  'Realizou operações referentes a mais de um dos indicadores acima';
   lListaIndicadorOperacoes.add( lIndicadorOperacoes);

end;

end.

