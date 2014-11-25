unit uI010BD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD;

type
   TI010BD = class(TRegistroBD)
      private

      public
         function Inserir           (const oRegistro : TRegistro) : Boolean;      override;
         function Alterar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Deletar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Procurar          (const oRegistro : TRegistro) : TRegistro;    override;
         function Todos             ()                            : TObjectList;  override ;
         procedure SetaDataBase (const oRegistro : TRegistro);
   end;

implementation

uses
   uI010,uSped, UEmpresaContabilIB  , uIndicadorOperacoes;

function TI010BD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

procedure TI010BD.SetaDataBase (const oRegistro : TRegistro);
begin
   //vai precisar arrumar uma maneira de sempre saber qual empresa estmos em qualquer nivel i100 i200 i300
   // Um maneira que pensei foi tornar TEmpresa singleton
   // Aredito que esta idéia é melhor criar TEmpresaConexao do stereotipo Singleton e esta classe já instancia EmpresaContabilIB e retorna a conexao
//   correta
  // aqui
   Qry.Database :=  TEmpresaContabilIB.GetObjetoConexao( TSped(oRegistro).Empresa.ID).Conexao;
end;

function TI010BD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TI010BD.Inserir(const oRegistro: TRegistro): Boolean;
var
   ID  : Integer;
begin
   SetaDataBase(oRegistro);

   ID := GeraId('I010');

   Qry.sql.Clear;
   Qry.SQL.Add('INSERT INTO I010(ID, INDICADOROPERACOES)         '+ #13+
               'VALUES (:pID,:pINDICADOROPERACOES);              '  );

   TI010(oRegistro).ID                                          := ID;
   Qry.ParamByName('pID').AsInteger                             := ID;
   Qry.ParamByName('pINDICADOROPERACOES').AsInteger             := TI010(oRegistro).IndicadorOperacoes.ID;
   try
      Qry.ExecSQL;
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

function TI010BD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TI010BD.Todos(): TObjectList;
begin
end;


end.



