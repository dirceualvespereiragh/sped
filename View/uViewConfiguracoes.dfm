object ViewConfiguracoes: TViewConfiguracoes
  Left = 211
  Top = 98
  Width = 927
  Height = 823
  Caption = 'Configura'#231#245'es'
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
    Top = 0
    Width = 911
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 5
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object cbEmpresa: TComboBox
      Left = 16
      Top = 24
      Width = 627
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cbEmpresa'
    end
    object bPesquisar: TButton
      Left = 688
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = bPesquisarClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 744
    Width = 911
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 911
    Height = 687
    Align = alClient
    TabOrder = 2
    object PBlocoI010: TPanel
      Left = 1
      Top = 1
      Width = 909
      Height = 176
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 5
        Width = 51
        Height = 13
        Caption = 'Bloco I010'
      end
      object sbIncluiI010: TSpeedButton
        Left = 648
        Top = 8
        Width = 23
        Height = 22
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = sbIncluiI010Click
      end
      object sbExclui010: TSpeedButton
        Left = 688
        Top = 8
        Width = 23
        Height = 22
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lSpedID: TLabel
        Left = 97
        Top = 5
        Width = 3
        Height = 13
      end
      object sgI010: TStringGrid
        Left = 16
        Top = 40
        Width = 860
        Height = 120
        ColCount = 1
        Ctl3D = False
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        ParentCtl3D = False
        TabOrder = 0
        ColWidths = (
          834)
      end
    end
    object PBlocoI100: TPanel
      Left = 1
      Top = 177
      Width = 909
      Height = 209
      Align = alTop
      TabOrder = 1
      object Label3: TLabel
        Left = 14
        Top = 5
        Width = 51
        Height = 13
        Caption = 'Bloco I100'
      end
      object SpeedButton3: TSpeedButton
        Left = 648
        Top = 8
        Width = 23
        Height = 22
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object SpeedButton4: TSpeedButton
        Left = 688
        Top = 8
        Width = 23
        Height = 22
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object StringGrid2: TStringGrid
        Left = 16
        Top = 64
        Width = 865
        Height = 120
        TabOrder = 0
      end
    end
  end
end
