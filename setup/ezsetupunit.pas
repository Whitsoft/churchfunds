Unit ezsetupunit;
  {$mode objfpc}{$H+}

Interface

Uses 
Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
ExtCtrls, DBGrids, LResources, sqldb, DbCtrls, LCLType, chelp, IBConnection, db,
Grids,  ComCtrls, PrintersDlgs, RPrintClass;

   { TFormSetup }

Type 
  TFormSetup = Class(TForm)
    AGroupReport: TGroupBox;
    BtnPayDel: TButton;
    BtnPostChurch: TButton;
    CkBoxDed2: TCheckBox;
    CkBoxDed4: TCheckBox;
    CkBoxDed3: TCheckBox;
    CkBoxDed5: TCheckBox;
    CkBoxDed1: TCheckBox;
    CkBoxPayroll: TCheckBox;
    LoadBtn: TButton;
    EditChName: TEdit;
    EditChAdd1: TEdit;
    EditChAdd2: TEdit;
    EditChCity: TEdit;
    EditChState: TEdit;
    EditChZip: TEdit;
    EditChPhone: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label79: TLabel;
    Label8: TLabel;
    Label80: TLabel;
    Label81: TLabel;

    //TabSet1: TTabSet;
    NoteBook: TNotebook;
    Page1: TPage;
    Page2: TPage;
    Page3: TPage;
    Page4: TPage;
    Page5: TPage;
    Page6: TPage;
    Page7: TPage;
    Page8: TPage;
    Page9: TPage;
    Page10: TPage;
    Page11: TPage;
    AccData: TDatabase;
    Label68: TLabel;
    AGroupAccount: TGroupBox;
    Label55: TLabel;
    Label54: TLabel;
    Label53: TLabel;
    BtnInAcc: TButton;
    EditAccIn: TEdit;
    Splitter1: TSplitter;
    TypeBox: TComboBox;
    GroupLookup: TDBLookupComboBox;
    BtnAccClear: TButton;
    AccountGrid: TDBGrid;
    Label3: TLabel;
    AGroupFunds: TGroupBox;
    ComboTranAcc: TComboBox;
   { GridFunds: TDBGrid;  }
    Label1: TLabel;
    AGroupVendor: TGroupBox;
    Label12: TLabel;
    VendorGrid: TDBGrid;
    AGroupVuPay: TGroupBox;
    Label13: TLabel;
    PayGrid: TDBGrid;
    AGroupPayRoll: TGroupBox;
    Label7: TLabel;
    ComboAcc: TComboBox;
    EditName: TEdit;
    Label9: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label39: TLabel;
    Label38: TLabel;
    Label17: TLabel;
    Label32: TLabel;
    Label40: TLabel;
    Label31: TLabel;
    Label5: TLabel;
    Label61: TLabel;
    EditDed5Amt: TEdit;
    EditDed4Amt: TEdit;
    BtnPayClr: TButton;
    BtnPostPay: TButton;
    EditDed3Amt: TEdit;
    EditDed2Amt: TEdit;
    EditDed1Amt: TEdit;
    EditPenAcc: TEdit;
    EditPen: TEdit;
    EditLocalAcc: TEdit;
    EditLocal: TEdit;
    EditStateAcc: TEdit;
    EditState: TEdit;
    EditMedAcc: TEdit;
    EditMed: TEdit;
    EditFICAAcc: TEdit;
    EditFICA: TEdit;
    EditFITAcc: TEdit;
    EditFIT: TEdit;
    EditWageAcc: TEdit;
    EditWage: TEdit;
    EditSocNo: TEdit;
    AGroupPrint: TGroupBox;
    Label27: TLabel;
    PrintNav: TDBNavigator;
    PrintGrid: TDBGrid;
    PrintBtn: TButton;
    RadioPrint: TRadioGroup;
    AGroupChecks: TGroupBox;
    Label28: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label26: TLabel;
    AmountX: TEdit;
    DateX: TEdit;
    PayX: TEdit;
    ScriptX: TEdit;
    ScriptY: TEdit;
    PayY: TEdit;
    DateY: TEdit;
    AmountY: TEdit;
    PostBtn: TButton;
    ClrBtn: TButton;
    Label59: TLabel;
    Label60: TLabel;
    AccountY: TEdit;
    Label24: TLabel;
    DupY: TEdit;
    Label22: TLabel;
    MemoY: TEdit;
    MemoX: TEdit;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    AGroupAccGroups: TGroupBox;
    Label2: TLabel;
    GridGroup: TDBGrid;
    AGroupFundGroups: TGroupBox;
    Label6: TLabel;
    GridFundGroups: TDBGrid;
    AGroupYear: TGroupBox;
    Label56: TLabel;
    Label10: TLabel;
    BtnDelOld: TButton;
    BtnCal: TButton;
    Label52: TLabel;
    Label67: TLabel;
    Label70: TLabel;
    Label69: TLabel;
    EditOldCheck: TEdit;
    EditOldCont: TEdit;
    EditOldBal: TEdit;
    EditNewBal: TEdit;
    // ReportSystem: TRvSystem;
    //MGroupShell: TMasterShell;
    //DAccountShell: TDetailShell;
    //AGroupReport: TGroupBox;
    BtnReport: TButton;
    Label71: TLabel;
    MonthBox: TComboBox;
    EditYear: TEdit;
    Label72: TLabel;
    GridFunds: TDBGrid;
    Label73: TLabel;
    Label74: TLabel;
    EditOldDP: TEdit;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    procedure AGroupChecksClick(Sender: TObject);
    procedure BtnPayDelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEditPostChange(Sender: TObject);
    procedure GridFundGroupsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GridGroupDblClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);

    procedure UpdateChurchEdits;
    procedure EditFICAEnter(Sender: TObject);
    procedure EditFITEnter(Sender: TObject);
    procedure EditLocalEnter(Sender: TObject);
    procedure EditMedEnter(Sender: TObject);
    procedure EditPenEnter(Sender: TObject);
    procedure EditStateEnter(Sender: TObject);
    procedure EditWageEnter(Sender: TObject);
    procedure PayGridCellClick(Column: TColumn);
    procedure PrintGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

    Procedure PrintLiability;
    Procedure FillCheck;
    Procedure FillPayGrid(SocNo: String);
    Procedure InitAccount;
    Procedure PayrollWhite;
    procedure CheckHelpOpen;
    procedure ShowContext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

   //procedure ShowContext(Sender: TObject; var Key: Word; Shift: TShiftState);
    Procedure TabSet1Change(Sender: TObject; NewTab: Integer;
                            Var AllowChange: Boolean);
    Procedure FormActivate(Sender: TObject);
    Procedure InitPayGrid;
    Procedure SetTblBeforePost(DataSet: TDataset);
    Procedure PrintBtnClick(Sender: TObject);
    Procedure BtnReportClick(Sender: TObject);
    Procedure PostBtnClick(Sender: TObject);
    Procedure RadioPrintClick(Sender: TObject);

    Procedure AccountGridDrawDataCell(Sender: TObject; Const Rect: TRect;
                                      Field: TField; State: TGridDrawState);
    Procedure BtnAccClearClick(Sender: TObject);
    procedure SearchPayroll;
    Procedure EditNameChange(Sender: TObject);
    Procedure EditNameKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditSocNoKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditWageKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditWageAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditFITKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditFITAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditFICAKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditFICAAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditMedKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditMedAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditStateKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditStateAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditLocalKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditLocalAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditPenKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditPenAccKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditDed1KeyPress(Sender: TObject; Var Key: Char);
    Procedure EditDed1AmtKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditDed2AmtKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditDed3AmtKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditDed4AmtKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditDed5AmtKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditWageAccEnter(Sender: TObject);
    Procedure EditFITAccEnter(Sender: TObject);
    Procedure EditFICAAccEnter(Sender: TObject);
    Procedure EditMedAccEnter(Sender: TObject);
    Procedure EditStateAccEnter(Sender: TObject);
    Procedure EditLocalAccEnter(Sender: TObject);
    Procedure EditPenAccEnter(Sender: TObject);
    Procedure EditDed1AmtEnter(Sender: TObject);
    Procedure EditDed2AmtEnter(Sender: TObject);
    Procedure EditDed3AmtEnter(Sender: TObject);
    Procedure EditDed4AmtEnter(Sender: TObject);
    Procedure EditDed5AmtEnter(Sender: TObject);
    Procedure AccComboDblClick(Sender: TObject);
    Procedure GridFundsDblClick(Sender: TObject);
    Procedure BtnInAccClick(Sender: TObject);
    Procedure AccountGridDblClick(Sender: TObject);
    Procedure ClrBtnClick(Sender: TObject);
    Procedure EditWageAccDblClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Function  getGroupDesc(GroupNo: Integer): String;
    Function  getAccountName(AccNo: Integer): String;
    Function  getLiability(Account: Integer): Double;
    Function  getType(TypeNo: Integer): String;

    Function  TwoYears: TDateTime;
    Function  toFloat(FStr: String): String;
    Function  getAccount(Const Account: String): String;
    Procedure EditFITAccDblClick(Sender: TObject);
    Procedure EditFICAAccDblClick(Sender: TObject);
    Procedure EditMedAccDblClick(Sender: TObject);
    Procedure EditStateAccDblClick(Sender: TObject);
    Procedure EditLocalAccDblClick(Sender: TObject);
    Procedure EditPenAccDblClick(Sender: TObject);
    Procedure EditDed1AmtDblClick(Sender: TObject);
    Procedure EditDed2AmtDblClick(Sender: TObject);
    Procedure EditDed3AmtDblClick(Sender: TObject);
    Procedure EditDed4AmtDblClick(Sender: TObject);
    Procedure EditDed5AmtDblClick(Sender: TObject);
    Procedure BtnPostPayClick(Sender: TObject);
    Procedure BtnPayClrClick(Sender: TObject);
    Procedure BtnDelOldClick(Sender: TObject);
    Procedure BtnCalClick(Sender: TObject);
    // procedure AppMessage(var Msg: TMessage; var Handled: Boolean);

    // procedure doLastPage;
    Function  BegLastMonth(Year,Month: Word): TDateTime;
    Function  GetMonth: Word;
    Function  BegMonth(Year,Mnth:  Word): TDateTime;
    Function  EndMonth(Year,Mnth: Word): TDateTime;
    Function  SumConTrib(BDate,EDate: TDateTime): Double;
    Function  SumTrans(BDate,EDate: TDateTime): Double;
    Function  SumDirPost(BDate,EDate: TDateTime): Double;
    Procedure zeroYear;
    Procedure ZeroGroup;
    Procedure ReportDP;
    Procedure CalcBalance;

    Procedure FormClose(Sender: TObject);
    Procedure GridFundsDrawDataCell(Sender: TObject; Const Rect: TRect;
                                    Field: TField; State: TGridDrawState);

    procedure ReportFunds;
    procedure FundReportHeader;
    procedure FundReportTitle;
    procedure FundReportNewPage;
    procedure FundRowPrint;
    procedure FundReportSetup;
    //procedure FundBodyHeader;

    procedure ReportAccounts;
    procedure AccountReportHeader;
    procedure AccountReportTitle;
    procedure AccountReportNewPage;
    procedure AccountRowPrint;
    procedure AccountReportSetup;
    procedure AccountBodyHeader;

    procedure ReportFinances;
    procedure ReportBeforePrint;  //Zero NewPage, Zero global total variables
    procedure ReportTitle;
    procedure ReportNewPage;

    procedure ReportSetup;
    procedure DisplayReportPage(RPrinter: TReportPrinterClass; Page: Integer);

    procedure ReportPrintGroup(var Done: Boolean);
   // procedure ReportAfterGroup;

    procedure doGroupHeader(Group: String);
    procedure ReportPrintRow(var Done: Boolean);
    procedure ReportAfterRow;
    procedure doLastpage;
    procedure OpenTables;
    function  ReportRowNumLines(Group: Integer): Integer;
    function  getPayName(SocNo: String):String;
    function  getFloat(S: String): Double;

    Private 
      LineCnt: Integer;
    { Private declarations }
    Public 
    { Public declarations }
  End;

  const
   HelpFN: String='../help/ezsetup.chm';
   RELATIVE = true;

