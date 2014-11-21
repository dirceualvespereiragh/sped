program SPED;

uses
  Forms,
  uPrincipal in 'uPrincipal.pas' {frmSped},
  uI010BD in 'DAO\uI010BD.pas',
  uExcecao in '..\comum\Geral\uExcecao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSped, frmSped);
  Application.Run;
end.


