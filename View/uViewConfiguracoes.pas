unit uViewConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, Buttons,

  MVCInterfaces, uEmpresa, USped;
// A View conhece o Modelo pois exibe os atributos dele

type

  TListaEvent = procedure of object; // Aqui é uma grande sacada pois a variável abaixo
                                    // FDOLista recebe um procedimento do Controle sem na verdade
                                    // conhecer o controle
                                    // para ententer melhor veja a inicialização
                                    // do controle


  TViewConfiguracoes = class(TForm)
    Panel1: TPanel;
    cbEmpresa: TComboBox;
    bPesquisar: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    PBlocoI010: TPanel;
    Label2: TLabel;
    sbIncluiI010: TSpeedButton;
    sbExclui010: TSpeedButton;
    sgI010: TStringGrid;
    PBlocoI100: TPanel;
    StringGrid2: TStringGrid;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure bPesquisarClick(Sender: TObject);
    procedure sbIncluiI010Click(Sender: TObject);
  private
     FModelo  : TEmpresa;
     FDoLista : TListaEvent;
     FIncluiI010: TListaEvent;
     procedure SetModel(const Value: TEmpresa);
     procedure SetDoLista(const Value: TListaEvent);
    procedure SetIncluiI010(const Value: TListaEvent);
  public
     procedure Initialize;
     procedure ModeloMudou;
     property Modelo      : TEmpresa     read FModelo  write SetModel;
     property DoLista     : TListaEvent  read FDoLista write SetDoLista;
     property IncluiI010  : TListaEvent  read FIncluiI010 write SetIncluiI010;
  end;

//var           // Programador bom comenta estas linha, como eu comentei logo...
//  ViewConfiguracoes: TViewConfiguracoes;

implementation

{$R *.dfm}

{ TViewConfiguracoes }

procedure TViewConfiguracoes.Initialize;
begin

end;

procedure TViewConfiguracoes.ModeloMudou;
begin
end;



procedure TViewConfiguracoes.SetDoLista(const Value: TListaEvent);
begin
  FDoLista := Value;
end;

procedure TViewConfiguracoes.SetModel(const Value: TEmpresa);
begin
  FModelo := Value;
end;

procedure TViewConfiguracoes.bPesquisarClick(Sender: TObject);
begin
   DoLista;
end;

procedure TViewConfiguracoes.sbIncluiI010Click(Sender: TObject);
begin
   IncluiI010;
end;

procedure TViewConfiguracoes.SetIncluiI010(const Value: TListaEvent);
begin
  FIncluiI010 := Value;
end;

end.