Var 
  FormSetup: TFormSetup;
  HForm: THelpForm;
  AccNum: Integer;
  Activated: Boolean;
 // EZPSClass: TPostscriptClass;
    RPrinter: TReportPrinterClass;

Implementation

Uses setupmod;

Var
  BBalance,EBalance: Double;
  YearStart,MonthStart,MonthEnd: TDateTime;
  TotalYearBudget,TotalMonthIncome,TotalMonthSpent: Double;
  GroupBudget,GroupIncome,GroupSpent: Double;
  TotalYearIncome,TotalYearSpent: Double;
  GroupYearIncome,GroupYearSpent: Double;
  DPTotalYearIncome,DPTotalYearSpent,DPTotalMonthIncome,DPTotalMonthSpent: Double;
  LastMoBal,ThisMoBal: Double;
  BegOfTime: TDateTime;
  RepYear,RepMonth: Word;

Const 
  EXPENSE = 0;
 // ChurchName = 'Saegertown United Methodist Church';

function AddDecimalPoint(Money: String): String;
begin
  if Money = '' then
    Result := '0.00  '
  else if Pos('.', Money)<=0 then
    Result := Money+'.00  '
  else
    Result := Money+'  ';
end;

procedure clearlogfile(fname: String);
begin
end;


Procedure TFormSetup.FormActivate(Sender: TObject);

Var 
  Day,Month,Year: Word;
Begin
  If Activated Then
    exit;
  Activated := True;

  BegOfTime := EncodeDate(1990,1,1);
  DecodeDate(Date,Year,Month,Day);
  EditYear.Text := IntToStr(Year);
  If Month>1 Then
    MonthBox.ItemIndex := Month-1
  Else
    MonthBox.ItemIndex := 1;

  AccNum := 0;
  NoteBook.PageIndex := 0;
  RadioPrint.ItemIndex := 0;
  LineCnt := 4;
  If Not DataMod.ZTblGroup.Active Then
    DataMod.ZTblGroup.Open;
   {GridFunds.Columns[3].Width:=200; }
  DataMod.ZTblGroup.FieldByName('DESCRIPTION').DisplayWidth := 32;
  DataMod.ZTblFundGroups.FieldByName('DESCRIPTION').DisplayWidth := 32;
  With DataMod.ZTblFund Do
    Begin
      FieldByName('DETAIL_FUND_NO').DisplayWidth := 7;
      FieldByName('DETAIL_FUND_NO').DisplayLabel := 'FUND';
      FieldByName('DESCRIPTION').DisplayWidth := 24;
    End;
  With DataMod.ZTblFunds Do
    Begin
      FieldByName('DETAIL_FUND_NO').DisplayWidth := 6;
      FieldByName('DETAIL_FUND_NO').DisplayLabel := 'FUND';
      FieldByName('DESCRIPTION').DisplayWidth := 19;
    End;
  With DataMod.ZTblAccounts Do
    Begin
      FieldByName('ACCOUNT').DisplayWidth := 7;
      FieldByName('NAME').DisplayWidth := 19;
    End;
  With DataMod.ZTblAcc Do
    Begin
      FieldByName('ACCOUNT').DisplayWidth := 7;
      FieldByName('BUDGET').DisplayWidth := 5;
      FieldByName('GROUP_NO').DisplayWidth := 30;
      FieldByName('GROUP_NO').DisplayLabel := 'GROUP';
      FieldByName('ACC_TYPE').DisplayWidth := 30;
      FieldByName('ACC_TYPE').DisplayLabel := ' TYPE';
    End;
  InitPayGrid;
  InitAccount;
  UpdateChurchEdits;
  If RPrinter <> nil then
    With RPrinter do
      begin
        SaveFontName(1, HELVETICA);
        SaveFontSize(1,12);
        SaveFontName(2, HELVETICA);
        SaveFontSize(1,10);
      end;
  OpenTables;
end;

procedure TFormSetup.OpenTables;
begin
  with DataMod do
    begin
       ZTblFund.Open;
       ZTblGroup.open;
       ZTblFunds.Open;
       ZTblAccounts.Open;
       ZTblVendor.Open;
       ZTblPayroll.Open;
       ZTblFundGroups.Open;
    end;
end;

Procedure TFormSetup.InitPayGrid;
Begin
  With PayGrid Do
    Begin
      Columns[1].Width := 200;
      Columns[2].Width := 60;
      Columns[3].Width := 60;
      Columns[4].Width := 60;
      Columns[5].Width := 110;
      Columns[5].DisplayName := 'MEDICARE';
      Columns[6].Width := 60;
      Columns[7].Width := 110;
      Columns[8].Width := 90;
      Columns[8].DisplayName := 'ACCOUNT';
    End;
End;

Procedure TFormSetup.TabSet1Change(Sender: TObject; NewTab: Integer;
                                   Var AllowChange: Boolean);

Var 
  Year, Month, Day: Word;
Begin
  NoteBook.PageIndex := NewTab;
  If NewTab=2 Then
    Begin
      DataMod.ZTblAcc.Close;
      DataMod.ZTblAcc.Open;
      EditAccIn.SetFocus;
    End
  Else
    If NewTab=6 Then
      Begin
      End
  Else
    If NewTab=4 Then
      Begin
        DecodeDate(Date, Year, Month, Day);
       { YearEdit.Text:='1/1/'+IntToStr(Year);  }
      End
  Else
    If NewTab=7 Then
      Begin
        FillCheck
      End;
End;


Procedure TFormSetup.SetTblBeforePost(DataSet: TDataset);
Begin
  { SetTbl.FieldByName('Year').AsString:=YearEdit.Text; }
End;

Procedure TFormSetup.PrintBtnClick(Sender: TObject);
Begin
If RadioPrint.ItemIndex=0 then
   ReportFunds
else
  ReportAccounts;
  RPrinter.EndPage;
  DisplayReportPage(RPrinter, 1);
End;



Procedure TFormSetup.RadioPrintClick(Sender: TObject);
Begin
  With RadioPrint Do
    Begin
      If ItemIndex=0 Then
        Begin
          PrintNav.DataSource := DataMod.FundSrc;
          PrintGrid.Datasource := DataMod.FundSrc;
          DataMod.ZTblFund.Open;
        End
      Else
        If ItemIndex=1 Then
          Begin
            PrintNav.DataSource := DataMod.AccSrc;
            PrintGrid.Datasource := DataMod.AccSrc;
            DataMod.ZTblAccounts.Open;
          End
      Else
        If ItemIndex=2 Then
          Begin

          End
    End;
End;


//*************************************
// Report Funds
//*************************************

procedure TFormSetup.ReportFunds;
var
  fName: String;
begin
 RPrinter.NewPage;

  FundReportSetup;
  FundReportTitle;
  DataMod.ZTblFunds.First;
  while not DataMod.ZTblFunds.EOF do
    begin
      FundRowPrint;
      DataMod.ZTblFunds.Next;
    end;
 // RPrinter.EndPage;
end;

procedure TFormSetup.FundReportTitle;
var
  Day,Month,Year: Word;
  ChurchName: String;
begin
  DecodeDate(Date,Year,Month,Day);
  ChurchName := DataMod.TableChurch.FieldByName('NAME').AsString;
  With RPrinter do
    begin
      Bold:=True;
      RestoreFont(1);
      //report Title
      PrintCenterPage(ChurchName);
      RestoreFont(2);
      Bold:=False;
      NewLine;
      Newline;
      PrintCenterPage('Funds Report');
      PrintLeft(IntToStr(Month) + ' - '+ IntToStr(Day) +' , '+IntToStr(Year),6.0);
      If PageNo>1 then
      PrintXY(7.25,0.05,'Page '+IntToStr(PageNo));
      NewLine;
      Newline;
      FundReportHeader;
    end;
end;

procedure TFormSetup.FundReportNewPage;
var
  Day,Month,Year: Word;
begin
  DecodeDate(Date,Year,Month,Day);
  With RPrinter do
    begin
      EndPage;
      NewPage;
      RestoreFont(1);
      PageNo := PageNo + 1;
      If PageNo>1 then
        begin
          PrintCenterPage('Fund Report');
          PrintLeft(IntToStr(Month) + ' - '+ IntToStr(Day) +' , '+IntToStr(Year),6.0);
        end;
      PrintXY(7.25,0.05,'Page '+IntToStr(PageNo));
      Newline;
      Newline;
      FundReportHeader;
    end;
 end;

procedure TFormSetup.FundReportSetup;
var
   FundFont: FontType;
   TmpTab: PTab;
   BH12: Double;
begin
  DataMod.ZTblFunds.First;
  With RPrinter do
    begin
      Landscape := false;
      DataMod.ZTblFund.First;

      FreeTabs(6);
      TmpTab := NewTab(6,0.75,JUSTIFYCENTER,1.0,0.05,ABSOLUT,BOXLINEALL,0);
      TmpTab := NewTab(6,0.0,JUSTIFYLEFT,2.75,0.05,RELATIVE,BOXLINEALL,0);
      TmpTab := NewTab(6,0.0,JUSTIFYLEFT,2.50,0.05,RELATIVE,BOXLINEALL,0);
      BH12 := PointToInch(Round(12* LineScale));
      SaveFontName(6, HELVETICA);
      SaveFontSize(6,12);
      setTabBoxHeight(6,BH12);
   end;
end;


procedure TFormSetup.FundReportHeader;
begin
 With RPrinter do
   begin
     NewLine;
    // TabJustify := tjCenter;
     PrintTab(6,'Fund');
     PrintTab(6,'Description');
     PrintTab(6,'Account');
    // NewLine;
    end;
end;

procedure TFormSetup.FundRowPrint;
var
  Acc: String;
  FundFont: FontType;
begin
 With RPrinter do
   begin
   // FundFont.FontName := 'HELVETICA';
   // FundFont.FontSize := 10;
   // Font := FundFont;
    Acc := getAccountName(DataMod.ZTblFundsACCOUNT.AsInteger);
    Bold := true;
    PrintTab(6, DataMod.ZTblFundsDETAIL_FUND_NO.AsString);
    Bold := False;
    PrintTab(6, DataMod.ZTblFundsDESCRIPTION.AsString);
    PrintTab(6, Acc); //DataMod.ZTblFundsACCOUNT.AsString);
   // NewLine;
    If  LinesLeft(0.3)<4 then
       FundReportNewPage;
   end;
end;

//*************************************
// Report Accounts
//*************************************

procedure TFormSetup.ReportAccounts;
var
  fName: String;
begin
  RPrinter.Landscape := true;
  RPrinter.Newpage;
  RPrinter.PageNo := 1;
  AccountReportSetup;
  AccountReportTitle;
  DataMod.ZTblAcc.First;
  while not DataMod.ZTblAcc.EOF do
    begin
      AccountRowPrint;
      DataMod.ZTblAcc.Next;
    end;
  RPrinter.EndPage;
end;

procedure TFormSetup.AccountReportTitle;
var
  Day,Month,Year: Word;
  ChurchName: String;
begin
  DecodeDate(Date,Year,Month,Day);
  ChurchName := DataMod.TableChurch.FieldByName('NAME').AsString;
 With RPrinter do
    begin
      Bold:=True;
      RestoreFont(1);
      //report Title
      PrintCenterPage(ChurchName);
      RestoreFont(2);
      Bold:=False;
      PrintCenterPage('Accounts Report');
      PrintLeft(IntToStr(Month) + ' - '+ IntToStr(Day) +' , '+IntToStr(Year),6.5);
      If PageNo>1 then
      PrintXY(7.25,0.05,'Page '+IntToStr(PageNo));
      Newline;
      Newline;
      Newline;
      AccountReportHeader;
     // MyNewPage:=True;
    end;
end;

