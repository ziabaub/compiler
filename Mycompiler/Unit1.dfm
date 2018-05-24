object Form1: TForm1
  Left = 470
  Top = 283
  Width = 636
  Height = 385
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Compiler: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Compile'
    TabOrder = 0
    OnClick = CompilerClick
  end
  object Button3: TButton
    Left = 16
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Code: TMemo
    Left = 96
    Top = 8
    Width = 473
    Height = 313
    Hint = 'Enter Your Code'
    HelpType = htKeyword
    Lines.Strings = (
      'Code')
    TabOrder = 2
    OnClick = CodeClick
    OnKeyPress = CodeKeyPress
  end
end
