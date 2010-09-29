{ Don Whitbeck 2010 - Basic class for postscript output
}
unit newpsclass;
//{$linklib c}
{$mode objfpc} 
interface
 uses BaseUnix, unixtype,initc, errors, sysutils, classes, strings, ctypes;

const 
  CR = #13;
  LF = #10;
  FATFONT = 0.5;
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


  BOXLINEALL = 15;
  BOXLINENONE = 0;
  BOXLINELEFT = 1;
  BOXLINETOP = 2;
  BOXLINERIGHT = 4;
  BOXLINEBOTTOM = 8;

Type
  PFontType = ^FontType;
  FontType = record
    FontName: String;
    FontSize: Integer;
  end;
	
Type	  
	PTab = ^TTab;                  //A pointer to a tab
	TTab = record
	  XPos:         Integer;       //tab stop - use integers to reduce conversions
	  justifyText:  Integer;
	  BoxWidth:     Integer;       //width of this tab box
	  Margin:       Integer;       //Distance from lefte tab edge and start of text
	  BShade:       byte;          //Shadeing in box 
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
	   
Type
	TTabsArray = array [1..10] of PTabList; 

  
  TPostscriptClass = class(TObject)
  private
	  fTabArray         : TTabsArray;
	  fTabArrayIndex    : Integer;
	  fCurrentX         : Integer;    //Page Cursor
          fCurrentY         : Integer;
	  fCurrentFontName  : String;
	  fCurrentFontSize  : Integer;
	  fLineScale        : Double;
	  fPrintFileOpen    : Boolean;
	  fPrintFile        : Text;
	  fPrintFileName    : String;
	  fLeftMargin       : Integer;
	  fTopMargin        : Integer;
	  fRightMargin      : Integer;
	  fBottomMargin     : Integer;
	  fLineToLine       : Integer;
	  fErrorCode        : Integer;
	  fPageLength       : integer;
	  fpageWidth        : integer;
          fFont             : FontType;
          fOnFontChange     : TNotifyEvent;
          fErrorMessage     : String;
	
	 procedure   CreateTabArray;

   protected

         property    OnFontChange: TNotifyEvent
                     read fOnFontChange write fOnFontChange;

         procedure   setFont(AFont: FontType);
	 procedure   setCurrentX(XLoc: Double);
	 procedure   setCurrentY(YLoc: Double);
	 function    getCurrentX: Double;
	 function    getCurrentY: Double;

	 procedure   setPageLength(Ln: Double);
	 procedure   setPageWidth( Wd: Double);
         function    getPageLength: Double;
	 function    getPageWidth: Double;
	 
		 
	 procedure   setLineToLine(Spc: Double);
	 function    getLineToLine: Double;
	 procedure   PrintPointXY(S: String; XPos, YPos: Integer);
	 function    CalcCenterPage: Integer;

         procedure   PrintLeftPoint(S: String; XPos: integer);
	 procedure   PrintCenterPoint(S: String; XPos: integer);
	 procedure   PrintRightPoint(S: String; XPos: integer);
	 function    NewTabPoint(IDX, XPosition, just, XWidth, XMargin: integer;
                                     TabRel: Boolean; boxLines, boxShade: byte): PTab;

          procedure  PrintCurrentFont(Sender: TObject);

   public
	 constructor Create;
	 destructor  Destroy; override;
	 
	 function    getBoxShadeString(TabPtr: PTab): String;  //for printing	 function    getFontName(ListPtr: PTabList): String;
         property    font: FontType read fFont write setFont;
         property    TabArrayIndex: Integer read fTabArrayIndex write fTabArrayIndex;
	 property    PrintFileOpen: boolean read fPrintFileOpen;
	 property    PrintFile: Text read fPrintFile;
	 property    TabArray: TTabsArray read fTabArray;
	 
	 property    LineScale: Double read fLineScale write fLineScale;
	 property    LineSpacing: Double read getLineToLine write setLineToLine;

	 property    CurX: Integer read fCurrentX write fCurrentX;
	 property    CurY: Integer read fCurrentY write fCurrentY;
	 property    CurrentX: Double read getCurrentX write setCurrentX;
	 property    CurrentY: Double read getCurrentY write setCurrentY;

	 property    PageLength: Double read getPageLength write setPageLength;
	 property    PageWidth: Double  read getPageWidth  write setPageWidth;
	 property    PageLengthInt: Integer read fPageLength;
	 property    PageWidthInt: Integer read fPageWidth; 
	 
	 function    getBoxLeft(Combined: Byte): Boolean;
	 function    getBoxBottom(Combined: Byte): Boolean;
	 function    getBoxRite(Combined: Byte): Boolean;
	 function    getBoxTop(Combined: Byte): Boolean;

	 function    ShadePercentToByte(Percent: Double): Byte; 
         function    BoxLinesToByte(Lf, Tp, Rt, Bt: Boolean): Byte;
	 procedure   setBoxWidth(TabPtr: PTab; BWidth: Double);  
	 procedure   setBoxHeight(ListPtr: PTabList; BHeight: Double);
	 function    getBoxWidth(TabPtr: PTab):Double;
	 function    getBoxHeight(ListPtr: PTabList):Double;

	 procedure   setTabBoxHeight(IDX: Integer; BHeight: Double);

	 procedure   PrintXY(XPos, YPos: Double; S: String);
	 procedure   PrintLeft(S: String; XPos: Double);
	 procedure   PrintCenter(S: String; XPos: Double);
	 procedure   PrintRight(S: String; XPos: Double);
	 
	 procedure   printTab(IDX: integer; S: String);
         function    resetTab(IDX: Integer): PTab;
	 
	 
	 procedure   setBoxShade(TabPtr: PTab; Percent: Double);
	 
	 function    PointToInch(Pnt: Integer): Double;
	 function    InchToPoint(Inch: Double): Integer;
	 procedure   FreeAllTabs;
	 procedure   FreeTabs(IDX: Integer);
	 function    nextTab(IDX: Integer): PTab;
         procedure   Home;

	
    function    calcStringY(Base, Height: Integer): integer;
	//New tab creates a new tab in tabs array width index = IDX
	 function NewTab(IDX: Integer; XPosition: Double; just: Integer;XWidth, XMargin: Double;
	                    TabRel: Boolean; boxLines, boxShade: byte): PTab;	
							
     function    EvenTabs(IDX, XPosition, just, XWidth, XMargin, BHeight, Space, Num: integer;
                                    boxLines, boxShade: byte): PTab;	
									
	 procedure   setPageMargins(Lf, Tp, Rt, Bt: Double);

	 function    LinesLeft: Integer;
	 function    TransXFloat(X: Double): Integer;    //User to x points
	 function    TransYFloat(Y: Double): Integer;    //User to y points
	 function    TransXPoint(X: Integer): Integer;   //user x points to PS points
	 function    TransYPoint(Y: Integer): Integer;   //User y points to PS points
	 procedure   NewLine;
	 procedure   OpenPrintFile(FileName: String);    // Open file - discriptor goes to fPrintFile
	 procedure   ClosePrintFile;
	 procedure   PrintCenterPage(S: String);
	 procedure   setLineScale(Scale: Double);
	 procedure   GotoXY(X, Y: Double);
	 procedure   ShowPage;
	 //postscript procedures
	 procedure   XLocation(X: Double);
	 procedure   PSProcs;
  end;


  
