unit uRegistroBD;

interface

uses
   classes,Contnrs,      IBQuery,SqlExpr,   SysUtils,

   uRegistro;

type
   TRegistroBD = class(TObject)
      private
          teste : String;
      protected
          Qry:TIBQuery;
      public
         function Inserir   (const oRegistro: TRegistro)  : Boolean;         virtual; abstract;
         function Alterar   (const oRegistro: TRegistro)  : Boolean;         virtual; abstract;
         function Deletar   (const oRegistro: TRegistro)  : Boolean;         virtual; abstract;
         function Procurar  (const oRegistro: TRegistro)  : TRegistro;       virtual; abstract;
         function Todos     ()                            : TObjectList;     virtual; abstract;
         function GeraId    (Gerador: string)             : Integer;
         constructor create;
         destructor destroy();
   end;

Implementation


{ TRegistroBD }


constructor TRegistroBD.create;
begin
   Qry := TIBQuery.Create(nil);
end;

destructor TRegistroBD.destroy;
begin
   Qry.Close;
   Qry.Free;
   Qry := nil;
end;

function TRegistroBD.GeraId(Gerador: string): Integer;
begin
   result := 0;
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
end;

end.
