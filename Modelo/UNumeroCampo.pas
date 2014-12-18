unit UNumeroCampo;

interface

uses
   Contnrs,

   uRegistro;

type

   TNumeroCampo = class(TRegistro)
      private
         fID               : Integer;
         fCodigo           : String;
         fDescricao        : String;
         procedure SetCodigo(const Value: String);
         procedure SetDescricao(const Value: String);
         procedure SetID(const Value: Integer);
      public
         property ID             : Integer     read fID          write SetID;
         property Descricao      : String      read fDescricao   write SetDescricao;
         property Codigo         : String      read fCodigo      write SetCodigo;
         function Todos : TObjectList;
         function Procurar  ()  : TRegistro;
         constructor create();
   end;


implementation

uses
   UNumeroCampoBD;

{ TNumeroCampo }

constructor TNumeroCampo.create;
begin

end;

function TNumeroCampo.Procurar: TRegistro;
var
   lNumeroCampoBD : TNumeroCampoBD;
begin
   lNumeroCampoBD  := TNumeroCampoBD.Create;
   result          := lNumeroCampoBD.Procurar(self);
   fDescricao      := TNumeroCampo(result).fDescricao;
   fCodigo         := TNumeroCampo(result).fCodigo;
end;

procedure TNumeroCampo.SetCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TNumeroCampo.SetDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TNumeroCampo.SetID(const Value: Integer);
begin
  fID := Value;
end;

function TNumeroCampo.Todos: TObjectList;
var
   lNumeroCampoBD : TNumeroCampoBD;
begin
   lNumeroCampoBD := TNumeroCampoBD.Create;
   result := lNumeroCampoBD.Todos();
end;

end.