implementation	
 
 procedure TPostScriptClass.OpenPrintFile(FileName: String);
   begin
     assignfile(fPrintFile, FileName);
     reWrite(fPrintFile);
	 fPrintFileOpen := True;
     if Assigned(fOnFontChange) then
        OnFontChange(Self);
     psProcs;
   end;
   
 constructor TPostScriptClass.Create;   
    begin
   	inherited create;               //Set defaults
	fPageLength := 792;             //11.0
	fPageWidth := 612;              //8.5
	fLeftMargin := 36;
	fTopMargin := 36;
        CreateTabArray;                 //create empty tab array
	fFont.FontName := HELVETICA;
	fFont.FontSize := 10;
	fLineScale := 1.5;
        fLineToLine := round(fFont.FontSize * fLineScale);
	fPrintFileName := '';
	fPrintFileOpen := false;
	setPageMargins(0.5, 0.5, 0.5, 0.5);
	CurX := fLeftMargin;
	CurY := fTopMargin + fLineToLine;
        fOnFontChange:= @PrintCurrentFont;
   end;

  procedure TPostScriptClass.PrintCurrentFont(Sender: TObject);
  begin
    if (PrintFileOpen)  then
	  begin
	     writeln(PrintFile,'/',Font.FontName,' findfont');
              writeln(PrintFile,Font.FontSize,' scalefont');
             writeln(PrintFile,'setfont');
	   end;
  end;

 procedure TPostScriptClass.setFont(AFont: FontType);
 begin
   fFont.fontName := AFont.FontName;
   fFont.fontSize := AFont.FontSize;
   fLineToLine := round(fFont.fontSize * LineScale);
   if Assigned(fOnFontChange) then
      OnFontChange(Self);
 end;


  procedure TPostScriptClass.ClosePrintFile;
  begin
    if PrintFileOpen then
      CloseFile(fPrintFile);
	fPrintFileOpen := false;
  end;	   
	   
   procedure   TPostScriptClass.CreateTabArray; //Array 1..10 of tab lists
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
		      boxHeight := 0;
		      TabHead := nil;
		      TabTail := nil;
		    end;
     	  fTabArray[IDX] := TabListPtr;
	  	end;       
   end;
   
   procedure  TPostScriptClass.setTabBoxHeight(IDX: Integer; BHeight: Double);

   begin
     fTabArray[IDX]^.boxHeight :=InchToPoint(BHeight);
   end;

 function TpostScriptClass.EvenTabs(IDX, XPosition, just, XWidth, XMargin, BHeight, Space, Num: integer;
                                    boxLines, boxShade: byte): PTab;
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
  				
