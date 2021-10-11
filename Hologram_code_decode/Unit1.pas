unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math, ComCtrls, XPMan, ExtDlgs;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Edit1: TEdit;
    Timer1: TTimer;
    Image3: TImage;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    ColorDialog1: TColorDialog;
    Button3: TButton;
    Button4: TButton;
    XPManifest1: TXPManifest;
    Label5: TLabel;
    Edit3: TEdit;
    Label6: TLabel;
    Edit4: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Button5: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Button6: TButton;
    Label10: TLabel;
    Label11: TLabel;
    Edit5: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Edit6: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TRGB = record
  r:real;
  g:real;
  b:real;
end;

var
  Form1: TForm1;

  bitmapOriginal: TBitmap;
  bitmapHologram: TBitmap;
  bitmapRestored: TBitmap;

  a: array of array of TRGB;
  b: array of array of real;

  sizeA: integer;
  sizeB: integer;

  WR: real;
  WG: real;
  WB: real;

  mouseButton: integer = 0;
  mousePos: TPoint;

implementation

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var
  x0, y0: integer;
  x1, y1: integer;
  d: real;

  max: real;
  sizeBA: real;
begin

  WR := StrToFloat(Edit1.Text);
  WG := StrToFloat(Edit5.Text);
  WB := StrToFloat(Edit6.Text);

  sizeBA := sizeB / sizeA;

  for x0 := 0 to sizeA-1 do
    for y0 := 0 to sizeA-1 do
    begin
      a[x0,y0].r := GetRValue(bitmapOriginal.Canvas.Pixels[x0,y0]);
      a[x0,y0].g := GetGValue(bitmapOriginal.Canvas.Pixels[x0,y0]);
      a[x0,y0].b := GetBValue(bitmapOriginal.Canvas.Pixels[x0,y0]);
    end;

  for x1 := 0 to sizeB-1 do
    for y1 := 0 to sizeB-1 do
    begin
      b[x1,y1] := 0;

      for x0 := 0 to sizeA-1 do
        for y0 := 0 to sizeA-1 do
        begin

          d := sqrt(sqr(x0 * sizeBA - x1) +
                    sqr(y0 * sizeBA - y1) +
                    1);

          b[x1,y1] := b[x1,y1] +
                       (a[x0,y0].r * cos(d/WR) +
                        a[x0,y0].g * cos(d/WG) +
                        a[x0,y0].b * cos(d/WB))/3;
        end;
    end;

  max := 0;

  for x1 := 0 to sizeB-1 do
    for y1 := 0 to sizeB-1 do
    begin
      if (max < abs(b[x1,y1])) then
         max := abs(b[x1,y1]);

    end;

  for x1 := 0 to sizeB-1 do
    for y1 := 0 to sizeB-1 do
    begin
      if (max <> 0) then
          b[x1,y1] := abs(b[x1,y1]/max*127.5*StrToFloat(Edit2.Text) + 127.5);

      if (b[x1,y1] > 255) then
          b[x1,y1] := 255;
    end;

  for x1 := 0 to sizeB-1 do
    for y1 := 0 to sizeB-1 do
      bitmapHologram.Canvas.Pixels[x1,y1] := RGB(trunc(b[x1,y1]),
                                             trunc(b[x1,y1]),
                                             trunc(b[x1,y1]));

  Image3.Canvas.StretchDraw(Image3.ClientRect,bitmapHologram);
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  mousePos.X := x;
  mousePos.Y := y;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mousePos.X := x;
  mousePos.Y := y;

  if (Button = mbLeft) then
    mouseButton := 1
  else
    mouseButton := 2;

