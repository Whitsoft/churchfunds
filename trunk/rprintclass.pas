{Don Whitbeck 2010 - Basic class for printing - derived from newpsclass
}
unit RPrintclass;
//{$linklib c}
{$mode objfpc} 
interface
 uses initc, Forms, Controls,comCtrls, dialogs,
   sysutils, classes, strings, ExtCtrls, Graphics, GraphType,db, Printers;

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
  BOXMARGIN = 4;      //Margin for left or right between box sides and text

  BOXLINEALL = 15;
  BOXLINENONE = 0;
  BOXLINELEFT = 1;
  BOXLINETOP = 2;
  BOXLINERIGHT = 4;
  BOXLINEBOTTOM = 8;

  RELATIVE = TRUE;
  ABSOLUT = FALSE;

Type
  PFontType = ^FontType;
  FontType = record
    FontName: String;
    FontSize: Integer;
  end;

Type
  TFontArray = array [1..10] of PFontType;

Type	  
	PTab = ^TTab;                  //A pointer to a tab
	TTab = record
	  XPos:         Integer;       //tab stop - use integers to reduce conversions
	  justifyText:  Integer;
	  BoxWidth:     Integer;       //width of this tab box
	  Margin:       Integer;       //Distance from left tab edge and start of text
	  BShade:       TGraphicsColor;          //Shadeing in box
	  BLines:       byte;          //Box lines
	  Next:         PTab;
	  Prev:         PTab;
	end;  
     
Type
    PTabList = ^TTabList;            //A pointer to a linked list of tabs
	TTabList = record
	  TabIndex:  integer;
	  TabCount:  integer;     //Number of tabs in this list
	  boxHeight: integer;     //All boxes in these tab list are this high
	  TabPos:    PTab;        //Current tab in list	  
	  TabHead:   PTab;        //Pointer to first tab in this tab list
	  TabTail:   PTab;        //Pointer to last tab in this tab list
end;



        TPageArray = array [1..100] of TImage;
