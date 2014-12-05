unit uCST;

interface

uses
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
         constructor create();
   end;

   
implementation



{ TCST }

constructor TCST.create;
begin

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

end.
