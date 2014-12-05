unit uSpedBD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD;

type
   TSpedBD = class(TRegistroBD)
      private

      public
         function Inserir           (const oRegistro : TRegistro) : Boolean;      override;
         function Alterar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Deletar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Procurar          (const oRegistro : TRegistro) : TRegistro;    override;
         function Todos             ()                            : TObjectList;  override ;
         function TodosDaEmpresa    (const oRegistro : TRegistro)                            : TObjectList;  overload ;
         procedure SetaDataBase     (const oRegistro : TRegistro);
   end;

implementation

uses
   uEmpresa, uSped, UEmpresaContabilIB , UI010 ;

function TSpedBD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

procedure TSpedBD.SetaDataBase (const oRegistro : TRegistro);
begin
   Qry.Database :=  TEmpresaContabilIB.GetObjetoConexao( TSped(oRegistro).Empresa.ID).Conexao;
end;

function TSpedBD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TSpedBD.Inserir(const oRegistro: TRegistro): Boolean;
var
   ID  : Integer;
begin
   SetaDataBase(oRegistro);
   ID := GeraId('SPED');

   Qry.sql.Clear;
   Qry.SQL.Add('INSERT INTO SPED(ID, EMPRESA)         '+ #13+
               'VALUES (:pID,:pEMPRESA);              '  );

   TSped(oRegistro).ID                               := ID;
   Qry.ParamByName('pID').AsInteger                  := ID;
   Qry.ParamByName('pEMPRESA').AsInteger             := TSped(oRegistro).Empresa.ID;
   try
      Qry.ExecSQL;
      //comita;
      Qry.Database.DefaultTransaction.Commit;
   except
      on e:Exception do begin
         Qry.Close;
         Qry.Free;
         raise exception.Create('Erro na inserção');
      end;
   end;
   Qry.Close;
   Qry.Free;
end;

function TSpedBD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
   SetaDataBase(oRegistro);
   Qry.SQL.Clear;
   Qry.SQL.Add( '    SELECT ID , EMPRESA FROM  SPED              '    );
   Qry.SQL.Add('     WHERE ID      =  :pID                       '    );
   Qry.ParamByName('pID').AsInteger := TSped(oRegistro).ID ;
   try
       Qry.Open;
       if (not Qry.IsEmpty) then begin
          Qry.First;
          TSped(oRegistro).ID          := Qry.FieldByName('ID').AsInteger;
          TSped(oRegistro).Empresa.ID  := Qry.FieldByName('EMPRESA').AsInteger;
          result := TSped(oRegistro);
       end
       else result := Nil;
    except
       result := Nil;
    end;
end;

function TSpedBD.Todos(): TObjectList;
begin
end;

function TSpedBD.TodosDaEmpresa(const oRegistro: TRegistro): TObjectList;
var
   lSped : TSped;
   lSpeds : TObjectList;
   lI010s : TObjectList;
   lI010  : TI010;
begin
   SetaDataBase(oRegistro);
   lSpeds := TObjectList.create;
   Qry.SQL.Clear;

   Qry.SQL.Add( '    SELECT ID , EMPRESA FROM  SPED              '    );
   Qry.SQL.Add('     WHERE EMPRESA =  :pID                       '    );
   Qry.ParamByName('pID').AsInteger := TSped(oRegistro).Empresa.ID ;
   try
       Qry.Open;
       if (not Qry.IsEmpty) then begin
          Qry.First;
          while (not Qry.Eof ) do begin
             lSped := TSped.Create;
             lSped.ID          := Qry.FieldByName('ID').AsInteger;
             lSped.Empresa.ID  := Qry.FieldByName('EMPRESA').AsInteger;
             lI010             := TI010.create;
             lI010.Sped        := lSped.ID;
             lI010.Empresa.ID  := lSped.Empresa.ID;
             lI010s            := TObjectList.Create;
             lI010s            := lI010.getTodosDoSped;
             lSped.I010s       := lI010s;
             lSpeds.Add(lSped);
             self.Qry.Next;
          end;

          result := lSpeds;
       end
       else result := Nil;
    except
       result := Nil;
    end;
end;

end.



implementation

uses uIBAplicativosRC;