Type
	TTabsArray = array [1..10] of PTabList; 



  TReportPrinterClass = class(TObject)
  private
          fPrintForm        : TForm;
          fCurrentPage      : TImage;
          fPageIndex        : Integer;
          fToolBar          : TToolBar;
	  fTabArray         : TTabsArray;
          fFontArray        : TFontArray;
	  fTabArrayIndex    : Integer;
	  fCurrentX         : Integer;    //Page Cursor
          fCurrentY         : Integer;
	  fCurrentFontName  : String;
	  fCurrentFontSize  : Integer;
          fPages            : Integer;   // Number of pages in report
          fPageArray        : TPageArray;
	  fLineScale        : Double;
          fLineSpace        : Integer;
	  fPrintFileOpen    : Boolean;
	  fPrintFile        : Text;
	  fPrintFileName    : String;
          fPageNo           : Integer;
	  fLeftMargin       : Integer;
	  fTopMargin        : Integer;
	  fRightMargin      : Integer;
	  fBottomMargin     : Integer;
	  fErrorCode        : Integer;
	  fPageLength       : integer;
	  fpageWidth        : integer;
          fFont             : FontType;
          fBold             : Boolean;
          fLandscape        : Boolean;
          fSender           : TObject;
          fOnLandscapeChange: TNotifyEvent;
          fErrorMessage     : String;

	 procedure   CreateFontArray;
	 procedure   CreateTabArray;
         procedure   CreatePageArray;

   protected
         property    OnLandscapeChange: TNotifyEvent
                     read fOnLandscapeChange write fOnLandscapeChange;

         procedure   LandscapeChange(Sender: TObject);
         procedure   setLandscape(LS: boolean);
         procedure   setBold(BoldOn: Boolean);
         procedure   setFont(AFont: FontType);
	 procedure   setCurrentX(XLoc: Double);
	 procedure   setCurrentY(YLoc: Double);
	 function    getCurrentX: Double;
	 function    getCurrentY: Double;
         procedure   Swap(var L, W: integer);
         property    CurrentPage: TImage read fCurrentPage;
	 procedure   setPageLength(Ln: Double);
	 procedure   setPageWidth( Wd: Double);
         function    getPageLength: Double;
	 function    getPageWidth: Double;
	 
	 procedure   PrintPointXY(S: String; XPos, YPos: Integer);
	 function    CalcCenterPage: Integer;

         procedure   PrintLeftPoint(S: String; XPos: integer);
	 procedure   PrintCenterPoint(S: String; XPos: integer);
	 procedure   PrintRightPoint(S: String; XPos: integer);
         procedure   PrintDot(XPos, YPos: Double; S: String);
	 function    NewTabPoint(IDX, XPosition, just, XWidth, XMargin: integer;
                                     TabRel: Boolean; boxLines, boxShade: integer): PTab;

         function   TabYPos(S: String; BBase, BHght: Integer): Integer;
         procedure   PrintFormClose(Sender: TObject; var act: TCloseAction);
   public
	 constructor Create(Sender: TObject);
         procedure   PrintFormCreate(Sender: TObject);
         property    Landscape: Boolean read fLandscape write setLandscape;
         property    PageNo: Integer read fPageNo write fPageNo;
         property    font: FontType read fFont write setFont;
         property    TabArrayIndex: Integer read fTabArrayIndex write fTabArrayIndex;
	 property    PrintFileOpen: boolean read fPrintFileOpen;
	 property    PrintFile: Text read fPrintFile;
	 property    TabArray: TTabsArray read fTabArray;

         property    Bold: Boolean read fBold write setBold;
	 property    LineScale: Double read fLineScale write fLineScale;
         property    LineSpace: integer read fLinespace write fLinespace;

	 property    CurX: Integer read fCurrentX write fCurrentX;
	 property    CurY: Integer read fCurrentY write fCurrentY;
	 property    CurrentX: Double read getCurrentX write setCurrentX;
	 property    CurrentY: Double read getCurrentY write setCurrentY;
       //  property    CurrentPage: TImage read fCurrentPage write fCurrentPage;

	 property    PageLength: Double read getPageLength write setPageLength;
	 property    PageWidth: Double  read getPageWidth  write setPageWidth;
	 property    PageLengthInt: Integer read fPageLength;
	 property    PageWidthInt: Integer read fPageWidth;
         property    PrintForm: TForm read fPrintForm;
         property    PageArray: TPageArray read fPageArray;

	 function    getBoxLeft(Combined: Byte): Boolean;
	 function    getBoxBottom(Combined: Byte): Boolean;
	 function    getBoxRite(Combined: Byte): Boolean;
	 function    getBoxTop(Combined: Byte): Boolean;

	 function    ShadeToGreyScale(Shade: Integer): TGraphicsColor;
         function    GreyScaleToShade(Shade: TGraphicsColor): Integer;
         function    BoxLinesToByte(Lf, Tp, Rt, Bt: Boolean): Byte;
	 procedure   setBoxWidth(TabPtr: PTab; BWidth: Double);  
	 procedure   setBoxHeight(ListPtr: PTabList; BHeight: Double);
	 function    getBoxWidth(TabPtr: PTab):Double;
	 function    getBoxHeight(ListPtr: PTabList):Double;

	 procedure   setTabBoxHeightInt(IDX: Integer; BHeight: Integer);
         function    getTabBoxHeightInt(IDX: Integer): Integer;

         procedure   setTabBoxHeight(IDX: Integer; BHeight: Double);
         function    getTabBoxHeight(IDX: Integer): Double;

         procedure   ShowReport;
	 procedure   PrintXY(XPos, YPos: Double; S: String);
	 procedure   PrintLeft(S: String; XPos: Double);
	 procedure   PrintCenter(S: String; XPos: Double);
	 procedure   PrintRight(S: String; XPos: Double);
	 
	 procedure   printTab(IDX: integer; S: String);
         function    resetTab(IDX: Integer): PTab;
	 procedure   SaveFontName(IDX: Integer; FName: String);
         procedure   SaveFontSize(IDX, FSize: Integer);
	 procedure   RestoreFont(IDX: Integer);

         procedure   setBoxShade(TabPtr: PTab; Shade: Integer);
         function    getBoxShade(TabPtr: PTab): Integer;
	 
	 function    PointToInch(Pnt: Integer): Double;
	 function    InchToPoint(Inch: Double): Integer;
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
	 function    NewTab(IDX: Integer; XPosition: Double; just: Integer;XWidth, XMargin: Double;
	                    TabRel: Boolean; boxLines, boxShade: integer): PTab;
							
         function    EvenTabs(IDX, XPosition, just, XWidth, XMargin, BHeight, Space, Num: integer;
                                    boxLines, boxShade: integer): PTab;
									
	 procedure   setPageMargins(Lf, Tp, Rt, Bt: Double);

	 function    LinesLeft(LineSize: Double): Integer;
	 function    TransXFloat(X: Double): Integer;    //User to x points
	 function    TransYFloat(Y: Double): Integer;    //User to y points
	 function    TransXPoint(X: Integer): Integer;   //user x points to PS points
	 function    TransYPoint(Y: Integer): Integer;   //User y points to PS points
         procedure   XLocation(X: Double);
	 procedure   NewLine;
         procedure   TabNewLine(IDX: Integer);
	 procedure   OpenPrintFile(FileName: String);    // Open file - discriptor goes to fPrintFile
	 procedure   ClosePrintFile;
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
         fPostNetWeight : Integer;
         fLabelWidth       : integer;
         fLabelHeight      : integer;
         fSpacingWidth     : integer;
         fSpacingHeight    : integer;
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
   function getMarginTop: Double;
   procedure setMarginTop(Top: Double);
   function getMarginLeft: Double;
   procedure setMarginLeft(Left: Double);
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
   property MarginTop: Double read getMarginTop write setMarginTop;
   property MarginLeft: Double read getMarginLeft write setMarginLeft;
   property TextMarginTop: Double read getTextMarginTop write setTextMarginTop;
   property TextMarginLeft: Double read getTextMarginLeft write setTextMarginLeft;
   property LabelWidth: Double read getLabelWidth write setLabelWidth;
   property LabelHeight: Double read getLabelHeight write setLabelHeight;
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
   fPrintForm.Width := fPageWidth;
   fPrintForm.Height := fPageLength;
   fPrintForm.Show;
   fToolBar.Show;
 end;

 procedure TReportPrinterClass.OpenPrintFile(FileName: String);
   begin
     assignfile(fPrintFile, FileName);
     reWrite(fPrintFile);
	 fPrintFileOpen := True;
   end;

 procedure TReportPrinterClass.NewPage;
 begin
   inc(fPages);
   if fPrintForm = nil then
     PrintFormCreate(fSender);

   fCurrentPage := TImage.Create(FPrintForm as TComponent);
   With fCurrentPage do
      begin
        Parent := fPrintForm;
        Align := alClient;
        Top := fToolBar.Height;
        Color := clWhite;
        Width := fPageWidth;
        Height := fPageLength;
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
    CurX := fLeftMargin;
    CurY := fTopMargin ;
    ShowReport;
