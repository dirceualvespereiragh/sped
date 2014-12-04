unit uI100BD;

interface

uses
   IBQuery,SqlExpr,SysUtils,Contnrs,  Dialogs,  DB, ADODB,

   uRegistro,uRegistroBD;

type
   TI100BD = class(TRegistroBD)
      private

      public
         function Inserir           (const oRegistro : TRegistro) : Boolean;      override;
         function Alterar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Deletar           (const oRegistro: TRegistro)  : Boolean;      override;
         function Procurar          (const oRegistro : TRegistro) : TRegistro;    override;
         function Todos             ()                            : TObjectList;  override ;
         procedure SetaDataBase (const oRegistro : TRegistro);
         function getTodosDoSped(const oRegistro : TRegistro): TObjectList;
   end;

implementation

uses
   uI100,uSped, UEmpresaContabilIB  , uIndicadorOperacoes;

function TI100BD.Alterar(const oRegistro: TRegistro): Boolean;
begin

end;

procedure TI100BD.SetaDataBase (const oRegistro : TRegistro);
begin
   Qry.Database :=  TEmpresaContabilIB.GetObjetoConexao( TI100(oRegistro).Empresa.ID).Conexao;
end;

function TI100BD.Deletar(const oRegistro: TRegistro): Boolean;
begin

end;

function TI100BD.Inserir(const oRegistro: TRegistro): Boolean;
begin
end;

function TI100BD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TI100BD.Todos(): TObjectList;
begin
end;


function TI100BD.getTodosDoSped(const oRegistro: TRegistro): TObjectList;
//var
//   lI010s  : TObjectList;
//   lI010   : TI010;
//   lIndicadorOperacoes : TIndicadorOperacoes;
begin
//   lI010s := TObjectList.create;
//   SetaDataBase(oRegistro);
//   Qry.SQL.Clear;
//   Qry.SQL.Add( '    SELECT ID , INDICADOROPERACOES FROM  I010       '    );
//   Qry.SQL.Add('     WHERE SPED =  :pSPED                          '    );
//   Qry.ParamByName('pSPED').AsInteger := TI010(oRegistro).SPED ;
//   try
//       Qry.Open;
//       if (not Qry.IsEmpty) then begin
//
//          Qry.First;
//          while (not Qry.Eof ) do begin
//             lI010                   := TI010.Create;
//             lIndicadorOperacoes     :=    TIndicadorOperacoes.create;
//             lI010.ID                     := Qry.FieldByName('ID').AsInteger;
//             lIndicadorOperacoes.ID       := Qry.FieldByName('INDICADOROPERACOES').AsInteger;
//             lI010.IndicadorOperacoes     := lIndicadorOperacoes;
//             lI010.Sped                   := TI010(oRegistro).SPED ;
//             lI010s.Add(lI010);
//             Qry.Next;
//          end;
//          result := lI010s;
//       end
//       else result := Nil;
//    except
//       result := Nil;
//    end;
//    lI010s.Free;   Precisa entender porque limpou o RESULT tambem, por isso esta comentado para não limpar
//    lI010s := nil;
end;

end.



