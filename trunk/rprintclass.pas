//Don Whitbeck 2010 - Basic class for printing - derived from newpsclass

unit rprintclass;
//{$linklib c}
{$mode objfpc}
interface
 uses initc, Forms, Controls,comCtrls, dialogs,
   sysutils, classes, strings, ExtCtrls, db, Graphics, GraphType, Newpsclass;

const
  CR = #13;
  LF = #10;
  JUSTIFYLEFT = 0;
  JUSTIFYCENTER = 1;
  JUSTIFYRIGHT = 2;
  TIMESROMAN = 'Times-Roman';
  TIMESITALIC = 'Times-Italic';
  TIMESBOLD = 'Times-Bold';
  HELVETICA = 'Helvetica';
  HELVETICAITALIC = 'Helvetica-Italic';
  HELVETICABOLD = 'Helvetica-Bold';
  HELVETICACONDENSED = 'Helvetica-Condensed';
  POINTS = 72.0;

  BOXSPACE  = 6;      //Extra height to fit current font
  BOXMARGIN = 4;      //Margin for left or right between box sides and text

  BOXLINEALL = 15;
  BOXLINENONE = 0;
  BOXLINELEFT = 1;
  BOXLINETOP = 2;
  BOXLINERIGHT = 4;
  BOXLINEBOTTOM = 8;

  RELATIVE = TRUE;
  ABSOLUT = FALSE;



{     TRect = record
    case Integer of
      0: (Left, Top, Right, Bottom: Integer);
      1: (TopLeft, BottomRight: TPoint);
  end;    }



Type
        TPageArray = array [1..100] of TImage;

  TReportPrinterClass = class(TPostscriptClass)
  private
          fPrintForm        : TForm;
          fCurrentPage      : TImage;
          fPageIndex        : Integer;
          fToolBar          : TToolBar;
          fPages            : Integer;   // Number of pages in report
          fPageArray        : TPageArray;
          fLandscape        : Boolean;
          fSender           : TObject;
          fOnLandscapeChange: TNotifyEvent;
          fErrorMessage     : String;

         procedure   CreatePageArray;

   protected
         property    OnLandscapeChange: TNotifyEvent
                     read fOnLandscapeChange write fOnLandscapeChange;

         procedure   LandscapeChange(Sender: TObject);
         procedure   setLandscape(LS: boolean);
         procedure   Swap(var L, W: integer);
         //property    CurrentPage: TImage read fCurrentPage;
	 procedure   PrintPointXY(S: String; XPos, YPos: Integer);
	// function    CalcCenterPage: Integer;

         procedure   RTextOut(X, Y: Integer; S: String);
         procedure  TabTextOut(IDX, X, Y, BWidth, BLeft: Integer; S: String);
         procedure   PrintLeftPoint(S: String; XPos: integer);
	 procedure   PrintCenterPoint(S: String; XPos: integer);
	 procedure   PrintRightPoint(S: String; XPos: integer);
         procedure   PrintDot(XPos, YPos: Double; S: String);

         function    TabYPos(S: String; FHigh, BBase, BHght: Integer): Integer;
         procedure   PrintFormClose(Sender: TObject; var act: TCloseAction);
   public
         property    CurrentPage: TImage read fCurrentPage;
	 constructor Create(Sender: TObject);
         procedure   PrintFormCreate(Sender: TObject);

         property    Landscape: Boolean read fLandscape write setLandscape;
       //  property    TabArrayIndex: Integer read fTabArrayIndex write fTabArrayIndex;



       //  property    CurrentPage: TImage read fCurrentPage write fCurrentPage;


         property    PrintForm: TForm read fPrintForm;
         property    PageArray: TPageArray read fPageArray;


	 function    getBoxLeft(Combined: Byte): Boolean;
	 function    getBoxBottom(Combined: Byte): Boolean;
	 function    getBoxRite(Combined: Byte): Boolean;
	 function    getBoxTop(Combined: Byte): Boolean;

	 //function    ShadeToGreyScale(Shade: Integer): TGraphicsColor;
         //function    GreyScaleToShade(Shade: TGraphicsColor): Integer;
         function    BoxLinesToByte(Lf, Tp, Rt, Bt: Boolean): Byte;


         procedure   ShowReport;
	 procedure   PrintXY(XPos, YPos: Double; S: String);
	 procedure   PrintLeft(S: String; XPos: Double);
	 procedure   PrintCenter(S: String; XPos: Double);
	 procedure   PrintRight(S: String; XPos: Double);

	 procedure   printTab(IDX: integer; S: String);
         function    resetTab(IDX: Integer): PTab;


         //procedure   setBoxShade(TabPtr: PTab; Shade: Integer);
         //function    getBoxShade(TabPtr: PTab): Integer;
	 procedure   FreeAllTabs;
	 procedure   FreeTabs(IDX: Integer);
	 function    nextTab(IDX: Integer): Integer;
         procedure   Home;
         procedure   NewPage;
         procedure   EndPage;
         procedure   PrevPage(Sender: TObject);
         procedure   NextPage(Sender: TObject);
         procedure   PrintPage(Sender: TObject);
         procedure   PrintAllPages(Sender: TObject);
	 function    stripRight(S: String): String;
         function    calcStringY(Base, Height: Integer): integer;
	//New tab creates a new tab in tabs array width index = IDX

         procedure   XLocation(X: Double);
         procedure   RFormDestroy(Sender: TObject);
	 procedure   PrintCenterPage(S: String);
	 procedure   GotoXY(X, Y: Double);
	 procedure   ShowPage(IDX: Integer);
	 //postscript procedures
  end;