end;

 procedure TReportPrinterClass.PrintFormCreate(Sender: TObject);
  var
    ButtonR, ButtonF,ButtonPrint, ButtonPrintAll: TToolButton;
 begin
    	setPageMargins(0.5, 0.5, 0.5, 0.5);
	CurX := fLeftMargin;
	CurY := fTopMargin ;
        fPrintForm := TForm.Create(Sender as TComponent);
        fPrintForm.OnClose := @PrintFormClose;
        fPrintForm.OnDestroy := @RFormDestroy;
        fPrintForm.Width := fPageWidth;
        FPrintForm.Height := fPageLength;
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
 end;

 constructor TReportPrinterClass.Create(Sender: TObject);
    begin
   	inherited create;               //Set defaults
	fPageLength := 792 + 36;             //11.0
	fPageWidth := 612 + 36;              //8.5
        CreateFontArray;
        //create empty tab array
        CreateTabArray;
        //CreatePageArray;
        fPageNo := 0;
        fPages := 0;
	fFont.FontName := TIMESROMAN;
	fFont.FontSize := 10;
	fLineScale := 1.5;
        fLineSpace := 4;
	fPrintFileName := '';
	fPrintFileOpen := false;
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
   var
     APrinter: TPrinter;
     ARect: TRect;
     LMargin, BMargin: Integer;
   begin
     if fCurrentPage = nil then exit;
     APrinter := Printer;
     With APrinter do
       begin
         ARect.Left := 0; ARect.Top := 0;
         ARect.Right := PageWidth;
         ARect.Bottom := PageHeight;
         BeginDoc;
         Canvas.Font.Name := fFont.FontName;
         Canvas.Font.Size := fFont.FontSize;
         Canvas.Font.Color := clBlack;
         Canvas.StretchDraw(ARect, CurrentPage.Picture.Bitmap);
        //         APrinter.Canvas.CopyRect(Classes.Rect(0, 0, APrinter.PaperSize.Width, APrinter.PaperSize.Height),
        //   CurrentPage.Canvas, Classes.Rect(0,0, CurrentPage.Width, CurrentPage.Height));
         EndDoc;
       end;
   end;

   procedure TReportPrinterClass.PrintAllPages(Sender: TObject);
   var
     APrinter: TPrinter;
     ARect: TRect;
     LMargin, BMargin, IDX: Integer;
   begin
     APrinter := Printer;
     if fPages <= 0 then exit;
     With APrinter do
       begin
         ARect.Left := 0; ARect.Top := 0;
         ARect.Right := PageWidth;
         ARect.Bottom := PageHeight;
         BeginDoc;
         Canvas.Font.Name := fFont.FontName;
         Canvas.Font.Size := fFont.FontSize;
         Canvas.Font.Color := clBlack;
         for IDX := 1 to fPages do
           Canvas.StretchDraw(ARect, fPageArray[IDX].Picture.Bitmap);
         EndDoc;
       end;
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

  procedure TReportPrinterClass.ClosePrintFile;
  begin
    if PrintFileOpen then
      CloseFile(fPrintFile);
	fPrintFileOpen := false;
  end;	   


  procedure TReportPrinterClass.CreatePageArray; //Array 1..100 of images
 // Type
 // PPage = ^TImage;
 // TPageArray = array [1..100] of PPage;
  var
    IDX: Integer;
  begin
  end;

   procedure TReportPrinterClass.CreateFontArray; //Array 1..10 of font records
  // Type
  //   PFontType = ^FontType;
  //   FontType = record
  //   FontName: String;
  //   FontSize: Integer;
   var
     IDX: Integer;
   begin
      for IDX := 1 to 10 do
        begin
          fFontArray[IDX]:=new(PFontType);
          fFontArray[IDX]^.FontName := HELVETICA;
          fFontArray[IDX]^.FontSize := 10;
         end;
   end;

   procedure   TReportPrinterClass.CreateTabArray; //Array 1..10 of tab lists
   var
     IDX: Integer;
	 TabListPtr: PTabList;  
   begin
     for IDX := 1 to 10 do
	    begin
	      TabListPtr := new(PTabList);
	      with TabListPtr^ do
	        begin
		      TabIndex := 0;
		      TabPos := nil;
		      TabCount := 0;
		      boxHeight := 24;
		      TabHead := nil;
		      TabTail := nil;
		    end;
     	  fTabArray[IDX] := TabListPtr;
	  	end;       
   end;

   procedure  TReportPrinterClass.setTabBoxHeightInt(IDX: Integer; BHeight: Integer);
   begin
     fTabArray[IDX]^.boxHeight := BHeight;
   end;

   function   TReportPrinterClass.getTabBoxHeightInt(IDX: Integer): Integer;
   begin
     result :=fTabArray[IDX]^.boxHeight;
   end;

   procedure  TReportPrinterClass.setTabBoxHeight(IDX: Integer; BHeight: Double);
   begin
     setTabBoxHeightInt(IDX, InchToPoint(BHeight));
   end;


  function TReportPrinterClass.getTabBoxHeight(IDX: Integer): Double;
  begin
    result := PointToInch(getTabBoxHeightInt(IDX));
  end;


 function TReportPrinterClass.EvenTabs(IDX, XPosition, just, XWidth, XMargin, BHeight, Space, Num: integer;
                                    boxLines, boxShade: integer): PTab;
 //A tab list of evenly spaced evenly sized tabs - just a utility									
										
 var
   I, St, Inc, Pos: Integer; 
   TmpTab: PTab;	
  begin
 
  St := XPosition;
  Inc := XWidth + Space;
  Pos := XPosition;
  If (St + Num * Inc) > fPageWidth then
    begin
	  EvenTabs := nil;
	  exit;
	end;  
	
   setTabBoxHeight(IDX, BHeight);
   fTabArray[IDX]^.TabCount := num;	
  for I := 1 to Num do
    begin
	   TmpTab := NewTabPoint(IDX, Pos, just, XWidth, XMargin, false, BoxLines, BoxShade); 
	   Pos := Pos + Inc;
	   If I = 1 then
	     begin
	       fTabArray[IDX]^.TabHead := TmpTab;
		   fTabArray[IDX]^.TabPos  := TmpTab;
		   fTabArray[IDX]^.TabIndex:= 1;
		 end;  
	end;
	fTabArray[IDX]^.TabTail := TmpTab;
  end;   					
  				
