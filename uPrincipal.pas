unit uPrincipal;


// Esta unit  só conhece o CONTROLE -- veja o "USES" do IMPLEMENTACION


interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSped = class(TForm)
    btParametros: TButton;
    btGeracao: TButton;
    procedure btParametrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSped: TfrmSped;

implementation

uses
   uControleConfiguracoes;


{$R *.dfm}

procedure TfrmSped.btParametrosClick(Sender: TObject);
var
   lControle: TControle;
begin
   lControle := TControle.Create;
   lControle.Initialize;
end;

end.