procedure TFormSetup.AccountReportNewPage;
var
  Day,Month,Year: Word;
begin
  DecodeDate(Date,Year,Month,Day);
  With RPrinter do
    begin
      EndPage;
      NewPage;
      RestoreFont(1);
      PageNo := PageNo + 1;
      If PageNo>1 then
        begin
          PrintCenterPage('Accounts Report');
          PrintLeft(IntToStr(Month) + ' - '+ IntToStr(Day) +' , '+IntToStr(Year),6.5);
           Newline;
           Newline;
        end;
      PrintXY(7.25,0.05,'Page '+IntToStr(PageNo));
      NewLine;
      AccountReportHeader;
    end;
 end;

procedure TFormSetup.AccountReportSetup;
var
   FundFont: FontType;
   TmpTab: PTab;
   BH12: Double;
begin
  if not DataMod.ZTblAcc.active then DataMod.ZTblAcc.open;
  DataMod.ZTblAcc.First;
  With RPrinter do
    begin
      setPageMargins(0.25, 0.25, 0.5, 0.5);
      FreeTabs(7);
      TmpTab := NewTab(7 ,1.0,JUSTIFYCENTER,1.00,0.05, ABSOLUT,  BOXLINEALL,0);
      TmpTab := NewTab(7 ,0.0,JUSTIFYLEFT,  2.50,0.05, RELATIVE, BOXLINEALL,0);
      TmpTab := NewTab(7, 0.0,JUSTIFYRIGHT, 1.15,0.05, RELATIVE, BOXLINEALL,0);
      TmpTab := NewTab(7, 0.0,JUSTIFYLEFT,  1.25,0.05, RELATIVE, BOXLINEALL,0);
      TmpTab := NewTab(7, 0.0,JUSTIFYLEFT,  2.00,0.05, RELATIVE, BOXLINEALL,0);
      TmpTab := NewTab(7, 0.0,JUSTIFYLEFT,  0.75,0.05, RELATIVE, BOXLINEALL,0);
      BH12 := PointToInch(Round(12* LineScale));
      SaveFontName(7, HELVETICA);
      SaveFontSize(7,12);
      setTabBoxHeight(7,BH12);
   end;
end;


procedure TFormSetup.AccountReportHeader;
begin
 With RPrinter do
   begin
    // NewLine;
    // TabJustify := tjCenter;
     PrintTab(7, 'Account');
     PrintTab(7, 'Description');
     PrintTab(7, 'Budget');
     PrintTab(7, 'Type');
     PrintTab(7, 'Group');
     PrintTab(7, 'Payroll');
   end;
end;

procedure TFormSetup.AccountRowPrint;
var
  Budget: String;
begin
    If DataMod.ZTblAccAccount.AsInteger>0 then
      With RPrinter do
        begin
          Budget := AddDecimalPoint( DataMod.ZTblAccBUDGET.AsString);
          Bold:=True;
          PrintTab(7, DataMod.ZTblAccACCOUNT.AsString);
          Bold:=False;
          PrintTab(7, DataMod.ZTblAccNAME.AsString);
          PrintTab(7,Budget);
          PrintTab(7, getType(DataMod.ZTblAccACC_TYPE.AsInteger-1));
          PrintTab(7, getGroupDesc(DataMod.ZTblAccGROUP_NO.AsInteger));
          If DataMod.ZTblAccPayroll.AsString<>'' then
              PrintTab(7, 'True')
           else
              PrintTab(7, ' ');
           //NewLine;
           If  LinesLeft(0.3)<3 then
             AccountReportNewPage;
       end;
end;


Function TFormSetup.getAccountName(AccNo: Integer): String;
Begin
  With DataMod.ZQueryAccName Do
    Begin
      close;
      params[0].AsInteger := AccNo;
      open;
      result := FieldByName('NAME').AsString;
    End;
End;

Function TFormSetup.getGroupDesc(GroupNo: Integer): String;
Begin
  With DataMod.ZQueryGroupDesc Do
    Begin
      close;
      params[0].AsInteger := GroupNo;
      open;
      result := FieldByName('DESCRIPTION').AsString;
    End;
End;

Function TFormSetup.getType(TypeNo: Integer): String;
Begin
  result := '';
  Try
    result := TypeBox.Items[TypeNo];
  Except
End;
End;




{procedure TFormSetup.FundShellRowAfter(ReportPrinter: TBaseReport;
  ReportShell: TDetailShell; var Valid: Boolean);
begin
  DataMod.ZTblFund.Next;
  Valid := not DataMod.ZTblFund.EOF;
end;

procedure TFormSetup.AccShellRowAfter(ReportPrinter: TBaseReport;
  ReportShell: TDetailShell; var Valid: Boolean);
begin
  DataMod.ZTblAcc.Next;
  Valid := not DataMod.ZTblAcc.EOF;
end;

 }

Procedure TFormSetup.AccountGridDrawDataCell(Sender: TObject;
          Const Rect: TRect; Field: TField; State: TGridDrawState);

Var 
  R: TRect;
  TmpStr: String;
Begin
  With  AccountGrid, Canvas Do
    Begin
      R := Rect;
      If (Field.FieldName='ACC_TYPE') Then
        Begin
          If (Field.AsInteger>0) And (Field.AsInteger<=20) Then
            Begin
              TmpStr := getType(Field.AsInteger-1)
            End
          Else
            Begin
              TmpStr := 'Unknown'
            End;
          TextRect(R,R.Left,R.Top,' '+TmpStr);
        End
      Else
        If (Field.FieldName='GROUP_NO') Then
          Begin
            DataMod.ZqueryGroupDesc.close;
            DataMod.ZqueryGroupDesc.params[0].AsInteger := Field.AsInteger;
            DataMod.ZqueryGroupDesc.open;
            TmpStr := DataMod.ZQueryGroupDesc.FieldByName('DESCRIPTION').AsString;
            If TmpStr <> '' Then
              Begin
                TmpStr := Copy(TmpStr,1,20)
              End
            Else
              Begin
                TmpStr := Field.AsString
              End;
            TextRect(R,R.Left,R.Top,' '+TmpStr);
          End
      Else
        If (Field.FieldName='PAYROLL') Then
          Begin
            If Field.AsString<> ''Then
              Begin
                Brush.Color := clAqua;
                TmpStr := 'Pay'
              End
            Else
              Begin
                Brush.Color := clWhite;
                TmpStr := '';
              End;
            TextRect(R,R.Left,R.Top,' '+TmpStr);
          End;
    End;
End;

Procedure TFormSetup.BtnAccClearClick(Sender: TObject);
Begin
  TypeBox.ItemIndex := -1;
 { TypeBox.Text:=''; }
  GroupLookup.Text := '';
  EditAccIn.Text := '';
  EditAccIn.SetFocus;
End;


procedure TFormSetup.SearchPayroll;
var
  SParm, NParm: String;
  Acc: Integer;
begin
 // BtnPayClrClick(Self);
  SParm := '';
  NParm:='';
  If EditSocNo.Text <>'' then
    SParm := EditSocNo.Text
  else if EditName.Text <> '' then
    NParm := EditName.Text;
  With DataMod.ZQueryPayroll do
    begin
      close;
      Params[0].AsString := SParm;
      Params[1].AsString := NParm;
      Open;
      If FieldByName('SOC_SEC_NO').AsString <> '' then
        begin
          EditName.Text := FieldByName('NAME').AsString;
          EditSocNo.Text := FieldByName('SOC_SEC_NO').AsString;

          If FieldByName('WAGE_ACCOUNT').AsInteger <> 0 then
            begin
               EditWageAcc.Text := IntToStr(FieldByName('WAGE_ACCOUNT').AsInteger);
               EditWage.Text := FloatToStr(FieldByName('WAGE').AsFloat);
            end;
          If FieldByName('FED_ACCOUNT').AsInteger <> 0 then
            begin
               EditFITAcc.Text := IntToStr(FieldByName('FED_ACCOUNT').AsInteger);
               EditFIT.Text := FloatToStr(FieldByName('FED').AsFloat);
            end;
          If FieldByName('FICA_ACCOUNT').AsInteger <> 0 then
            begin
               EditFICAAcc.Text := IntToStr(FieldByName('WAGE_ACCOUNT').AsInteger);
               EditFICA.Text := FloatToStr(FieldByName('WAGE').AsFloat);
            end;
          If FieldByName('MED_ACCOUNT').AsInteger <> 0 then
            begin
               EditMedAcc.Text := IntToStr(FieldByName('MED_ACCOUNT').AsInteger);
               EditMed.Text := FloatToStr(FieldByName('MED').AsFloat);
            end;
          If FieldByName('STATE_ACCOUNT').AsInteger <> 0 then
            begin
               EditStateAcc.Text := IntToStr(FieldByName('STATE_ACCOUNT').AsInteger);
               EditState.Text := FloatToStr(FieldByName('STATE').AsFloat);
            end;
          If FieldByName('LOCAL_ACCOUNT').AsInteger <> 0 then
            begin
               EditLocalAcc.Text := IntToStr(FieldByName('LOCAL_ACCOUNT').AsInteger);
               EditLocal.Text := FloatToStr(FieldByName('LOCAL').AsFloat);
            end;
           If FieldByName('PENSION_ACCOUNT').AsInteger <> 0 then
            begin
               EditPenAcc.Text := IntToStr(FieldByName('PENSION_ACCOUNT').AsInteger);
               EditPen.Text := FloatToStr(FieldByName('PENSION').AsFloat);
            end;

            If FieldByName('DEDUCT1_ACC').AsInteger <> 0 then
              begin
                EditDED1Amt.Text := FloatToStr(FieldByName('DEDUCT1').AsFloat);
                CKBoxDed1.Checked := true;
              end;

            If FieldByName('DEDUCT2_ACC').AsInteger <> 0 then
              begin
                EditDED2Amt.Text := FloatToStr(FieldByName('DEDUCT2').AsFloat);
                CKBoxDed2.Checked := true;
              end;

            If FieldByName('DEDUCT3_ACC').AsInteger <> 0 then
              begin
                EditDED3Amt.Text := FloatToStr(FieldByName('DEDUCT3').AsFloat);
                CKBoxDed3.Checked := true;
              end;

           If FieldByName('DEDUCT4_ACC').AsInteger <> 0 then
              begin
                EditDED4Amt.Text := FloatToStr(FieldByName('DEDUCT4').AsFloat);
                CKBoxDed4.Checked := true;
              end;

           If FieldByName('DEDUCT5_ACC').AsInteger <> 0 then
              begin
                EditDED5Amt.Text := FloatToStr(FieldByName('DEDUCT5').AsFloat);
                CKBoxDed5.Checked := true;
              end;

        end;
    end;
end;

Procedure TFormSetup.EditNameChange(Sender: TObject);
Begin
  AccNum := 0;
  PayrollWhite;
End;

Procedure TFormSetup.EditNameKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  searchPayroll;
  EditSocNo.SetFocus;
End;

Procedure TFormSetup.EditSocNoKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  searchPayroll;
  EditWage.SetFocus;
End;

Procedure TFormSetup.EditWageKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditWageAcc.SetFocus;
End;

Procedure TFormSetup.EditWageAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditFIT.SetFocus;
End;

Procedure TFormSetup.EditFITKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditFITAcc.SetFocus;
End;

Procedure TFormSetup.EditFITAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditFICA.SetFocus;
End;

Procedure TFormSetup.EditFICAKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditFICAAcc.SetFocus;
End;

Procedure TFormSetup.EditFICAAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditMed.SetFocus;
End;

Procedure TFormSetup.EditMedKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditMedAcc.SetFocus;
End;

Procedure TFormSetup.EditMedAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditState.SetFocus;
End;

Procedure TFormSetup.EditStateKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditStateAcc.SetFocus;
End;

Procedure TFormSetup.EditStateAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditLocal.SetFocus;
End;

Procedure TFormSetup.EditLocalKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditLocalAcc.SetFocus;
End;