function TReportPrinterClass.NewTab(IDX: Integer; XPosition: Double; just: Integer;XWidth, XMargin: Double;
	                    TabRel: Boolean; boxLines, boxShade: integer): PTab;
var
  XP, XW, XM: Integer;
begin
  XP := InchToPoint(XPosition);
  XW := InchToPoint(XWidth);
  XM := InchToPoint(XMargin);
  NewTab := NewTabPoint(IDX, XP,just, XW, XM, TabRel, boxlines, boxshade);
end;								
						    
 function TReportPrinterClass.NewTabPoint(IDX, XPosition, just, XWidth, XMargin: integer;
                                  TabRel: Boolean; boxLines, boxShade: integer): PTab;
   // Create a new tab
 var 
    NewPTab: PTab;
	IX: Integer;
	TP: PTab;
 begin
   NewPTab := new(PTab);
   With fTabArray[IDX]^ do
     begin
	   if TabHead = nil then
	     begin
		   NewPTab^.prev := nil;       //First tab in the list
		   TabHead := NewPTab;
		   TabCount := 1;
		   TabIndex := 1;
		   TabPos := NewPTab;
		 end
	   else    
	     begin                         //At least one tab already exists
	       NewPTab^.Prev := TabTail;
		   TabTail^.Next := NewPTab;   //Penultimate tab points to newly created tab
		   TabCount := TabCount + 1;
		 end;  
	   TabTail:= NewPTab;              //The new tab is at the tail of the list ALWAYS
	   
	  // NewPTab^.Next := nil;           //The last tab has no next link	
	    NewPTab^.Next := TabHead;        //Last points to head   	    
     end;
	 
		 
	 With NewPTab^ do                  //Set box parameters, start position and justification 
	   begin 
	     If fTabArray[IDX]^.TabCount = 1 then
		   XPos := XPosition
		 else if (TabRel) and (Prev <> nil) then     
           //New position is relative to prev tab
	       XPos := XPosition + Prev^.XPos + Prev^.BoxWidth
	     else		
           XPos := XPosition;
		   
		 justifyText := just;  
	         BoxWidth := XWidth;
		 Margin := XMargin;
		 BShade := ShadeToGreyScale(boxShade);
		 BLines := boxLines;
	   end;
	 NewTabPoint := NewPTab;  
  end;	   	  
	    	  	  

  procedure   TReportPrinterClass.setPageLength(Ln: Double);
  begin
    fPageLength := trunc(Ln*POINTS);
  end;
  
  procedure   TReportPrinterClass.setPageWidth( Wd: Double);
  begin
    fPageWidth := trunc(Wd*POINTS);
  end;
  
  function    TReportPrinterClass.getPageLength: Double;
  begin
    getPageLength := Double(fPageLength)/POINTS;
  end;
  
 function    TReportPrinterClass.getPageWidth: Double;
  begin
     getPageWidth := Double(fPageWidth)/POINTS;
  end;



