program SPED;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmSped},
  uI100BD in 'DAO\uI100BD.pas',
  uExcecao in '..\comum\Geral\uExcecao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSped, frmSped);
  Application.Run;
end.


