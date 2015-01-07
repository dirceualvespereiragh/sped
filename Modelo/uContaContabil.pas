unit uContaContabil;

interface

uses
   Contnrs,

   uRegistroEmpresaContabil , uRegistro;

type

TContaContabil = class(TRegistroEmpresaContabil)
  private
    fGrau: Integer;
    fID: Integer;
    fTipo: String;
    fCodigo: String;
    fDescricao: String;
    fCodigoReduzido: String;
    procedure setCodigo(const Value: String);
    procedure setDescricao(const Value: String);
    procedure setGrau(const Value: Integer);
    procedure setID(const Value: Integer);
    procedure setTipo(const Value: String);
    procedure SetCodigoReduzido(const Value: String);
    function RPad(S: string; Ch: Char; Len: Integer): string;
public
   property ID             : Integer       read fID             write setID;
   property CodigoReduzido : String        read fCodigoReduzido write SetCodigoReduzido;
   property Codigo         : String        read fCodigo         write setCodigo;
   property Descricao      : String        read fDescricao      write setDescricao;
   property Grau           : Integer       read fGrau           write setGrau;
   property Tipo           : String        read fTipo           write setTipo;
   function Procurar()     : TRegistro;
   constructor create();
end;

implementation

uses
   uContaContabilBD, uEmpresa;
{ TContaContabil }

constructor TContaContabil.create;
begin
   Empresa := TEmpresa.create;
end;

function TContaContabil.Procurar: TRegistro;
var
   lContaContabilBD : TContaContabilBD;
begin
   lContaContabilBD := TContaContabilBD.Create;
   result := lContaContabilBD.Procurar(self);
   lContaContabilBD.Free;
   lContaContabilBD := nil;
end;

procedure TContaContabil.setCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TContaContabil.SetCodigoReduzido(const Value: String);
begin
  fCodigoReduzido :=  RPad(Value, ' ', 12);
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

//function TContaContabil.LPad(S: string; Ch: Char; Len: Integer): string;
//var
//   RestoTamanho: Integer;
//begin
//   Result  := S;
//   RestoTamanho := Len - Length(s);
//   if RestoTamanho < 1 then Exit;
//   Result := S + StringOfChar(Ch, RestoTamanho);
//end;

function TContaContabil.RPad(S: string; Ch: Char; Len: Integer): string;
var
   RestoTamanho: Integer;
begin
   Result  := S;
   RestoTamanho := Len - Length(s);
   if RestoTamanho < 1 then Exit;
   Result := StringOfChar(Ch, RestoTamanho) + S;
end;

//{exemplo de uso}
//procedure TForm1.Button1Click(Sender: TObject);
//begin   Edit1.Text := RPad(Edit2.Text, '-', 30);
//end;

end.