function  TReportPrinterClass.GreyScaleToShade(Shade: TGraphicsColor): Integer;
 var
   Intensity: Integer;
begin
   Intensity := Shade shr 4;
   if Intensity >= 255 then
      result := 0
   else if Intensity <= 0 then
      result := 10
   else
      result := 255 - intensity;

end;

  function  TReportPrinterClass.ShadeToGreyScale(Shade: Integer): TGraphicsColor;
  var
  red, blue, green: Integer;   //0 is black, 255 white   $FF
begin
   If (Shade <= 0) then
     Red := 255
   else if (Shade >= 10) then
     Red := 0
   else
     Red := 255 - (10 * Shade);

   Green := Red shl 8;
   Blue := Red shl 16;
   result := Red or Green or Blue;
 end;
  
 procedure  TReportPrinterClass.setBoxShade(TabPtr: PTab; Shade: Integer);
 begin
    TabPtr^.BShade := ShadeToGreyScale(Shade);
 end;

 function TReportPrinterClass.getBoxShade(TabPtr: PTab): Integer;
 begin
   result := GreyScaleToShade(TabPtr^.BShade);
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
    CurX := fLeftMargin;
    CurY := fTopMargin;
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
  
  function  TReportPrinterClass.getBoxWidth(TabPtr: PTab):Double;
  begin
    getBoxWidth := PointToInch(TabPtr^.BoxWidth);
  end;
  
  function  TReportPrinterClass.getBoxHeight(ListPtr: PTabList):Double;
  begin
    getBoxHeight := PointToInch(ListPtr^.BoxHeight);
  end;
  
  function  TReportPrinterClass.InchToPoint(Inch: Double): Integer;
  begin
    InchToPoint := round(Inch * POINTS);
  end;
  
 function   TReportPrinterClass.PointToInch(Pnt: Integer): Double;
   begin
      result := Double(Pnt)/POINTS;
   end;
  	
  procedure TReportPrinterClass.setBoxWidth(TabPtr: PTab; BWidth: Double);
  begin
    TabPtr^.BoxWidth := InchToPoint(BWidth);
  end;
  
   procedure TReportPrinterClass.setBoxHeight(ListPtr: PTabList; BHeight: Double);
  begin
    ListPtr^.BoxHeight := InchToPoint(BHeight);
  end;
  
  procedure TReportPrinterClass.setCurrentX(XLoc: Double);
  begin
    fCurrentX := round(XLoc*POINTS) + fLeftMargin;
  end; 
  
  function  TReportPrinterClass.getCurrentX: Double;
  begin
    getCurrentX := Double(fCurrentX)/POINTS - fLeftMargin;
  end;
  
  
  procedure TReportPrinterClass.setCurrentY(YLoc: Double);
  begin
    fCurrentY := round(YLoc*POINTS) + fTopMargin;
  end; 
  
  function  TReportPrinterClass.getCurrentY: Double;
  begin
    getCurrentY := Double(fCurrentY)/POINTS - fTopMargin;
  end;

  function TReportPrinterClass.TabYPos(S: String; BBase, BHght: Integer): Integer;
  var
     High, TpMargin: Integer;
  begin
     With CurrentPage.Canvas do
       begin
          High := TextHeight(S);
          TpMargin := (BHght - High) div 2;
          TpMargin := TpMargin + (TpMargin mod 2);
          If BHght <= High then
             begin
               Result := BBase - BHght + 1;
               exit;
             end
          else
            Result := BBase - BHght + TpMargin;
       end;
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
        Font.Size := fFont.FontSize;
        Font.Name := fFont.FontName;
      end;
    if (IDX <= 0) or (IDX > 10) then exit;
    YPos:= CurY;
    TabPtr := fTabArray[IDX]^.TabPos;
    //Shade := getBoxShade(TabPtr);

    With fTabArray[IDX]^ do
      begin
        BoxHght := fTabArray[IDX]^.boxHeight;
        //Box height is common to all tabs in this list
      end;
	With TabPtr^ do
	  begin
	    BoxLeft := TransXPoint(Xpos);  //WRiteln('BoxLeft ', BoxLeft,' ',XPos);
	    BoxRight := TransXPoint(XPos + BoxWidth);
	    BoxWdth := BoxWidth;
	    BoxTop := TransYPoint(YPos - BoxHght);  //Measuring Y = 0 at top of page
            BoxBottom := BoxTop + BoxHght;
	    //BoxTop := BoxBase + BoxHght;          //could eliminate one function call
	    just := justifyText;
	    Box := BLines;
            SY := TabYPos(S, BoxBottom,BoxHght);
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
                   TextOut(XStart, SY, S);
		 end
	       else if just = JUSTIFYCENTER then
	         begin
                   if Wide >= BoxWdth then
                     XStart := BoxLeft + BOXMARGIN
                   else
	             XStart := BoxLeft + (BoxWdth - Wide) div 2;
		   TextOut(XStart, SY, S);
	         end
	       else
	         begin
                   XStart := BoxLeft + BOXMARGIN;
		   TextOut(XStart, SY , S);
		 end;
	       CurY := TmpY;
	     end;  //if S <>
           if nextTab(IDX) = 1 then
              TabNewLine(IDX);
        end;
  end;
  
 procedure TReportPrinterClass.PrintPointXY(S: String; XPos, YPos: Integer);
 //Print a string at X & Y without altering CurY
 begin
   Currentpage.canvas.Font.Size := fFont.FontSize;
   Currentpage.canvas.Font.Name := fFont.FontName;
   CurrentPage.Canvas.TextOut(XPos,YPos,S);
 end;
 

  function  TReportPrinterClass.ResetTab(IDX: Integer): PTab;
  begin
    //With TabListPtr^ do
    With fTabArray[IDX]^ do
       begin
         TabPos := TabHead;
	 TabIndex := 1;
         ResetTab := TabPos;
       end;
  end;

  //function  TReportPrinterClass.nextTab(TabListPtr: PTabList): PTab;
  function  TReportPrinterClass.nextTab(IDX: Integer): Integer;
  begin
    With fTabArray[IDX]^ do
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



 procedure TReportPrinterClass.PrintXY(XPos, YPos: Double; S: String);
 //Print a string at X & Y without altering CurY
 var
   X, Y: Integer;
 begin
   X := TransXFloat(XPos);
   Y := TransYFloat(YPos);
   PrintPointXY(S, X, Y);
 end;
 
 procedure TReportPrinterClass.GotoXY(X, Y: Double);
 var
   XInt, YInt: Integer;
 begin
   XInt := TransXFloat(X);
   YInt := TransYFloat(Y);
   CurrentPage.Canvas.MoveTo(XInt,YInt);
   CurY := YInt;
  end;
 
 procedure TReportPrinterClass.PrintCenterPage(S: String);
 var
   X, Y, St: Integer;
   Wide: Integer;
 begin
   With CurrentPage.Canvas do
     begin
       Font.Size := fFont.FontSize;
       Font.Name := fFont.FontName;
       Y := TextWidth(S);
       X := CalcCenterPage;
       St := X - (Y div 2);
       TextOut(St,TransYPoint(CurY),S);
     end;
  end;

 
 function TReportPrinterClass.CalcCenterPage: Integer;
 begin
   CalcCenterPage := (fPageWidth - fRightMargin- fLeftMargin) div 2 + fLeftMargin;
 end;
  
  
 procedure TReportPrinterClass.PrintLeft(S: String; XPos: Double);
 begin
   Currentpage.canvas.Font.Size := fFont.FontSize;
   Currentpage.canvas.Font.Name := fFont.FontName;
   CurrentPage.Canvas.TextOut(TransXFloat(Xpos),TransYPoint(CurY),S);
 end;
 
 procedure TReportPrinterClass.PrintCenter(S: String; XPos: Double);
 var
   X, Wide: Integer;
 begin 
   X := TransXFloat(XPos);
   With CurrentPage.Canvas do
     begin
       Font.Size := fFont.FontSize;
       Font.Name := fFont.FontName;
       Wide := TextWidth(S);
       TextOut(X - Wide div 2, TransYPoint(CurY), S);
     end;
 end;
  
 procedure TReportPrinterClass.PrintRight(S: String; XPos: Double);
 var
    X, Wide: Integer;
 begin
   X := TransXFloat(XPos);
   With CurrentPage.Canvas do
     begin
       Font.Size := fFont.FontSize;
       Font.Name := fFont.FontName;
       Wide := TextWidth(S);
       TextOut(X - Wide, TransYPoint(CurY), S);
     end;
 end;

 procedure TReportPrinterClass.PrintDot(XPos, YPos: Double; S: String);
 var
    X, Y, L, charW, Dot: Integer;
 begin
   X := TransXFloat(XPos);
   Y := TransYFloat(YPos);
   Dot := pos('.',S);
   L := Length(S);
   if Dot <= 0 then
     begin
       PrintRight(S,XPos);
       exit;
     end;

