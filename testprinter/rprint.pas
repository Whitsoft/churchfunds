unit rprint;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  PrintersDlgs, rprintclass;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    PgLfMarg: TEdit;
    PgTpMarg: TEdit;
    PgBtMarg: TEdit;
    PgRtMarg: TEdit;
    EdXDPI: TEdit;
    EdYDPI: TEdit;
    EdWidth: TEdit;
    EdLength: TEdit;
    EdTop: TEdit;
    EdLf: TEdit;
    EdRt: TEdit;
    EdBt: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabelBot: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
    procedure  TestFrame;
    procedure  TestLabel;
    procedure  TestTabs;
  end;

var
  Form1: TForm1;
  RPrinter: TReportPrinterClass;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
   If RPrinter.CurrentPage = nil then RPrinter.NewPage;
  TestFrame;
 // TestLabel;
 // TestTabs;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  If RPrinter.CurrentPage = nil then RPrinter.NewPage;
  TestLabel;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   With RPrinter do
     begin
       If RPrinter.CurrentPage = nil then NewPage;
       CurrentPage.Canvas.RoundRect(MarginLeft + 72,  MarginTop + 72, MarginRight - 72, MarginBottom -72, 18, 18);
       CurrentPage.Canvas.RoundRect(MarginLeft + 144, MarginTop + 144, MarginRight - 144, MarginBottom -144, 18, 18);
       CurrentPage.Canvas.RoundRect(MarginLeft + 216, MarginTop + 216, MarginRight - 216, MarginBottom -216, 18, 18);
       CurrentPage.Canvas.RoundRect(MarginLeft + 288, MarginTop + 288, MarginRight - 288, MarginBottom -288, 18, 18);
     end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  TmpTab: PTab;
begin
  With RPrinter do
    begin
      If RPrinter.CurrentPage = nil then NewPage;
      CurY := 144;
      TmpTab := NewTab(5,0.1,JUSTIFYLEFT,2.5,0.05,ABSOLUT, BOXLINEALL,3);
      TmpTab := NewTab(5,2.75,JUSTIFYRIGHT,2.25,0.05,ABSOLUT, BOXLINEALL,3);
      TmpTab := NewTab(5,5.15,JUSTIFYRIGHT,2.25,0.05,ABSOLUT, BOXLINEALL,3);
      PutTabFont(5, HELVETICA, StrToInt(Edit1.Text));

      Bold:=True;
      PrintTab(5,'Liability Accounts');
      Bold:=False;
      PrintTab(5,'OverPaid');
      PrintTab(5,'Owed');

      Bold:=True;
      PrintTab(5,'Liability Accounts');
      Bold:=False;
      PrintTab(5,'OverPaid');
      PrintTab(5,'Owed');
    end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  With RPrinter do
     begin
      EdXDPI.Text := IntToStr(PRDotsPI.XDotsPI);
      EdYDPI.Text := IntToStr(PRDotsPI.YDotsPI);
      EdWidth.Text := IntToStr(PageWidthInt);
      EdLength.Text := IntToStr(PageLengthInt);

      Label12.Caption := FloatToStr(PageWidthInt/72.0);
      Label13.Caption := FloatToStr(PageLengthInt/72.0);

      EdTop.Text := IntToStr(PrMarginTop);
      EdLf.Text :=  IntToStr(PrMarginLeft);
      EdRt.Text :=  IntToStr(PrMarginRight);
      EdBt.Text :=  IntToStr(PrMarginBottom);

      Label14.Caption := FloatToStr(PrMarginTop/600.0);
      Label15.Caption := FloatToStr(PrMarginLeft/600.0);
      Label16.Caption := FloatToStr(PrMarginRight/600.0);
      Label17.Caption := FloatToStr(PrMarginBottom/600.0);

      PgTpMarg.Text :=  IntToStr(MarginTop);
      PgLfMarg.Text :=  IntToStr(MarginLeft);
      PgRtMarg.Text :=  IntToStr(MarginRight);
      PgBtMarg.Text :=  IntToStr(MarginBottom);

      Label18.Caption := FloatToStr(MarginLeft/72.0);
      Label19.Caption := FloatToStr(MarginTop/72.0);
      Label20.Caption := FloatToStr(MarginRight/72.0);
      Label21.Caption := FloatToStr(MarginBottom/72.0);
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  RPrinter := TReportPrinterClass.Create(Sender as TObject);
end;

procedure  TForm1.TestFrame;
begin
  With RPrinter do
  begin
    CurrentPage.Canvas.RoundRect(MarginLeft, MarginTop , MarginRight, MarginBottom, 18, 18);
  end;
end;

procedure  TForm1.TestLabel;
begin
  With RPrinter do
    CurrentPage.Canvas.RoundRect(72  , 72  , 288 , 144, 18, 18);
end;

procedure  TForm1.TestTabs;
begin

end;

end.

