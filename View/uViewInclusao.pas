unit uViewInclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type

  TListaEvent = procedure of object; // Aqui � uma grande sacada pois a vari�vel abaixo
                                    // FDOLista recebe um procedimento do Controle sem na verdade
                                    // conhecer o controle
                                    // para ententer melhor veja a inicializa��o  ( TControle.Initialize)
                                    // do controle


  TViewInclusao = class(TForm)
    Panel1: TPanel;
    btFechar: TButton;
    btSalvar: TButton;
    Panel2: TPanel;
    reTitulo: TRichEdit;
    Panel3: TPanel;
    procedure btFecharClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    FSalvar: TListaEvent;
    procedure SetSalvar(const Value: TListaEvent);
    { Private declarations }
  public
     procedure Initialize;
     property Salvar     : TListaEvent  read FSalvar write SetSalvar;
    { Public declarations }
  end;

var
  ViewInclusao: TViewInclusao;

implementation

{$R *.dfm}

procedure TViewInclusao.btFecharClick(Sender: TObject);
begin
   close;
end;

procedure TViewInclusao.Initialize;
begin

end;

procedure TViewInclusao.btSalvarClick(Sender: TObject);
begin
   Salvar;
   Close;
end;

procedure TViewInclusao.SetSalvar(const Value: TListaEvent);
begin
  FSalvar := Value;
end;

end.
