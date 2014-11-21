unit uCSTBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD  ;

type
   TCSTBD = class(TRegistroBD)
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
   uCST;

function TEmpresaBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TEmpresaBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TEmpresaBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TEmpresaBD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TEmpresaBD.Todos(): TObjectList;
var
   lCST            : TCST;
   lCSTs           : TObjectList;
begin
   lCSTs := TObjectList.Create;

   lCST := TCST.Create;
   lCST.ID        := 1;
   lCST.Codigo    := '01';
   lCST.Descricao :=  'Operação Tributável com Alíquota Básica';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 2;
   lCST.Codigo    := '02';
   lCST.Descricao :=  'Operação Tributável com Alíquota Diferenciada';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 4;
   lCST.Codigo    := '04';
   lCST.Descricao :=  'Operação Tributável Monofásica - Revenda a Alíquota Zero';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 5;
   lCST.Codigo    := '05';
   lCST.Descricao :=  'Operação Tributável por Substituição Tributária';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 6;
   lCST.Codigo    := '06';
   lCST.Descricao :=  'Operação Tributável a Alíquota Zero';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 7;
   lCST.Codigo    := '07';
   lCST.Descricao :=  'Operação Isenta da Contribuição';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 8;
   lCST.Codigo    := '08';
   lCST.Descricao :=  'Operação sem Incidência da Contribuição';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 9;
   lCST.Codigo    := '09';
   lCST.Descricao :=  'Operação com Suspensão da Contribuição';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 49;
   lCST.Codigo    := '49';
   lCST.Descricao :=  'Outras Operações de Saída';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 99;
   lCST.Codigo    := '99';
   lCST.Descricao :=  'Outras Operações';
   lCSTs.Add(lCST);


end;

end.