type
  pAddressRecord = ^TAddressRecord;
  TAddressRecord = record
     AName: String;
     Add1: String;
     Add2: String;
     CityState: String;
     ZipCode: String;
    // PostNetCode: PostNetType;
  end;

type
 TAddressLabelClass = class(TReportPrinterClass)
   private
         fLabelStyle       : String;
         fOutlineColor     : TColor;
         fNumAcross        : integer;
         fNumDown          : integer;
         fXpos             : integer;
         fYPos             : integer;
        // fMarginTop        : integer;
        // fMarginLeft       : integer;
         fTextMarginTop    : Integer;
         fTextMarginLeft   : Integer;
         fPostNetWeight    : Integer;
         fLabelWidth       : integer;
         fLabelHeight      : integer;
         fSpacingWidth     : integer;
         fSpacingHeight    : integer;
         fSpacingTop       : integer;
         fSpacingLeft      : integer;
         fRadius           : integer;
         fPostNetHeight    : Double;
         fPostNetSpacing   : Double;
         fPostNetLineWidth : Double;
         fPrintPostNet     : Boolean;
         fRowPointer       : Integer;
         fColPointer       : Integer;
         fPageDone         : Boolean;
         fAddressRecord    : TAddressRecord;
         fAddressDataSource: TDataSource;
 protected
   function getRadius: Double;
   procedure setRadius(Rad: Double);
   function getTextMarginTop: Double;
   procedure setTextMarginTop(Top: Double);
   function getTextMarginLeft: Double;
   procedure setTextMarginLeft(Left: Double);
   function getLabelWidth: Double;
   procedure setLabelWidth(LabelWidth: Double);
   function getLabelHeight: Double;
   procedure setLabelHeight(LabelHeight: Double);
   function getSpacingWidth: Double;
   procedure setSpacingWidth(SpacingWidth: Double);
   function getSpacingHeight: Double;
   procedure setSpacingHeight(SpacingHeight: Double);
   function getSpacingLeft: Double;
   procedure setSpacingLeft(SpacingLeft: Double);
   function getSpacingTop: Double;
   procedure setSpacingTop(SpacingTop: Double);
   procedure setPostnetLineWidth(Width: Double);
   procedure setAddressRecord(Title, fName, lName, Addr1, Addr2, City, State, Zip: String);
 public
   constructor Create(Sender: TObject);
  // destructor  Destroy; override;
   procedure LabelFormDestroy(Sender: TObject);
  // property Address: TAddressRecord  write setAddressRecord;
   property Radius: Double read getRadius write setRadius;
   property OutlineColor: TColor read fOutlineColor write fOutlineColor;
   property LabelStyle: String read fLabelStyle write fLabelStyle;
   property NumAcross: Integer read fNumAcross write fNumAcross;
   property NumDown: Integer read fNumDown write fNumDown;

   property TextMarginTop: Double read getTextMarginTop write setTextMarginTop;
   property TextMarginLeft: Double read getTextMarginLeft write setTextMarginLeft;
   property LabelWidth: Double read getLabelWidth write setLabelWidth;
   property LabelHeight: Double read getLabelHeight write setLabelHeight;
   property SpacingTop: Double read getSpacingTop write setSpacingTop;
   property SpacingLeft: Double read getSpacingLeft write setSpacingLeft;
   property SpacingWidth: Double read getSpacingWidth write setSpacingWidth;
   property SpacingHeight: Double read getSpacingHeight write setSpacingHeight;
   property PostNetHeight: Double read fPostNetHeight write fPostNetHeight;
   property PostNetSpacing: Double read fPostNetSpacing write fPostNetSpacing;
   property PostNetLineWidth: Double read fPostNetLineWidth write setPostNetLineWidth;
   property AddressDataSource: TDataSource read fAddressDataSource write fAddressDataSource;
   property PrintPostNet: Boolean read fPrintPostNet write fPrintPostNet;
   property PostNetWeight: integer read fPostNetWeight write fPostNetWeight;
   procedure putText(S: String);
   procedure PostNetXY(S: String; var X, Y: Integer; PostnetImage: TImage);
   procedure PrintLabels(LabelDataSrc: TDataSource);
   procedure PrintOneLabel;
   procedure OutlineLabel;
 end;


implementation

 procedure TReportPrinterClass.ShowReport;
 begin
   fPrintForm.Width := PageWidthInt;
   fPrintForm.Height := PageLengthInt;
   fPrintForm.Show;
   fToolBar.Show;
 end;


 procedure TReportPrinterClass.NewPage;
 begin
   inc(fPages);
   if fPrintForm = nil then
     PrintFormCreate(fSender);

   fCurrentPage := TImage.Create(FPrintForm as TComponent);
   With fCurrentPage do
      begin
        Transparent := true;
        Parent := fPrintForm;
        Align := alClient;
        Top := fToolBar.Height;
        Color := clWhite;
        Width := PageWidthInt;
        Height := PageLengthInt;
        font.Color := clBlack;
        AutoSize := true;
        fPageArray[fPages] := fCurrentPage;
      end;
    With fCurrentPage.Canvas do
      begin
        Brush.color := clWhite;
        FillRect(0,0,Width,Height);
        FillRect(0,0,Width,Height);
      end;
    CurX := MarginLeft;
    CurY := MarginTop ;
    ShowReport;