function TPostScriptClass.NewTab(IDX: Integer; XPosition: Double; just: Integer;XWidth, XMargin: Double;
	                    TabRel: Boolean; boxLines, boxShade: byte): PTab;		
var
  XP, XW, XM: Integer;
begin
  XP := InchToPoint(XPosition);
  XW := InchToPoint(XWidth);
  XM := InchToPoint(XMargin);
  NewTab := NewTabPoint(IDX, XP,just, XW, XM, TabRel, boxlines, boxshade);
end;								
						    
 function TPostScriptClass.NewTabPoint(IDX, XPosition, just, XWidth, XMargin: integer;
                                  TabRel: Boolean; boxLines, boxShade: byte): PTab;
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
		 BShade := boxShade;
		 BLines := boxLines;
	   end;
	 NewTabPoint := NewPTab;  
  end;	   	  
	    	  	  

  procedure   TPostScriptClass.setPageLength(Ln: Double);
  begin
    fPageLength := trunc(Ln*POINTS);
  end;
  
  procedure   TPostScriptClass.setPageWidth( Wd: Double);
  begin
    fPageWidth := trunc(Wd*POINTS);
  end;
  
  function    TPostScriptClass.getPageLength: Double; 
  begin
    getPageLength := Double(fPageLength)/POINTS;
  end;
  
 function    TPostScriptClass.getPageWidth: Double;
  begin
     getPageWidth := Double(fPageWidth)/POINTS;
  end;
  
  function  TPostScriptClass.ShadePercentToByte(Percent: Double): Byte; 
 var
   B: Byte;
  begin
   
    If (Percent < 1) then
	  B := 0
	else if (Percent >= 100) then
	  B := 15
	else
	  B := trunc(Percent/100 * 15);
	//B := B shl 4;
	ShadePercentToByte := B; 

  end;	
  
 procedure  TPostScriptClass.setBoxShade(TabPtr: PTab; Percent: Double);
 begin
    TabPtr^.BShade := ShadePercentToByte(Percent);
 end;
  
 function  TPostScriptClass.getBoxShadeString(TabPtr: PTab): String;
  begin
    getBoxShadeString := FloatToStrF(1.0 - TabPtr^.BShade/15.0, ffFixed, 3, 1);
  end;
  
  
  function  TPostScriptClass.BoxLinesToByte(Lf, Tp, Rt, Bt: Boolean): Byte;
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
  
  procedure TPostScriptClass.Home;
  begin
    CurX := fLeftMargin;
    CurY := fTopMargin;
  end;

  function TPostScriptClass.getBoxLeft(Combined: Byte): boolean;
  begin  
    getBoxLeft:=(Combined and 1) > 0;   
  end;	    
 
 function TPostScriptClass.getBoxBottom(Combined: Byte): boolean;
  begin  
    getBoxBottom:=(Combined and 8) > 0;   
  end;	  
  
  function TPostScriptClass.getBoxRite(Combined: Byte): boolean;
  begin  
     getBoxRite:=(Combined and 4) > 0;   
  end;	  
  
  function TPostScriptClass.getBoxTop(Combined: Byte): boolean;
  begin  
    getBoxTop:=(Combined and 2) > 0;   
  end;	  
  
  function  TPostScriptClass.getBoxWidth(TabPtr: PTab):Double;
  begin
    getBoxWidth := PointToInch(TabPtr^.BoxWidth);
  end;
  
  function  TPostScriptClass.getBoxHeight(ListPtr: PTabList):Double;
  begin
    getBoxHeight := PointToInch(ListPtr^.BoxHeight);
  end;
  
  function  TPostScriptClass.InchToPoint(Inch: Double): Integer;
  begin
    InchToPoint := round(Inch * POINTS);
  end;
  
 function   TPostScriptClass.PointToInch(Pnt: Integer): Double;
   begin
      PointToInch := Double(Pnt)/POINTS;
   end;
  	
  procedure TPostScriptClass.setBoxWidth(TabPtr: PTab; BWidth: Double);
  begin
    TabPtr^.BoxWidth := InchToPoint(BWidth);
  end;
  
   procedure TPostScriptClass.setBoxHeight(ListPtr: PTabList; BHeight: Double);
  begin
    ListPtr^.BoxHeight := InchToPoint(BHeight);
  end;
  
  procedure TPostScriptClass.setCurrentX(XLoc: Double);
  begin
    fCurrentX := round(XLoc*POINTS) + fLeftMargin;
  end; 
  
  function  TPostScriptClass.getCurrentX: Double;
  begin
    getCurrentX := Double(fCurrentX)/POINTS - fLeftMargin;
  end;
  
  
  procedure TPostScriptClass.setCurrentY(YLoc: Double);
  begin
    fCurrentY := round(YLoc*POINTS) + fTopMargin;
  end; 
  
  function  TPostScriptClass.getCurrentY: Double;
  begin
    getCurrentY := Double(fCurrentY)/POINTS - fTopMargin;
  end;
  
  procedure  TPostScriptClass.printTab(IDX: Integer; S: String);
  var
    YPos, TmpY: Integer;
	Shade: String;
	just, SY, Box, XStart, FH: integer;
	BoxBase, BoxLeft, BoxTop, BoxRight, BoxHght, BoxWdth, Marg: Integer;
	TabPtr: PTab;
	FN: String;
  begin
    if not PrintFileOpen then exit;
    if (IDX <= 0) or (IDX > 10) then exit;
	YPos := CurY; 
	TabPtr := fTabArray[IDX]^.TabPos;
	Shade := getBoxShadeString(TabPtr);
	With fTabArray[IDX]^ do
	  begin
	    BoxHght := fTabArray[IDX]^.boxHeight;
	    //Box height is common to all tabs in this list
	    SY := calcStringY(YPos,BoxHght);  //Y location for string inside the box
	    BoxBase := TransYPoint(YPos);     //Base line of box is at YPos
          end;
	With TabPtr^ do
	  begin
	    Marg := Margin;
	    BoxLeft := TransXPoint(Xpos);  //WRiteln('BoxLeft ', BoxLeft,' ',XPos);           
	    BoxRight := TransXPoint(XPos + BoxWidth);
	    BoxWdth := BoxWidth;
	    BoxTop := TransYPoint(YPos - BoxHght);  //Measuring Y = 0 at top of page
	    //BoxTop := BoxBase + BoxHght;          //could eliminate one function call
	    just := justifyText;
	    Box := BLines;
	  end;			
	
	 //fill tab box
	 Writeln(PrintFile,Shade,  ' setgray');  
	 Writeln(PrintFile,'newpath');
	 Writeln(PrintFile,BoxLeft,' ',BoxBase,' moveto');
	 Writeln(PrintFile,BoxWdth,' ',0,' rlineto');
	 Writeln(PrintFile,0,' ',BoxHght,' rlineto');
	 Writeln(PrintFile,-BoxWdth,' ',0,' rlineto');
	 Writeln(PrintFile,'closepath');
	 Writeln(PrintFile,'fill');
	 Writeln(PrintFile, '0.0 setgray');

	 //box lines if any
	 if getBoxBottom(Box) then
	    begin
	      Writeln(PrintFile,BoxLeft,' ',BoxBase,' moveto');
	      Writeln(PrintFile,BoxWdth,' ',0,' rlineto');
		  Writeln(PrintFile,'stroke');
		end;
	  if getBoxRite(Box) then
	    begin	
		  Writeln(PrintFile,BoxRight,' ',BoxBase,' moveto'); 
	      Writeln(PrintFile,0,' ',BoxHght,' rlineto');
		  Writeln(PrintFile,'stroke');
		end;
	  if getBoxTop(Box) then
	    begin	
		   Writeln(PrintFile,BoxLeft,' ',BoxTop,' moveto');  
	       Writeln(PrintFile,BoxWdth,' ',0,' rlineto');
		   Writeln(PrintFile,'stroke');
		end;
	   if getBoxLeft(Box) then
	     begin	  
	       Writeln(PrintFile,BoxLeft,' ',BoxBase,' moveto');
	       Writeln(PrintFile,0,' ',BoxHght,' rlineto');
	       Writeln(PrintFile,'stroke');
	     end;
	   if S <> '' then
	     begin
	       TmpY := CurY;
	       CurY := SY;
	       if just = JUSTIFYRIGHT then
	         begin
		   XStart := BoxRight - Font.Fontsize div 2;
		   PrintRightPoint(S, XStart);
		 end
	       else if just = JUSTIFYCENTER then
	         begin
	           XStart := BoxLeft + BoxWdth div 2;
		   PRintCenterPoint(S,XStart);
	         end
	       else
	         begin
		   printLeftPoint(S, BoxLeft + Marg);
		 end;
	       CurY := TmpY;
	     end;  //if S <>
           nextTab(IDX);
  end;
  
 procedure TPostScriptClass.PrintPointXY(S: String; XPos, YPos: Integer); 
 //Print a string at X & Y without altering CurY
 begin
  if (not PrintFileOpen) then exit;
    Writeln(PrintFile,'0.0 setgray');
    Writeln(PrintFile,XPos,' ',YPos,' moveto');
	Writeln(PrintFile,'(',S,')',' show');
 end;
 

  function  TPostScriptClass.ResetTab(IDX: Integer): PTab;
  begin
    //With TabListPtr^ do
    With fTabArray[IDX]^ do
       begin
         TabPos := TabHead;
	 TabIndex := 1;
         ResetTab := TabPos;
       end;
  end;

  //function  TPostScriptClass.nextTab(TabListPtr: PTabList): PTab;
  function  TPostScriptClass.nextTab(IDX: Integer): PTab;
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
          nextTab := TabPos;		
		end;	
		
  end;
  	
  function TPostScriptClass.calcStringY(Base, Height: Integer): integer;
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
  					
  procedure TPostScriptClass.FreeAllTabs;
  var
    I: Integer;
  begin
    for I := 1 to 10 do
	  FreeTabs(I);
  end;	  	
 
					
  procedure TPostScriptClass.FreeTabs(IDX: Integer);
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



 procedure TPostScriptClass.PrintXY(XPos, YPos: Double; S: String);
 //Print a string at X & Y without altering CurY
 var
   X, Y: Integer;
 begin
   if fPrintFileOpen then
     begin
	   X := TransXFloat(XPos);
	   Y := TransYFloat(YPos);
       PrintPointXY(S, X, Y);
	end;
 end;
 
 procedure TPostScriptClass.GotoXY(X, Y: Double);
 var
   XInt, YInt: Integer;
 begin
   XInt := TransXFloat(X);
   YInt := TransYFloat(Y);
   Writeln(PrintFile, XInt,' ',Yint,' moveto');
   CurY := YInt;
  end;
 
 procedure TPostScriptClass.PrintCenterPage(S: String);
 var
   X: Integer;
 begin
   X := CalcCenterPage;
   writeln(PrintFile,X,' ',TransYPoint(CurY),' moveto');
   writeln(PrintFile,'(',S,') centershow');
  end;

 
 function TPostScriptClass.CalcCenterPage: Integer;
 begin
   CalcCenterPage := (fPageWidth - fRightMargin- fLeftMargin) div 2 + fLeftMargin;
 end;
  
  
 procedure TPostScriptClass.PrintLeft(S: String; XPos: Double);
 begin
   writeln(PrintFile,XPos,' ',TransYPoint(CurY),' moveto');
   writeln(PrintFile,'(',S,')', ' show');
 end;
 
 procedure TPostScriptClass.PrintCenter(S: String; XPos: Double);
 var
   X: Integer;
 begin 
   X := TransXFloat(XPos);
   writeln(PrintFile,X,' ',TransYPoint(CurY),' moveto');
   writeln(PrintFile,'(',S,') centershow');  
 end;
  
 procedure TPostScriptClass.PrintRight(S: String; XPos: Double);
 var
   X: Integer;
 begin 
   X := TransXFloat(XPos);
   writeln(PrintFile,X,' ',TransYPoint(fCurrentY),' moveto');
   writeln(PrintFile,'(',S,') rightshow');  
 end;
  
  procedure TPostScriptClass.PrintLeftPoint(S: String; XPos: integer);
 begin
   writeln(PrintFile,XPos,' ',TransYPoint(CurY),' moveto');
   writeln(PrintFile,'(',S,')', ' show');
 end;
 
 procedure TPostScriptClass.PrintCenterPoint(S: String; XPos: integer);
  begin 
   writeln(PrintFile,XPos,' ',TransYPoint(CurY),' moveto');
   writeln(PrintFile,'(',S,') centershow');  
 end;
  
 procedure TPostScriptClass.PrintRightPoint(S: String; XPos: integer);
 begin 
    writeln(PrintFile,XPos,' ',TransYPoint(fCurrentY),' moveto');
   writeln(PrintFile,'(',S,') rightshow');  
 end;
 
  procedure TPostScriptClass.setPageMargins(Lf, Tp, Rt, Bt: Double);
 begin
   fLeftMargin := InchToPoint(Lf); 
   fTopMargin := InchToPoint(Tp); 
   fRightMargin := InchToPoint(Rt); 
   fBottomMargin := InchToPoint(Bt); 
 end;
 
  procedure TPostScriptClass.setLineToLine(Spc: Double);
  begin
    fLineToLine := round(Double(fCurrentFontSize) * fLineScale);
  end;
  	
  function TPostScriptClass.getLineToLine: Double;
  begin
    getLineToLine := PointToInch(fLineToLine);
  end;
  
    	 
  function TPostScriptClass.LinesLeft: Integer;
  var
    PageUsed: Integer;	
  begin
    PageUsed := fPageLength - CurY - fBottomMargin;
	LinesLeft := PageUsed div fLineToLine; 
  end;
   
  function TPostScriptClass.TransXFloat(X: Double): Integer;
  begin
    TransXFloat := TransXPoint(InchToPoint(X));
  end;
  
  function TPostScriptClass.TransYFloat(Y: Double): Integer;
  begin
    TransYFloat := TransYPoint(InchToPoint(Y));
  end;
  
  function TPostScriptClass.TransXPoint(X: Integer): Integer;
  begin
    TransXPoint := X + fLeftMargin;
  end; 
  	
  function TPostScriptClass.TransYPoint(Y: Integer): Integer; 
  begin
    TransYPoint := fPageLength - fTopMargin - Y;
   end;	