procedure TUsuarioDaoAplicativos.Excluir(pUsuario: TBaseObjetoDados);
begin
   Qry.sql.Clear;
   Qry.SQL.Add('DELETE FROM FUNCIONARIO ');
   Qry.SQL.Add(' WHERE CODIGOFUNCIONARIO = :pID');
   Qry.ParamByName('pID').AsInteger := TUsuario(pUsuario).ID;
   try
      Qry.ExecSQL();
      pUsuario.Estado := sdBrowse;
    except
    on e:Exception do
       raise exception.Create('Falha ao excluir Usuário: ' + TUsuario(pUsuario).Nome + #13#10 + 'Mensagem original: '+e.Message);
    end;
end;


function TUsuarioDaoAplicativos.ListarPorCampo(Campo, Valor: String): TBaseObjetoDados;
begin

end;


function TUsuarioDaoAplicativos.ListarPorNome(pUsuario:tUsuario;NOME: String ; var vAchou : boolean): tUsuario;
var
  OUsuario        : TUsuario;
begin
   Nome :=  Criptografia (Nome,'ZENITHPOLAR');
   Qry.SQL.Clear;
   Qry.SQL.Add('     SELECT CODIGOFUNCIONARIO,USUARIO,NOMECOMPLETO,SENHA, TAMANHOSENHA');
   Qry.SQL.Add('     FROM FUNCIONARIO ');
   Qry.SQL.Add('     WHERE USUARIO = ' + QuotedStr(Nome));
   try
      try
         Qry.Open;
         if Qry.IsEmpty then begin
            vAchou   := false;
         end else begin
              vAchou   := True;

              pUsuario.ID         := Qry.FieldByName('CODIGOFUNCIONARIO').asInteger;
              pUsuario.Nome       := Qry.FieldByName('NOMECOMPLETO').asString;

              pUsuario.SENHA      :=  COPY ( Criptografia( Qry.FieldByName('SENHA').asstring, 'ZENITHPOLAR') , 0,Qry.FieldByName('TAMANHOSENHA').asinteger );

              pUsuario.Usuario    := Qry.FieldByName('USUARIO').asstring;

         end;
      except
         on e:exception do begin
            ShowMessage('Falha ao recuperar o USUARIO'+ #13+
                  'Mesagem original: '+ e.Message);
             pUsuario := nil;
             vAchou   := false;
         end;
      end;
   finally
      result := pUsuario;
   end;
end;



function TUsuarioDaoAplicativos.ListaTodos(): TObjectList;
var
   OsUsuarios : TObjectList;
   OUsuario   : TUsuario;
begin
   Qry.SQL.Clear;
   Qry.SQL.Add('SELECT ID, CODIGO,NOME');
   Qry.SQL.Add('FROM USUARIOS ');
   try
    try
      Qry.Open;
      OsUsuarios := TObjectList.Create;
      if Qry.IsEmpty then
         OsUsuarios := nil
      else begin
        while not Qry.Eof do  begin
          OUsuario            := TUsuario.Create;
          OUsuario.Id         := Qry.FieldByName('ID').asInteger;
          OUsuario.Codigo     := Qry.FieldByName('CODIGO').asInteger;
          OUsuario.Nome       := Qry.FieldByName('NOME').asString;
          OsUsuarios.Add(OUsuario);
          Qry.Next;
        end;
      end;
    except
       on e:exception do begin
         ShowMessage('Falha ao recuperar USUARIOS'+ #13+
                     'Mesagem original: '+ e.Message);
         OsUsuarios := nil;
       end;
    end;
  finally
    result := OsUsuarios;
  end;
end;


function TUsuarioDaoAplicativos.Recuperar(ID: Integer): TBaseObjetoDados;
var
  OUsuario: TUsuario;
begin
  Qry.sql.Clear;
  Qry.SQL.Add('SELECT ID, CODIGO, NOME');
  Qry.SQL.Add('FROM USUARIOS ');
  Qry.SQL.Add('WHERE ID = ' + IntTostr(Id));
  try
    try
      Qry.Open;
      if Qry.IsEmpty then
         OUsuario := nil
      else begin
        OUsuario                   := TUsuario.Create;
        OUsuario.Id                := Qry.FieldByName('ID').asInteger;
        OUsuario.Nome              := Qry.FieldByName('NOME').asString;
        OUsuario.Codigo            := Qry.FieldByName('CODIGO').asInteger;
      end;
    except
    on e:exception do
    begin
      ShowMessage('Falha ao recuperar USUARIO'+ #13+
                  'Mesagem original: '+ e.Message);
      OUsuario := nil;
    end;
    end;
  finally
    result := OUsuario;
  end;
end;


procedure TUsuarioDaoAplicativos.alterar(pUsuario: TBaseObjetoDados);
var
   id,x     : Integer;
   //trans    : TDBXTransaction;   funciona com D 2006 DBXCommon no uses
   trans : TTransactionDesc;
begin
   Qry.sql.Clear;
   Qry.SQL.Add('UPDATE USUARIOS ' +
           'SET CODIGO         = :pCODIGO,' +
           'NOME               = :pNOME,'+
           'WHERE ID           = :pID');

   Qry.ParamByName('pCODIGO').AsiNTEGER         := TUsuario(pUsuario).Codigo;
   Qry.ParamByName('pNOME').AsString            := TUsuario(pUsuario).NOME;
   Qry.ParamByName('pID').AsInteger             := TUsuario(pUsuario).ID;
   try
      Qry.ExecSQL();
      try

      except
         on e:Exception do  begin
            ShowMessage('Falha ao salvar o USUARIO '+ TUsuario(pUsuario).NOME  + #13 +
                    'Mensagem original: '+ e.Message);
         end;
      end;
   finally
      pUsuario.Estado := sdBrowse;
   end;
end;