end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  mouseButton := 0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  Randomize;

  ColorDialog1.Color := RGB(255,255,255);

  sizeA := StrToInt(Edit3.Text);
  sizeB := StrToInt(Edit4.Text);

  SetLength(a, sizeA, sizeA);
  SetLength(b, sizeB, sizeB);

  bitmapOriginal := TBitmap.Create;
  bitmapOriginal.Width := sizeA;
  bitmapOriginal.Height := sizeA;

  bitmapOriginal.Canvas.StretchDraw(bitmapOriginal.Canvas.ClipRect,Image1.Picture.Bitmap);
  Image1.Picture.Bitmap := nil;  

  bitmapHologram := TBitmap.Create;
  bitmapHologram.Width := sizeB;
  bitmapHologram.Height := sizeB;

  bitmapRestored := TBitmap.Create;
  bitmapRestored.Width := sizeA;
  bitmapRestored.Height := sizeA;

  Image2.Canvas.Rectangle(Image2.ClientRect);
  Image3.Canvas.Rectangle(Image3.ClientRect);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if (mouseButton = 1)  then
    bitmapOriginal.Canvas.Pixels[
      trunc(mousePos.X/Image1.Width * sizeA),
      trunc(mousePos.Y/Image1.Height * sizeA)] := ColorDialog1.Color
  else
     if (mouseButton = 2)  then
    bitmapOriginal.Canvas.Pixels[
      trunc(mousePos.X/Image1.Width * sizeA),
      trunc(mousePos.Y/Image1.Height * sizeA)] := RGB(0,0,0);

  Image1.Canvas.StretchDraw(Image1.ClientRect,bitmapOriginal);
end;

procedure TForm1.Image3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i,j,r:integer;
begin

  bitmapHologram.Canvas.Brush.Color := RGB(0,0,0);

  if (Button = mbLeft) then
    bitmapHologram.Canvas.Ellipse(
      trunc(x / Image3.Width * sizeB - sizeB / 5),
      trunc(y / Image3.Height * sizeB - sizeB / 5),
      trunc(x / Image3.Width * sizeB + sizeB / 5),
      trunc(y / Image3.Height * sizeB + sizeB / 5));

  if (Button = mbRight) then
  for i := -sizeB div 5 to sizeB div 5 do
    for j := -sizeB div 5 to sizeB div 5 do
    begin
      r:= random(256);
      bitmapHologram.Canvas.Pixels[
        trunc(i + x /Image3.Width * sizeB),
        trunc(j + y / Image3.Height * sizeB)] := RGB(r, r, r);
    end;

  Image3.Canvas.StretchDraw(Image3.ClientRect, bitmapHologram);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  x0, y0: integer;
  x1, y1: integer;
  d: real;
  cosPhase: real;
  maxR, maxG, maxB: real;
  sizeBA: real;
  diff: TRGB;
