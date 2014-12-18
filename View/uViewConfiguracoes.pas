unit uViewConfiguracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, Buttons,

  MVCInterfaces, uEmpresa, USped, UI010;
// A View somente conhece o Modelo para exibir os atributos dele mas não pode alterar ou interagir com o Modelo 

type

  TListaEvent = procedure of object; // Aqui é uma grande sacada pois a variável abaixo
                                    // FDOLista recebe um procedimento do Controle sem na verdade
                                    // conhecer o controle
                                    // para ententer melhor veja a inicialização  ( TControle.Initialize)
                                    // do controle


  TViewConfiguracoes = class(TForm)
    pEmpresa: TPanel;
    cbEmpresa: TComboBox;
    bPesquisar: TButton;
    pRodape: TPanel;
    pCentral: TPanel;
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
    PBI200: TPanel;
    Label4: TLabel;
    sbIncluirI200: TSpeedButton;
    sbExcluiI200: TSpeedButton;
    sgI200: TStringGrid;
    procedure bPesquisarClick(Sender: TObject);
    procedure sbIncluiI010Click(Sender: TObject);
    procedure sgI010SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure sgI010Click(Sender: TObject);
    procedure sbIncluirI100Click(Sender: TObject);
    procedure sgI100Click(Sender: TObject);
    procedure sgI100SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sbIncluirI200Click(Sender: TObject);
  private
     FModelo       : TEmpresa;
     FModeloI010   : TI010;
     FDoLista      : TListaEvent;
     FIncluiI010   : TListaEvent;
     FDoListaI100  : TListaEvent;
     FIncluiI100   : TListaEvent;
     FDoListaI200  : TListaEvent;

     procedure SetModel(const Value: TEmpresa);
     procedure SetDoLista(const Value: TListaEvent);
     procedure SetIncluiI010(const Value: TListaEvent);
     procedure SetDoListaI100(const Value: TListaEvent);
     procedure SetModeloI010(const Value: TI010);
    procedure SetIncluiI100(const Value: TListaEvent);
    procedure SetDoListaI200(const Value: TListaEvent);
  public
     fLinhaSg010  : Integer;
     fLinhasgI100 : Integer;
     IncluiI200 : TListaEvent;
     procedure Initialize;
     procedure ModeloMudou;
     property Modelo      : TEmpresa     read FModelo       write SetModel;
     property ModeloI010  : TI010        read fModeloI010   write SetModeloI010;
     property DoLista     : TListaEvent  read FDoLista      write SetDoLista;
     property IncluiI010  : TListaEvent  read FIncluiI010   write SetIncluiI010;
     property DoListaI100 : TListaEvent  read FDoListaI100  write SetDoListaI100;
     property DOListaI200 : TListaEvent  read FDoListaI200  write SetDoListaI200;
     property IncluiI100  : TListaEvent  read FIncluiI100   write SetIncluiI100;

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
   fLinhaSg010 := ARow;
end;

procedure TViewConfiguracoes.SetModeloI010(const Value: TI010);
begin
  fModeloI010 := Value;
end;

procedure TViewConfiguracoes.sgI010Click(Sender: TObject);
begin
   DoListaI100;
end;

procedure TViewConfiguracoes.sbIncluirI100Click(Sender: TObject);
begin
   IncluiI100;
end;

procedure TViewConfiguracoes.SetIncluiI100(const Value: TListaEvent);
begin
  FIncluiI100 := Value;
end;

procedure TViewConfiguracoes.sgI100Click(Sender: TObject);
begin
   DoListaI200;
end;

procedure TViewConfiguracoes.sgI100SelectCell(Sender: TObject; ACol,   ARow: Integer; var CanSelect: Boolean);
begin
   fLinhasgI100 := Arow;
end;

procedure TViewConfiguracoes.SetDoListaI200(const Value: TListaEvent);
begin
  FDoListaI200 := Value;
end;

procedure TViewConfiguracoes.sbIncluirI200Click(Sender: TObject);
begin
   IncluiI200;
end;

end.

