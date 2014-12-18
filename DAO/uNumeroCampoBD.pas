unit uNumeroCampoBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD  ;

type
   TNumeroCampoBD = class(TRegistroBD)
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
   uNumeroCampo;

function TNumeroCampoBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TNumeroCampoBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TNumeroCampoBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TNumeroCampoBD.Procurar(const oRegistro: TRegistro): TRegistro;
var
   lNumeroCampos           : TObjectList;
   I : Integer;
begin
   lNumeroCampos := TObjectList.Create;
   lNumeroCampos := Todos;
   lNumeroCampos.First;
   I := 0;
   result := nil;
   while (I < lNumeroCampos.Count) do begin
      if  ( TNumeroCampo(oRegistro).ID = (TNumeroCampo(lNumeroCampos[I]).ID) ) then begin
         result :=   TNumeroCampo(lNumeroCampos[I]);
         I :=  lNumeroCampos.Count;
      end;
      inc(I);
   end;
end;

function TNumeroCampoBD.Todos(): TObjectList;
var
   lNumeroCampo            : TNumeroCampo;
   lNumeroCampos           : TObjectList;
begin
   lNumeroCampos := TObjectList.Create;

   lNumeroCampo := TNumeroCampo.Create;
   lNumeroCampo.ID        := 2;
   lNumeroCampo.Codigo    := '02';
   lNumeroCampo.Descricao :=  'Receitas';
   lNumeroCampos.Add(lNumeroCampo);
   lNumeroCampo := TNumeroCampo.Create;
   lNumeroCampo.ID        := 4;
   lNumeroCampo.Codigo    := '04';
   lNumeroCampo.Descricao :=  'Deduções e Exclusões Gerais';
   lNumeroCampos.Add(lNumeroCampo);
   lNumeroCampo := TNumeroCampo.Create;
   lNumeroCampo.ID        := 5;
   lNumeroCampo.Codigo    := '05';
   lNumeroCampo.Descricao :=  'Deduçõs e Exclusões Específicas';
   lNumeroCampos.Add(lNumeroCampo);
   result :=  lNumeroCampos;
end;

end.

