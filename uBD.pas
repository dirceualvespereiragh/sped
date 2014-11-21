unit uBD;

interface

uses
   classes,IBQuery,SqlExpr,SysUtils,Contnrs,

   URegistro, UConexaoFB;

    // O exemplo de singleton em /Exemplo1/uDadosRegistroDB.pas é muito mais simples ,
    // mas´não funciona no D7 só a partir do Delphi 2009

type
   TBD = class
      // strict private no D7 não tem strict
      private
         // Não funciona no D7 class var FInstancia: TBD;
         // Variavel estática para armazenar a unica instancia
         FBD: TBD;
         // Construtor privado para que possamos criar
         // o objeto somente dentro da propria classe
         constructor Create;
      public
         class function GetInstancia  : TBD;
         function Inserir   (oRegistro   : TRegistro  ) : Boolean;
         function Excluir   (oRegistro   : TRegistro  ) : Boolean;
         function GeraId    (Gerador     : string     ) : Integer;
         function Procurar  (oRegistro   : TRegistro  ) : TRegistro;
         function Todos     (oRegistro   : TRegistro  ) : TObjectList;
   end;


implementation

uses UEmpresa, UEmpresaBD,
     uRegistroBD;

var FInstancia:TBD = nil;


{ TBD }

constructor TBD.Create;
begin
    // criar o objeto que será fornecida para todos.
    FInstancia        := create;
end;

function TBD.Excluir(oRegistro: TRegistro): Boolean;
begin

end;

function TBD.GeraId(Gerador: string): Integer;
var
  Qry:TIBQuery;
begin
   result := 0;
   Qry := TIBQuery.Create(nil);
   Qry.Database := TConexaoFB.GetObjetoConexao().conexao;
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT GEN_ID('+GERADOR+',1) as ID FROM rdb$database');
   try
     Qry.Open;
     result := Qry.FieldByName('ID').AsInteger;
   except
      on e:Exception do begin
         Qry.Close;
         Qry.Free;
         raise exception.Create('Gerador inexistente: ' + Gerador);
      end;
   end;
   Qry.Close;
   Qry.Free;
end;


class function TBD.GetInstancia: TBD;
begin
   if (not Assigned(FInstancia)) then begin
      FInstancia := create;
   end;
   result := FInstancia;
end;


function TBD.Inserir(oRegistro: TRegistro): Boolean;
var
  fBD : TRegistroBD;
begin
  // poderia ter um TList especialista para isto ao invez de um if
  // no initialization poderia registrar todas as Classes + ClassesDB no mesmo
  // e aqui realizar um loop para descobri, fica "on the fly" - não precisa mais alterar o
  // metodo que se tornaria generico.
  //
  //  For in ListClassesRegistrada
  //     ClasseRegistrada.Inserir(aRegistro);

  if oRegistro is TMedico then begin
     fBD                   :=  TMedicoBD.Create;
     TMedico(oRegistro).ID :=  GeraId('medico');
  end;
  fBD.Inserir(oRegistro);
end;


function TBD.Procurar(oRegistro: TRegistro): TRegistro;
var
  fBD : TRegistroBD;
begin
   if oRegistro is TMedico then begin
      fBD     :=  TMedicoBD.Create;
   end;
   result := fBD.Procurar(oRegistro);

end;



function TBD.Todos(oRegistro: TRegistro): TObjectList;
var
  fBD : TRegistroBD;
begin
   if oRegistro is TEspecialidade then begin
      fBD     :=  TEspecialidadeBD.Create;
   end;
   result := fBD.Todos(oRegistro);

end;

end.
