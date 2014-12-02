unit uViewInclusao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type

  TListaEvent = procedure of object; // Aqui é uma grande sacada pois a variável abaixo
                                    // FDOLista recebe um procedimento do Controle sem na verdade
                                    // conhecer o controle
                                    // para ententer melhor veja a inicialização
                                    // do controle


  TViewInclusao = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    btSalvar: TButton;
    Panel2: TPanel;
    reTitulo: TRichEdit;
    Panel3: TPanel;
    procedure Button1Click(Sender: TObject);
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

procedure TViewInclusao.Button1Click(Sender: TObject);
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
