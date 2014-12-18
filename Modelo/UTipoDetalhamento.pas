unit UTipoDetalhamento;

interface

uses
   Contnrs,

   uRegistro, uNumeroCampo;

type

   TTipoDetalhamento = class(TRegistro)
      private
         fID              : Integer;
         fCodigo           : String;
         fDescricao        : String;
    fNumeroCampo: TNumeroCampo;
         procedure SetCodigo(const Value: String);
         procedure SetDescricao(const Value: String);
         procedure SetID(const Value: Integer);
    procedure SetNumeroCampo(const Value: TNumeroCampo);
      public
         property ID             : Integer      read fID          write SetID;
         property NumeroCampo    : TNumeroCampo read fNumeroCampo write SetNumeroCampo;
         property Descricao      : String       read fDescricao   write SetDescricao;
         property Codigo         : String       read fCodigo      write SetCodigo;
         function Todos : TObjectList;
         function Procurar  ()  : TRegistro;
         constructor create();
   end;


implementation

uses
   UTipoDetalhamentoBD;



{ TTipoDetalhamento }

constructor TTipoDetalhamento.create;
begin
   fNumeroCampo :=  TNumeroCampo.create;
end;

function TTipoDetalhamento.Procurar: TRegistro;
var
   lTipoDetalhamentoBD : TTipoDetalhamentoBD;
begin
   lTipoDetalhamentoBD  := TTipoDetalhamentoBD.Create;
   result  := lTipoDetalhamentoBD.Procurar(self);
   fDescricao := TTipoDetalhamento(result).fDescricao;
   fCodigo    := TTipoDetalhamento(result).fCodigo;
end;

procedure TTipoDetalhamento.SetCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TTipoDetalhamento.SetDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TTipoDetalhamento.SetID(const Value: Integer);
begin
  fID := Value;
end;

procedure TTipoDetalhamento.SetNumeroCampo(const Value: TNumeroCampo);
begin
  fNumeroCampo := Value;
end;

function TTipoDetalhamento.Todos: TObjectList;
var
   lTipoDetalhamentoBD : TTipoDetalhamentoBD;
begin
   lTipoDetalhamentoBD := TTipoDetalhamentoBD.Create;
   result := lTipoDetalhamentoBD.Todos();
end;

end.
