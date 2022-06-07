object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 469
  ClientWidth = 839
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
  object shpExitBlock: TShape
    Left = 24
    Top = 95
    Width = 65
    Height = 65
    Brush.Color = clRed
    Pen.Width = 3
  end
  object shpBlock1: TShape
    Left = 24
    Top = 166
    Width = 65
    Height = 65
    Brush.Color = clGreen
    Pen.Width = 3
  end
  object shpBlock2: TShape
    Left = 24
    Top = 237
    Width = 65
    Height = 65
    Brush.Color = clGreen
    Pen.Width = 3
  end
  object shpBlock3: TShape
    Left = 24
    Top = 308
    Width = 65
    Height = 65
    Brush.Color = clGreen
    Pen.Width = 3
  end
  object shpExitSegment: TShape
    Left = 24
    Top = 379
    Width = 65
    Height = 65
    Brush.Color = clSilver
  end
  object shpTable: TShape
    Left = 24
    Top = 24
    Width = 65
    Height = 65
    Brush.Color = clBlack
  end
  object pnlNavigator: TPanel
    Left = 569
    Top = 232
    Width = 120
    Height = 120
    TabOrder = 0
    object spDown: TSpeedButton
      Left = 49
      Top = 78
      Width = 23
      Height = 22
    end
    object sbRight: TSpeedButton
      Left = 78
      Top = 50
      Width = 23
      Height = 22
    end
    object sbLeft: TSpeedButton
      Left = 20
      Top = 50
      Width = 23
      Height = 22
    end
    object sbUp: TSpeedButton
      Left = 49
      Top = 22
      Width = 23
      Height = 22
    end
  end
  object ActionList1: TActionList
    Left = 768
    Top = 88
    object actHelpContents: THelpContents
      Category = 'Help'
      Caption = '&Contents'
      Enabled = False
      Hint = 'Help Contents'
      ImageIndex = 40
      OnExecute = actHelpContentsExecute
    end
    object actStartGame: TAction
      Caption = 'StartGame'
      OnExecute = actStartGameExecute
    end
    object actDrawExitBlock: TAction
      Category = 'Draw'
      Caption = 'Draw ExitBlock'
      OnExecute = actDrawExitBlockExecute
    end
    object actDrawTable: TAction
      Category = 'Draw'
      OnExecute = actDrawTableExecute
    end
    object actDrawBlock1: TAction
      Category = 'Draw'
      Caption = 'actDrawBlock1'
      OnExecute = actDrawBlock1Execute
    end
    object actDrawBlock2: TAction
      Category = 'Draw'
      Caption = 'actDrawBlock2'
      OnExecute = actDrawBlock2Execute
    end
    object actDrawBlock3: TAction
      Category = 'Draw'
      Caption = 'actDrawBlock3'
      OnExecute = actDrawBlock3Execute
    end
    object actDrawExitSegment: TAction
      Category = 'Draw'
      Caption = 'actDrawExitSegment'
      OnExecute = actDrawExitSegmentExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 768
    Top = 24
    object StartGame1: TMenuItem
      Action = actStartGame
      Caption = 'Start Game'
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object HelpContent1: TMenuItem
        Action = actHelpContents
      end
    end
  end
end
