unit uEmpresa;

interface

// O Modelo não precisa conhecer ninguem
// Ai esta o interessante do MVC.
// Desta forma o modelo fica desacoplado e podendo ser utilizado por vários controles

uses
   Contnrs,            //  <--  Nesta Unit está implementado TObjectList

   MVCInterfaces,uRegistro,uContador;

type
   TEmpresa = class(TRegistro)
      private
         fID              : Integer;   // Toda chave primaria nossa no banco dentro do objeto vai chamar ID
         fNome            : String;
         fContador        : TContador;
         FOnModeloMudou: TModeloMudou;
         fCNPJ: String;
         procedure SetContador(const Value: Tcontador);
         procedure SetID(const Value: Integer);
         procedure SetNome(const Value: String);
         procedure SetOnModeloMudou(const Value: TModeloMudou);
         procedure SetCNPJ(const Value: String);
      public
         property ID             : Integer     read fID       write SetID;
         property Nome           : String      read fNome     write SetNome;
         property CNPJ           : String      read fCNPJ     write SetCNPJ;
         property Contador       : Tcontador   read fContador write SetContador;
         //property OnModeloMudou: TModeloMudou read GetOnModeloMudou write SetOnModeloMudou; // Precisa ver se assim funciona em versões mais novas de Delphi
         property OnModeloMudou: TModeloMudou read FOnModeloMudou write SetOnModeloMudou;      // Assim funcionou em Delphi 7

         function Todos : TObjectList;
         class function GetEmpresa() : TEmpresa;
         constructor create();
   end;

implementation

uses
   UEmpresaBD;
{ TEmpresa }

var
   fEmpresa:TEmpresa = nil;

constructor TEmpresa.create;
begin
   fContador := TContador.create;
end;


class function TEmpresa.GetEmpresa: TEmpresa;
begin
   if (not Assigned(fEmpresa)) then begin
      fEmpresa := create();
   end;
   result := fEmpresa;
end;

procedure TEmpresa.SetCNPJ(const Value: String);
begin
  fCNPJ := Value;
end;

procedure TEmpresa.SetContador(const Value: Tcontador);
begin
  fContador := Value;
end;

procedure TEmpresa.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TEmpresa.SetNome(const Value: String);
begin
  fNome := Value;
end;

procedure TEmpresa.SetOnModeloMudou(const Value: TModeloMudou);
begin
  FOnModeloMudou := Value;
end;


function TEmpresa.Todos: TObjectList;
var
   lEmpresaBD : TEmpresaBD;
begin
   lEmpresaBD := TEmpresaBD.Create;
   result := lEmpresaBD.Todos();
end;

end.