end;

 procedure TReportPrinterClass.PrintFormCreate(Sender: TObject);
  var
    ButtonR, ButtonF,ButtonPrint, ButtonPrintAll: TToolButton;
 begin
	CurX := MarginLeft;
	CurY := MarginTop ;
        fPrintForm := TForm.Create(Sender as TComponent);
        fPrintForm.OnClose := @PrintFormClose;
        fPrintForm.OnDestroy := @RFormDestroy;
        fPrintForm.Width := PageWidthInt;
        FPrintForm.Height := PageLengthInt;
        fToolBar := TToolBar.Create(fPrintForm as TComponent);
        fToolBar.Parent := fPrintForm;
        fToolBar.ShowCaptions := true;
        fPages := 1;
        fLandscape := false;
        With fToolBar do
          begin
            Flat := false;
            ButtonHeight := 32;
            ButtonWidth := 60;
            Height := 36;
            BorderWidth := 2;
            Anchors := [akTop, akLeft, akRight];

            ButtonR := TToolButton.Create(fToolBar);
            ButtonF := TToolButton.Create(fToolBar);
            ButtonPrint := TToolButton.Create(fToolBar);
            ButtonPrintAll := TToolButton.Create(fToolBar);

            ButtonR.Parent := fToolBar;
            ButtonF.Parent := fToolBar;
            ButtonR.onClick := @PrevPage;
            ButtonF.onClick := @NextPage;
            ButtonR.Caption := 'Rev';
            ButtonF.Caption := 'For';
            ButtonPrint.Parent := fToolBar;
            ButtonPrint.Caption := 'Print';
            ButtonPrint.onClick := @PrintPage;
            ButtonPrintAll.Parent := fToolBar;
            ButtonPrintAll.Caption := 'Print All';
            ButtonPrintAll.onClick := @PrintAllPages;
          end;
        fPageIndex := 1;
        CurrentY :=PointToInch(CurY);
        OpenPrintFile(getPrintFileName);
 end;

 constructor TReportPrinterClass.Create(Sender: TObject);
    begin
   	inherited create;               //Set defaults
        //create empty tab array
        //CreatePageArray;
        fSender := Sender;
        fOnLandscapeChange:= @LandscapeChange;
   end;

   procedure TReportPrinterClass.NextPage(Sender: TObject);
   begin
     if fPageIndex < fPages then
        begin
          inc(fPageIndex);
          fCurrentPage := fPageArray[fPageIndex];
          fCurrentPage.BringToFront;
        end;
   end;

   procedure TReportPrinterClass.PrintPage(Sender: TObject);
   begin
   {  if fCurrentPage = nil then exit;
     With fPrinter do
       begin
         ARect.Left := 0; ARect.Top := 0;
         ARect.Right := PaperSize.Width;
         ARect.Bottom := PaperSize.Height;
         BeginDoc;
         Canvas.StretchDraw(ARect, CurrentPage.Picture.Bitmap);
        // TImage(Currentpage).Picture.saveToFile('home/don/churchfunds/jk.bmp');

         EndDoc;
       end;   }
   end;

   procedure TReportPrinterClass.PrintAllPages(Sender: TObject);
   var
     ARect: TRect;
     LMargin, BMargin, IDX: Integer;
   begin
    { if fPages <= 0 then exit;
     With fPrinter do
       begin
         ARect.Left := 0; ARect.Top := 0;
         ARect.Right := PaperSize.Width;
         ARect.Bottom := PaperSize.Height;
         BeginDoc;
         for IDX := 1 to fPages do
           Canvas.StretchDraw(ARect, fPageArray[IDX].Picture.Bitmap);
         EndDoc;
       end;   }
   end;

  procedure TReportPrinterClass.PrevPage(Sender: TObject);
   begin
     if fPageIndex > 1 then
        begin
          dec(fPageIndex);
          fCurrentPage := fPageArray[fPageIndex];
          fCurrentPage.BringToFront;
        end;
   end;


  procedure TReportPrinterClass.CreatePageArray; //Array 1..100 of images
 // Type
 // PPage = ^TImage;
 // TPageArray = array [1..100] of PPage;
  var
    IDX: Integer;
  begin
  end;


 function  TReportPrinterClass.BoxLinesToByte(Lf, Tp, Rt, Bt: Boolean): Byte;
   var
    Res: Byte;
  begin
    Res:=0;
	If Lf then Res := Res or BOXLINELEFT;
	If Tp then Res := Res or BOXLINETOP;
	If Rt then Res := Res or BOXLINERIGHT;
	If Bt then Res := Res or BOXLINEBOTTOM;
	BoxLinesToByte := Res;
  end;

  procedure TReportPrinterClass.Home;
  begin
    CurX := MarginLeft;
    CurY := MarginTop;
  end;

  function TReportPrinterClass.getBoxLeft(Combined: Byte): boolean;
  begin
    getBoxLeft:=(Combined and 1) > 0;
  end;

 function TReportPrinterClass.getBoxBottom(Combined: Byte): boolean;
  begin
    getBoxBottom:=(Combined and 8) > 0;
  end;

  function TReportPrinterClass.getBoxRite(Combined: Byte): boolean;
  begin
     getBoxRite:=(Combined and 4) > 0;
  end;

  function TReportPrinterClass.getBoxTop(Combined: Byte): boolean;
  begin
    getBoxTop:=(Combined and 2) > 0;
  end;


  function TReportPrinterClass.TabYPos(S: String; FHigh, BBase, BHght: Integer): Integer;
  var
     BotMargin: Integer;
  begin
     With CurrentPage.Canvas do
       begin
          BotMargin := (BHght - FHigh) div 2 + 1;
         // BotMargin := BotMargin - (BotMargin mod 2);    //Weight toward bottom
          If BHght <= FHigh then
             begin
               Result := BBase - BHght + 1;
               exit;
             end
          else
            Result := BBase - BotMargin ;  //RText out adjusts to measure to bottom of text
       end;
    end;

  procedure TReportPrinterClass.RTextOut(X, Y: Integer; S: String);
  begin
    fCurrentPage.Canvas.TextOut(X, Y - FontHeight, S); //measure to bottom of text
  end;

  procedure TReportPrinterClass.TabTextOut(IDX, X, Y, BWidth, BLeft: Integer; S: String);
  var
    TS: String;
    TWidth, XS: Integer;
  begin
    XS := X;
    TS := S;
    While (fCurrentPage.Canvas.TextWidth(TS) > (BWidth - 2 * BOXSPACE)) do
      begin
        TS:=LeftStr(TS, Length(TS) -1);
        if TS = '' then break;
      end;

    if X < BLeft + BOXSPACE then
       XS := BLeft + BOXSPACE;
    fCurrentPage.Canvas.TextOut(XS, Y - TabArray[IDX]^.TabFont.FontHeight, TS); //measure to bottom of text
  end;

  procedure  TReportPrinterClass.printTab(IDX: Integer; S: String);
  var
        YPos, TmpY, Wide: Integer;
	just, SY, Box, XStart, FH: integer;
	BoxLeft, BoxTop, BoxRight, BoxHght, BoxWdth, BoxBottom: Integer;
	TabPtr: PTab;
  begin
    With CurrentPage.Canvas do
      begin
        Wide := TextWidth(S);
        Font.Size := TabArray[IDX]^.TabFont.FontSize;
        Font.Name := TabArray[IDX]^.TabFont.FontName;
        FH := TabArray[IDX]^.TabFont.FontHeight;
      end;
    if (IDX <= 0) or (IDX > 10) then exit;
    YPos:= CurY;
    TabPtr := TabArray[IDX]^.TabPos;
    //Shade := getBoxShade(TabPtr);

    With TabArray[IDX]^ do
      begin
        BoxHght := TabArray[IDX]^.boxHeight;
        //Box height is common to all tabs in this list
      end;
	With TabPtr^ do
	  begin
	    BoxLeft := Xpos;  //WRiteln('BoxLeft ', BoxLeft,' ',XPos);
	    BoxRight := XPos + BoxWidth;
	    BoxWdth := BoxWidth;
	    BoxTop := YPos - BoxHght;  //Measuring Y = 0 at top of page
            BoxBottom := YPos;
	    //BoxTop := BoxBase + BoxHght;          //could eliminate one function call
	    just := justifyText;
	    Box := BLines;
            SY := TabYPos(S, FH, BoxBottom,BoxHght);
	  end;

	 //fill tab box
         With CurrentPage.Canvas do
           begin
             Brush.color := TabPtr^.BShade;
             Brush.Style := bsSolid;
             Pen.Color := clBlack;
             FillRect(BoxLeft,BoxTop,BoxRight,BoxBottom);

	 //box lines if any
	 if getBoxBottom(Box) then
	    begin
               MoveTo(BoxLeft, BoxBottom);
               LineTo(BoxRight, BoxBottom);
            end;
	  if getBoxRite(Box) then
	    begin
               MoveTo(BoxRight, BoxTop);
               LineTo(BoxRight, BoxBottom);
            end;
	  if getBoxTop(Box) then
	    begin
	       MoveTo(BoxLeft, BoxTop);
               LineTo(BoxRight, BoxTop);
            end;
	  if getBoxLeft(Box) then
	     begin
               MoveTo(BoxLeft, BoxTop);
               LineTo(BoxLeft, BoxBottom);
	     end;
	   if S <> '' then
	     begin
	       TmpY := CurY;
	       CurY := SY;
	       if just = JUSTIFYRIGHT then
	         begin
		   XStart := BoxRight - Wide - BOXMARGIN;
                   TabTextOut(IDX, XStart, SY, BoxWdth, BoxLeft, S);
		 end
	       else if just = JUSTIFYCENTER then
	         begin
                   if Wide >= BoxWdth then
                     XStart := BoxLeft + BOXMARGIN
                   else
	             XStart := BoxLeft + (BoxWdth - Wide) div 2;
		   TabTextOut(IDX, XStart, SY, BoxWdth, BoxLeft, S);
	         end
	       else
	         begin
                   XStart := BoxLeft + BOXMARGIN;
		   TabTextOut(IDX, XStart, SY, BoxWdth, BoxLeft , S);
		 end;
	       CurY := TmpY;
	     end;  //if S <>
          // if nextTab(IDX) = 1 then     do this in newpsclass
             // TabNewLine(IDX);
        end;
        PrintPSTab(IDX, S);
  end;

 procedure TReportPrinterClass.PrintPointXY(S: String; XPos, YPos: Integer);
 //Print a string at X & Y without altering CurY
 begin
   Currentpage.canvas.Font.Size := Font.FontSize;
   Currentpage.canvas.Font.Name := Font.FontName;
   RTextOut(XPos,YPos , S);
 end;


  function  TReportPrinterClass.ResetTab(IDX: Integer): PTab;
  begin
    //With TabListPtr^ do
    With TabArray[IDX]^ do
       begin
         TabPos := TabHead;
	 TabIndex := 1;
         ResetTab := TabPos;
       end;
  end;

  //function  TReportPrinterClass.nextTab(TabListPtr: PTabList): PTab;
  function  TReportPrinterClass.nextTab(IDX: Integer): Integer;
  begin
    With TabArray[IDX]^ do
      begin
        If TabPos = TabTail then  //Last tab? then wrap to first
          begin
	    TabPos := TabHead;
	    TabIndex := 1;
	  end
        else
	  begin
	    TabPos := TabPos^.next;	  //increment tab position
	    TabIndex := TabIndex + 1;
	  end;
        result := TabIndex;
      end;
  end;

  function TReportPrinterClass.calcStringY(Base, Height: Integer): integer;
  var
    Margin, FSZ: integer;
  begin
 	FSZ := round(Double(Font.FontSize) * 0.75);
	if FSZ < Height then
	  begin
	    Margin := (Height - FSZ ) div 2 + 1;
	    calcStringY := Base - Margin;
	  end
	else
	  calcStringY := Base - 3;
  end;

  procedure TReportPrinterClass.FreeAllTabs;
  var
    I: Integer;
  begin
    for I := 1 to 10 do
	  FreeTabs(I);
  end;


  procedure TReportPrinterClass.FreeTabs(IDX: Integer);
  var
    ClrTab, NuTab, LastTab: PTab;
  begin
    if (IDX <= 0) then exit;
	ClrTab:=TabArray[IDX]^.TabHead;
        LastTab := TabArray[IDX]^.TabTail;
	if ClrTab <> nil then
	while (ClrTab <> LastTab) do
	  begin
	    NuTab:=ClrTab^.Next;
	    dispose(ClrTab);
	    ClrTab := NuTab;
	  end;
    dispose(clrTab);

	With TabArray[IDX]^ do
	  begin
	    IDX := 0;
		TabPos := nil;
		TabCount := 0;
		boxHeight := 0;
		TabHead := nil;
		TabTail := nil;
	 end;