//   charW := TextWidth(S) div L;
   X := X - charW * Dot;
   With CurrentPage.Canvas do
     begin
       Font.Size := fFont.FontSize;
       Font.Name := fFont.FontName;
       TextOut(X , Y, S);
     end;
 end;

  
  procedure TReportPrinterClass.PrintLeftPoint(S: String; XPos: integer);
 begin
   With CurrentPage.Canvas do
     begin
       MoveTo(XPos,TransYPoint(CurY));
       TextOut(XPos,TransYPoint(CurY),S);
     end;
 end;
 
 procedure TReportPrinterClass.PrintCenterPoint(S: String; XPos: integer);
  begin
    With CurrentPage.Canvas do
      begin
        MoveTo(XPos,TransYPoint(CurY));
        TextOut(XPos,TransYPoint(CurY),S);
      end;
 end;
  
 procedure TReportPrinterClass.PrintRightPoint(S: String; XPos: integer);
 var
   Wide: Integer;
 begin
    With CurrentPage.Canvas do
      begin
        Font.Size := fFont.FontSize;
        Font.Name := fFont.FontName;
        Wide := TextWidth(S);
        TextOut(XPos - Wide,TransYPoint(CurY),S);
      end;
 end;
 
  procedure TReportPrinterClass.setPageMargins(Lf, Tp, Rt, Bt: Double);
 begin
   fLeftMargin := InchToPoint(Lf); 
   fTopMargin := InchToPoint(Tp); 
   fRightMargin := InchToPoint(Rt); 
   fBottomMargin := InchToPoint(Bt); 
 end;
 

  function TReportPrinterClass.LinesLeft(LineSize: Double): Integer;
  var
    PageUsed, LineSizeInt: Integer;
  begin
    LineSizeInt := InchToPoint(LineSize);
    PageUsed := fPageLength - CurY - fBottomMargin;
    result := PageUsed div LineSizeInt;
  end;

    procedure TReportPrinterClass.setBold(BoldOn: Boolean);
  var
    Dash: Integer;
  begin
     Dash:=pos('-',fFont.FontName);
     If BoldOn then
       begin
         if Dash <=0 then
           fFont.FontName:=fFont.FontName+'-Bold';
       end
      else
        begin
          Dash:=pos('-Bold',fFont.FontName);
          If Dash > 0 then
             fFont.FontName := LeftStr(fFont.FontName,Dash-1);
        end;
      // PrintCurrentFont(Self);
  end;

  function TReportPrinterClass.TransXFloat(X: Double): Integer;
  begin
    TransXFloat := TransXPoint(InchToPoint(X));
  end;
  
  function TReportPrinterClass.TransYFloat(Y: Double): Integer;
  begin
    TransYFloat := TransYPoint(InchToPoint(Y));
  end;
  
  function TReportPrinterClass.TransXPoint(X: Integer): Integer;
  begin
    TransXPoint := X + fLeftMargin;
  end; 
  	
  function TReportPrinterClass.TransYPoint(Y: Integer): Integer;
  begin
    TransYPoint := fTopMargin + Y;
    //TransYPoint := fPageLength - fTopMargin - Y;
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
 

  procedure TReportPrinterClass.TabNewLine(IDX: Integer);
  begin
    CurY := CurY + Trunc(fTabArray[IDX]^.boxHeight);
    if  (BOXLINEBOTTOM) and (fTabArray[IDX]^.TabPos^.BLines)> 0
      then CurY := CurY + 1;
  end;

  procedure TReportPrinterClass.NewLine;
  begin
   CurY := CurY + Round(Font.FontSize * LineScale) + 1;
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


  procedure TReportPrinterClass.SaveFontName(IDX: Integer; FName: String);
  // Type
  //   PFontType = ^FontType;
  //   FontType = record
  //   FontName: String;
  //   FontSize: Integer;
  begin
    if fFontArray[IDX] <> nil then
      fFontArray[IDX]^.FontName := FName;
  end;


  procedure TReportPrinterClass.SaveFontSize(IDX, FSize: Integer);
  begin
    if fFontArray[IDX] <> nil then
      fFontArray[IDX]^.FontSize := FSize;
  end;

  procedure TReportPrinterClass.RestoreFont(IDX: Integer);
  begin
    If fFontArray[IDX] <> nil then
       begin
         fFont.FontName := fFontArray[IDX]^.FontName;
         fFont.FontSize := fFontArray[IDX]^.FontSize;
       end;
  end;


 procedure TReportPrinterClass.setFont(AFont: FontType);
 begin
   fFont.fontName := AFont.FontName;
   fFont.fontSize := AFont.FontSize;
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
      if fLandscape then
        begin
          if fPageLength >= fPageWidth then
            swap(fPageLength, fPagewidth);
        end
     else
        begin
           if fPageWidth >= fPageLength then
            swap(fPageLength, fPagewidth);
        end;
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

    function TAddressLabelClass.getMarginTop: Double;
    begin
      result := PointToInch(fTopMargin);
    end;

    procedure TAddressLabelClass.setMarginTop(Top: Double);
    begin
       fTopMargin := InchToPoint(Top);
    end;

    function TAddressLabelClass.getMarginLeft: Double;
    begin
      result := PointToInch(fLeftMargin);
    end;

    procedure TAddressLabelClass.setMarginLeft(Left: Double);
    begin
      fLeftMargin := InchToPoint(Left);
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
     X, Y, Rad: Integer;
     Across, Down: Integer;
     tmp: TColor;
   begin
     X := fLeftMargin;
     Y := fTopMargin;
     for Across := 0 to fNumAcross - 1 do
        for Down := 0 to fNumDown - 1 do
          begin
            X := fLeftMargin + Across * fSpacingWidth;
            Y := fTopMargin + Down * fSpacingHeight;
            tmp := fCurrentPage.Canvas.Pen.Color;
            fCurrentPage.Canvas.Pen.Color := OutlineColor;
            fCurrentPage.Canvas.RoundRect(X, Y , X + fLabelWidth, Y + fLabelHeight, fRadius, fRadius);
            fCurrentPage.Canvas.Pen.Color := tmp;
          end;
   end;

   procedure TAddressLabelClass.PrintOneLabel;
   var
     X, X2, Y: Integer;
    YAdd1, YAdd2, YCSZ,YPostNet: Integer;
    LineToLine: Integer;
    Zip: String;
   begin
      LineToLine := round(font.fontsize * fLineScale);
      X := fLeftMargin + fTextMarginLeft + fColPointer * (fSpacingWidth );
      Y := fTopMargin  + fTextMarginTop
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
          YPostNet := YAdd2 + 2 * (LineToLine  + inchToPoint(fPostNetHeight));
        //  YPostNet := fTopMargin + fLabelHeight + fTextMarginTop +
        //               fRowPointer * (fSpacingHeight);

      Zip := fAddressRecord.ZipCode;
      X2 := X + 2;
      PostNetXY(Zip,X2,YPostNet,CurrentPage);
      X := X2;
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


