object frmSplashScreen: TfrmSplashScreen
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmSplashScreen'
  ClientHeight = 632
  ClientWidth = 938
  Color = 12170412
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ScreenSnap = True
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object picLogo: TImage
    Left = 235
    Top = 158
    Width = 185
    Height = 105
    AutoSize = True
    Transparent = True
  end
  object Label1: TLabel
    Left = 8
    Top = 611
    Width = 70
    Height = 13
    Caption = 'Version: v1.06'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 259
    Height = 24
    Caption = 'PAT deur Derich Havenga'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Delay: TTimer
    OnTimer = DelayTimer
    Left = 896
    Top = 592
  end
end