end;


 //Print at an absoule position from left of page to start of text
 //from top of page to top of text

 procedure TReportPrinterClass.PrintXY(XPos, YPos: Double; S: String);
 //Print a string at X & Y without altering CurY
 var
   X, Y: Integer;
 begin
   X := InchToPoint(XPos);
   Y := InchToPoint(YPos);
   PrintPointXY(S, X, Y);
   PrintPSXY(S, XPos, YPos);
 end;

 procedure TReportPrinterClass.GotoXY(X, Y: Double);
 var
   XInt, YInt: Integer;
 begin
   XInt := InchToPoint(X);
   YInt := InchToPoint(Y);
   CurrentPage.Canvas.MoveTo(XInt,YInt);
   CurY := YInt;
   GotoPSXY(X, Y);
  end;

 procedure TReportPrinterClass.PrintCenterPage(S: String);
 var
   X, Y, St: Integer;
   Wide: Integer;
 begin
       CurrentPage.Canvas.Font.Size := Font.FontSize;
       CurrentPage.Canvas.Font.Name := Font.FontName;
       Y := CurrentPage.Canvas.TextWidth(S);
       X := CalcCenterPage;
       St := X - (Y div 2);
       RTextOut(St, CurY,S);
       PrintPSCenterPage(S);
  end;


 procedure TReportPrinterClass.PrintLeft(S: String; XPos: Double);
 begin
   Currentpage.canvas.Font.Size := Font.FontSize;
   Currentpage.canvas.Font.Name := Font.FontName;
   RTextOut(InchToPoint(Xpos),CurY,S);
 end;

 procedure TReportPrinterClass.PrintCenter(S: String; XPos: Double);
 var
   X, Wide: Integer;
 begin
   X := InchToPoint(XPos);
   CurrentPage.Canvas.Font.Size := Font.FontSize;
   CurrentPage.Canvas.Font.Name := Font.FontName;
   Wide := CurrentPage.Canvas.TextWidth(S);
   RTextOut(X - Wide div 2, CurY, S);

 end;

 procedure TReportPrinterClass.PrintRight(S: String; XPos: Double);
 var
    X, Wide: Integer;
 begin
   X := InchToPoint(XPos);
   CurrentPage.Canvas.Font.Size := Font.FontSize;
   CurrentPage.Canvas.Font.Name := Font.FontName;
   Wide := CurrentPage.Canvas.TextWidth(S);
   RTextOut(X - Wide, CurY, S);
 end;

 procedure TReportPrinterClass.PrintDot(XPos, YPos: Double; S: String);
 var
    X, Y, L, charW, Dot: Integer;
 begin
   X := InchToPoint(XPos);
   Y := InchToPoint(YPos);
   Dot := pos('.',S);
   L := Length(S);
   if Dot <= 0 then
     begin
       PrintRight(S,XPos);
       exit;
     end;