Procedure TFormSetup.EditLocalAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditPen.SetFocus;
End;

Procedure TFormSetup.EditPenKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditPenAcc.SetFocus;
End;

Procedure TFormSetup.EditPenAccKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditDed1Amt.SetFocus;
End;

Procedure TFormSetup.EditDed1KeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditDed1Amt.SetFocus;
End;

Procedure TFormSetup.EditDed1AmtKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditDed2Amt.SetFocus;
End;


Procedure TFormSetup.EditDed2AmtKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditDed3Amt.SetFocus;
End;


Procedure TFormSetup.EditDed3AmtKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditDed4Amt.SetFocus;
End;


Procedure TFormSetup.EditDed4AmtKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  EditDed5Amt.SetFocus;
End;


Procedure TFormSetup.EditDed5AmtKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key<>#13 Then
    Begin
      Exit
    End;
  BtnPostPay.SetFocus;
End;


Procedure TFormSetup.EditWageAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditWageAcc.Color := clAqua;
  AccNum := 1;
End;

Procedure TFormSetup.EditFITAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditFITAcc.Color := clAqua;
  AccNum := 2;
End;

Procedure TFormSetup.EditFICAAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditFICAAcc.Color := clAqua;
  AccNum := 3;
End;

Procedure TFormSetup.EditMedAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditMedAcc.Color := clAqua;
  AccNum := 4;
End;

Procedure TFormSetup.EditStateAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditStateAcc.Color := clAqua;
  AccNum := 5;
End;

Procedure TFormSetup.EditLocalAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditLocalAcc.Color := clAqua;
  AccNum := 6;
End;

Procedure TFormSetup.EditPenAccEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditPenAcc.Color := clAqua;
  AccNum := 7;
End;


Procedure TFormSetup.EditDed1AmtEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditDed1Amt.Color := clAqua;
  AccNum := 8;
End;

Procedure TFormSetup.EditDed2AmtEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditDed2Amt.Color := clAqua;
  AccNum := 9;
End;

Procedure TFormSetup.EditDed3AmtEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditDed3Amt.Color := clAqua;
  AccNum := 10;
End;

Procedure TFormSetup.EditDed4AmtEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditDed4Amt.Color := clAqua;
  AccNum := 11;
End;

Procedure TFormSetup.EditDed5AmtEnter(Sender: TObject);
Begin
  PayrollWhite;
  EditDed5Amt.Color := clAqua;
  AccNum := 12;
End;

Procedure TFormSetup.AccComboDblClick(Sender: TObject);

Var 
  AccNo: String;
Begin
  AccNo := DataMod.ZTblAccounts.FieldByName('ACCOUNT').AsString;
  Case AccNum Of 
    1:
       Begin
         EditWageAcc.Text := AccNo
       End;
    2:
       Begin
         EditFITAcc.Text := AccNo
       End;
    3:
       Begin
         EditFICAAcc.Text := AccNo
       End;
    4:
       Begin
         EditMedAcc.Text := AccNo
       End;
    5:
       Begin
         EditStateAcc.Text := AccNo
       End;
    6:
       Begin
         EditLocalAcc.Text := AccNo
       End;
    7:
       Begin
         EditPenAcc.Text := AccNo
       End;
    8:
       Begin
         EditDed1Amt.Text := AccNo
       End;
    9:
       Begin
         EditDed2Amt.Text := AccNo
       End;
    10:
        Begin
          EditDed3Amt.Text := AccNo
        End;
    11:
        Begin
          EditDed4Amt.Text := AccNo
        End;
    12:
        Begin
          EditDed5Amt.Text := AccNo
        End;
    Else
      Begin
        ShowMessage('Error in finding account number '+AccNo)
      End;
  End;
  PayRollWhite;
  AccNum := 0;
End;

Procedure TFormSetup.PayrollWhite;
Begin
  EditWage.Color := clWhite;
  EditFIT.Color := clWhite;
  EditFICA.Color := clWhite;
  EditMed.Color := clWhite;
  EditState.Color := clWhite;
  EditLocal.Color := clWhite;
  EditPen.Color := clWhite;
  EditWageAcc.Color := clWhite;
  EditFITAcc.Color := clWhite;
  EditFICAAcc.Color := clWhite;
  EditMedAcc.Color := clWhite;
  EditStateAcc.Color := clWhite;
  EditLocalAcc.Color := clWhite;
  EditPenAcc.Color := clWhite;
  EditDed1Amt.Color := clWhite;
  EditDed2Amt.Color := clWhite;
  EditDed3Amt.Color := clWhite;
  EditDed4Amt.Color := clWhite;
  EditDed5Amt.Color := clWhite;
End;


Procedure TFormSetup.GridFundsDblClick(Sender: TObject);
Begin
  If ComboTranAcc.Text='' Then
    exit;
  With DataMod.ZTblFunds Do
    Begin
      Edit;
      FieldByName('ACCOUNT').AsString := GetAccount(ComboTranAcc.Text);
      Post;
    End;
End;

Procedure TFormSetup.BtnInAccClick(Sender: TObject);
var
  AccName: String;
Begin
  If (EditAccIn.Text='') Or (TypeBox.Text='') Or
     (GroupLookUp.Text='') then
    Begin
      ShowMessage('Enter an account no., account type and group.');
      EditAccIn.SetFocus;
      exit;
    End;
  With DataMod.ZTblAcc Do
    Begin
      Try
        Tag := SQLINSERT;
        Insert;
        FieldByName('ACCOUNT').AsInteger := StrToInt(EditAccIn.Text);
        FieldByName('ACC_TYPE').AsInteger := TypeBox.ItemIndex+1;
        FieldByName('GROUP_NO').AsInteger := 
        DataMod.ZTblGroup.FieldByName('GROUP_NO').AsInteger;
        Post;
       // ApplyUpdates;
        DataMod.SQLTransactionEZ.commit;
        close;
        open;
        AccName := getAccountName(StrToInt(EditAccIn.Text));
          if AccName = '' then
             ShowMessage('Account '+EditAccIn.Text+' is not listed in database.');
        AccountGrid.SetFocus;
        AccountGrid.SelectedIndex := 1;
      Except
        ShowMessage('Account '+EditAccIn.Text+' did not insert.');
    close;
    open;
    End;
End;

End;

Procedure TFormSetup.AccountGridDblClick(Sender: TObject);
Var
  MyBook: TBookMark;
  FieldName: String;
Begin
  If (EditAccIn.Text='') And (TypeBox.Text='') And (GroupLookUp.Text='') then
     exit;
  If MessageDlg('OK to make changes to accounts?',
     mtConfirmation, [mbNo, mbYes], 0) = mrNo then
      exit;
  FieldName := AccountGrid.SelectedField.Name;
  With DataMod.ZTblAcc Do
    Begin
      try
        MyBook := GetBookmark;
        Edit;
        If FieldName='DataMod.ZTblAccACC_TYPE' then
          Begin
            FieldByName('ACC_TYPE').AsInteger := TypeBox.ItemIndex+1
          End
        else
          If FieldName='DataMod.ZTblAccGROUP_NO' then
            Begin
              If GroupLookup.Text='' then
                  FieldByName('GROUP_NO').AsString := ''
              else
                  FieldByName('GROUP_NO').AsInteger := DataMod.ZTblGroup.FieldByName('GROUP_NO').AsInteger;
              end;
        Tag := SQLEDIT;
        Post;
        GotoBookmark(MyBook);
        FreebookMark(MyBook);
      Except
        FreebookMark(MyBook);
        Cancel;
    End
End;

End;

procedure TFormSetup.LoadBtnClick(Sender: TObject);
begin
  DataMod.ZTblXY.Open;
  DataMod.ZTblXY.First;
  With DataMod.ZTblXY Do
     If RecordCount > 0 Then
        Begin
           ScriptX.Text :=  FormatFloat( '0.00',Fields[0].AsFloat);
           ScriptY.Text :=  FormatFloat( '0.00',Fields[1].AsFloat);
           PayX.Text :=     FormatFloat( '0.00',Fields[2].AsFloat);
           PayY.Text :=     FormatFloat( '0.00',Fields[3].AsFloat);
           DateX.Text :=    FormatFloat( '0.00',Fields[4].AsFloat);
           DateY.Text :=    FormatFloat( '0.00',Fields[5].AsFloat);
           AmountX.Text :=  FormatFloat( '0.00',Fields[6].AsFloat);
           AmountY.Text :=  FormatFloat( '0.00',Fields[7].AsFloat);
           MemoX.Text :=    FormatFloat( '0.00',Fields[8].AsFloat);
           MemoY.Text :=    FormatFloat( '0.00',Fields[9].AsFloat);
           DupY.Text   :=   FormatFloat( '0.00',Fields[10].AsFloat);
           AccountY.Text := FormatFloat( '0.00',Fields[11].AsFloat);
       End; {With}
end;

Procedure TFormSetup.PostBtnClick(Sender: TObject);
Begin
   DataMod.ZTblXY.Open;
  DataMod.ZTblXY.First;
  With DataMod.ZTblXY Do
    Begin
      If RecordCount=0 Then
        Begin
          insert
        End
      Else
        Begin
          edit
        End;
      Fields[0].AsFloat := StrToFloat(ScriptX.Text);
      Fields[1].AsFloat := StrToFloat(ScriptY.Text);
      Fields[2].AsFloat := StrToFloat(PayX.Text);
      Fields[3].AsFloat := StrToFloat(PayY.Text);
      Fields[4].AsFloat := StrToFloat(DateX.Text);
      Fields[5].AsFloat := StrToFloat(DateY.Text);
      Fields[6].AsFloat := StrToFloat(AmountX.Text);
      Fields[7].AsFloat := StrToFloat(AmountY.Text);
      Fields[8].AsFloat := StrToFloat(MemoX.Text);
      Fields[9].AsFloat := StrToFloat(MemoY.Text);
      Fields[10].AsFloat:= StrToFloat(DupY.Text);
      Fields[11].AsFloat:= StrToFloat(AccountY.Text);
      Post;
    End; {With}
    OpenTables;
End;

Procedure TFormSetup.ClrBtnClick(Sender: TObject);
Begin
  ScriptX.Text := '';
  ScriptY.Text := '';
  PayX.Text := '';
  PayY.Text := '';
  DateX.Text := '';
  DateY.Text := '';
  AmountX.Text := '';
  AmountY.Text := '';
  MemoX.Text := '';
  MemoY.Text := '';
  DupY.Text := '';
  AccountY.Text := '';
End;

Procedure TFormSetup.initAccount;

Var 
  Account: String;
Begin
  DataMod.ZTblAccounts.First;
  With DataMod.ZTblAccounts Do
    Begin
      While Not EOF Do
        Begin
          Account := FieldByName('Account').AsString;
          Account := Account+copy('        ',1,8-Length(account))+
                     FieldByName('Name').AsString;
          ComboTranAcc.Items.Add(Account);
          ComboAcc.Items.Add(Account);
          Next;
        End;
    End;
End;

Procedure TFormSetup.FormCreate(Sender: TObject);
Begin
  //Application.OnMessage := AppMessage;
  //NoteBook.PageIndex:=TabSet1.TabIndex;
  Activated := False;
  RPrinter := TReportPrinterClass.Create(Sender as TObject);
  WindowState := wsNormal;
End;

Function TFormSetup.getAccount(Const Account: String): String;

Var 
  Temp: String;
  IDX: Integer;
Begin
  Temp := '';
  For IDX:=1 To Length(Account) Do
    Begin
      If (Account[IDX]<'0') Or (Account[IDX]>'9') Then
        Begin
          break
        End
      Else
        Begin
          Temp := Temp+Account[IDX]
        End
    End;
  Try
    If Temp='' Then
      Begin
        Result := ''
      End
    Else
      Begin
        Result := IntToStr(StrToInt(Temp))
      End;
  Except
    Result := '';
End;
End;

Procedure TFormSetup.EditWageAccDblClick(Sender: TObject);
Begin
  EditWageAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditFITAccDblClick(Sender: TObject);
