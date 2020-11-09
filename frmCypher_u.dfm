object frmCipher: TfrmCipher
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cipher Program'
  ClientHeight = 584
  ClientWidth = 932
  Color = 12170412
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmCypher
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnShow = OnShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblSave: TLabel
    Left = 197
    Top = 13
    Width = 4
    Height = 16
    Hint = 'Saves File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 172
    Height = 13
    Caption = 'Select a File with the Browse button'
  end
  object Label2: TLabel
    Left = 8
    Top = 106
    Width = 156
    Height = 13
    Caption = 'Choose to Encrypt or to Decrypt'
  end
  object Label3: TLabel
    Left = 8
    Top = 173
    Width = 173
    Height = 13
    Caption = 'Enter a 10 digit keycode  (Required)'
  end
  object Label4: TLabel
    Left = 8
    Top = 251
    Width = 110
    Height = 13
    Caption = 'Press the magic button'
  end
  object Label5: TLabel
    Left = 8
    Top = 301
    Width = 148
    Height = 26
    Caption = 'Press the save button to save to text file'
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 366
    Width = 175
    Height = 13
    Caption = 'If you'#39're stuck press the help button'
  end
  object Label7: TLabel
    Left = 8
    Top = 16
    Width = 132
    Height = 23
    Caption = 'Cipher program'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLastUsedCode: TLabel
    Left = 111
    Top = 227
    Width = 69
    Height = 18
    AutoSize = False
  end
  object lblLoadedFile: TLabel
    Left = 432
    Top = 13
    Width = 4
    Height = 16
    Hint = 'Saves File'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    Layout = tlCenter
  end
  object BBtnHelp: TBitBtn
    Left = 8
    Top = 385
    Width = 75
    Height = 25
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 7
    OnClick = BBtnHelpClick
  end
  object BtnBrowse: TButton
    Left = 8
    Top = 75
    Width = 81
    Height = 25
    Caption = '&Browse...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = BtnBrowseClick
  end
  object BtnCipher: TButton
    Left = 8
    Top = 270
    Width = 75
    Height = 25
    Caption = '&Encrypt'
    Enabled = False
    TabOrder = 5
    OnClick = BtnCipherClick
  end
  object btnSave: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Save as...'
    TabOrder = 6
    OnClick = btnSaveClick
  end
  object rbDecrypt: TRadioButton
    Left = 8
    Top = 150
    Width = 58
    Height = 17
    Caption = 'Decrypt'
    TabOrder = 2
    OnClick = rbDecryptClick
  end
  object rbEncrypt: TRadioButton
    Left = 8
    Top = 127
    Width = 57
    Height = 17
    Align = alCustom
    Caption = 'Encrypt'
    Checked = True
    Color = 7695971
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    TabStop = True
    OnClick = rbEncryptClick
  end
  object RedtDisplay: TRichEdit
    Left = 197
    Top = 35
    Width = 633
    Height = 537
    Align = alCustom
    BevelOuter = bvSpace
    BevelKind = bkFlat
    Color = 7695971
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 8
    Zoom = 100
    OnChange = Change
  end
  object MedtKeycode: TMaskEdit
    Left = 8
    Top = 224
    Width = 81
    Height = 21
    Align = alCustom
    Color = clMenu
    MaxLength = 10
    TabOrder = 4
    Text = ''
    TextHint = 'ex. abcdefghij'
    OnChange = MedtKeycodeChange
  end
  object BbtnCopy: TBitBtn
    Left = 836
    Top = 35
    Width = 38
    Height = 34
    Glyph.Data = {
      82060000424D8206000000000000420000002800000014000000140000000100
      200003000000400600008CB800008CB8000000000000000000000000FF0000FF
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000E000000A0000000A00000
      00A1000000A2000000A3000000A3000000A3000000A3000000A2000000A10000
      00A0000000A00000000E00000000000000000000000000000000000000000000
      000000000048000000FF000000FB000000FA000000FC000000FE000000FE0000
      00FE000000FE000000FC000000FA000000FB000000FF00000048000000000000
      00000000000000000000000000000000000000000046000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000004600000000000000000000000000000000000000000000
      000000000045000000FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000045000000000000
      00000000000000000000000000000000000000000045000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000004500000000000000000000000000000000000000000000
      000000000045000000FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000045000000000000
      00000000000000000000000000000000000000000045000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000004500000000000000000000000000000000000000000000
      000000000045000000FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000045000000000000
      00000000000000000000000000000000000000000045000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000004500000000000000000000000000000000000000000000
      000000000045000000FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF00000045000000000000
      00000000000000000000000000000000000000000045000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000004500000000000000000000000000000000000000000000
      000000000044000000FF00000000000000B3000000FF000000FF000000FF0000
      00FF000000FF000000FF000000B300000000000000FF00000044000000000000
      00000000000000000000000000000000000000000044000000FF000000000000
      00D4000000D0000000460000004E0000004E00000046000000D0000000D40000
      0000000000FF0000004400000000000000000000000000000000000000000000
      000000000042000000FF00000068000000FF000000CB00000043000000000000
      000000000043000000CB000000FF00000068000000FF00000042000000000000
      0000000000000000000000000000000000000000003F000000FF000000FF0000
      00FF000000FF000000FF000000A1000000A1000000FF000000FF000000FF0000
      00FF000000FF0000003F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000042000000FF0000
      00FF000000430000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
    TabOrder = 9
    OnClick = BbtnCopyClick
  end
  object BBtnClear: TBitBtn
    Left = 836
    Top = 75
    Width = 38
    Height = 34
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    ModalResult = 4
    NumGlyphs = 2
    TabOrder = 10
    OnClick = BBtnClearClick
  end
  object TSTheme: TToggleSwitch
    Left = 836
    Top = 138
    Width = 79
    Height = 20
    State = tssOn
    StateCaptions.CaptionOn = 'Dark'
    StateCaptions.CaptionOff = 'Light'
    TabOrder = 11
    OnClick = TSThemeClick
  end
  object btnRandom: TBitBtn
    Left = 8
    Top = 193
    Width = 81
    Height = 25
    Caption = 'Randomize'
    TabOrder = 3
    OnClick = btnRandomClick
  end
  object cbAnimations: TCheckBox
    Left = 836
    Top = 115
    Width = 69
    Height = 17
    Caption = 'Animations'
    Checked = True
    State = cbChecked
    TabOrder = 12
    OnClick = cbAnimationsClick
  end
  object redInvisible: TRichEdit
    Left = 645
    Top = 483
    Width = 185
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    Visible = False
    Zoom = 100
  end
  object OTFDEncrypt: TOpenTextFileDialog
    Filter = 'Text files (*.txt)|*.TXT'
    Options = [ofHideReadOnly, ofOldStyleDialog, ofEnableSizing]
    Left = 48
    Top = 416
  end
  object STFDSave: TSaveTextFileDialog
    Filter = 'Text files (*.txt)|*.TXT'
    Options = [ofHideReadOnly, ofOldStyleDialog, ofEnableSizing]
    Encodings.Strings = (
      'UTF-8')
    Left = 8
    Top = 416
  end
  object mmCypher: TMainMenu
    Left = 88
    Top = 416
    object mmFile: TMenuItem
      Caption = '&File'
      ShortCut = 32838
      object mmBrowse: TMenuItem
        Caption = '&Browse...'
        ShortCut = 16450
        OnClick = mmBrowseClick
      end
      object mmSave: TMenuItem
        Caption = '&Save'
        ShortCut = 16467
        OnClick = mmSaveClick
      end
      object mmSaveas: TMenuItem
        Caption = 'Save as...'
        ShortCut = 24659
        OnClick = mmSaveasClick
      end
    end
    object mmCipher1: TMenuItem
      Caption = '&Cipher'
      ShortCut = 32835
      object mmEncrypt: TMenuItem
        Caption = '&Encrypt'
        ShortCut = 24645
        OnClick = mmEncryptClick
      end
      object mmDecrypt: TMenuItem
        Caption = '&Decrypt'
        ShortCut = 24644
        OnClick = mmDecryptClick
      end
    end
    object mmHelp: TMenuItem
      Caption = '&Help'
      ShortCut = 32840
      object mmDocumentation: TMenuItem
        Caption = 'Documentation'
        ShortCut = 16456
        OnClick = mmDocumentationClick
      end
    end
  end
end