procedure TPostScriptClass.XLocation(X: Double);
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
 
procedure TPostScriptClass.psProcs;
begin
  if (PrintFileOpen)  then
    begin
	  writeln(PrintFile,'/rightshow');
	  writeln(PrintFile,'{dup stringwidth pop');
	  writeln(PrintFile,'0 exch sub');
	  writeln(PrintFile,'0 rmoveto');
	  writeln(PrintFile,'show} def');
	  writeln(PrintFile);
	  
	  writeln(PrintFile,'/centershow');
	  writeln(PrintFile,'{dup stringwidth pop');
	  writeln(PrintFIle,'2 div');
	  writeln(PrintFile,'0 exch sub');
	  writeln(PrintFile,'0 rmoveto');
	  writeln(PrintFile,'show} def');
	  writeln(PrintFile);
	 end; 
end;

  procedure TPostScriptClass.setLineScale(Scale: Double);
  begin
    fLineScale := Scale;
  end;	
	 	 
  procedure TPostScriptClass.NewLine;
  begin
    CurY := CurY + InchToPoint(LineSpacing);//fLineToLine;
  end;
     
  procedure TPostScriptClass.ShowPage;
  begin	
  if PrintFileOpen then
    writeln(PrintFile,'showpage');
  end;	
   
  destructor TPostScriptClass.Destroy;
  begin
  // InitCriticalSection(fCriticalSection); 
	FreeAllTabs;
	inherited Destroy;
		
	//DoneCriticalSection(fCriticalSection);	
end;

 
end.

