object Form1: TForm1
  Left = 233
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Hologram by ValLer 2011 '
  ClientHeight = 405
  ClientWidth = 979
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 96
    Width = 256
    Height = 256
    Picture.Data = {
      07544269746D617036030000424D360300000000000036000000280000001000
      0000100000000100180000000000000300000000000000000000000000000000
      0000000000000000000000000000000000300099300099300099300099300099
      3000990000000000000000000000000000000000000000000000000000003000
      9900F2FF00F2FF00F2FF00F2FF00F2FF00F2FF30009900000000000000000000
      000000000000000030009930009900F2FF00F2FF00F2FF00F2FF00F2FF00F2FF
      00F2FF00F2FF30009930009900000000000000000000000030009900F2FF00F2
      FF00F2FF241CED241CED00F2FF00F2FF00F2FF00F2FF00F2FF30009900000000
      000000000030009900F2FF00F2FF241CED241CED00F2FF00F2FF241CED241CED
      00F2FF00F2FF00F2FF00F2FF30009900000030009900F2FF00F2FF00F2FF00F2
      FF00F2FF00F2FF00F2FF00F2FF00F2FF241CED241CED00F2FF00F2FF00F2FF30
      009930009900F2FF00F2FF3C5A9C00F2FF00F2FF00F2FF30009900F2FF00F2FF
      00F2FF00F2FF00F2FF00F2FF00F2FF30009930009900F2FF3C5A9C3C5A9C00F2
      FF00F2FF00F2FF30009900F2FF00F2FF00F2FF00F2FF3C5A9C00F2FF00F2FF30
      009930009900F2FF3C5A9C00F2FF00F2FF00F2FF00F2FF00F2FF30009900F2FF
      00F2FF00F2FF3C5A9C3C5A9C00F2FF30009930009900F2FF00F2FF00F2FF00F2
      FFEFB70000000000F2FF00F2FF00F2FFEFB70000000000F2FF00F2FF00F2FF30
      009930009900F2FF00F2FF00F2FF000000EFB700EFB70000000000F2FF000000
      EFB700EFB70000F2FF00F2FF00F2FF30009900000030009900F2FF00F2FF00F2
      FF00000000000000F2FF00F2FF00F2FF00000000000000F2FF00F2FF30009900
      000000000000000030009900F2FF00F2FF00F2FF00F2FF00F2FF00F2FF00F2FF
      00F2FF00F2FF00F2FF30009900000000000000000000000030009930009900FF
      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0030009930009900000000
      000000000000000000000000000000FF0000FF0000FF0000FF0000FF0000FF00
      00FF0000FF0000FF0000000000FF000000000000000000000000000000000000
      0030009930009930009930009930009930009900000000000000FF0000000000
      0000}
    Stretch = True
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object Image2: TImage
    Left = 712
    Top = 96
    Width = 256
    Height = 256
  end
  object Image3: TImage
    Left = 360
    Top = 96
    Width = 256
    Height = 256
    OnMouseDown = Image3MouseDown
  end
  object Label1: TLabel
    Left = 120
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Original Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 440
    Top = 24
    Width = 85
    Height = 13
    Caption = 'Hologram Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 752
    Top = 24
    Width = 166
    Height = 13
    Caption = 'Restored from hologram Data'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 24
    Width = 23
    Height = 13
    Caption = 'Red:'
  end
  object Label5: TLabel
    Left = 496
    Top = 64
    Width = 42
    Height = 13
    Caption = 'Intensity:'
  end
  object Label6: TLabel
    Left = 256
    Top = 64
    Width = 11
    Height = 13
    Caption = 'px'
  end
  object Label7: TLabel
    Left = 456
    Top = 64
    Width = 11
    Height = 13
    Caption = 'px'
  end
  object Label8: TLabel
    Left = 160
    Top = 64
    Width = 53
    Height = 13
    Caption = 'Resolution:'
  end
  object Label9: TLabel
    Left = 360
    Top = 64
    Width = 53
    Height = 13
    Caption = 'Resolution:'
  end
  object Label10: TLabel
    Left = 712
    Top = 376
    Width = 52
    Height = 13
    Caption = 'Difference:'
  end
  object Label11: TLabel
    Left = 768
    Top = 376
    Width = 14
    Height = 13
    Caption = '0%'
  end
  object Label12: TLabel
    Left = 8
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Green:'
  end
  object Label13: TLabel
    Left = 16
    Top = 72
    Width = 24
    Height = 13
    Caption = 'Blue:'
  end
  object Edit1: TEdit
    Left = 48
    Top = 16
    Width = 57
    Height = 21
    TabOrder = 1
    Text = '0,03'
  end
  object Button2: TButton
    Left = 624
    Top = 216
    Width = 75
    Height = 25
    Caption = '> Decode >'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 272
    Top = 216
    Width = 75
    Height = 25
    Caption = '> Encode >'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 552
    Top = 56
    Width = 57
    Height = 21
    TabOrder = 3
    Text = '2,0'
  end
  object Button3: TButton
    Left = 96
    Top = 368
    Width = 81
    Height = 25
    Caption = 'Pen Color'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 192
    Top = 368
    Width = 73
    Height = 25
    Caption = 'Clear'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit3: TEdit
    Left = 216
    Top = 56
    Width = 33
    Height = 21
    TabOrder = 6
    Text = '16'
    OnChange = Edit3Change
  end
  object Edit4: TEdit
    Left = 416
    Top = 56
    Width = 33
    Height = 21
    TabOrder = 7
    Text = '176'
    OnChange = Edit4Change
  end
  object Button5: TButton
    Left = 8
    Top = 368
    Width = 73
    Height = 25
    Caption = 'Load'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 896
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Edit5: TEdit
    Left = 48
    Top = 40
    Width = 57
    Height = 21
    TabOrder = 10
    Text = '0,029'
  end
  object Edit6: TEdit
    Left = 48
    Top = 64
    Width = 57
    Height = 21
    TabOrder = 11
    Text = '0,028'
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 352
    Top = 352
  end
  object ColorDialog1: TColorDialog
    Left = 312
    Top = 352
  end
  object XPManifest1: TXPManifest
    Left = 680
    Top = 56
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 712
    Top = 56
  end
end
