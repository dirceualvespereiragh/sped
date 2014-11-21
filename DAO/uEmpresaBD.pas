unit uEmpresaBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD, UBaseContabilIB  ;

type
   TEmpresaBD = class(TRegistroBD)
      private

      public
         function Inserir           (const oRegistro : TRegistro) : Boolean;      override;
         function Alterar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Deletar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Procurar          (const oRegistro : TRegistro) : TRegistro;    override;
         function Todos             ()                            : TObjectList;  override ;
   end;

implementation

uses
   uEmpresa,uContador;

function TEmpresaBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TEmpresaBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TEmpresaBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TEmpresaBD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TEmpresaBD.Todos(): TObjectList;
var
   lContador       : TContador;
   lEmpresa        : TEmpresa;
   lEmpresas       : TObjectList;
   Qry             : TIBQuery;
begin
   Qry          :=  TIBQuery.Create(nil);
   Qry.Database :=  TBaseContabilIB.GetObjetoConexao.Conexao;
   Qry.SQL.Clear;

   Qry.SQL.Add( '    SELECT EM_COD , EM_NOME, EM_CGC  FROM  EMPRESA     '  +
                   '    ORDER BY EM_CGC                                         '   );
   try
       Qry.Open;
       if (not Qry.IsEmpty) then begin
          lEmpresas := TObjectList.Create;
          Qry.First;
          while (not Qry.Eof ) do begin
             lEmpresa := TEmpresa.Create;
             lEmpresa.ID    := Qry.FieldByName('EM_COD').AsInteger;
             lEmpresa.Nome  := Qry.FieldByName('EM_NOME').AsString;
             lEmpresa.CNPJ  := Qry.FieldByName('EM_CGC').AsString;
             lEmpresas.Add(lEmpresa);
             Qry.Next;
          end;
          result := lEmpresas;
       end;
    except
       result := Nil;
    end;
end;

end.

