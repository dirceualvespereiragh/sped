unit uViewConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, Buttons,

  MVCInterfaces, uEmpresa, USped, UI010;
// A View conhece o Modelo pois exibe os atributos dele

type

  TListaEvent = procedure of object; // Aqui � uma grande sacada pois a vari�vel abaixo
                                    // FDOLista recebe um procedimento do Controle sem na verdade
                                    // conhecer o controle
                                    // para ententer melhor veja a inicializa��o
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
    sgI100: TStringGrid;
    Label3: TLabel;
    sbIncluirI100: TSpeedButton;
    sbExcluirI100: TSpeedButton;
    lSpedID: TLabel;
    procedure bPesquisarClick(Sender: TObject);
    procedure sbIncluiI010Click(Sender: TObject);
    procedure sgI010SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
     FModelo  : TEmpresa;
     FModeloI010 : TI010;
     FDoLista : TListaEvent;
     FIncluiI010: TListaEvent;
     FDoListaI100: TListaEvent;
     procedure SetModel(const Value: TEmpresa);
     procedure SetDoLista(const Value: TListaEvent);
     procedure SetIncluiI010(const Value: TListaEvent);
     procedure SetDoListaI100(const Value: TListaEvent);
    procedure SetModeloI010(const Value: TI010);
  public
     procedure Initialize;
     procedure ModeloMudou;
     property Modelo      : TEmpresa     read FModelo       write SetModel;
     property ModeloI010  : TI010        read fModeloI010   write SetModeloI010;
     property DoLista     : TListaEvent  read FDoLista      write SetDoLista;
     property IncluiI010  : TListaEvent  read FIncluiI010   write SetIncluiI010;
     property DoListaI100 : TListaEvent  read FDoListaI100  write SetDoListaI100;
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

procedure TViewConfiguracoes.SetDoListaI100(const Value: TListaEvent);
begin
  FDoListaI100 := Value;
end;

procedure TViewConfiguracoes.sgI010SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
   FModeloI010 :=  TI010( sgI010.Objects [0,ARow] );
   Label1.Caption := inttostr(FModeloI010.ID);
   DoListaI100;
end;

procedure TViewConfiguracoes.SetModeloI010(const Value: TI010);
begin
  fModeloI010 := Value;
end;

end.