//   charW := TextWidth(S) div L;
   X := X - charW * Dot;
   CurrentPage.Canvas.Font.Size := Font.FontSize;
   CurrentPage.Canvas.Font.Name := Font.FontName;
   RTextOut(X , Y, S);
 end;


  procedure TReportPrinterClass.PrintLeftPoint(S: String; XPos: integer);
 begin
   With CurrentPage.Canvas do
     begin
       MoveTo(XPos,CurY);
       RTextOut(XPos,CurY,S);
     end;
 end;

 procedure TReportPrinterClass.PrintCenterPoint(S: String; XPos: integer);
  begin
    With CurrentPage.Canvas do
      begin
        MoveTo(XPos,CurY);
        RTextOut(XPos,CurY,S);
      end;
 end;

 procedure TReportPrinterClass.PrintRightPoint(S: String; XPos: integer);
 var
   Wide: Integer;
 begin
       CurrentPage.Canvas.Font.Size := Font.FontSize;
        CurrentPage.Canvas.Font.Name := Font.FontName;
        Wide := CurrentPage.Canvas.TextWidth(S);
        RTextOut(XPos - Wide,CurY,S);
 end;



procedure TReportPrinterClass.XLocation(X: Double);
var
  Xint: Integer;
begin
 if (PrintFileOpen)  then
   begin
     XInt := InchToPoint(X);
 	 writeln(PrintFile,'/loc ',Xint,' def');
   end;
 // /loc Xint def
