unit uContador;

interface

uses
   uRegistro;

type

   TContador = class(TRegistro)
      private
         fID              : Integer;   // Toda chave primaria nossa no banco dentro do objeto vai chamar ID
         fNome            : String;
         fCRC             : Integer;
         procedure SetCRC(const Value: Integer);
         procedure SetID(const Value: Integer);
         procedure SetNome(const Value: String);
      public
         property ID             : Integer     read fID       write SetID;
         property Nome           : String      read fNome     write SetNome;
         property CRC            : Integer     read fCRC      write SetCRC;
         constructor create();
   end;
implementation

{ TContador }

constructor TContador.create;
begin

end;

procedure TContador.SetCRC(const Value: Integer);
begin
  fCRC := Value;
end;

procedure TContador.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TContador.SetNome(const Value: String);
begin
  fNome := Value;
end;

end.