begin

  WR := StrToFloat(Edit1.Text);
  WG := StrToFloat(Edit5.Text);
  WB := StrToFloat(Edit6.Text);

  sizeBA := sizeB / sizeA;

  for x1 := 0 to sizeB-1 do
    for y1 := 0 to sizeB-1 do
    begin
      b[x1,y1] := GetRValue(bitmapHologram.Canvas.Pixels[x1,y1]);
    end;
           
  for x0 := 0 to sizeA-1 do
    for y0 := 0 to sizeA-1 do
    begin
      a[x0,y0].r := 0;
      a[x0,y0].g := 0;
      a[x0,y0].b := 0;

      for x1 := 0 to sizeB-1 do
        for y1 := 0 to sizeB-1 do
        begin
          d := sqrt(sqr(x0 * sizeBA - x1) +
                    sqr(y0 * sizeBA - y1) +
                    1);

          a[x0,y0].r := a[x0,y0].r + b[x1,y1] * cos(d/WR);
          a[x0,y0].g := a[x0,y0].g + b[x1,y1] * cos(d/WG);
          a[x0,y0].b := a[x0,y0].b + b[x1,y1] * cos(d/WB);
        end;

       a[x0,y0].r := abs(a[x0,y0].r);
       a[x0,y0].g := abs(a[x0,y0].g);
       a[x0,y0].b := abs(a[x0,y0].b);
    end;

  maxR := 0;
  maxG := 0;
  maxB := 0;

  for x0 := 0 to sizeA-1 do
    for y0 := 0 to sizeA-1 do
    begin
      if (maxR < a[x0,y0].r) then
         maxR := a[x0,y0].r;
      if (maxG < a[x0,y0].g) then
         maxG := a[x0,y0].g;
      if (maxB < a[x0,y0].b) then
         maxB := a[x0,y0].b;
    end;

  for x0 := 0 to sizeA-1 do
    for y0 := 0 to sizeA-1 do
    begin
      if (maxR<>0) then
        a[x0,y0].r := a[x0,y0].r / maxR * 255;
      if (maxG<>0) then
        a[x0,y0].g := a[x0,y0].g / maxG * 255;
      if (maxB<>0) then
        a[x0,y0].b := a[x0,y0].b / maxB * 255;
    end;

 for x0 := 0 to sizeA-1 do
    for y0 := 0 to sizeA-1 do
    begin
        bitmapRestored.Canvas.Pixels[x0,y0] := RGB(
          trunc(a[x0,y0].r),
          trunc(a[x0,y0].g),
          trunc(a[x0,y0].b));
    end;

  Image2.Canvas.StretchDraw(Image2.ClientRect,bitmapRestored);


  diff.r := 0;
  diff.g := 0;
  diff.b := 0;

  for x0 := 0 to sizeA-1 do
    for y0 := 0 to sizeA-1 do
    begin
        diff.r := diff.r + abs( GetRValue(bitmapOriginal.Canvas.Pixels[x0,y0]) -
                                GetRValue(bitmapRestored.Canvas.Pixels[x0,y0]) ) /
                                255;
        diff.g := diff.g + abs( GetGValue(bitmapOriginal.Canvas.Pixels[x0,y0]) -
                                GetGValue(bitmapRestored.Canvas.Pixels[x0,y0]) ) /
                                255;
        diff.b := diff.b + abs( GetBValue(bitmapOriginal.Canvas.Pixels[x0,y0]) -
                                GetBValue(bitmapRestored.Canvas.Pixels[x0,y0]) ) /
                                255;
    end;

    diff.r := diff.r / sqr(sizeA) / sqrt(3);
    diff.g := diff.g / sqr(sizeA) / sqrt(3);
    diff.b := diff.b / sqr(sizeA) / sqrt(3);

    Label11.Caption := FloatToStr(sqrt(sqr(diff.r) +
                                       sqr(diff.g) +
                                       sqr(diff.b)) * 100) + '%';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ColorDialog1.Execute;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  bitmapOriginal.Canvas.Brush.Color := ColorDialog1.Color;
  bitmapOriginal.Canvas.FillRect(bitmapOriginal.Canvas.ClipRect);
end;

procedure TForm1.Edit3Change(Sender: TObject);
begin

  if (StrToInt(Edit3.Text) > Image1.Width) then
    Edit3.Text := IntToStr(Image1.Width);

    sizeA := StrToInt(Edit3.Text);

    SetLength(a, sizeA, sizeA);

    bitmapOriginal.Width := sizeA;
    bitmapOriginal.Height := sizeA;

    bitmapRestored.Width := sizeA;
    bitmapRestored.Height := sizeA;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

  if (StrToInt(Edit4.Text) > Image1.Width) then
    Edit4.Text := IntToStr(Image1.Width);

    sizeB := StrToInt(Edit4.Text);

    SetLength(b, sizeB, sizeB);

    bitmapHologram.Width := sizeB;
    bitmapHologram.Height := sizeB;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  tempBitmap: TBitmap;
begin
  if (OpenPictureDialog1.Execute = true) then
  begin
    tempBitmap := TBitmap.Create;
    tempBitmap.LoadFromFile(OpenPictureDialog1.FileName);

    bitmapOriginal.Canvas.StretchDraw(bitmapOriginal.Canvas.ClipRect, tempBitmap);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin              
  Image1.Picture.SaveToFile('1.bmp');
  Image3.Picture.SaveToFile('2.bmp');
  Image2.Picture.SaveToFile('3.bmp');
end;

end.