end;

  procedure TReportPrinterClass.ShowPage(IDX: Integer);
  begin

  end;

  procedure TReportPrinterClass.RFormDestroy(Sender: TObject);
  begin
  // InitCriticalSection(fCriticalSection);
	FreeAllTabs;
	inherited Destroy;

	//DoneCriticalSection(fCriticalSection);
end;


  procedure TReportPrinterClass.EndPage;
  begin
    //Stub for now, maybe reset current page double buffered
  end;

  function TReportPrinterClass.stripRight(S: String): String;
  var
    Tmp: String;
    I1, I2 : Integer;
  begin
    Tmp := '123456789';
    I2 := Length(S);
    while S[I2] = ' ' do
      dec(I2);
    for I1 := 1 to I2 do
      Tmp[I1] := S[I1];
    result := Tmp;
  end;

Procedure TReportPrinterClass.PrintFormClose(Sender: TObject; var Act: TCloseAction);

Var
  IDX: Integer;
begin
  for IDX := 1 to fPages do
    fPageArray[IDX].free;
  fPages := 0;
  fCurrentPage := nil;
  Act := caFree;
  fPrintForm := nil;
  ClosePrintFile;
end;


   procedure TReportPrinterClass.Swap(var L, W: integer);
   var
     tmp: Integer;
   begin
     tmp := L;
     L:= W;
     W := tmp;
   end;


procedure TReportPrinterClass.setLandscape(LS: boolean);
begin
  fLandscape := LS;
  if Assigned(fOnLandscapeChange) then
        OnLandscapeChange(Self);
end;


procedure TReportPrinterClass.LandscapeChange(Sender: TObject);
   begin
     { if fLandscape then
        begin
          if fPageHeight >= fPageWidth then
            swap(fPageHeight, fPagewidth);
        end
     else
        begin
           if fPageWidth >= fPageHeight then
            swap(fPageHeight, fPagewidth);
        end;  }
end;

   constructor TAddressLabelClass.Create(Sender: TObject);
    begin
      inherited create(Sender);
      fRadius := 18;
      fRowPointer := 0;
      fColPointer := 0;
      fPageDone := False;
      fPostNetHeight := 0.125;
      fPostNetSpacing := 0.08;
      PostNetLineWidth := 0.04;
    end;

  procedure TAddressLabelClass.LabelFormDestroy(Sender: TObject);
  begin
  // InitCriticalSection(fCriticalSection);
  inherited Destroy;
  //DoneCriticalSection(fCriticalSection);
