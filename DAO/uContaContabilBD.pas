unit uContaContabilBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD, UBaseContabilIB  ;

type
   TContaContabilBD = class(TRegistroBD)
      private

      public
         function Inserir           (const oRegistro : TRegistro) : Boolean;      override;
         function Alterar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Deletar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Procurar          (const oRegistro : TRegistro) : TRegistro;    override;
         function Todos             ()                            : TObjectList;  override ;
         procedure SetaDataBase     (const oRegistro : TRegistro);
   end;

implementation

uses
   uContaContabil,uEmpresa, UEmpresaContabilIB ;

function TContaContabilBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

function TContaContabilBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TContaContabilBD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TContaContabilBD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
   SetaDataBase(oRegistro);
   Qry.SQL.Clear;
   if (TContaContabil(oRegistro).CodigoReduzido <> '' ) then begin
      Qry.SQL.Add( '    SELECT CODRED, NUMEROCONT , NOMECONTA , GRAU , TIPOCTA FROM PLANO              '    );
      Qry.SQL.Add('     WHERE CODRED     =  :pID                                                       '    );
      Qry.ParamByName('pID').AsString := TContaContabil(oRegistro).CodigoReduzido ;
   end;
   try
       Qry.Open;
       if (not Qry.IsEmpty) then begin
          Qry.First;
          TContaContabil(oRegistro).ID              := Qry.FieldByName('CODRED').AsInteger;
          TContaContabil(oRegistro).CodigoReduzido  := Qry.FieldByName('CODRED').AsString;
          TContaContabil(oRegistro).Codigo          := Qry.FieldByName('NUMEROCONT').AsString;
          TContaContabil(oRegistro).Descricao       := Qry.FieldByName('NOMECONTA').AsString;
          TContaContabil(oRegistro).Grau            := Qry.FieldByName('GRAU').AsInteger;
          TContaContabil(oRegistro).Tipo            := Qry.FieldByName('TIPOCTA').AsString;
          result :=  TContaContabil(oRegistro);
       end
       else result := Nil;
    except
       result := Nil;
    end;
end;


procedure TContaContabilBD.SetaDataBase(const oRegistro: TRegistro);
begin
   Qry.Database :=  TEmpresaContabilIB.GetObjetoConexao( TContaContabil(oRegistro).Empresa.ID).Conexao;
end;

function TContaContabilBD.Todos(): TObjectList;
var
   lContaContabil     : TContaContabil;
   lContas            : TObjectList;
   Qry                : TIBQuery;
begin
   Qry          :=  TIBQuery.Create(nil);
   Qry.Database :=  TBaseContabilIB.GetObjetoConexao.Conexao;
   Qry.SQL.Clear;

   Qry.SQL.Add( '    SELECT CODRED, NUMEROCONT , NOMECONTA , GRAU , TIPOCTA FROM PLANO     '  +
                '    ORDER BY NOMECONTA                                                    '   );
   try
       Qry.Open;
       if (not Qry.IsEmpty) then begin
          lContas := TObjectList.Create;
          Qry.First;
          while (not Qry.Eof ) do begin
             lContaContabil := TContaContabil.Create;
             lContaContabil.ID               := Qry.FieldByName('CODRED').AsInteger;
             lContaContabil.CodigoReduzido   := Qry.FieldByName('CODRED').AsString;
             lContaContabil.Codigo           := Qry.FieldByName('NUMEROCONT').AsString;
             lContaContabil.Descricao        := Qry.FieldByName('NOMECONTA').AsString;
             lContaContabil.Grau             := Qry.FieldByName('GRAU').AsInteger;
             lContaContabil.Tipo             := Qry.FieldByName('TIPOCTA').AsString;
             lContas.Add(lContaContabil);
             Qry.Next;
          end;
          result := lContas;
       end;
    except
       result := Nil;
    end;
end;

end.

