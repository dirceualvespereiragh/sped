unit uIndicadorOperacoes;

interface

uses
   Contnrs,

   uRegistro;

type

   TIndicadorOperacoes = class(TRegistro)
      private
         fID               : Integer;   // Toda chave primaria nossa no banco dentro do objeto vai chamar ID
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
         constructor create();
   end;

   
implementation

uses
   uIndicadorOperacoesBD;

{ TIndicadorOperacoes }

constructor TIndicadorOperacoes.create;
begin

end;

procedure TIndicadorOperacoes.SetCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TIndicadorOperacoes.SetDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TIndicadorOperacoes.SetID(const Value: Integer);
begin
  fID := Value;
end;

function TIndicadorOperacoes.Todos: TObjectList;
var
   lIndicadorOperacoesBD : TIndicadorOperacoesBD;
begin
   lIndicadorOperacoesBD := TIndicadorOperacoesBD.Create;
   result := lIndicadorOperacoesBD.Todos();

end;

end.
