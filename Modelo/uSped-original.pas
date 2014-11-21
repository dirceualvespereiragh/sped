unit uSped;

interface

uses
   Contnrs,            //  <--  Nesta Unit está implementado TObjectList

   MVCInterfaces,uRegistro,uEmpresa;

type
   TSped = class(TRegistro)
      private
         fID              : Integer;
         FOnModeloMudou: TModeloMudou;
         fEmpresa: TEmpresa;
         fI010: TObjectList;
         procedure SetEmpresa(const Value: TEmpresa);
         procedure SetI010(const Value: TObjectList);
         procedure SetID(const Value: Integer);
         procedure SetOnModeloMudou(const Value: TModeloMudou);
      public
         property ID                : Integer     read fID                 write SetID;
         property Empresa           : TEmpresa    read fEmpresa            write SetEmpresa;
         property I010              : TObjectList read fI010               write SetI010;
         property OnModeloMudou: TModeloMudou read FOnModeloMudou write SetOnModeloMudou;      // Assim funcionou em Delphi 7
         function TodosDaEmpresa : TObjectList;
         function inserir()  : Boolean; 
         constructor create();
   end;

implementation

Uses
uSpedBD;
{ TSped }

constructor TSped.create;
begin
   Empresa := TEmpresa.create;
   I010    := TObjectList.create;
end;

function TSped.inserir: Boolean;
var
   lSpedBD : TSpedBD;
begin
   lSpedBD := TSpedBD.Create;
   result := lSpedBD.Inserir(self);
   lSpedBD.Free;
   lSpedBD := nil;
end;


procedure TSped.SetEmpresa(const Value: TEmpresa);
begin
  fEmpresa := Value;
end;

procedure TSped.SetI010(const Value: TObjectList);
begin
  fI010 := Value;
end;

procedure TSped.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TSped.SetOnModeloMudou(const Value: TModeloMudou);
begin
  FOnModeloMudou := Value;
end;

function TSped.TodosDaEmpresa: TObjectList;
var
   lSpedBD : TSpedBD;
begin
   lSpedBD := TSpedBD.Create;
   result := lSpedBD.TodosDaEmpresa(self);
   lSpedBD.Free;
   lSpedBD := nil;
end;

end.
