object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  HelpFile = 
    'E:\Users\banes\Documents\Embarcadero\Studio\projects\grUnblock\p' +
    'rUnblock\Help\Unblock.chm'
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ActionList1: TActionList
    Left = 544
    Top = 96
    object HelpContents1: THelpContents
      Category = 'Help'
      Caption = '&Contents'
      Enabled = False
      Hint = 'Help Contents'
      ImageIndex = 40
      OnExecute = HelpContents1Execute
    end
  end
  object MainMenu1: TMainMenu
    Left = 544
    Top = 32
    object Help1: TMenuItem
      Caption = 'Help'
      object HelpContent1: TMenuItem
        Action = HelpContents1
      end
    end
  end
end