end;

   procedure TAddressLabelClass.setAddressRecord(Title, fName, lName,
                                Addr1, Addr2, City, State, Zip: String);
     begin
       fAddressRecord.AName := Title+' '+fName+' '+ lName;
       fAddressRecord.Add1 := Addr1;
       fAddressRecord.Add2 := Addr2;
       fAddressRecord.CityState:= City+','+State;
       fAddressRecord.ZipCode := Zip;
     end;

   function TAddressLabelClass.getRadius: Double;
   begin
     result := PointToInch(fRadius);
   end;

   procedure TAddressLabelClass.setRadius(Rad: Double);
   begin
     fRadius := InchToPoint(Rad);
   end;

  function TAddressLabelClass.getTextMarginTop: Double;
    begin
      result := PointToInch(fTextMarginTop);
    end;

    procedure TAddressLabelClass.setTextMarginTop(Top: Double);
    begin
       fTextMarginTop := InchToPoint(Top);
    end;

    function TAddressLabelClass.getTextMarginLeft: Double;
    begin
      result := PointToInch(fTextMarginLeft);
    end;

    procedure TAddressLabelClass.setTextMarginLeft(Left: Double);
    begin
      fTextMarginLeft := InchToPoint(Left);
    end;

    function TAddressLabelClass.getLabelWidth: Double;
    begin
      result := PointToInch(fLabelWidth);
    end;

    procedure TAddressLabelClass.setLabelWidth(LabelWidth: Double);
    begin
      fLabelWidth := InchToPoint(LabelWidth);
    end;

    function TAddressLabelClass.getLabelHeight: Double;
    begin
      result := PointToInch(fLabelHeight);
    end;

    procedure TAddressLabelClass.setLabelHeight(LabelHeight: Double);
    begin
      fLabelHeight := InchToPoint(LabelHeight);
    end;

    function TAddressLabelClass.getSpacingWidth: Double;
    begin
      result := PointToInch(fSpacingWidth);
    end;

    procedure TAddressLabelClass.setSpacingWidth(SpacingWidth: Double);
    begin
      fSPacingWidth := InchToPoint(SpacingWidth);
    end;

    function TAddressLabelClass.getSpacingLeft: Double;
    begin
      result := PointToInch(fSpacingLeft);
    end;

    procedure TAddressLabelClass.setSpacingLeft(SpacingLeft: Double);
    begin
      fSPacingLeft := InchToPoint(SpacingLeft);
    end;

    function TAddressLabelClass.getSpacingTop: Double;
    begin
      result := PointToInch(fSpacingTop);
    end;

    procedure TAddressLabelClass.setSpacingTop(SpacingTop: Double);
    begin
      fSPacingTop := InchToPoint(SpacingTop);
    end;

    function TAddressLabelClass.getSpacingHeight: Double;
    begin
      result := PointToInch(fSpacingHeight);
    end;

    procedure TAddressLabelClass.setSpacingHeight(SpacingHeight: Double);
    begin
       fSPacingHeight := InchToPoint(SpacingHeight);
    end;

   procedure TAddressLabelClass.setPostnetLineWidth(Width: Double);
    begin
       fPostnetLineWidth := Width;
       fPostnetWeight := inchToPoint(Width);
    end;

   procedure TAddressLabelClass.OutlineLabel;
   var
     X0, Y0, X, Y, Rad: Integer;
     Across, Down: Integer;
     tmp: TColor;
   begin
     X0 := fSpacingLeft - MarginLeft;
     Y0 := fSpacingTop - MarginTop;

     for Across := 0 to fNumAcross - 1 do
        for Down := 0 to fNumDown - 1 do
          begin
            X := X0 + Across * fSpacingWidth;
            Y := Y0 + Down * fSpacingHeight;
            tmp := fCurrentPage.Canvas.Pen.Color;
            fCurrentPage.Canvas.Pen.Color := OutlineColor;
            fCurrentPage.Canvas.RoundRect(X, Y , X + fLabelWidth, Y + fLabelHeight, fRadius, fRadius);
            fCurrentPage.Canvas.Pen.Color := tmp;
          end;
   end;

   procedure TAddressLabelClass.PrintOneLabel;
   var
     X0, Y0, X, Y: Integer;
    YAdd1, YAdd2, YCSZ,YPostNet: Integer;
    LineToLine: Integer;
    Zip: String;
   begin
      LineToLine := round(font.fontHeight * LineScale);
      X0 := fSpacingLeft;
      Y0 := fSpacingTop + Font.FontHeight;;
      X := X0 + fTextMarginLeft + fColPointer * (fSpacingWidth );
      Y := Y0 + fTextMarginTop
                       + fRowPointer * (fSpacingHeight);
      YAdd1 := Y + LineToLine;
      if fAddressRecord.Add2 <> '' then
         YAdd2 := YAdd1 + LineToLine
      else
         YAdd2 := YAdd1;
      YCSZ  :=  YAdd2 + LineToLine;

      With fAddressRecord do
        begin
          PrintPointXY(AName, X, Y);
          PrintPointXY(Add1, X, YAdd1);
          if Add2 <> '' then
          PrintPointXY(Add2, X, YAdd2);
          PrintPointXY(CityState+' '+ZipCode, X, YCSZ);
        end;
      if fPrintPostNet then
        begin
          YPostNet := YAdd2 + 2 + (LineToLine  + inchToPoint(fPostNetHeight));
        //  YPostNet := fTopMargin + fLabelHeight + fTextMarginTop +
        //               fRowPointer * (fSpacingHeight);

      Zip := fAddressRecord.ZipCode;
      PostNetXY(Zip,X,YPostNet,CurrentPage);
        end;
      inc(fColPointer);
      if fColPointer = fNumAcross then
        begin
          fColPointer := 0;
          inc(fRowPointer);
          if FRowPointer = fNumDown then
            begin
              fRowPointer := 0;
              EndPage;
              fPageDone := true;
            end;
        end;
   end;

   procedure TAddressLabelClass.PrintLabels(LabelDataSrc: TDataSource);
    begin
    //  if not PrintFileOpen then exit;
   // DataSet :=
    With LabelDataSrc.DataSet do
      begin
        if not active then open;
        first;
        Newpage;
        OutlineLabel;
        while not EOF do
          begin
            fPageDone := False;
            fAddressRecord.AName := FieldByName('TITLE').AsString + ' ' +
                                    FieldByName('FNAME').AsString + ' ' +
                                    FieldByName('NAME').AsString;
             fAddressRecord.Add1 := FieldByName('ADDRESS_1').AsString;
             fAddressRecord.Add2 := FieldByName('ADDRESS_2').AsString;
             fAddressRecord.CityState    := FieldByName('CITY').AsString + ',' +
                                    FieldByName('STATE').AsString;
             fAddressRecord.ZipCode      := FieldByName('ZIP').AsString;
             PrintOneLabel;
             if fPageDone then
               begin
                 Newpage;
                 OutlineLabel;
                 fPageDone := false;
               end;
             next;
          end; //While not EOF
      end; //With DataSet
      if fPageDone then
        begin
          fPageDone := false;
          EndPage;
        end;
   end;

   procedure TAddressLabelClass.putText(S: String);
   begin
     writeln(PrintFile,S);
   end;


   procedure TAddressLabelClass.PostNetXY(S: String; var X, Y: Integer;  PostnetImage: TImage);
   var
      SmBarHt, BarHt, BarSpace: Integer;
      IDX: Integer;
      PostNetCanvas: TCanvas;

      procedure DrawBar(Hi, Sp: Integer);
        begin
          With PostNetImage.Canvas do
            begin
              Pen.Width := fPostNetWeight;
              MoveTo(X, Y);
              Lineto(X,Y-Hi);
              X := X + Sp;
              MoveTo(X, Y);
            end;
        end;

     procedure DrawOne;
       begin
         DrawBar(smBarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(smBarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(BarHt, BarSpace);
       end;

     procedure DrawTwo;
       begin
         DrawBar(smBarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(BarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(BarHt, BarSpace);
       end;

     procedure DrawThree;
       begin
         DrawBar(smBarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(BarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(smBarHt, BarSpace);
       end;

     procedure DrawFour;
       begin
         DrawBar(smBarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(smBarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(BarHt, BarSpace);
       end;

     procedure DrawFive;
       begin
         DrawBar(smBarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(smBarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(smBarHt, BarSpace);
       end;

     procedure DrawSix;
       begin
         DrawBar(smBarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(BarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(smBarHt, BarSpace);
       end;

     procedure DrawSeven;
       begin
         DrawBar(BarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(smBarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(BarHt, BarSpace);
       end;

     procedure DrawEight;
       begin
         DrawBar(BarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(smBarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(smBarHt, BarSpace);
       end;

     procedure DrawNine;
       begin
         DrawBar(BarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(BarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(smBarHt, BarSpace);
       end;

     procedure DrawZero;
       begin
         DrawBar(BarHt, BarSpace); DrawBar(BarHt, BarSpace);
         DrawBar(smBarHt, BarSpace); DrawBar(smBarHt, BarSpace);
         DrawBar(smBarHt, BarSpace);
       end;

   begin
      BarHt := InchToPoint(fPostNetHeight);
      SmBarHt := InchToPoint(fPostNetHeight / 2.0);
      BarSpace := InchToPoint(fPostNetSpacing);

     for IDX := 1 to length(S) do
       begin
          if S[IDX] = '0' then
            DrawZero
          else if S[IDX] = '1' then
            DrawOne
          else if S[IDX] = '2' then
            DrawTwo
          else if S[IDX] = '3' then
            DrawThree
          else if S[IDX] = '4' then
            DrawFour
          else if S[IDX] = '5' then
            DrawFive
          else if S[IDX] = '6' then
            DrawSix
          else if S[IDX] = '7' then
            DrawSeven
          else if S[IDX] = '8' then
            DrawEight
          else if S[IDX] = '9' then
            DrawNine;
        end;
   end;
end.

{  function  TReportPrinterClass.PrinterDotsToInchX(Pnt: Integer): Double;
  var
     ppi: Integer;
     P: TCupsPrinter;
     PP: Pppd_file_t;
     PT: ppd_file_t;
     PZ: Pppd_size_t;
     PS:ppd_size_t;
     SS: SIngle;
  begin
    PP := fPrinter.CupsPPD;
    PT :=PP^;
    PZ := PT.Sizes;
    PS := PZ^;
    SS :=PS.Left;
    ShowMessage(IntToStr(fPrinter.PageWIdth)+' '+IntToStr(fPrinter.PageHeight));
    //ppi := fPrinter.GetXDPI;
    //Result := Double(Pnt ) / ppi;
    Result := Double(Pnt)/300;
  end;     }
