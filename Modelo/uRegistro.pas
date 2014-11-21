unit uRegistro;

interface

uses
   classes;

type
   TRegistro = class(TObject)
    public
         function Inserir   ()  : Boolean;         virtual; abstract;
         function Alterar   ()  : Boolean;         virtual; abstract;
         function Deletar   ()  : Boolean;         virtual; abstract;
         function Procurar  ()  : TRegistro;       virtual; abstract;
   end;

Implementation

end.
