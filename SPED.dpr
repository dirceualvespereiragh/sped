program SPED;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmSped};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSped, frmSped);
  Application.Run;
end.


