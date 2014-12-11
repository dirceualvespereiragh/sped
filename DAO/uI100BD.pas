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
         function GetTodosdoI010(const oRegistro : TRegistro): TObjectList;
   end;

implementation

uses
   uI100,uSped, UEmpresaContabilIB ,uCST, uCSTBD  ;

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
var
   ID  : Integer;
begin
   SetaDataBase(oRegistro);

   ID := GeraId('I100');

   Qry.sql.Clear;
   Qry.SQL.Add('INSERT INTO I100(ID, CST, TOTALFATURAMENTO, VALORPIS, BASECALCULOPIS , ALIQUOTAPIS ,    ' + #13+
               '                 VALORCOFINS,  BASECALCULOCOFINS , ALIQUOTACOFINS,  I010 )              ' + #13+
               'VALUES                                                                                  ' + #13+
               '(:pID, :pCST, :pTOTALFATURAMENTO, :pVALORPIS, :pBASECALCULOPIS , :pALIQUOTAPIS ,        ' + #13+
               '  :pVALORCOFINS,  :pBASECALCULOCOFINS , :pALIQUOTACOFINS,  :pI010 )                     '  );

   TI100(oRegistro).ID                                          := ID;
   Qry.ParamByName('pID').AsInteger                             := ID;
   Qry.ParamByName('pCST').AsInteger                            := TI100(oRegistro).CST.ID;
   Qry.ParamByName('pALIQUOTAPIS').AsFloat                      := TI100(oRegistro).AliquotaPIS;
   Qry.ParamByName('pALIQUOTACOFINS').AsFloat                   := TI100(oRegistro).AliquotaCOFINS;
   Qry.ParamByName('pI010').AsInteger                           := TI100(oRegistro).I010.ID;

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

function TI100BD.Procurar(const oRegistro: TRegistro): TRegistro;
begin
end;

function TI100BD.Todos(): TObjectList;
begin
end;


function TI100BD.GetTodosdoI010(const oRegistro: TRegistro): TObjectList;
var
   lI100s  : TObjectList;
   lI100   : TI100;
   lCST    : TCST;
begin
   SetaDataBase(oRegistro);
   Qry.SQL.Clear;
   Qry.SQL.Add( '    SELECT ID , CST  FROM  I100                   '    );
   Qry.SQL.Add('     WHERE I010 =  :pI010                          '    );
   Qry.ParamByName('pI010').AsInteger := TI100(oRegistro).I010.ID ;
   try
       Qry.Open;
       if (not Qry.IsEmpty) then begin
          lI100s := TObjectList.create;
          Qry.First;
          while (not Qry.Eof ) do begin
             lI100           := TI100.Create;
             lCST            := TCST.create;
             lI100.ID          := Qry.FieldByName('ID').AsInteger;
             lCST.ID           := Qry.FieldByName('CST').AsInteger;
             lCST.Procurar;
             lI100.CST         := lCST;
             lI100s.Add(lI100);
             Qry.Next;
          end;
          result := lI100s;
       end
       else result := Nil;
    except
       result := Nil;
    end;
//    lI010s.Free;   Precisa entender porque limpou o RESULT tambem, por isso esta comentado para não limpar
//    lI010s := nil;
end;

end.



