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
  object Label1: TLabel
    Left = 594
    Top = 194
    Width = 47
    Height = 13
    Caption = 'Directions'
  end
  object lblBlocks: TLabel
    Left = 472
    Top = 194
    Width = 29
    Height = 13
    Caption = 'Blocks'
  end
  object pnlTable: TPanel
    Left = 32
    Top = 36
    Width = 329
    Height = 329
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    object shpBlock1: TShape
      Left = 144
      Top = 118
      Width = 65
      Height = 65
      Hint = 'Block1'
      Brush.Color = clGreen
      ParentShowHint = False
      Pen.Width = 3
      ShowHint = True
    end
    object shpBlock2: TShape
      Left = 144
      Top = 189
      Width = 65
      Height = 65
      Hint = 'Block2'
      Brush.Color = clGreen
      ParentShowHint = False
      Pen.Width = 3
      ShowHint = True
    end
    object shpBlock3: TShape
      Left = 144
      Top = 260
      Width = 65
      Height = 65
      Hint = 'Block3'
      Brush.Color = clGreen
      ParentShowHint = False
      Pen.Width = 3
      ShowHint = True
    end
    object shpExitSegment: TShape
      Left = 232
      Top = 189
      Width = 65
      Height = 65
      Brush.Color = clPurple
    end
    object shpExitBlock: TShape
      Left = 144
      Top = 47
      Width = 65
      Height = 65
      Hint = 'Block0'
      Brush.Color = clRed
      ParentShowHint = False
      Pen.Width = 3
      ShowHint = True
    end
  end
  object pnlNavigator: TPanel
    Left = 569
    Top = 221
    Width = 120
    Height = 120
    TabOrder = 0
    object spDown: TSpeedButton
      Left = 49
      Top = 78
      Width = 23
      Height = 22
      OnClick = spDownClick
    end
    object sbRight: TSpeedButton
      Left = 78
      Top = 50
      Width = 23
      Height = 22
      OnClick = sbRightClick
    end
    object sbLeft: TSpeedButton
      Left = 20
      Top = 50
      Width = 23
      Height = 22
      OnClick = sbLeftClick
    end
    object sbUp: TSpeedButton
      Left = 49
      Top = 22
      Width = 23
      Height = 22
      OnClick = sbUpClick
    end
  end
  object Panel1: TPanel
    Left = 448
    Top = 221
    Width = 97
    Height = 141
    TabOrder = 2
    object rbtExitBlock: TRadioButton
      Left = 6
      Top = 8
      Width = 113
      Height = 17
      Caption = 'Exit Block'
      TabOrder = 0
    end
    object rbtBlock1: TRadioButton
      Left = 6
      Top = 39
      Width = 113
      Height = 17
      Caption = 'Block 1'
      TabOrder = 1
    end
    object rbtBlock2: TRadioButton
      Left = 6
      Top = 70
      Width = 113
      Height = 17
      Caption = 'Block 2'
      TabOrder = 2
    end
    object rbtBlock3: TRadioButton
      Left = 8
      Top = 104
      Width = 113
      Height = 17
      Caption = 'Block 3'
      TabOrder = 3
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
    object actDraw: TAction
      Category = 'Draw'
      Caption = 'actDraw'
      OnExecute = actDrawExecute
    end
  end
  object MainMenu1: TMainMenu
    Left = 768
    Top = 24
    object mniGame: TMenuItem
      Caption = 'Game'
      object StartGame1: TMenuItem
        Action = actStartGame
        Caption = 'Start'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object HelpContent1: TMenuItem
        Action = actHelpContents
      end
    end
  end
end
