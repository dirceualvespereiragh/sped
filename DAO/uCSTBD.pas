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

function TCSTBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TCSTBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TCSTBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TCSTBD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TCSTBD.Todos(): TObjectList;
var
   lCST            : TCST;
   lCSTs           : TObjectList;
begin
   lCSTs := TObjectList.Create;

   lCST := TCST.Create;
   lCST.ID        := 1;
   lCST.Codigo    := '01';
   lCST.Descricao :=  'Opera��o Tribut�vel com Al�quota B�sica';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 2;
   lCST.Codigo    := '02';
   lCST.Descricao :=  'Opera��o Tribut�vel com Al�quota Diferenciada';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 4;
   lCST.Codigo    := '04';
   lCST.Descricao :=  'Opera��o Tribut�vel Monof�sica - Revenda a Al�quota Zero';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 5;
   lCST.Codigo    := '05';
   lCST.Descricao :=  'Opera��o Tribut�vel por Substitui��o Tribut�ria';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 6;
   lCST.Codigo    := '06';
   lCST.Descricao :=  'Opera��o Tribut�vel a Al�quota Zero';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 7;
   lCST.Codigo    := '07';
   lCST.Descricao :=  'Opera��o Isenta da Contribui��o';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 8;
   lCST.Codigo    := '08';
   lCST.Descricao :=  'Opera��o sem Incid�ncia da Contribui��o';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 9;
   lCST.Codigo    := '09';
   lCST.Descricao :=  'Opera��o com Suspens�o da Contribui��o';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 49;
   lCST.Codigo    := '49';
   lCST.Descricao :=  'Outras Opera��es de Sa�da';
   lCSTs.Add(lCST);
   lCST := TCST.Create;
   lCST.ID        := 99;
   lCST.Codigo    := '99';
   lCST.Descricao :=  'Outras Opera��es';
   lCSTs.Add(lCST);
   result :=  lCSTs;

end;

end.

