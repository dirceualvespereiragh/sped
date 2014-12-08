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
    object Label1: TLabel
      Left = 32
      Top = 30
      Width = 140
      Height = 13
      Caption = 'C'#243'digo de Situa'#231#227'o Tribut'#225'ria'
    end
    object Label2: TLabel
      Left = 32
      Top = 78
      Width = 191
      Height = 13
      Caption = 'Al'#237'quota de PIS/PASEP (em percentual)'
    end
    object Label3: TLabel
      Left = 344
      Top = 80
      Width = 173
      Height = 13
      Caption = 'Al'#237'quota de COFINS (em percentual)'
    end
    object ComboBox1: TComboBox
      Left = 184
      Top = 24
      Width = 473
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'ComboBox1'
    end
    object Edit1: TEdit
      Left = 235
      Top = 73
      Width = 89
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 528
      Top = 75
      Width = 90
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
    end
  end
end
