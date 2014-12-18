unit uContaContabil;

interface

uses
   Contnrs,

   uRegistroEmpresaContabil;

type

TContaContabil = class(TRegistroEmpresaContabil)
  private
    fGrau: Integer;
    fID: Integer;
    fTipo: String;
    fCodigo: String;
    fDescricao: String;
    procedure setCodigo(const Value: String);
    procedure setDescricao(const Value: String);
    procedure setGrau(const Value: Integer);
    procedure setID(const Value: Integer);
    procedure setTipo(const Value: String);

public
   property ID         : Integer   read fID          write setID;
   property Codigo     : String    read fCodigo      write setCodigo;
   property Descricao  : String    read fDescricao   write setDescricao;
   property Grau       : Integer   read fGrau        write setGrau;
   property Tipo       : String    read fTipo        write setTipo;

end;

implementation

{ TContaContabil }

procedure TContaContabil.setCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TContaContabil.setDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TContaContabil.setGrau(const Value: Integer);
begin
  fGrau := Value;
end;

procedure TContaContabil.setID(const Value: Integer);
begin
  fID := Value;
end;

procedure TContaContabil.setTipo(const Value: String);
begin
  fTipo := Value;
end;

end.
