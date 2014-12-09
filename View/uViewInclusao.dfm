object ViewInclusao: TViewInclusao
  Left = 302
  Top = 311
  Width = 803
  Height = 273
  Caption = 'ViewInclusao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 194
    Width = 787
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 488
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object btSalvar: TButton
      Left = 248
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btSalvarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 49
    Align = alTop
    TabOrder = 1
    object reTitulo: TRichEdit
      Left = 1
      Top = 1
      Width = 785
      Height = 47
      Align = alClient
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 787
    Height = 145
    Align = alClient
    BiDiMode = bdRightToLeftNoAlign
    BorderWidth = 8
    BorderStyle = bsSingle
    ParentBiDiMode = False
    TabOrder = 2
  end
end
