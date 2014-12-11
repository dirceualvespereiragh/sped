unit uCST;

interface

uses
   Contnrs,

   uRegistro;

type

   TCST = class(TRegistro)
      private
         fID              : Integer;   // Toda chave primaria nossa no banco dentro do objeto vai chamar ID
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
   UCSTBD;



{ TCST }

constructor TCST.create;
begin

end;

function TCST.Procurar: TRegistro;
var
   lCSTBD : TCSTBD;
begin
   lCSTBD := TCSTBD.Create;
   result := lCSTBD.Procurar(self);
end;

procedure TCST.SetCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TCST.SetDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TCST.SetID(const Value: Integer);
begin
  fID := Value;
end;

function TCST.Todos: TObjectList;
var
   lCSTBD : TCSTBD;
begin
   lCSTBD := TCSTBD.Create;
   result := lCSTBD.Todos();
end;

end.
