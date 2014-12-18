program SPED;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmSped},
  uContaContabil in 'Modelo\uContaContabil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSped, frmSped);
  Application.Run;
end.


