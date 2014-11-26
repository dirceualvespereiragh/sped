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
         function getTodosDoSped(const oRegistro: TRegistro): TObjectList;
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
   // Acredito que esta id�ia ? melhor: criar TEmpresaConexao do stereotipo Singleton e esta classe j�
   //instancia EmpresaContabilIB e retorna a conexao   correta
   //  Na verdade desenvolvemos assim:
   // Criado a classe  uRegistroEmpresaContabil;
   // Cada objeto Cont?bil precisa saber
   // qual empresa ele pertence por isso criamos esta
   // classe TRegistroEmpresaContabil herdada de TRegistro
   // para ser o Pai de todos os objetos da Contabilidade
   Qry.Database :=  TEmpresaContabilIB.GetObjetoConexao( TI010(oRegistro).Empresa.ID).Conexao;
//   Qry.Database :=  TEmpresaContabilIB.GetObjetoConexao( TSped(oRegistro).Empresa.ID).Conexao;
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
   Qry.SQL.Add('INSERT INTO I010(ID, SPED, INDICADOROPERACOES)         '+ #13+
               'VALUES (:pID,:pSPED,:pINDICADOROPERACOES);              '  );

   TI010(oRegistro).ID                                          := ID;
   Qry.ParamByName('pID').AsInteger                             := ID;
   Qry.ParamByName('pINDICADOROPERACOES').AsInteger             := TI010(oRegistro).IndicadorOperacoes.ID;
   Qry.ParamByName('pSPED').AsInteger                           := TI010(oRegistro).Sped;
   try
      Qry.ExecSQL;
      Qry.Database.DefaultTransaction.Commit;
   except
      on e:Exception do begin
         Qry.Close;
         Qry.Free;
         raise exception.Create('Erro na inser��o');
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


function TI010BD.getTodosDoSped(const oRegistro: TRegistro): TObjectList;
//var
//   lSped   : TSped;
//   lSpeds  : TObjectList;
//   lI010s  : TObjectList;
//   lI010   : TI010;
begin
//   lI010s := TObjectList.create;
//   SetaDataBase(oRegistro);
//   Qry.SQL.Clear;

//   Qry.SQL.Add( '    SELECT ID , INDICADOROPERACOES FROM  I010       '    );
//   Qry.SQL.Add('     WHERE SPED =  :pSPED                          '    );
//   Qry.ParamByName('pSPED').AsInteger := TSped(oRegistro).ID ;
   //try
      // Qry.Open;
       //if (not Qry.IsEmpty) then begin
       //   Qry.First;
       //   while (not Qry.Eof ) do begin
       //      lI010 := TI010.Create;
       //      lI010.ID                     := Qry.FieldByName('ID').AsInteger;
       //      lI010.IndicadorOperacoes.ID  := Qry.FieldByName('INDICADOROPERACOES').AsInteger;
       //      lI010.Sped                   := TSped(oRegistro).ID ;
       //      lI010s.Add(lI010);
       //      Qry.Next;
        //  end;
        //  result := lI010s;
       //end
       //else result := Nil;
    //except
  //     result := Nil;
//    end;

    result := Nil;

//    lI010s.Free;
//    lI010s := nil;

end;

end.