Begin
  EditFITAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditFICAAccDblClick(Sender: TObject);
Begin
  EditFICAAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditMedAccDblClick(Sender: TObject);
Begin
  EditMedAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditStateAccDblClick(Sender: TObject);
Begin
  EditStateAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditLocalAccDblClick(Sender: TObject);
Begin
  EditLocalAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditPenAccDblClick(Sender: TObject);
Begin
  EditPenAcc.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditDed1AmtDblClick(Sender: TObject);
Begin
  EditDed1Amt.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditDed2AmtDblClick(Sender: TObject);
Begin
  EditDed2Amt.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditDed3AmtDblClick(Sender: TObject);
Begin
  EditDed3Amt.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditDed4AmtDblClick(Sender: TObject);
Begin
  EditDed4Amt.Text := GetAccount(ComboAcc.Text);
End;

Procedure TFormSetup.EditDed5AmtDblClick(Sender: TObject);
Begin
  EditDed5Amt.Text := GetAccount(ComboAcc.Text);
End;

function  TFormSetup.getPayName(SocNo: String):String;
begin
  With DataMod.ZTblPay do
    begin
      close;
      Params[0].AsString := SocNo;
      open;
      result := FieldByName('Name').AsString;
    end;
end;

procedure TFormSetup.BtnPayDelClick(Sender: TObject);
begin
    If MessageDlg('OK to delete ' + EditSocNo.Text+' from payroll?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;
   With DataMod.ZDeletePay do
     begin
       close;
       Params[0].AsString := EditSocNo.Text;
       open;
       delete;
     end;
   BtnPayClrClick(Self);
end;

procedure TFormSetup.AGroupChecksClick(Sender: TObject);
begin

end;

Procedure TFormSetup.BtnPostPayClick(Sender: TObject);
Var
  SocNum: String;
Begin
  If MessageDlg('OK to post changes to payroll?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    exit;

  SocNum := EditSocNo.Text;
  DataMod.TableSpecial.Open;
  If (SocNum='') Or (EditName.Text='') Then
    exit;
  Try
    If getPayName(SocNum) <> '' then
      Begin
        DataMod.ZEditPay.Open;
        DataMod.ZEditPay.Edit;
      End
    Else
      Begin
        DataMod.ZEditPay.Open;
        DataMod.ZEditPay.Insert;
      End;
    With DataMod.ZEditPay Do
      Begin
        FieldByName('SOC_SEC_NO').AsString := SocNum;
        FieldByName('NAME').AsString := EditName.Text;
        If EditWageAcc.Text<>'' Then
          Begin
            FieldByName('WAGE').AsFloat := StrToFloat(EditWage.Text);
            FieldByName('WAGE_ACCOUNT').AsInteger := StrToInt(EditWageAcc.Text);
          End;
        If EditFIT.Text<>'' Then
          Begin
            FieldByName('FED').AsFloat := getFloat(EditFIT.Text);
            FieldByName('FED_ACCOUNT').AsInteger := StrToInt(EditFITAcc.Text);
          End;
        If EditFICA.Text<>'' Then
          Begin
            FieldByName('FICA').AsFloat := getFloat(EditFICA.Text);
            FieldByName('FICA_ACCOUNT').AsInteger := StrToInt(EditFICAAcc.Text);
          End;
        If EditMed.Text<>'' Then
          Begin
            FieldByName('MED').AsFloat := getFloat(EditMed.Text);
            FieldByName('MED_ACCOUNT').AsInteger := StrToInt(EditMedAcc.Text);
          End;
        If EditStateAcc.Text<>'' Then
          Begin
            FieldByName('STATE').AsFloat := getFloat(EditState.Text);
            FieldByName('STATE_ACCOUNT').AsInteger := StrToInt(EditStateAcc.Text);
          End;
        If EditStateAcc.Text<>'' Then
          Begin
            FieldByName('LOCAL').AsFloat := getFloat(EditLocal.Text);
            FieldByName('LOCAL_ACCOUNT').AsInteger := StrToInt(EditLocalAcc.Text);
          End;
        If EditPenAcc.Text<>'' Then
          Begin
            FieldByName('PENSION').AsFloat := getFloat(EditPen.Text);
            FieldByName('PENSION_ACCOUNT').AsInteger := StrToInt(EditPenAcc.Text);
          End;
        If (EditDed1Amt.Text<>'') and (CkBoxDed1.Checked) and (DataMod.TableSpecial.Fields[0].AsVariant <> null)Then
          begin
            FieldByName('DEDUCT1').AsFloat := getFloat(EditDed1Amt.Text);
            FieldByName('DEDUCT1_ACC').AsInteger := DataMod.TableSpecial.Fields[0].AsInteger;
          end
        else
          begin
            FieldByName('DEDUCT1').AsFloat := 0.0;
            FieldByName('DEDUCT1_ACC').AsInteger := 0;
          end;
        If (EditDed2Amt.Text<>'') and (CkBoxDed2.Checked) and (DataMod.TableSpecial.Fields[1].AsVariant <> null) Then
          begin
            FieldByName('DEDUCT2').AsFloat := getFloat(EditDed2Amt.Text);
            FieldByName('DEDUCT2_ACC').AsInteger := DataMod.TableSpecial.Fields[1].AsInteger;
          end
        else
          begin
            FieldByName('DEDUCT2').AsFloat := 0.0;
            FieldByName('DEDUCT2_ACC').AsInteger := 0;
          end;
        If (EditDed3Amt.Text<>'') and (CkBoxDed3.Checked) and (DataMod.TableSpecial.Fields[2].AsVariant <> null)  then
          begin
            FieldByName('DEDUCT3').AsFloat := getFloat(EditDed3Amt.Text);
            FieldByName('DEDUCT3_ACC').AsInteger := DataMod.TableSpecial.Fields[3].AsInteger;
          end
        else
          begin
            FieldByName('DEDUCT3').AsFloat := 0.0;
            FieldByName('DEDUCT3_ACC').AsInteger := 0;
          end;
        If (EditDed4Amt.Text<>'') and (CkBoxDed4.Checked) and (DataMod.TableSpecial.Fields[3].AsVariant <> null) then
          begin
            FieldByName('DEDUCT4').AsFloat := getFloat(EditDed4Amt.Text);
            FieldByName('DEDUCT4_ACC').AsInteger := DataMod.TableSpecial.Fields[3].AsInteger;
          end
          else
          begin
            FieldByName('DEDUCT4').AsFloat := 0.0;
            FieldByName('DEDUCT4_ACC').AsInteger := 0;
          end;
        If (EditDed5Amt.Text<>'') and (CkBoxDed5.Checked) and (DataMod.TableSpecial.Fields[4].AsVariant <> null) then
          begin
            FieldByName('DEDUCT5').AsFloat := getFloat(EditDed5Amt.Text);
            FieldByName('DEDUCT5_ACC').AsInteger := DataMod.TableSpecial.Fields[4].AsInteger;
          end
        else
          begin
            FieldByName('DEDUCT5').AsFloat := 0.0;
            FieldByName('DEDUCT5_ACC').AsInteger := 0;
          end;
        Post;
      End;
  Except
    ShowMessage('Could not post, check your entries');
    DataMod.ZTblPay.Cancel;
    DataMod.SQLTransactionEZ.Rollback;
    OpenTables;
  end;
end;

Procedure TFormSetup.BtnPayClrClick(Sender: TObject);
Begin
  EditName.Text := '';
  EditSocNo.Text := '';
  EditWage.Text := '';
  EditWageAcc.Text := '';
  EditFIT.Text := '';
  EditFITAcc.Text := '';
  EditFICA.Text := '';
  EditFICAAcc.Text := '';
  EditMed.Text := '';
  EditMedAcc.Text := '';
  EditState.Text := '';
  EditStateAcc.Text := '';
  EditLocal.Text := '';
  EditLocalAcc.Text := '';
  EditPen.Text := '';
  EditPenAcc.Text := '';
  EditDed1Amt.Text := '';
  EditDed2Amt.Text := '';
  EditDed3Amt.Text := '';
  EditDed4Amt.Text := '';
  EditDed5Amt.Text := '';
  CkBoxDed1.Checked := false;
  CkBoxDed2.Checked := false;
  CkBoxDed3.Checked := false;
  CkBoxDed4.Checked := false;
  CkBoxDed5.Checked := false;
  ComboAcc.Text := '';
End;

Procedure TFormSetup.FillCheck;
Begin
  With DataMod.ZTblXY Do
    Begin
      ScriptX.Text := FieldByName('SCRIPTX').AsString;
      ScriptY.Text := FieldByName('SCRIPTY').AsString;
      PayX.Text := FieldByName('PAYX').AsString;
      PayY.Text := FieldByName('PAYY').AsString;
      DateX.Text := FieldByName('DATEX').AsString;
      DateY.Text := FieldByName('DATEY').AsString;
      AmountX.Text := FieldByName('AMOUNTX').AsString;
      AmountY.Text := FieldByName('AMOUNTY').AsString;
      MemoX.Text := FieldByName('MEMOX').AsString;
      MemoY.Text := FieldByName('MEMOY').AsString;
      DUPY.Text := FieldByName('DUPY').AsString;
      ACCOUNTY.Text := FieldByName('ACCOUNTY').AsString;
    End;
End;

Procedure TFormSetup.FillPayGrid(SocNo: String);
Begin
  With DataMod.ZTblPay Do
    Begin
      close;
      Params[0].AsString := SocNo;
      open;
      EditName.Text := FieldByName('NAME').AsString;
      EditSocNo.Text := FieldByName('SOC_SEC_NO').AsString;
      EditWage.Text := toFloat(FieldByName('WAGE').AsString);
      EditWageAcc.Text := FieldByName('WAGE_ACCOUNT').AsString;
      EditFIT.Text := toFloat(FieldByName('FED').AsString);
      EditFITAcc.Text := FieldByName('FED_ACCOUNT').AsString;
      EditFICA.Text := toFloat(FieldByName('FICA').AsString);
      EditFICAAcc.Text := FieldByName('FICA_ACCOUNT').AsString;
      EditMed.Text := toFloat(FieldByName('MED').AsString);
      EditMedAcc.Text := FieldByName('MED_ACCOUNT').AsString;
      EditState.Text := toFloat(FieldByName('STATE').AsString);
      EditStateAcc.Text := FieldByName('STATE_ACCOUNT').AsString;
      EditLocal.Text := toFloat(FieldByName('LOCAL').AsString);
      EditLocalAcc.Text := FieldByName('LOCAL_ACCOUNT').AsString;
      EditPen.Text := toFloat(FieldByName('PENSION').AsString);
      EditPenAcc.Text := FieldByName('PENSION_ACCOUNT').AsString;
      EditDed1Amt.Text := toFloat(FieldByName('DEDUCT1').AsString);
      EditDed2Amt.Text := toFloat(FieldByName('DEDUCT2').AsString);
      EditDed3Amt.Text := toFloat(FieldByName('DEDUCT3').AsString);
      EditDed4Amt.Text := toFloat(FieldByName('DEDUCT4').AsString);
      EditDed5Amt.Text := toFloat(FieldByName('DEDUCT5').AsString);
    End;
End;

Function TFormSetup.toFloat(FStr: String): String;
Begin
  Result := FStr;
  If (FStr='') Or (FStr='0') Then
    Begin
      Result := ''
    End
  Else
    If pos('.',FStr)<=0 Then
      Begin
        Result := FStr+'.0'
      End
  Else
    Begin
      Result := FStr
    End;
End;

Function TFormSetup.TwoYears: TDateTime;

Var 
  Day,Month,Year: Word;
Begin
  DecodeDate(Date,Year,Month,Day);
  Result := EncodeDate(Year-3,12,31)+1.0;
End;

Procedure TFormSetup.BtnDelOldClick(Sender: TObject);

Var 
  DelPast: TDateTime;
Begin
  DelPast := TwoYears;
  If MessageDlg('OK to delete checks and contributions older than '+DateToStr(DelPast)+' ?',
     mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
    Begin
      exit
    End;
  Try
    Screen.Cursor := crHourGlass;
    With DataMod.ZTblBal Do
      Begin
        Edit;
        FieldByName('BEGBALANCE').AsFloat := StrToFloat(EditNewBal.Text);
        Post;
        Close;
        Open;
      End;
  Except
    ShowMessage('Could not change beginning balance.');
    exit;
End;
Try
 // AccData.StartTransaction;
  With DataMod.ZQueryDelOldChk Do
    Begin
      Close;
      Params[0].AsDate := DelPast;
      ExecSQL;
    End;
  With DataMod.ZQueryDelOldCont Do
    Begin
      Close;
      Params[0].AsDate := DelPast;
      ExecSQL;
    End;
  With DataMod.ZQueryDelOldDP Do
    Begin
      Close;
      Params[0].AsDate := DelPast;
      ExecSQL;
    End;
  DataMod.SQLTransactionEZ.Commit;
Except
  DataMod.SQLTransactionEZ.Rollback;
  Screen.Cursor := crDefault;
  ShowMessage('Could not delete data, check your entries.');
End;
BtnCalClick(Sender as TObject);
Screen.Cursor := crDefault;
ShowMessage('Old data is now deleted');
End;

Procedure TFormSetup.BtnCalClick(Sender: TObject);

Var 
  DelPast: TDateTime;
  ContSum,CheckSum,DPSum,OldBal,NewBal: Double;
Begin
  Try
    Screen.Cursor := crHourGlass;
    DelPast := TwoYears;
    With DataMod.ZQuerySumOldChk Do
      Begin
        Close;
        Params[0].AsDate := DelPast;
        Open;
        CheckSum := Fields[0].AsFloat;
      End;
    With DataMod.ZQuerySumOldCont Do
      Begin
        Close;
        Params[0].AsDate := DelPast;
        Open;
        ContSum := Fields[0].AsFloat;
      End;
    With DataMod.ZQuerySumOldDP Do
      Begin
        Close;
        Params[0].AsDate := DelPast;
        Open;
        DPSum := Fields[0].AsFloat;
      End;
    EditOldCheck.Text := FormatFloat('0.00',CheckSum);
    EditOldCont.Text := FormatFloat('0.00',ContSum);
    EditOldDP.Text := FormatFloat('0.00',DPSum);
    OldBal := DataMod.ZTblBal.FieldByName('BegBalance').AsFloat;
    EditOldBal.Text := FormatFloat('0.00',OldBal);
    NewBal := OldBal+ContSum-CheckSum+DPSum;
    EditNewBal.Text := FormatFloat('0.00',NewBal);
  Finally
    Screen.Cursor := crDefault;
End;
End;


Procedure TFormSetup.FormClose(Sender: TObject);
Var
  IDX: Integer;
Begin
End;


procedure TFormSetup.DisplayReportPage(RPrinter: TReportPrinterClass; Page: Integer);
var
  CurPage: TImage;
begin
  with RPrinter do
    begin
      CurPage:= PageArray[Page];
      if CurPage <> nil then
         begin
          ShowReport;
          CurPage.BringToFront;
         end;
    end;
end;

procedure TFormSetup.ReportFinances;
var
 Done: Boolean;
 FName: String;
begin
  ReportBeforePrint;
  ReportSetup;
  ReportTitle;
  ReportPrintGroup(Done);
  doLastPage;

  RPrinter.EndPage;
  With RPrinter do
    begin
      DisplayReportPage(RPrinter, 1);
     // NewPage;
     end;
end;


procedure TFormSetup.ReportBeforePrint;
begin
 // MyNewPage:=True;
  ZeroGroup;
  zeroYear;
  RPRinter.Landscape:=false;
  RPrinter.NewPage;
end;


procedure TFormSetup.ReportTitle;
var
  ChurchName: String;
begin
  With RPrinter do
    begin
      ChurchName := StripRight(DataMod.TableChurch.FieldByName('NAME').AsString);
      Bold:=True;
      RestoreFont(1);
      CurrentY := 0.15;
      PageNo := 1;
      //report Title
      PrintCenterPage(ChurchName);
      RestoreFont(2);
      Bold:=False;
      NewLine;
       PrintCenterPage('General Fund Report');
      PrintLeft(MonthBox.Text+'-'+EditYear.Text,6.0);
      If PageNo>1 then
      PrintXY(7.25,0.05,'Page '+IntToStr(PageNo));
      NewLine;
      NewLine;
     // MyNewPage:=True;
    end;
end;

procedure TFormSetup.ReportNewPage;
begin
  With RPrinter do
    begin
      EndPage;
      NewPage;
      RestoreFont(1);
      PageNo := PageNo + 1;
      If PageNo > 1 then
        begin
          PrintCenterPage('General Fund Report');
          PrintLeft(MonthBox.Text+' - '+EditYear.Text,5.0);
         end;
      PrintXY(7.25,0.05,'Page '+IntToStr(PageNo));
      Newline;
      NewLine;
    end;
end;


procedure TFormSetup.ReportSetup;
var
  TmpTab: PTab;
  BH10, BH12: Double;
begin
  DataMod.ZTblGroup.First;
  With RPrinter do
    begin
      SaveFontName(1, HELVETICA);
      SaveFontSize(1,12);
      SaveFontName(2, HELVETICA);
      SaveFontSize(1,10);
      SaveFontName(3, HELVETICA);
      SaveFontSize(3,12);
      SaveFontName(4, HELVETICA);
      SaveFontSize(4,10);
      SaveFontName(5, HELVETICA);
      SaveFontSize(4,10);
      //fLineToLine := round(fFont.FontSize * fLineScale);

    FreeTabs(1);  //Page Header
    TmpTab := NewTab(1, 4.0,JUSTIFYRIGHT,2.5,0.05, ABSOLUT, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0,JUSTIFYRIGHT,1.0,0.05,RELATIVE, BOXLINENONE,0);

    FreeTabs(2); //ToDate  Group Header
    TmpTab := NewTab(2, 0.2,JUSTIFYLEFT, 2.3,  0.05, ABSOLUT, BOXLINELEFT+BOXLINETOP,1);
    TmpTab := NewTab(2, 0.0,JUSTIFYRIGHT,0.9,  0.05, RELATIVE, BOXLINETOP,1);
    TmpTab := NewTab(2, 0.0,JUSTIFYRIGHT,0.9,  0.05, RELATIVE, BOXLINETOP,1);
    TmpTab := NewTab(2, 0.0,JUSTIFYRIGHT,0.9,  0.05, RELATIVE, BOXLINETOP,1);
    TmpTab := NewTab(2, 0.0,JUSTIFYRIGHT,0.9,  0.05, RELATIVE, BOXLINETOP,1);
    TmpTab := NewTab(2, 0.0,JUSTIFYRIGHT,1.3,  0.05 ,RELATIVE, BOXLINERIGHT+BOXLINETOP,1);

    FreeTabs(3); //Income/Spent   Group Header
    TmpTab := NewTab(3,0.2,JUSTIFYLEFT, 2.3,  0.05, ABSOLUT,BOXLINELEFT+BOXLINEBOTTOM,1);
    TmpTab := NewTab(3,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINEBOTTOM,1);
    TmpTab := NewTab(3,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINEBOTTOM,1);
    TmpTab := NewTab(3,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINEBOTTOM,1);
    TmpTab := NewTab(3,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINEBOTTOM,1);
    TmpTab := NewTab(3,0.0,JUSTIFYRIGHT,1.3,  0.05,RELATIVE,BOXLINERIGHT+BOXLINEBOTTOM,1);


    FreeTabs(4); //Figures   Funds
    TmpTab := NewTab(4,0.2,JUSTIFYLEFT, 2.3,  0.05,ABSOLUT,BOXLINENONE,0);
    TmpTab := NewTab(4,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINENONE,0);
    TmpTab := NewTab(4,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINENONE,0);
    TmpTab := NewTab(4,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINENONE,0);
    TmpTab := NewTab(4,0.0,JUSTIFYRIGHT,0.9,  0.05,RELATIVE,BOXLINENONE,0);
    TmpTab := NewTab(4,0.0,JUSTIFYRIGHT,1.3,  0.05,RELATIVE,BOXLINENONE,0);


    FreeTabs(5); //Sums
    TmpTab := NewTab(5,0.2,JUSTIFYLEFT,  2.3, 0.05,ABSOLUT,BOXLINEALL,2);    //****
    TmpTab := NewTab(5,2.6,JUSTIFYRIGHT, 0.8, 0.05,ABSOLUT,BOXLINEALL,2);
    TmpTab := NewTab(5,3.5,JUSTIFYRIGHT, 0.8, 0.05,ABSOLUT,BOXLINEALL,2);
    TmpTab := NewTab(5,4.4,JUSTIFYRIGHT, 0.8, 0.05,ABSOLUT,BOXLINEALL,2);
    TmpTab := NewTab(5,5.3,JUSTIFYRIGHT, 0.8, 0.05,ABSOLUT,BOXLINEALL,2);
    TmpTab := NewTab(5,6.2,JUSTIFYRIGHT, 1.2, 0.05,ABSOLUT,BOXLINEALL,2);

    BH10 := PointToInch(Round(10*LineScale));
    BH12 := PointToInch(Round(12* LineScale));
    setTabBoxHeight(1,BH12);
    setTabBoxHeight(2,BH12);
    setTabBoxHeight(3,BH12);
    setTabBoxHeight(4,BH12);
    setTabBoxHeight(5,BH12);
    setPageMargins(0.5, 0.25, 0.5, 0.5);
  end; //with

end;


procedure TFormSetup.ReportPrintGroup(var Done: Boolean);
var
  Group, NumRows, Jnk: Integer;
  GroupDesc: String;
begin
  With DataMod.ZTblGroup do
    begin
      if not Active then Open;
      First;
      While not EOF do
        begin
           Group := FieldByName('GROUP_NO').AsInteger;
           GroupDesc := FieldByName('DESCRIPTION').AsString;
           NumRows := ReportRowNumLines(Group);
           If (NumRows > (RPrinter.LinesLeft(0.35) - 3)) then
             ReportNewPage;
           doGroupHeader(GroupDesc);
           ReportPrintRow(Done);
           Next;
           Done := EOF;
        end;
    end;
end;

procedure TFormSetup.doGroupHeader(Group: String);
var
    BH10, BH12: Double;
begin
  With RPrinter do
    begin
      NewLine;

      PrintTab(2,'');
      PrintTab(2,'');
      PrintTab(2,'');
      PrintTab(2,'ToDate');
      PrintTab(2,'ToDate');
      PrintTab(2,EditYear.Text);
      //NewLine;

      Bold:=True;
      PrintTab(3,Group);
      Bold:=False;
      PrintTab(3,'Income');
      PrintTab(3,'Spent');
      PrintTab(3,'Income');
      PrintTab(3,'Spent');
      PrintTab(3,'Budget');
   end; //With ReportPrinter
end;


procedure TFormSetup.doLastpage;
var
  TmpTab: PTab;
  BH10, BH12: Double;
begin
  With RPrinter do
    begin
      If LinesLeft(0.3) < 4 then ReportNewPage;
      doGroupHeader('Direct Post');
      ReportDP;
      NewLine;
      Bold:=True;
      PrintTab(5, 'Total = ');
      PrintTab(5, FormatFloat('0.00',DPTotalMonthIncome));
      PrintTab(5, FormatFloat('0.00',DPTotalMonthSpent));
      PrintTab(5, FormatFloat('0.00',DPTotalYearIncome));
      PrintTab(5, FormatFloat('0.00',DPTotalYearSpent));
      PrintTab(5, FormatFloat('0.00',0.0));
      BH10 := PointToInch(Round(10*LineScale));
      BH12 := PointToInch(Round(12*LineScale));
      setTabBoxHeight(5,BH12);
      TotalMonthIncome:=TotalMonthIncome+DPTotalMonthIncome;
      TotalMonthSpent:=TotalMonthSpent+DPTotalMonthSpent;
      TotalYearIncome:=TotalYearIncome+DPTotalYearIncome;
      TotalYearSpent:=TotalYearSpent+DPTotalYearSpent;

      Bold:=False;
      If LinesLeft(0.3) < 4 then ReportNewPage;
      doGroupHeader('Total Income & Expense');
      TabNewLine(5);
      Bold:=True;
      PrintTab(5, 'Total = ');
      PrintTab(5, FormatFloat('0.00',TotalMonthIncome));
      PrintTab(5, FormatFloat('0.00',TotalMonthSpent));
      PrintTab(5, FormatFloat('0.00',TotalYearIncome));
      PrintTab(5, FormatFloat('0.00',TotalYearSpent));
      PrintTab(5, FormatFloat('0.00',TotalYearBudget));

      //TabNewLine(9);
      CalcBalance;
      FreeTabs(9);
      TmpTab := NewTab(9 ,0.20,JUSTIFYLEFT,2.35,0.05,ABSOLUT,BOXLINEALL,5);
      TmpTab := NewTab(9, 2.6,JUSTIFYRIGHT,1.1,0.05, ABSOLUT,BOXLINEALL,5);
      TmpTab := NewTab(9, 3.75,JUSTIFYLEFT,2.35,0.05,ABSOLUT,BOXLINEALL,5);
      TmpTab := NewTab(9, 6.2,JUSTIFYRIGHT,1.2,0.05, ABSOLUT,BOXLINEALL,5);
      setTabBoxHeight(9,BH12);
      NewLine;
      If LinesLeft(0.3) < 2 then ReportNewPage;
      //TabNewLine(9);
      PrintTab(9,'Beginning Balance = ');
      PrintTab(9, FormatFloat('0.00',BBalance));
      PrintTab(9,'Ending Balance = ');
      PrintTab(9, FormatFloat('0.00',EBalance));
      PrintLiability;
  end;
end;

procedure TFormSetup.AccountBodyHeader;
begin
   With RPrinter do
     begin
       if (LinesLeft(0.3)<DataMod.ZQueryAccounts.RecordCount+8) then
          ReportNewPage;
      // doNewHeader(DataMod.ZTblGroup.FieldByname('Description').asString);
   end;
end;

function  TFormSetup.ReportRowNumLines(Group: Integer): Integer;
begin
   With DataMod.ZQueryAccounts do
    begin
      Close;
      Params[0].AsInteger:=Group;
      Open;
      First;
      Result := RecordCount;
    end;
end;

procedure TFormSetup.ReportPrintRow(var Done: Boolean);
var
  Income,Spent,IncToDate,SpToDate,Budget: Double;
  Account: Integer;
  Jnk: String;
begin
  Done := DataMod.ZQueryAccounts.EOF;  //Depends upon print group setting the query
  while not Done do
      With RPrinter do
        begin
          Account:=DataMod.ZQueryAccounts.FieldByName('Account').AsInteger;
          Budget:=DataMod.ZQueryAccounts.FieldByName('BUDGET').AsFloat;
          With DataMod.ZQuerySumCont do
            begin
              Close;
              Params[0].AsInteger:=Account;
              Params[1].AsDateTime:=YearStart;
              Params[2].AsDateTime:=MonthEnd;
              Open;
              IncToDate:=Fields[0].AsFloat;
              Close;
              Params[1].AsDateTime:=MonthStart;
              Open;
              Income:=Fields[0].asFloat;
            end;
           With DataMod.ZQuerySumTrans do
             begin
               Close;
               Params[0].AsInteger:=Account;
               Params[1].AsDateTime:=YearStart;
               Params[2].AsDateTime:=MonthEnd;
               Params[3].AsInteger:=EXPENSE;
               Open;
               SpToDate:=Fields[0].AsFloat;
               Close;
               Params[1].AsDateTime:=MonthStart;
               Open;
               Spent:=Fields[0].asFloat;
             end;
          //NewLine;    auto NewLine at last tab

          PrintTab(4,DataMod.ZQueryAccounts.FieldByName('Name').asString);
          PrintTab(4,FormatFloat('0.00',Income));
          PrintTab(4,FormatFloat('0.00',Spent));
          PrintTab(4,FormatFloat('0.00',IncToDate));
          PrintTab(4,FormatFloat('0.00',SpToDate));
          PrintTab(4,FormatFloat('0.00',Budget));

          GroupIncome:=GroupIncome+Income;
          TotalMonthIncome:=TotalMonthIncome+Income;
          GroupSpent:=GroupSpent+Spent;
          TotalMonthSpent:=TotalMonthSpent+Spent;
          GroupYearIncome:=GroupYearIncome+IncToDate;
          GroupYearSpent:=GroupYearSpent+SpToDate;
          TotalYearIncome:=TotalYearIncome+IncToDate;
          TotalYearSpent:=TotalYearSpent+SpToDate;
          GroupBudget:=GroupBudget+Budget;
          TotalYearBudget:=TotalYearBudget+Budget;
          DataMod.ZQueryAccounts.Next;
          Done := DataMod.ZQueryAccounts.EOF;
        end; // with RPrinter
  If Done then ReportAfterRow;
    //If DataMod.ZTblGroup.EOF then
    //   doLastPage(ReportPrinter);
end;


procedure TFormSetup.ReportAfterRow;
begin
  With RPrinter do
    begin
     // NewLine;
      Bold:=True;
      PrintTab(5,'Total = ');
      PrintTab(5,FormatFloat('0.00',GroupIncome));
      PrintTab(5,FormatFloat('0.00',GroupSpent));
      PrintTab(5,FormatFloat('0.00',GroupYearIncome));
      PrintTab(5,FormatFloat('0.00',GroupYearSpent));
      PrintTab(5,FormatFloat('0.00',GroupBudget));
      Bold:=False;
      ZeroGroup;
   end;
end;

Procedure TFormSetup.ZeroGroup;
Begin
  GroupIncome :=      0.0;
  GroupSpent :=       0.0;
  GroupYearIncome :=  0.0;
  GroupYearSpent :=   0.0;
  GroupBudget :=      0.0;
End;

Procedure TFormSetup.zeroYear;
Begin
  TotalMonthIncome := 0.0;
  TotalMonthSpent :=  0.0;
  TotalYearIncome := 0.0;
  TotalYearSpent := 0.0;
  TotalYearBudget := 0.0;
End;


Function TFormSetup.BegMonth(Year,Mnth: Word): TDateTime;
Begin
  Result := EncodeDate(Year,Mnth,1);
End;

Function TFormSetup.EndMonth(Year,Mnth: Word): TDateTime;

Var 
  TmpMonth: Word;
Begin
  TmpMonth := Mnth;
  If Mnth=12 Then
    Begin
      TmpMonth := 1;
      Year := Year+1;
    End
  Else
    Begin
      TmpMonth := Mnth+1
    End;
  Result := EncodeDate(Year,TmpMonth,1)-1;
End;

Function TFormSetup.GetMonth: Word;

Var 
  Year,Month,Day: Word;
Begin
  DecodeDate(Date,Year,Month,Year);
  Result := Month;
End;

Procedure TFormSetup.BtnReportClick(Sender: TObject);

Var 
  Month,Year: Word;
Begin
  Try
    RepYear := StrToInt(EditYear.Text);
    Year := RepYear;
    RepMonth := MonthBox.ItemIndex;
    If RepMonth<1 Then
      Begin
        Month := 1
      End
    Else
      If RepMonth>12 Then
        Begin
          Month := 12
        End
    Else
      Begin
        Month := RepMonth
      End;
    YearStart := EncodeDate(Year,1,1);
    MonthStart := BegMonth(Year,Month);
    MonthEnd := EndMonth(Year,Month);

    ReportFinances;
  Except
    ShowMessage('Report failed, check entries for year and month.');
End;
End;



Function TFormSetup.SumContrib(BDate,EDate: TDateTime): Double;
Begin
  With DataMod.ZQueryTotalCont Do
    Begin
      Close;
      Params[0].AsDateTime := BDate;
      Params[1].AsDateTime := EDate;
      Open;
      Result := Fields[0].AsFloat;
    End;
End;

Function TFormSetup.SumTrans(BDate,EDate: TDateTime): Double;
Begin
  With DataMod.ZQueryTotalTrans Do
    Begin
      Params[1].AsDateTime := BDate;
      Params[2].AsDateTime := EDate;
      Params[3].asInteger := EXPENSE;
      Open;
      Result := Fields[0].AsFloat;
    End;
End;

Function TFormSetup.SumDirPost(BDate,EDate: TDateTime): Double;
Begin
  With DataMod.ZQueryTotalDP Do
    Begin
      Close;
      Params[0].AsDateTime := BDate;
      Params[1].AsDateTime := EDate;
      Open;
      Result := Fields[0].AsFloat;
    End;
End;

Function TFormSetup.BegLastMonth(Year,Month: Word): TDateTime;

Var 
  TmpYear,TmpMonth: Word;
Begin
  If Month<=1 Then
    Begin
      TmpMonth := 12;
      TmpYear := Year-1;
    End
  Else
    Begin
      TmpYear := Year;
      TmpMonth := Month-1;
    End;
  Result := EncodeDate(Year,Month,1);
End;

Procedure TFormSetup.ReportDP;

Var 
  BDate,EDate: TDateTime;
Begin
  With DataMod.ZQueryPlusDP Do
    Begin
      Close;
      Params[0].AsDateTime := BegMonth(RepYear,1);
      Params[1].AsDateTime := EndMonth(RepYear,RepMonth);
      Open;
      DPTotalYearIncome := Fields[0].AsFloat;
      Close;
      Params[0].AsDateTime := BegMonth(RepYear,RepMonth);
      Open;
      DPTotalMonthIncome := Fields[0].AsFloat;
    End;
  With DataMod.ZQueryNegDP Do
    Begin
      Close;
      Params[0].AsDateTime := BegMonth(RepYear,1);
      Params[1].AsDateTime := EndMonth(RepYear,RepMonth);
      Open;
      DPTotalYearSpent := -Fields[0].AsFloat;
      Close;
      Params[0].AsDateTime := BegMonth(RepYear,RepMonth);
      Open;
      DPTotalMonthSpent := -Fields[0].AsFloat;
    End;
End;

Procedure TFormSetup.CalcBalance;

Var 
  DPSumLast,DPSum: Double;
  ContSumLast,ContSum: Double;
  TranSumLast,TranSum: Double;
  BegBal: Double;
Begin
  With DataMod.ZQueryTotalDP Do
    Begin
      Close;
      Params[0].AsDateTime := BegOfTime;
      Params[1].AsDateTime := BegMonth(RepYear,RepMonth)-1;
      Open;
      DPSumLast := Fields[0].AsFloat;
      Close;
      Params[0].AsDateTime := EndMonth(RepYear,RepMonth);
      Open;
      DPSum := Fields[0].AsFloat;
    End;
  With DataMod.ZQueryTotalCont Do
    Begin
      Close;
      Params[0].AsDateTime := BegOfTime;
      Params[1].AsDateTime := BegMonth(RepYear,RepMonth)-1;
      Open;
      ContSumLast := Fields[0].AsFloat;
      Close;
      Params[0].AsDateTime := EndMonth(RepYear,RepMonth);
      Open;
      ContSum := Fields[0].AsFloat;
    End;
  With DataMod.ZQueryTotalTrans Do
    Begin
      Close;
      Params[0].AsDateTime := BegOfTime;
      Params[1].AsDateTime := BegMonth(RepYear,RepMonth)-1;
      Params[2].AsInteger := 0;
      Open;
      TranSumLast := Fields[0].AsFloat;
      Close;
      Params[1].AsDateTime := EndMonth(RepYear,RepMonth);
      Open;
      TranSum := Fields[0].AsFloat;
    End;
  DataMod.ZTblBalance.First;
  BegBal := DataMod.ZTblBalance.FieldByName('BEGBALANCE').AsFloat;
  BBalance := BegBal+ContSumLast+DPSumLast-TranSumLast;
  EBalance := BegBal+ContSum+DPSum-TranSum;
End;

Procedure TFormSetup.GridFundsDrawDataCell(Sender: TObject; Const Rect: TRect;
                                           Field: TField; State: TGridDrawState);

Var 
  R: TRect;
  TmpStr: String;
  TmpAcc: Integer;
Begin
  With  GridFunds, Canvas Do
    Begin
      R := Rect;
      If (Field.FieldName='AccDescription') Then
        Begin
          TmpAcc := DataMod.ZTblFunds.FieldByName('ACCOUNT').AsInteger;
          If TmpAcc>=10000 Then
            Begin
              TmpStr := 'Not in General Fund'
            End
          Else
            Begin
              With DataMod.ZQueryAccName Do
                Begin
                  close;
                  params[0].AsInteger := TmpAcc;
                  open;
                  TmpStr := FieldByName('NAME').AsString;
                End
            End;
          TextRect(R,R.Left,R.Top,' '+TmpStr);
        End;
    End;
End;



Procedure TFormSetup.printLiability;
Var
  Account: Integer;
  NegTotal,PosTotal,Total,Amount, BH10, BH12: Double;
  TmpTab: PTab;
Begin

 PosTotal:=0.0;NegTotal:=0.0;
  DataMod.ZQueryLiab.Open;
  DataMod.ZQueryLiab.First;
   With RPrinter do
    begin
      If LinesLeft(0.3) < (DataMod.ZQueryLiab.RecordCount + 4) then ReportNewPage;
      //NewLine;
      NewLine;
      freetabs(5);
      TmpTab := NewTab(5,0.2,JUSTIFYLEFT,2.5,0.05,ABSOLUT, BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,3);
      TmpTab := NewTab(5,0.0,JUSTIFYRIGHT,1.0,0.05,RELATIVE, BOXLINETOP+BOXLINEBOTTOM,3);
      TmpTab := NewTab(5,0.0,JUSTIFYRIGHT,1.0,0.05,RELATIVE, BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,3);
      BH10 := PointToInch(Round(10*LineScale));
      BH12 := PointToInch(Round(12*LineScale));
      setTabBoxHeight(5,BH12);
      Bold:=True;
      PrintTab(5,'Liability Accounts');
      Bold:=False;
      PrintTab(5,'OverPaid');
      PrintTab(5,'Owed');

      Bold:=False;
      ResetTab(4);
      With DataMod.ZQueryLiab do
        While not EOF do
           begin
             Amount:=getLiability(FieldByName('ACCOUNT').AsInteger);
             PrintTab(4,FieldByName('NAME').AsString);
             If Amount>=0 then
               begin
                 PosTotal:=PosTotal+Amount;
                 PrintTab(4,FormatFloat('0.00',Amount));
                 PrintTab(4,' ');
               end
             else
               begin
                 NegTotal:=NegTotal+Amount;
                 PrintTab(4,' ');
                 PrintTab(4,'('+copy(FormatFloat('0.00',Amount),2,10)+')');
               end;
             PrintTab(4,' ');
             PrintTab(4,' ');
             PrintTab(4,' ');
            // NewLine;
             Next;
          end;
      freetabs(5);
      TmpTab := NewTab(5,0.2,JUSTIFYLEFT,2.25,0.05,ABSOLUT, BOXLINEALL,3);
      TmpTab := NewTab(5,2.85,JUSTIFYRIGHT,0.9,0.05,ABSOLUT, BOXLINEALL,3);
      TmpTab := NewTab(5,3.85,JUSTIFYRIGHT,0.9,0.05,ABSOLUT, BOXLINEALL,3);
      TmpTab := NewTab(5,6.20,JUSTIFYRIGHT,1.2,0.05,ABSOLUT,BOXLINEALL,3);
      BH10 := PointToInch(Round(10*LineScale));
      setTabBoxHeight(5,BH12);
      Total:=PosTotal+NegTotal;
      Bold:=True;
      PrintTab(5,'Total ');
      PrintTab(5,FormatFloat('0.00',PosTotal));
      PrintTab(5,'('+copy(FormatFloat('0.00',NegTotal),2,10)+')');
      If Total>=0.0 then
        PrintTab(5,FormatFloat('0.00',Total))
      else
        PrintTab(5,'('+copy(FormatFloat('0.00',Total),2,10)+')');

      Total:=Total+EBalance;

      FreeTabs(8);
      NewLine;
      TmpTab := NewTab(8,0.25,JUSTIFYLEFT,4.70,0.05,ABSOLUT, BOXLINEALL,4);
      TmpTab := NewTab(8,6.20,JUSTIFYRIGHT,1.2,0.05,ABSOLUT,BOXLINEALL,4);
      setTabBoxHeight(8,BH12);
      PrintTab(8, 'Ending Balance including liabilities');
      If Total>=0.0 then
        PrintTab(8,FormatFloat('0.00',Total))
      else
        PrintTab(8,'('+copy(FormatFloat('0.00',Total),2,10)+')');
    end;
End;

procedure TFormSetup.Button1Click(Sender: TObject);
begin
  With DataMod.ZQueryAccounts do
    begin
      close;
     // params[0].AsInteger:=StrToInt(EditChName.Text);
      open;
    end;
end;


procedure TFormSetup.UpdateChurchEdits;
begin
  With DataMod.TableChurch do
    begin
      if not Active then open;
      EditChName.Text := FieldByName('NAME').AsString;
      EditChAdd1.Text := FieldByName('ADDRESS_1').AsString;
      EditChAdd2.Text := FieldByName('ADDRESS_2').AsString;
      EditChCity.Text := FieldByName('CITY').AsString;
      EditChState.Text := FieldByName('STATE').AsString;
      EditChZip.Text := FieldByName('ZIP').AsString;
      EditChPhone.Text := FieldByName('PHONE').AsString;
    end;
end;

procedure TFormSetup.DBEditPostChange(Sender: TObject);
begin
  With DataMod.TableChurch do
    begin
      if not Active then open;
      Edit;
      FieldByName('NAME').AsString := EditChName.Text;
      FieldByName('ADDRESS_1').AsString := EditChAdd1.Text;
      FieldByName('ADDRESS_2').AsString := EditChAdd2.Text;
      FieldByName('CITY').AsString := EditChCity.Text;
      FieldByName('STATE').AsString := EditChState.Text;
      FieldByName('ZIP').AsString := EditChZip.Text;
      FieldByName('PHONE').AsString := EditChPhone.Text;
      Post;
      ApplyUpdates;
      DataMod.SQLTransactionEZ.commit;
      UpdateChurchEdits;
    end;
end;

procedure TFormSetup.GridFundGroupsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TFormSetup.GridGroupDblClick(Sender: TObject);
begin

end;


procedure TFormSetup.ToolButton1Click(Sender: TObject);
begin

end;


procedure TFormSetup.EditFICAEnter(Sender: TObject);
begin
  PayrollWhite;
  EditFICA.Color := clAqua;
end;

procedure TFormSetup.EditFITEnter(Sender: TObject);
begin
   PayrollWhite;
   EditFIT.Color := clAqua;
end;

procedure TFormSetup.EditLocalEnter(Sender: TObject);
begin
   PayrollWhite;
  EditLocal.Color := clAqua;
end;

procedure TFormSetup.EditMedEnter(Sender: TObject);
begin
  PayrollWhite;
  EditMed.Color := clAqua;
end;

procedure TFormSetup.EditPenEnter(Sender: TObject);
begin
  PayrollWhite;
  EditPen.Color := clAqua;
end;

procedure TFormSetup.EditStateEnter(Sender: TObject);
begin
  PayrollWhite;
  EditState.Color := clAqua;
end;

procedure TFormSetup.EditWageEnter(Sender: TObject);
begin
  PayrollWhite;
  EditWage.Color := clAqua;
end;

procedure TFormSetup.PayGridCellClick(Column: TColumn);
begin
  FillPayGrid(DataMod.PaySrc.DataSet.FieldByName('SOC_SEC_NO').AsString);
end;

function TFormSetup.getFloat(S: String): Double;
begin
  try
    if S = '' then
      result := 0.0
    else
      result := StrToFloat(S);
    except
      result := 0.0;
    end;
end;

procedure TFormSetup.PrintGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  Var
  R: TRect;
  TmpStr: String;
Begin
  If RadioPrint.ItemIndex<>1 Then
    Begin
      exit
    End;
  With  PrintGrid, Canvas Do
    Begin
      R := Rect;
      If (Column.Field.FieldName='ACC_TYPE') Then
        Begin
          If (Column.Field.AsInteger>0) And (Column.Field.AsInteger<=20) Then
            Begin
              TmpStr := getType(Column.Field.AsInteger-1);
              //EditChAdd1.Text:=TmpStr;
            End
          Else
            Begin
              TmpStr := 'Unknown'
            End;
          FillRect(R);
          TextRect(R,R.Left,R.Top,TmpStr+'  ');
        End
      Else
        If (Column.Field.FieldName='BUDGET') Then
          Begin
            TmpStr := AddDecimalPoint(Column.Field.AsString);
            FillRect(R);
            TextRect(R,R.Left,R.Top,'  '+TmpStr);
          End
      Else
        If (Column.Field.FieldName='GROUP_NO') Then
          Begin
            Column.Width := 200;
            Column.Field.Alignment:=taLeftJustify;
            TmpStr := getGroupDesc(Column.Field.AsInteger);
            If TmpStr='' Then
              Begin
                TmpStr := Column.Field.AsString
              End;
             FillRect(R);
             TextRect(R,R.Left,R.Top,'  '+TmpStr);
          End
      Else
        If (Column.Field.FieldName='PAYROLL') Then
          Begin
            If (Column.Field.AsString<>'') Then
              Begin
                TmpStr := 'Payroll'
              End
            Else
              Begin
                TmpStr := ''
              End;
             FillRect(R);
             TextRect(R,R.Left,R.Top,' '+TmpStr);
          End;
    End;
end;


Function TFormSetup.getLiability(Account: Integer): Double;
Begin
  DataMod.ZQueryLiabOwe.Close;
  DataMod.ZQueryLiabPay.Close;
  DataMod.ZQueryLiabPay.Params[1].AsDateTime := EndMonth(RepYear,RepMonth);
  DataMod.ZQueryLiabOwe.Params[1].AsDateTime := EndMonth(RepYear,RepMonth);
  DataMod.ZQueryLiabPay.Params[0].AsInteger := Account;
  DataMod.ZQueryLiabOwe.Params[0].AsInteger := Account;
  DataMod.ZQueryLiabPay.Open;
  DataMod.ZQueryLiabOwe.Open;
  Result := DataMod.ZQueryLiabPay.Fields[0].AsFloat-DataMod.ZQueryLiabOwe.Fields[0].AsFloat;
End;

procedure TFormSetup.ShowContext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  hcontext: Integer;
  URL: String;
begin
  URL := 'file://'+HelpFN;
 // Label15.Caption:=TComponent(Sender).name;
 if (Button = mbRight) or (Button = mbLeft) then exit;
 CheckHelpOpen;
 hcontext:=TControl(Sender).HelpContext;
 If HForm <> nil then
    HForm.OpenUrl(Url,hContext);
end;


procedure TFormSetup.CheckHelpOpen;
begin
  if HForm <> nil then
    if not HForm.visible then
       HForm.visible := true;

  if HForm = nil then
       HForm := THelpForm.Create(Self);
  HForm.ShowOnTop;
end;

initialization
  {$i ezsetupunit.lrs}

End.

{ object TabSet1: TTabSet
    Left = 0
    Top = 356
    Width = 611
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      'Fund Groups'
      'Account Groups'
      'Accounts'
      'Funds'
      'Vendors'
      'View Payroll'
      'Edit Payroll'
      'Checks'
      'Print'
      'Year End'
      'Report'
    )
    TabIndex = 0
    OnChange = TabSet1Change
  end                }
