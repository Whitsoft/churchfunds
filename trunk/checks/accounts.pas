{Fix Xtra Check Feed when lot of accounts such as pay checks}
{Adjust Yoff based on number of accounts}
{Make a function to get a last name for search in view pay checks}
unit accounts;
{$mode objfpc}{$H+}
{$R accounts.lfm}

//{$R accounts.lfm}
//{$MODE Delphi}
interface

{UPDATE books
SET title = :title,
autor = :autor,
description = :description
WHERE id = :id}


uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, DBGrids, LResources, sqldb, DbCtrls, Types, Printers, IBConnection,
  db, Grids, Calendar, PrintersDlgs, StrUtils, unit30, cHelp, NewPSClass;

type
  PayInfo = record
    PCheckNo: Integer;
    PGross: Double;
    PNet: Double;
    PFed: Double;
    PFICA: Double;
    PMed: Double;
    PStait: Double;
    PLocal: Double;
    PPen: Double;
    PD1: Double;
    PD2: Double;
    PD3: Double;
    PD4: Double;
    PD5: Double;
    PHours: Double;
    PRate: Double;
    PYTDTotal: Double;
    PSocNo: String;
    PDate: String;
    PName: String;
  end;

   { TCheckForm }
type
  TCheckForm = class(TForm)
    AccCanBtn: TButton;
    AccPostBtn: TButton;
    AGroupChecks: TGroupBox;
    AGroupPayroll: TGroupBox;
    BtnChkDel: TButton;
    PayNameLUCB: TDBLookupComboBox;
    Label148: TLabel;
    Label93: TLabel;
    PayDateLabel: TLabel;
    PayeeLabel: TLabel;
    PayName: TLabel;
    PayAmountLabel: TLabel;
    BtnDed1: TButton;
    BtnDed2: TButton;
    BtnDed3: TButton;
    BtnDed4: TButton;
    BtnDed5: TButton;
    BtnPayCan: TButton;
    BtnSrchCheck: TButton;
    BtnSrchClear: TButton;
    ButtonPanel: TPanel;
    CanLabel: TLabel;
    CheckLab: TLabel;
    PayCheckLabel: TLabel;
    ChkPostBtn: TButton;
    DateLabel1: TLabel;
    DBNavigator3: TDBNavigator;
    DGridCheckTrans: TDBGrid;
    EDateEdit: TEdit;
    Edit3: TEdit;
    EditCheckNo: TEdit;
    GridSrchChecks: TDBGrid;
    Label124: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    MonLabel: TLabel;
    Label29: TLabel;
    Label51: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label65: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    LabelPayMemo: TLabel;
    PanelAccCan: TPanel;
    PanelAccPost: TPanel;
    PanelCheckPost: TPanel;
    PayBtn: TButton;
    CheckGrid: TDBGrid;
    EditDed1: TEdit;
    EditDed2: TEdit;
    EditDed3: TEdit;
    EditDed4: TEdit;
    EditDed5: TEdit;
    FedEdit: TEdit;
    FICAEdit: TEdit;
    GrossEdit: TEdit;
    HoursEdit: TEdit;
    Label20: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label87: TLabel;
    LabelDed1: TLabel;
    LabelDed2: TLabel;
    LabelDed3: TLabel;
    LabelDed4: TLabel;
    LabelDed5: TLabel;
    LabelPen: TLabel;
    LocalEdit: TEdit;
    MedEdit: TEdit;
    NetEdit: TEdit;
    NoteBook: TNotebook;
    Page1: TPage;
    Page2: TPage;
    Page3: TPage;
    Page4: TPage;
    Page5: TPage;
    Page6: TPage;
    Page7: TPage;
    Page8: TPage;
    Page9:TPage;
    Page10:TPage;
    Page11:TPage;
    AGroupPrint: TGroupBox;
    AGroupEdit: TGroupBox;
    CheckSrc: TDataSource;
    AccSrc: TDataSource;
    Panel25: TPanel;
    Panel6: TPanel;
    PanelSpc: TPanel;
    PanelSt: TPanel;
    PayBal: TEdit;
    PayCheck: TEdit;
    PayCheckDate: TEdit;
   // PayLabel: TLabel;
    PayLookUp: TComboBox;
    PenEdit: TEdit;
    ScriptLabel1: TLabel;
    SDateEdit: TEdit;
    StateEdit: TEdit;
    TrialCheckBtn: TButton;
    SingCheckBtn: TButton;
    AllCheckBtn: TButton;
    PrintAccSrc: TDataSource;
    FixChkGrid: TDBGrid;
    FixTranGrid: TDBGrid;
    NavChkEdit: TDBNavigator;
    PanelPrint: TPanel;
    Label23: TLabel;
    TransTblSrc: TDataSource;
    CheckingSrc: TDataSource;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;

    ChkEdit: TButton;
    ChkCan: TButton;
    ChkEditPost: TButton;
    AccEd: TButton;
    AccEditPost: TButton;
    AccDel: TButton;
    AccCan: TButton;


    AccLab: TLabel;
    RetSrc: TDataSource;

  //  ReportSystem: TReportSystem;


    EditTranTotal: TEdit;
    EditCheckTotal: TEdit;


  //  CheckPrinter: TReportPrinter;

    AGroupStub: TGroupBox;
    LabelRDed5: TLabel;
    LabelRDed4: TLabel;
    LabelRDed3: TLabel;
    LabelRDed2: TLabel;
    LabelRDed1: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    PrintBtn: TButton;
    GrossEd: TEdit;
    NetEd: TEdit;
    FedEd: TEdit;
    FICAEd: TEdit;
    MedEd: TEdit;
    LocEd: TEdit;
    StEd: TEdit;
    PenEd: TEdit;
    EditRDed1: TEdit;
    EditRDed2: TEdit;
    EditRDed3: TEdit;
    EditRDed4: TEdit;
    EditRDed5: TEdit;
    Label101: TLabel;
    EditStubDate: TEdit;
    AGroupRet: TGroupBox;
    Label129: TLabel;
    RetSum: TEdit;
    Panel22: TPanel;
    RetCheck: TCheckBox;
    NotCheck: TCheckBox;
    RetGrid: TDBGrid;
    Label128: TLabel;
    Label11: TLabel;
    CkLabel: TLabel;
    Label127: TLabel;
    Label126: TLabel;
    AccBalEdit: TEdit;
    RetCheckEdit: TEdit;
    RetConEdit: TEdit;
    RetDPEdit: TEdit;
    Label147: TLabel;
    EditRetYear: TEdit;
    AccBalBtn: TButton;
    Label125: TLabel;
    RetCombo: TComboBox;
    AGroupDP: TGroupBox;
    Label91: TLabel;
    Label90: TLabel;
    DPNav: TDBNavigator;
    Label8: TLabel;
    PDEd: TEdit;
    Label86: TLabel;
    Label100: TLabel;
    EditDPAmnt: TEdit;
    MemoDP: TEdit;
    DirPostBtn: TButton;
    DPCanBtn: TButton;
    EditCkBal: TEdit;
    DPSumEdit: TEdit;
    Label120: TLabel;
    Label92: TLabel;
    Label89: TLabel;
    AmntLabel: TLabel;
    GridDP: TDBGrid;
    AGroupTrans: TGroupBox;
    EditCheckTran: TEdit;
    Label35: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    TranTypeCombo: TComboBox;
    Label58: TLabel;
    BtnSrch: TButton;
    EdClrBtn: TButton;
    Label49: TLabel;
    Label50: TLabel;
    EditTranStart: TEdit;
    EditTranEnd: TEdit;
    Label141: TLabel;
    EditSumExp: TEdit;
    Label140: TLabel;
    EditSumLiab: TEdit;
    Label76: TLabel;
    EditTranAcc: TEdit;
    GridTrans: TDBGrid;
    ComboTranAcc: TComboBox;
    AGroupPayVu: TGroupBox;
    PaySrchBtn: TButton;
    VendorLabel1: TLabel;
    VendorLook: TComboBox;
    YTDNav: TDBNavigator;
    PayGrid: TDBGrid;
    PanelDt: TPanel;
    Label106: TLabel;
    Label107: TLabel;
    FromDt: TEdit;
    ToDt: TEdit;
    BtnClrViewPay: TButton;
    PanelVu: TPanel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    LabDed1: TLabel;
    Label121: TLabel;
    Label136: TLabel;
    LabDed2: TLabel;
    LabDed3: TLabel;
    LabDed4: TLabel;
    LabDed5: TLabel;
    EditVDed1: TEdit;
    Net: TEdit;
    LocalEd: TEdit;
    StateEd: TEdit;
    Medicare: TEdit;
    FICA: TEdit;
    Federal: TEdit;
    Gross: TEdit;
    BtnClrVu: TButton;
    PenTextEdit: TEdit;
    HrTextEdit: TEdit;
    EditVDed2: TEdit;
    EditVDed3: TEdit;
    EditVDed4: TEdit;
    EditVDed5: TEdit;
    AGroupWrite: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    MemoLabel: TLabel;
    Label12: TLabel;
    ScriptLabel: TLabel;
    AmountLabel: TLabel;
    VendorLabel: TLabel;
    Label10: TLabel;
    CheckLabel: TLabel;
    DateLabel: TLabel;
    ComboVendor: TComboBox;
    ComboAcc: TComboBox;
    Label53: TLabel;
    CKBal1: TEdit;
    CheckMemo: TEdit;
    CheckAmount: TEdit;
    CheckDate: TEdit;
    CheckEdit: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label18: TLabel;
    Label64: TLabel;
    Label83: TLabel;
    Label104: TLabel;
    Label143: TLabel;
    APanelTools: TPanel;
    PanelVoid: TPanel;
    Label94: TLabel;
    DelTranGrid: TDBGrid;
    VoidEdit: TEdit;
    VoidBtn: TButton;
    PanelDef: TPanel;
    Label88: TLabel;
    Label95: TLabel;
    Label33: TLabel;
    Label116: TLabel;
    YearEd: TEdit;
    MonthEd: TEdit;
    PanelTax: TPanel;
    Label119: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Btn941: TButton;
    SMonthBox: TComboBox;
    QuarterBox: TComboBox;
    PanelBal: TPanel;
    Label52: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    BalBtn: TButton;
    CheckEd: TEdit;
    DPEd: TEdit;
    ConEd: TEdit;
    BalEd: TEdit;
    PanelNext: TPanel;
    Label54: TLabel;
    Label55: TLabel;
    DBEditSeed: TDBEdit;
    BtnSeedPost: TButton;
    PanelBeg: TPanel;
    Label137: TLabel;
    BalPostBtn: TButton;
    BBEdit: TEdit;
    EmpCombo: TComboBox;

    Label145: TLabel;
    Label146: TLabel;


    NavEditTran: TDBNavigator;
    procedure GridDPDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PayNameLUCBChange(Sender: TObject);
    procedure DGridTransDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DPNavClick(Sender: TObject; Button: TDBNavButtonType);


    procedure RetGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FixAccGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DGridCheckTransDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    function FindStringKey(var Qry: TSQLQuery; SKey: String): Boolean;
    function FindIntegerKey(var Qry: TSQLQuery; IKey: Integer): Boolean;

    procedure NewLine(Ct: Integer; Var F:TextFile);
        procedure CheckPrinterPrint;
              procedure CheckAmountEnter(Sender: TObject);
              procedure NoteBookChangeBounds(Sender: TObject);
    {*}
    procedure SearchReturn(Ret: Boolean);
    procedure TrialCheckBtnClick(Sender: TObject);
   // procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    function  Inside(X,Y: Integer;CControl: TComponent): Boolean;
    procedure doCheckSrchClr;
    procedure doTranSrchClr;
    procedure doTaxPrint(Sender: TObject;BDate,EDate: TDateTime);
    procedure PrintTaxAcc(Sender: TObject;
             AccType,Mult: Integer;BDate,EDate: TDateTime);
    procedure doPrintOther(Sender: TObject;BDate,EDate: TDateTime);
    procedure doPrint941(Sender: TObject;BDate,EDate: TDateTime);

    function  ZFindKey(TName, Fld, Key: String; IntKey: Integer): boolean;
    function  GetAccType(Acc: Integer): Integer;
    function  AtoFloat(MonStr: String):Double;
    function  GetNameFromSoc(SocNo: String): String;
    function  GetSocFromName(NM: String): String;
    procedure doPayStubLabels(Pen, D1,D2,D3,D4,D5: Double);
    function  GetChecks(SDate, EDate: TDateTime): Double;
    function  GetCon(SDate, EDate: TDateTime; SFund, EFund: Integer): Double;
    function  GetDP(SDate, EDate: TDateTime): Double;
    procedure BtnClearViewPayClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSetChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);

    procedure SingCheckBtnClick(Sender: TObject);
    procedure AllCheckBtnClick(Sender: TObject);


    procedure PayBtnClick(Sender: TObject);
    procedure BtnPayCanClick(Sender: TObject);
    procedure NetEditChange(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    {procedure ClearPay; }
    procedure AccCanBtnClick(Sender: TObject);
    function  Pad(S: String; Sz: Integer):String;
    function  Front(S: String; Sz: Integer):String;

    procedure PrTotal(var F: TextFile);
    function  Liability: Double;
    procedure Balances(var F: TextFile; BBal,EBal: Double);
    procedure BtnSrchCheckClick(Sender: TObject);
    procedure DirPostBtnClick(Sender: TObject);
    function  GetMonth:Word;
    function  BegMonth(Year,Mnth:  Word):TDateTime;
    function  EndMonth(Year,Mnth: Word):TDateTime;
    procedure BalPostBtnClick(Sender: TObject);

    procedure ChkEditClick(Sender: TObject);
    procedure ChkEditPostClick(Sender: TObject);
    procedure ChkCanClick(Sender: TObject);
    procedure AccEdClick(Sender: TObject);
    procedure AccEditPostClick(Sender: TObject);
    procedure AccDelClick(Sender: TObject);
    procedure AccCanClick(Sender: TObject);
    procedure ChkPostBtnClick(Sender: TObject);

    procedure BtnSeedPostClick(Sender: TObject);

    procedure HoursEditExit(Sender: TObject);
    procedure CheckEditChange(Sender: TObject);
    procedure PayCheckChange(Sender: TObject);
    procedure CheckDateChange(Sender: TObject);
    procedure BtnClrViewPayClick(Sender: TObject);
    procedure PaySrchBtnClick(Sender: TObject);
    procedure BalBtnClick(Sender: TObject);
    procedure DoBalance;
    procedure FormActivate(Sender: TObject);

    procedure FirstDateP(var Str1: String);
    procedure LastDateP(var Str2: String);
    procedure DPSumEditClick(Sender: TObject);
    procedure doHeader(var F: Textfile; Head: String);
    function  EnvNo( Env: PChar):String;


    procedure RetGridDblClick(Sender: TObject);
    procedure AccBalBtnClick(Sender: TObject);

    procedure NotCheckClick(Sender: TObject);
    procedure RetCheckClick(Sender: TObject);
    procedure BalSrcDataChange(Sender: TObject; Field: TField);
  {  procedure Button1Click(Sender: TObject);}
    procedure PrintBtnClick(Sender: TObject);
    procedure EdClrBtnClick(Sender: TObject);
    procedure VoidBtnClick(Sender: TObject);

    procedure TableViewTranAfterPost(DataSet: TDataset);
    procedure BtnDed1Click(Sender: TObject);
    procedure BtnDed2Click(Sender: TObject);
    procedure BtnDed3Click(Sender: TObject);
    procedure BtnDed4Click(Sender: TObject);
    procedure BtnDed5Click(Sender: TObject);
    procedure RadioGrpDPClick(Sender: TObject);
    procedure PDEdKeyPress(Sender: TObject; var Key: Char);
    procedure EditDPAmntKeyPress(Sender: TObject; var Key: Char);
    procedure MemoDPKeyPress(Sender: TObject; var Key: Char);
    procedure CheckMemoChange(Sender: TObject);
    procedure DPCanBtnClick(Sender: TObject);
    procedure BtnSrchClearClick(Sender: TObject);
   // procedure FixAccGridDrawDataCell(Sender: TObject; const Rect: TRect;
     // Field: TField; State: TGridDrawState);
    procedure EditVDed3Change(Sender: TObject);
    procedure PenTextEditChange(Sender: TObject);
    procedure EditVDed1Change(Sender: TObject);
    procedure EditVDed2Change(Sender: TObject);
    procedure EditVDed4Change(Sender: TObject);
    procedure EditVDed5Change(Sender: TObject);
   // procedure RetGridDrawDataCell(Sender: TObject; const Rect: TRect;
    //  Field: TField; State: TGridDrawState);
    procedure EditRDed1Change(Sender: TObject);
    procedure PenEdChange(Sender: TObject);
    procedure EditRDed2Change(Sender: TObject);
    procedure EditRDed3Change(Sender: TObject);
    procedure EditRDed4Change(Sender: TObject);
    procedure EditRDed5Change(Sender: TObject);
    procedure BtnClrVuClick(Sender: TObject);
    procedure SMonthBoxKeyPress(Sender: TObject; var Key: Char);
    procedure QuarterBoxKeyPress(Sender: TObject; var Key: Char);
    procedure SMonthBoxChange(Sender: TObject);
    procedure QuarterBoxChange(Sender: TObject);
    procedure Btn941Click(Sender: TObject);
    procedure Report941Print(Sender: TObject);
    procedure VendorLookClick(Sender: TObject);
   // procedure DGridCheckTransDrawDataCell(Sender: TObject;
   //   const Rect: TRect; Field: TField; State: TGridDrawState);
    procedure EditCkBalClick(Sender: TObject);

    procedure HoursEditKeyPress(Sender: TObject; var Key: Char);
    procedure PenEditChange(Sender: TObject);
    procedure VendorBoxChange(Sender: TObject);
    //procedure FormClose(Sender: TObject);
    procedure FormClose(Sender: TObject);
    procedure AccountLookChange(Sender: TObject);
    procedure QueryTranSrcDataChange(Sender: TObject; Field: TField);

    procedure EditDPAmntChange(Sender: TObject);
    procedure BtnSrchClick(Sender: TObject);

    procedure ComboVendorKeyPress(Sender: TObject; var Key: Char);
    procedure ComboAccKeyPress(Sender: TObject; var Key: Char);
    procedure ComboVendorChange(Sender: TObject);
    procedure ComboAccChange(Sender: TObject);
    procedure AccPostBtnClick(Sender: TObject);
    procedure ComboTranAccKeyPress(Sender: TObject; var Key: Char);
    procedure FixTranGridDblClick(Sender: TObject);
    procedure BtnChkDelClick(Sender: TObject);
    procedure PayLookUpChange(Sender: TObject);

    procedure initDisplay;
    procedure initOpen;
    procedure doClearViewPay;
    procedure GetDedType(var D1,D2,D3,D4,D5: Integer);
   // function  getValues(IDX,IDY: Integer):Integer;
   // function  IndexOfName(IName: String;ArrDex: Integer): Integer;
    procedure initEmpNames;
    procedure doPayLabel(SocNo: String);
    function  GetRet(SDate,EDate: TDateTime; Ret: Integer): Double;
    procedure doDPCan;
    procedure DoCheckCancel(Chek: Integer);
    procedure doRetSearch(SDate,EDate: TDateTime);
    procedure doRefresh;
    procedure incCheckSeed;
   // function  getAccName(Acc,Ded: Integer): String;
    procedure fixCheckAmount;
    function  doTempCheckPost(Chek: Integer;Amnt: Double):Boolean;
    function  doAccountPost(Chk,Acc: Integer;
                     ChkDate: TDateTime; Amnt: Double): Boolean;
    procedure SumPay(SocNum: String; FDate,EDate: TDateTime);
    function  prnMoney(MonStr: String):String;
    procedure doDedArray(GrossAmnt: Double);
    procedure WriteScript(FAmnt: Double);
    procedure doBlankCheck;
    function  Kosher: Boolean;
    procedure initAccount;
    procedure initFunds;
    procedure initVendor;
    function  MonToStr(Money: Double):String;
    function  doStartTran: Boolean;
    function  ScriptMoney(MLeft,MRite: Integer):String;
    procedure doPayPrint(Info: PayInfo; BH: Double);
    procedure ClearPay;
    procedure FillPayCheck;
    function  MonDate(D: String):String;
    function  TransferCheck(ChekNo: String): Boolean;
    function  DeleteTempTrans(CheckNo: Integer): Boolean;
    function  DeleteTempCheck(CheckNo: Integer): Boolean;
    procedure doAccCancel;
     { procedure  NewLine(Ct: Integer; Var F:TextFile);  }
    procedure doPayCheck;
    procedure CheckHelpOpen;

   {procedure CheckAmountEnter(Sender: TObject); }
    procedure InitDates;
    function  PostCheckPlusTrans(ChekNo: Integer):Boolean;
    { procedure CkDateEditExit(Sender: TObject); }
    function  getAccountNo(Const Account: String): Integer;
    function  FmtAccountNo(Const Account: String): Integer;
    procedure ShowCheckNo;
    procedure doTempTotals;
    procedure InitBalance;
    procedure hideDeduct;
    function  getAccountName(Acc: Integer): String;
    function  ParseDate(Dt: String): String;
    function  FindPayroll(SocNo: String):Boolean;
    function  FindSocNo(Soc: String): Boolean;
    procedure ShowContext(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClearStubs;
    procedure InitDPGrid;

           { Private declarations }
  private



   public
     OldTab: Integer;
    Fund: array[101..310] of Integer;
    Amount: array[101..310] of Single;
    ConHits: array[101..310] of integer;
    GlobalAct:     Boolean;
    GlobalPost:    Boolean;
    GlobalTemp:    Boolean;
    GlobalLeft:    Integer;
    GlobalRite:    Integer;
    GlobStCheck,GlobEndCheck: Integer;
    GlobTrial: Boolean;
 RepConMonth,RepConYear,RepBennerMonth,RepBennerYear: Double;
    TotIncome,TotAmount,TotIncYear,TotAmnYear,TotBudget: Double;
   { procedure WMRButtonDown(var Msg: TWMMouse); message wm_RButtonDown;
    procedure WMPaint(var Msg: TWMPaint); message wm_Paint;   }

    PartialCheck:  Integer;
    LastAcc:       Integer;
    GlobalOcc:     Boolean;
    PayFlag:       Boolean;
      AccPtr:        Integer;
    ChkBal:        Double;
    PadStr:        String;
    PpiX,PPiY:     Integer;
    GlobalCheck:   Integer;
    GlobalAmount:  Double;
    { Public declarations }
  end;

const
   HelpFN: String='../help/ezcheck.chm';
var
  CheckForm: TCheckForm;
  SocList        :TStringList;
  fName: String;
  EZPSClass: TPostscriptClass;
  PayStubInfo: PayInfo;

  Activated: Boolean;
  StrDate: String;
  SepDate: String;
  AccTypeDesc: Array[0..13] of String;
  Deduction: Array[0..5] of Double;
  FlatTax: Array[0..5] of Double;
  DedAccounts: Array[0..5] of Integer;
  HForm: THelpForm;
  FedTax,FICATax,MedTax,StateTax,LocalTax,GrossWage,NetWage,Pension:  Double;
implementation
//{$R *.DFM}
{ TCheckForm }

//uses modunit;
Const
  EXPENSE=1;
  CFEDERAL=2;
  CFICA=3;
  CMED=4;
  CSTATE=5;
  CLOCAL=6;
  CPENSION=7;
  COTHERTAX=8;
  type
    TAccRecord = record
      CHKNO: SmallInt;
      ACCOUNT: SmallInt;
      CKDATE: TDateTime;
      AMOUNT: Double;
    end;
 type
    TTypeArray = array[0..5] of String[1];
 type
    ScriptArray = array[0..9] of String[7];
    NoAccount = Class(Exception);
    Tithe=set of 101..159;

  const
    TransArray: TTypeArray=('A','T','C','K','G','P');

    Script: ScriptArray=('','One','Two','Three','Four','Five','Six','Seven',
            'Eight','Nine');
    Scripty: ScriptArray=('','teen','Twenty','Thirty','Forty','Fifty',
             'Sixty','Seventy','Eighty','Ninety');
    Tithes: Tithe =[101,102,112,119,121,129,131,134,137,159];

    //UnderOn: String=Chr(27)+Chr(38)+Chr(100)+Chr(51)+Chr(68);
    //UnderOff: String=Chr(27)+Chr(38)+Chr(100)+Chr(64);
    BoldOn: String=Chr(27)+Chr(40)+Chr(115)+Chr(51)+Chr(66);
    BoldOff: String=Chr(27)+Chr(40)+Chr(115)+Chr(48)+Chr(66);



procedure TCheckForm.FormCreate(Sender: TObject);
begin
   NoteBook.PageIndex:=0;
   Activated:=False;
   AccPtr:=0;
   ChkBal:=0.0;
   GlobalAct:=False;
   SocList:=TStringList.Create;
   EZPSClass := TPostscriptClass.Create;
   EZPSCLass.ClosePrintFile;
 end;



procedure TCheckForm.TabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  If (GlobalPost=True) and (OldTab=0) and (NewTab<>0) then
    begin
      ShowMessage('Check '+CheckEdit.Text+' is pending, Post it or cancel');
      NoteBook.PageIndex:=0;
      exit;
    end
  Else
    begin
      DGridCheckTrans.DataSource:=NIL;
      ComboTranAcc.Text:='';
      If NewTab<>4 then
        begin
          FromDt.Text:='';
          ToDt.Text:='';
        end;
      If NewTab<>5 then
        begin
         SDateEdit.Text:='';
         EDateEdit.Text:='';
        end;
    end;
        if NewTab=0 then
          begin
            If OldTab<>0 then
               begin
                 ScriptLabel.Caption:='';
                 CheckDate.Text:=DateToStr(Date);
               end;
            NoteBook.PageIndex:=0;
          end
       else if NewTab=1 then
         begin
           doTempTotals;
           NoteBook.PageIndex:=1
         end
       else if NewTab=2 then
          NoteBook.PageIndex:=2
       else if NewTab=3 then
          NoteBook.PageIndex:=3
       else if NewTab=4 then
          NoteBook.PageIndex:=4
       else If NewTab=5 then
          begin
            NoteBook.PageIndex:=5;
            doCheckSrchClr;
          end
       else if NewTab=6 then
          begin
            NoteBook.PageIndex:=6;
            doTranSrchClr;
          end
       else if NewTab=7 then
          begin
            NoteBook.PageIndex:=7;
            EditCkBalClick(Sender as TObject);
            DPSumEditClick(Sender as TObject);
            PDEd.Text:=DateToStr(Date);
          end
       else if NewTab=8 then
          begin
            NoteBook.PageIndex:=8;
            BBEdit.Text:=FormatFloat('0.00',DataMod.ZTblBalance.FieldByName('BEGBALANCE').AsFloat);
          end
       else if NewTab=9 then
          NoteBook.PageIndex:=9
       else if NewTab=10 then
          NoteBook.PageIndex:=10
      else if NewTab=11 then
          NoteBook.PageIndex:=11;
       If (NewTab=0) or (NewTab=3) then
         begin
           DataMod.ZTblBalance.First;
           CheckEdit.Text:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsString;
           PayCheck.Text:=CheckEdit.Text;
           CheckLabel.Caption:=CheckEdit.Text;
           PayCheckLabel.Caption:=CheckEdit.Text;
           PayCheckDate.Text:=DateToStr(Date);
         end;

    OldTab:=NewTab;
end;

function TCheckForm.FindStringKey(var Qry: TSQLQuery; SKey: String): Boolean;
begin
   FindStringKey:=False;
end;


function TCheckForm.FindIntegerKey(var Qry: TSQLQuery; IKey: Integer): Boolean;
begin
   FindIntegerKey:=false;
   while not Qry.EOF do
       begin

       end;
end;

procedure TCheckForm.Balances(var F: TextFile; BBal,EBal: Double);
var
  BText,EText: String;
begin
  BText:=FormatFloat('0.00',BBal);
  EText:=FormatFloat('0.00',EBal);
  WriteLn(F,'     Beginning Balance = '+Btext+
  '      Ending Balance = '+EText);
end;

function TCheckForm.Liability: Double;
var
  TmpFloat:   Double;
  Ct:         Integer;
begin
  TmpFloat:=0;
  for Ct:=10 to 15 do
      TmpFloat:=TmpFloat+DataMod.ZTblPayroll.Fields[Ct].AsFloat;
  Result:=TmpFloat;
end;

procedure TcheckForm.PrTotal(var F: TextFile);
begin
      doHeader(F,'     Summary General Fnd');
      Write(F,'     ____');
      WriteLn(F,'____________________________________________________________________');
      Write(F,BoldOn);
      Write(F,Pad('     Total = ',26));
      Write(F,Front(FloatToStr(TotIncome),10));
      Write(F,Front(FloatToStr(TotAmount),10));
      Write(F,Front(FloatToStr(TotIncYear),10));
      Write(F,Front(FloatToStr(TotAmnYear),10));
      WriteLn(F,Front(FloatToStr(TotBudget),10));
      Write(F,BoldOff);
      NewLine(1,F);
  end;

procedure TCheckForm.doHeader(var F: Textfile; Head: String);
begin
 // WriteLn(F,BoldOn);
  Write(F,'                                                  ');
  WriteLn(F,'Income     Spent    Budget');
  Write(F,Pad(Head,21));
  WriteLn(F,'      Income     Spent    ToDate    ToDate      1997');
 // Write(F,BoldOff);
end;

procedure TCheckForm.BtnSrchCheckClick(Sender: TObject);
var
  FCheck,ECheck: LongInt;
  Year: Word;
  BegDate,EndDate: TDateTime;
begin
  try
    DGridCheckTrans.DataSource:=DataMod.SrcCheckTrans;
    FCheck:=0;
    ECheck:=0;
   DataMod.CheckingSrc.Enabled:=False;
    {Screen.Cursor:=crHourGlass; }
    try
      Year:=StrToInt(YearEd.Text);
      If SDateEdit.Text<>'' then
         BegDate:=StrToDate(SDateEdit.Text)
      else
           BegDate:=BegMonth(Year,1);
      If EDateEdit.Text<>'' then
         EndDate:=StrToDate(EDateEdit.Text)
      else
         EndDate:=EndMonth(Year,12);
    except
      ShowMessage('Check your date formats');
    end;
    try
      If EditCheckNo.Text<>'' then
        begin
          FCheck:=StrToInt(EditCheckNo.Text);
          ECheck:=FCheck;
        end
      else
        begin
          FCheck:=1;
          ECheck:=16000;
        end;
    except
      ShowMessage('Error in check number entry');
    end;
    With DataMod.ZQueryChecks do
      begin
        If not prepared then prepare;
        Close;
        Params[2].AsDateTime:=BegDate; //('FromDate')
        Params[3].AsDateTime:=EndDate;   //('ToDate')
        Params[0].AsInteger:=FCheck;  //('FromCheck')
        Params[1].AsInteger:=ECheck;    //('ToCheck')
        If VendorLook.Text<>'' then
          Params[4].AsString:=VendorLook.Text+'%' //('VendParm')
        else
          Params[4].AsString:='%';
        Open;
      end;
    With DataMod.ZQueryCheckSum do
      begin
        If not prepared then prepare;
        Close;
         Params[2].AsDateTime:=BegDate; //('FromDate')
        Params[3].AsDateTime:=EndDate;   //('ToDate')
        Params[0].AsInteger:=FCheck;  //('FromCheck')
        Params[1].AsInteger:=ECheck;    //('ToCheck')
        If VendorLook.Text<>'' then
          Params[4].AsString:=VendorLook.Text+'%' //('VendParm')
        else
          Params[4].AsString:='%';
        Open;
        CheckLab.Caption:=FormatFloat('0.00',Fields[0].AsFloat);
      end;
  finally
    DataMod.CheckingSrc.Enabled:=True;
    Screen.Cursor:=crDefault;
  end;
end;

function TCheckForm.EnvNo( Env: PChar):String;
var
  Cnt: Integer;
  TmpRes: String;
begin
  TmpRes:='';
  Cnt:=0;
  While Env[Cnt]<>#0 do
     begin
     TmpRes:=TmpRes+(Env[Cnt]);
     inc(Cnt);
     end;
  Result:=TmpRes;
end;

function TCheckForm.BegMonth(Year,Mnth: Word):TDateTime;
begin
  Result:=EncodeDate(Year,Mnth,1);
end;

Function TCheckForm.EndMonth(Year,Mnth: Word):TDateTime;
var
  TmpMonth: Word;
begin
  TmpMonth:=Mnth;
  If Mnth=12 then
      begin
        TmpMonth:=1;
        Year:=Year+1;
      end
  else
     TmpMonth:=Mnth+1;
    Result:=EncodeDate(Year,TmpMonth,1)-1;
end;

procedure TCheckForm.DirPostBtnClick(Sender: TObject);
var
  TmpDateStr: String;
  TmpDate: TDateTime;
  Amnt: Double;
  SavePlace: TBookMark;
begin
   If PDEd.Text='' then
     begin
       ShowMessage('You need a Post Date.');
       exit;
     end;
   If EditDPAmnt.Text<>'' then
      try
        try
          TmpDate:=StrToDate(PDEd.Text);
          TmpDateStr:=DateToStr(TmpDate);
        except
          ShowMessage('The Post Date appears to be invalid.');
          exit;
        end;
        With DataMod.ZQueryDP do
          begin
           // DataMod.SQLTransactionEZ.StartTransaction;
            SavePlace:=GetBookMark;
            insert;
            Amnt:=StrToFloat(EditDPAmnt.Text);
            FieldByName('Amount').AsString:=FloatToStr(Amnt);
            FieldByName('Memo').AsString:=MemoDP.Text;
            FieldByName('Post_Date').AsString:=TmpDateStr;
            Try
              DataMod.ZTblBalance.First;
              DataMod.ZQueryDP.Post;
              DataMod.SQLTransactionEZ.Commit;
              DataMod.ZQueryDP.Close;
              DataMod.ZQueryDP.Open;
              GotoBookMark(SavePlace);
              FreeBookMark(SavePlace);
            Except
              DataMod.ZQueryDP.Cancel;
              DataMod.ZQueryDP.FreeBookMark(SavePlace);
              DataMod.SQLTransactionEZ.RollBack;
              doDPCan;
            end;
          end;
      finally
        DataMod.ZQueryDP.Close;
        DataMod.ZQueryDP.Open;
        doDPCan;
        EditCkBalClick(Sender as TObject);
        DPSumEditClick(Sender as TObject);
      end;
 end;

function TCheckForm.GetMonth:Word;
var
  Year,Month,Day: Word;
begin
  DecodeDate(Date,Year,Month,Year);
  Result:=Month;
end;

procedure TCheckForm.BalPostBtnClick(Sender: TObject);
begin
  if MessageDlg('OK to set beginning balance to '+BBedit.text+' ?',
    mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    with DataMod.ZTblBalance do
      begin
        First;
        Edit;
        FieldByName('BEGBALANCE').AsFloat:=AtoFloat(BBEdit.Text);
        Post;
        ApplyUpdates;
        DataMod.SQLTransactionEZ.commit;
        Close;
        Open;
      end;
    doBalance;
end;


procedure TCheckForm.ChkEditClick(Sender: TObject);
begin
  GlobalTemp:=False;
  ChkEdit.Visible:=False;
  ChkEditPost.Visible:=True;
  ChkCan.Visible:=True;
  DataMod.ZTblTempChecks.Cancel;
  FixChkGrid.Enabled:=True;
  {AccDataBase.StartTransaction;
  TableTmpCheck.Edit;  }
end;

procedure TCheckForm.ChkEditPostClick(Sender: TObject);
begin
  ChkEdit.Visible:=True;
  ChkEditPost.Visible:=False;
  ChkCan.Visible:=False;
  FixChkGrid.Enabled:=False;
  GlobalTemp:=False;
  With DataMod do
  try
    //SQLTransactionEZ.StartTransaction;
    ZTblTempChecks.Edit;
    ZTblTempChecks.FieldByName('CHECK_NO').AsFloat:=GlobalCheck;
    ZTblTempChecks.FieldByName('AMOUNT').AsFloat:=GlobalAmount;
    ZTblTempChecks.Post;
    SQLTransactionEZ.Commit;
  except
    ZTblTempChecks.Cancel;
    SQLTransactionEZ.RollBack;
    ZTblTempChecks.Refresh;
  end;
  DataMod.ZTblTempChecks.Close;
  DataMod.ZTblTempChecks.Open;
end;

procedure TCheckForm.ChkCanClick(Sender: TObject);
begin
  ChkEdit.Visible:=True;
  ChkEditPost.Visible:=False;
  ChkCan.Visible:=False;
  DataMod.ZTblTempChecks.Cancel;
  FixChkGrid.Enabled:=False;
  GlobalTemp:=False;
end;

procedure TCheckForm.AccEdClick(Sender: TObject);
begin
  GlobalCheck:=DataMod.ZTblTempTrans.FieldByName('CHECK_NO').AsInteger;
  FixTranGrid.Enabled:=True;
  AccEd.Visible:=False;
  AccEditPost.Visible:=True;
  AccDel.Visible:=False;
  AccCan.Visible:=True;
  DataMod.ZTblTempTrans.Cancel;
  FixTranGrid.Options:=FixTranGrid.Options + [dgEditing];
  //DataMod.SQLTransactionEZ.StartTransaction;
  {TableTmpTrans.Edit; }
end;

procedure TCheckForm.AccEditPostClick(Sender: TObject);
var
   CheckPlace: TBookmark;
begin
  CheckPlace := DataMod.ZTblTempChecks.GetBookmark;
  AccEd.Visible:=True;
  AccEditPost.Visible:=False;
  AccDel.Visible:=True;
  AccCan.Visible:=False;
  FixTranGrid.Options:=FixTranGrid.Options - [dgEditing];
  With DataMod do
  Try
    Try
      ZTblTempTrans.Edit;
      ZTblTempTrans.FieldByName('CHECK_NO').AsInteger:=GlobalCheck;
      ZTblTempTrans.Post;
      {fixCheckAmount; }
      SQLTransactionEZ.Commit;
    except
      ZTblTempChecks.FreeBookmark(CheckPlace);
      ZTblTrans.Cancel;
      SQLTransactionEZ.RollBack;
    end;
  finally
    ZTblTempChecks.Close;
    ZTblTempChecks.Open;
    ZTblTempChecks.GotoBookmark(CheckPlace);
    ZTblTempChecks.FreeBookmark(CheckPlace);
    ZTblTempTrans.Close;
    ZTblTempTrans.Open;
    //ZTblVuTmpTrans.Close;
    //ZTblVuTmpTrans.Open;
    ZTblBalance.Close;
    ZTblBalance.Open;
    ZTblBalance.First;
  doTempTotals;
  FixTranGrid.Enabled:=False;
  end;
end;

procedure TCheckForm.AccCanClick(Sender: TObject);
begin
  FixTranGrid.Options:=FixTranGrid.Options - [dgEditing];
  doAccCancel;
  AccEd.visible:=True;
end;

procedure TCheckForm.AccDelClick(Sender: TObject);
var
   Freed: Boolean;
   Amnt,Accnt:  String;
   CheckPlace: TBookmark;
begin
  Freed:=False;
  FixTranGrid.Options:=FixTranGrid.Options - [dgEditing];
  CheckPlace := DataMod.ZTblTempChecks.GetBookmark;
  AccEd.Visible:=True;
  AccDel.Visible:=True;
  AccEditPost.Visible:=False;
  AccCan.Visible:=False;
  AccEd.Visible:=True;
  Accnt:=DataMod.ZTblTempTrans.FieldByName('ACCOUNT').AsString;
  Amnt:=DataMod.ZTblTempTrans.FieldByName('AMOUNT').AsString;
  If MessageDlg(' Ok to delete account no '+Accnt+' for amount $'+Amnt,
     mtInformation,[mbOk,mbCancel],0)=mrOk then
    try
      try
        //DataMod.SQLTransactionEZ.StartTransaction;
        DataMod.ZTblTempTrans.Delete;
        {fixCheckAmount; }
        DataMod.SQLTransactionEZ.Commit;
      except
        DataMod.ZTblTempTrans.Cancel;
        DataMod.SQLTransactionEZ.Rollback;
      end;
    finally
      DataMod.ZTblTempTrans.Close;
      DataMod.ZTblTempTrans.Open;
      DataMod.ZTblTempChecks.Close;
      DataMod.ZTblTempChecks.Open;
     // DataMod.ZTblVuTmpTrans.Close;
      //DataMod.ZTblVuTmpTrans.Open;
      DataMod.ZTblBalance.Close;
      DataMod.ZTblBalance.Open;
      DataMod.ZTblBalance.First;
      try
        DataMod.ZTblTempChecks.GotoBookmark(CheckPlace);
      except
        DataMod.ZTblTempChecks.FreeBookmark(CheckPlace);
        Freed:=True;
      end;
      If not Freed then
         DataMod.ZTblTempChecks.FreeBookmark(CheckPlace);
      doTempTotals;
    end;
end;

procedure TCheckForm.BtnSeedPostClick(Sender: TObject);
var
  CkSeed: String;
begin
  CkSeed := DBEditSeed.Text;
  With DataMod do
    begin
      If not ZEditCheckSeed.active then ZEditCheckSeed.open;
      ZEditCheckSeed.First;
      ZEditCheckSeed.Edit;
      ZEditCheckSeed.FieldByName('CHECKSEED').AsString := CkSeed;
      ZEditCheckSeed.Post;
      ZEditCheckSeed.ApplyUpdates;
      SQLTransactionEZ.Commit;
      ZTblBalance.Close;
      ZTblBalance.Open;
      ZTblTempChecks.Close;
      ZTblTempChecks.Open;
      ZTblTempTrans.Close;
      ZTblTempTrans.Open;
      CheckEdit.Text := CkSeed;
    end;
end;

procedure TCheckForm.HoursEditExit(Sender: TObject);
begin
  If HoursEdit.Text<>'' then
    begin
       PayLookup.Enabled:=True;
       if PayLookup.Text <> '' then
         PayLookUpChange(Sender);
     end
   else
     PayLookUp.Enabled:=False;
end;

procedure TCheckForm.CheckEditChange(Sender: TObject);
begin
   CheckLabel.Caption:=CheckEdit.Text;
end;

procedure TCheckForm.PayCheckChange(Sender: TObject);
begin
  PayCheckLabel.Caption:=PayCheck.Text;
end;

procedure TCheckForm.CheckDateChange(Sender: TObject);
begin
  CheckLabel.Caption:=CheckEdit.Text;
end;





procedure TCheckForm.PaySrchBtnClick(Sender: TObject);
var
  FromDate,ToDate: TDateTime;
  Year, Month, Day: Word;
  SocNum: String;
begin
FromDt.Text := ParseDate(FromDt.Text);
ToDt.Text := ParseDate(ToDt.Text);
If (FromDt.Text = '') or (ToDt.Text = '') then exit;
  If (Pos('Every',EmpCombo.Text)>0) or (EmpCombo.Text='') then
      SocNum:='%'
  else
      SocNum:=SocList.Strings[EmpCombo.ItemIndex - 1];

  DecodeDate(Date,Year, Month, Day);
  doPayLabel(SocNum);
  If FromDt.Text='' then
     FromDate:=StrToDate('01/01/'+IntToStr(Year))
  else
     FromDate:=StrToDate(FromDt.Text);
  If ToDt.Text='' then
     ToDate:=Date
  else
     ToDate:=StrToDate(ToDt.Text);
   With DataMod.ZQueryPayCheck do
       begin
         Close;
         Params[0].AsDate:=FromDate;   //From = 1
         Params[2].AsDate:=ToDate;      //To = 2
         Params[0].AsString:=SocNum;  //Soc = 0
         Open;
         first;
        end;
    SumPay(SocNum,FromDate,ToDate);
end;

procedure TCheckForm.BalBtnClick(Sender: TObject);
begin
  DoBalance;
end;

procedure TCheckForm.DoBalance;
var
  CheckTotal,DPTotal,ConTotal,BalTotal,Tmp: Double;
  JanDate, EDate: TDateTime;
  Year,Month,Day: Word;
begin
  DecodeDate(Now,Year,Month,Day);
  CheckTotal:=0.0;
  DPTotal:=0.0;
  ConTotal:=0.0;
  Year:=StrToInt(YearEd.Text);
  Month:=StrToInt(MonthEd.Text);
  JanDate:=BegMonth(1990,1);
  EDate:=EndMonth(Year,Month);
  With DataMod do
    begin
    //  ZQueryConTotal.Open;
      ZQueryConTotal.Close;
      ZQueryConTotal.Params[2].AsInteger:=100;  // FromFund = 2
      ZQueryConTotal.Params[3].AsInteger:=200;    //ToFund = 3
      ZQueryConTotal.Params[0].AsDateTime:=JanDate; //FromDate = 0
      ZQueryConTotal.Params[1].AsDateTime:=EDate;     //ToDate = 1
      ZQueryConTotal.Open;
      ConTotal:=ZQueryConTotal.Fields[0].AsFloat;

      ZQueryCheckTotal.Close;
      ZQueryCheckTotal.Params[0].AsDateTime:=JanDate;
      ZQueryCheckTotal.Params[1].AsDateTime:=EDate;
      ZQueryCheckTotal.Open;
      CheckTotal:=ZQueryCheckTotal.Fields[0].AsFloat;

      ZQueryDPTotal.Close;
      ZQueryDPTotal.Params[0].AsDateTime:=JanDate;
      ZQueryDPTotal.Params[1].AsDateTime:=EDate;
      ZQueryDPTotal.Open;
      DPTotal:=ZQueryDPTotal.Fields[0].AsFloat;
      If ZTblBalance.Active=False then
        ZTblBalance.Open;
      ZTblBalance.First;
      BalTotal:=ConTotal-CheckTotal+DPTotal+
            ZTblBalance.FieldByName('BEGBALANCE').AsFloat;

      GridDP.Datasource:=DPSrc;
      ZTblBalance.Edit;
      ZTblBalance.FieldByName('BALANCE').AsFloat:=BalTotal;
      ZTblBalance.Post;
      ZTblBalance.ApplyUpdates;
      DataMod.SQLTransactionEZ.Commit;
      ZTblBalance.Open;
      ZTblDP.Open;
      BalEd.Text:=Format('%m',[BalTotal]);
      CkBal1.Text := Format('%m',[BalTotal]);
      EditCkBal.Text := Format('%m',[BalTotal]);
      PayBal.Text := Format('%m',[BalTotal]);
      CheckEd.Text:=Format('%m',[CheckTotal]);
      RetCheckEdit.Text:=Format('%m',[CheckTotal]);
      ConEd.Text:=Format('%m',[ConTotal]);
      RetConEdit.Text:=Format('%m',[ConTotal]);
      DPEd.Text:=Format('%m',[DPTotal]);
      DPSumEdit.Text := Format('%m',[DPTotal]);
      RetDPEdit.Text:=Format('%m',[DPTotal]);
    end; //with
end;


procedure TCheckForm.FirstDateP(var Str1: String);
var
  Year,Mon,Day: Word;
  Years: String;
begin
  If Str1='' then
    begin
     DecodeDate(Date,Year,Mon,Day);
     Years:=','+IntToStr(Year);
     Str1:='01/01/'+IntToStr(Year);
   end;
end;

procedure TCheckForm.LastDateP(var Str2: String);
var
  Year,Mon,Day: Word;
  Years: String;
begin
  If Str2='' then
  begin
    DecodeDate(Date,Year,Mon,Day);
    Years:=','+IntToStr(Year);
    Str2:=IntToStr(Mon)+'/'+IntToStr(Day)+'/'+IntToStr(Year);
  end;
end;

procedure TCheckForm.DPSumEditClick(Sender: TObject);
var
  DPSum: Double;
begin
  doBalance;
  exit;
  DPSum:=0.0;
  With DataMod.ZQueryDP do
    try
      if not active then open;
      DisableControls;
      first;
        While not EOF do
          begin
            DPSum:=DPSum+FieldByName('Amount').AsFloat;
            next;
          end;
      EnableControls;
    except
      EnableControls;
    end;
  DPSumEdit.Text:=FormatFloat('0.00',DPSum);
  {GridDP.SetFocus;}
end;

procedure TCheckForm.RetGridDblClick(Sender: TObject);
var
  BegDate: TDateTime;
begin
  {If RetBox.Checked=False then
     exit;   }
  If RetGrid.SelectedIndex<>0 then
     Exit;
  try
     //DataMod.SQLTransactionEZ.StartTransaction;
     With DataMod.ZQueryChecks do
       begin
         If not locate('CHECK_NO',DataMod.ZQueryReturn.FieldByName('CHECK_NO').AsInteger,[]) then
            begin
              ShowMessage('Can not find check '+
                 DataMod.ZQueryReturn.FieldByName('CHECK_NO').AsString);
              DataMod.SQLTransactionEZ.RollBack;
              Exit;
            end
         else
           begin
              Edit;
              If FieldByName('RETURNED').AsString='X' then
                 FieldByName('RETURNED').Clear
              else
                 FieldByName('RETURNED').AsString:='X';
              Post;
              DataMod.SQLTransactionEZ.Commit;
              DataMod.ZQueryReturn.Close;
              DataMod.ZQueryReturn.Open;
              try
                BegDate:=EncodeDate(StrToInt(EditRetYear.Text),1,1);
              except
                BegDate:=Date;
              end;
              doRetSearch(BegDate,Date);
          end;
        end;
     {RetZQuery.Edit;}
     {If RetGrid.Fields[1].AsString='X' then
        RetGrid.Fields[1].AsString:=''
     else
       RetGrid.Fields[1].AsString:='X';   }
  except
     DataMod.SQLTransactionEZ.RollBack;
  end;
end;

function TCheckForm.GetChecks(SDate, EDate: TDateTime): Double;
begin
   With DataMod.ZQueryCheckTotal do
     begin
       Close;
       Params[0].AsDateTime:=SDate;
       Params[1].AsDateTime:=EDate;
       Open;
       Result:=Fields[0].AsFloat;
     end;
end;

function TCheckForm.GetDP(SDate, EDate: TDateTime): Double;
begin
  With DataMod.ZQueryDPTotal do
    begin
      Close;
      Params[0].AsDateTime:=SDate;
      Params[1].AsDateTime:=EDate;
      Open;
      Result:=Fields[0].AsFloat;
    end;
end;

function TCheckForm.GetCon(SDate, EDate: TDateTime; SFund, EFund: Integer): Double;
begin
  Result:=0.0;
  With DataMod.ZQueryConTotal do
    try
      If not prepared then prepare;
      Close;
      Params[0].AsDateTime:=SDate;
      Params[1].AsDateTime:=EDate;
      Params[2].AsInteger:=SFund; //FromFund = 2
      Params[3].AsInteger:=EFund;
      Open;
      Result:=Fields[0].AsFloat;
    except
    end;
end;

procedure TCheckForm.AccBalBtnClick(Sender: TObject);
var
  //FundNo: Integer;
  ChkSum,DPSum,ConSum, Bal: Double;
  SDate, EDate: TDateTime;
  Year, Month, Day: Word;
  NotRet,EndMon,BegBal: Double;
 begin
  try
    If EditRetYear.Text<>'' then
       Year:=StrToInt(EditRetYear.Text)
    else
      DecodeDate(Date,Year,Month,Day);
  except
    ShowMessage('Check the beginning of year');
    exit;
  end;
  Month:=RetCombo.ItemIndex+1;
  DataMod.ZQueryReturn.DisableControls;
{  DBGrid7.Datasource:=Nil;  }
  ChkSum:=0.0;DPSum:=0.0;ConSum:=0.0;
  EDate:=EndMonth(Year,Month);
  Month:=RetCombo.ItemIndex+1;
  If (Month>0) and (Month<=12) then
     EDate:=EndMonth(Year,Month);

  SDate:=EncodeDate(1980,1,1);
  DataMod.ZTblBalance.First;
  BegBal:=DataMod.ZTblBalance.FieldByName('BEGBALANCE').AsFloat;
  ConSum:=GetCon(SDate,EDate,100,199);
  DPSum:=GetDP(SDate,EDate);
  ChkSum:=GetChecks(SDate,EDate);
  NotRet:=GetRet(SDate,EDate,15000);
  EndMon:=BegBal+ConSum + DPSum - ChkSum+NotRet;

  RetCheckEdit.Text:=FormatFloat('0.00',ChkSum);
  if not DataMod.ZQueryDP.active then DataMod.ZQueryDP.open;
  DataMod.ZQueryDP.First;
  {DBGrid7.Datasource:=DPSrc; }
  doRetSearch(SDate,EDate);
  DataMod.ZQueryReturn.EnableControls;
  RetConEdit.Text:=FormatFloat('0.00',ConSum);
  RetDPEdit.Text:=FormatFloat('0.00',DPSum);
  AccBalEdit.Text:=FormatFloat('0.00',EndMon);
end;

procedure TCheckForm.SearchReturn(Ret: Boolean);
var
  EDate,SDate: TDateTime;
  Year, Month, Day: Word;
begin
  DecodeDate(Date,Year,Month,Day);
  EDate:=EndMonth(Year,Month);
  Month:=RetCombo.ItemIndex+1;
  If (Month>0) and (Month<=12) then
     EDate:=EndMonth(Year,Month);
  If Ret then
     SDate:=EncodeDate(StrToInt(EditRetYear.Text),1,1)   //Look for returned checks this year
  else
     SDate:=EncodeDate(1980,1,1);         //Look for un-returned checks for ever
  doRetSearch(SDate,EDate);
end;


procedure TCheckForm.NotCheckClick(Sender: TObject);
begin
  If (NotCheck.Checked=True) and (RetCheck.Checked=True) then
     RetCheck.Checked:=False;
  SearchReturn(RetCheck.Checked);
end;

procedure TCheckForm.RetCheckClick(Sender: TObject);
begin
  If (RetCheck.Checked=True) and (NotCheck.Checked=True) then
     NotCheck.Checked:=False;
  SearchReturn(RetCheck.Checked);
end;

procedure TCheckForm.BalSrcDataChange(Sender: TObject; Field: TField);
var
  Bal,Bal1: Double;
begin
   {ZTblBalance.First; }
   Bal1:=DataMod.ZTblBalance.FieldByName('BALANCE').AsFloat;
   EditCkBal.Text:=FormatFloat('0.00',Bal1);
   Bal:=Bal1-DataMod.ZTblBalance.FieldByName('TEMPSUM').AsFloat;
   CkBal1.Text:=FormatFloat('0.00',Bal);
   PayBal.Text:=CkBal1.Text;
end;

procedure TCheckForm.ClearStubs;
begin
    GrossEd.Text:='';
    NetEd.Text:='';
    FedEd.Text:='';
    FICAEd.Text:='';
    MedEd.Text:='';
    StEd.Text:='';
    LocEd.Text:='';
    PenEd.Text:='';
    EditRDed1.Text:='';
    EditRDed2.Text:='';
    EditRDed3.Text:='';
    EditRDed4.Text:='';
    EditRDed5.Text:='';
    PenEd.Visible:=false;
    EditRDed1.Visible:=false;
    EditRDed2.Visible:=false;
    EditRDed3.Visible:=false;
    EditRDed4.Visible:=false;
    EditRDed5.Visible:=false;
end;

procedure TCheckForm.doPayStubLabels(Pen,D1,D2,D3,D4,D5: Double);
begin
   Label122.Visible:=Pen>0.0;
    PenEd.Visible   :=Pen>0.0;

    LabelRDed1.Visible:=D1>0.0;
    EditRDed1.Visible :=D1>0.0;

    LabelRDed2.Visible:=D2>0.0;
    EditRDed2.Visible :=D2>0.0;

    LabelRDed3.Visible:=D3>0.0;
    EditRDed3.Visible :=D3>0.0;

    LabelRDed4.Visible:=D4>0.0;
    EditRDed4.Visible :=D4>0.0;

    LabelRDed5.Visible:=D5>0.0;
    EditRDed5.Visible :=D5>0.0;

    If PenEd.Visible then
      PenEd.Text := FormatFloat('0.00',Pen);

    If EditRDed1.Visible then
      EditRDed1.Text:=FormatFloat('0.00',D1);
    If EditRDed2.Visible then
      EditRDed2.Text:=FormatFloat('0.00',D2);
    If EditRDed3.Visible then
      EditRDed3.Text:=FormatFloat('0.00',D3);
    If EditRDed4.Visible then
      EditRDed4.Text:=FormatFloat('0.00',D4);
    If EditRDed5.Visible then
      EditRDed5.Text:=FormatFloat('0.00',D5);
end;


function TCHeckForm.GetNameFromSoc(SocNo: String): String;
var
  tmpRes: String;
begin
  With DataMod.ZQueryName do
    begin
      close;
      params[0].asString := SocNo;
      open;
      tmpRes := FieldByName('NAME').ASString;
      if tmpRes <> '' then
        result := tmpRes
      else
        Result:='Unknown';
    end;
end;


procedure TCheckForm.Report941Print(Sender: TObject);
var
 BegDate,EndDate: TDateTime;
 BMonth,EMonth: Word;
begin
 try
  If (SMonthBox.ItemIndex<0) and (QuarterBox.ItemIndex<0) then
     exit;
  If SMonthBox.ItemIndex>=0 then
    begin
      BMonth:=SMonthBox.ItemIndex+1;
      EMonth:=SMonthBox.ItemIndex+1;
    end
  else
    begin
      BMonth:=3*QuarterBox.ItemIndex+1;
      EMonth:=BMonth+2;
    end;
  BegDate:=BegMonth(StrToInt(YearEd.Text),BMonth);
  EndDate:=EndMonth(StrToInt(YearEd.Text),EMonth);
  With DataMod.ZQueryTranAcc do
    begin
      If not prepared then prepare;
         Close;
         Params[2].AsDateTime:=BegDate;
         Params[3].AsDateTime:=EndDate;
         Params[1].AsInteger:=0;
    end;
  With EZPSClass do
    begin
      Home;
      NewLine;
      NewLine;
      doTaxPrint(Sender,BegDate,EndDate);
    end;
  except
    ShowMessage('Could not do report, check your dates');
  end;
end;

procedure TCheckForm.BtnSrchClick(Sender: TObject);
var
  FromPType,ToPType: Integer;
  FromAccount,ToAccount: Integer;
  FCheck, TCheck: LongInt;
  Year: Word;
  BegDate,EndDate: TDateTime;
  Liab: Double;
begin
  try
    Screen.Cursor:=crHourGlass;
    try
      Year:=StrToInt(YearEd.Text);
      If EditTranStart.Text<>'' then
         BegDate:=StrToDateTime(EditTranStart.Text)
      else
           BegDate:=BegMonth(2000,1);
      If EditTranEnd.Text<>'' then
         EndDate:=StrToDateTime(EditTranEnd.Text)
      else
         EndDate:=EndMonth(Year,12);
    except
      ShowMessage('Check your date formats');
    end;
    try
      If ComboTranAcc.Text<>'' then
        begin
          FromAccount:=FmtAccountNo(ComboTranAcc.Text);
          ToAccount:=FromAccount;
        end
      else
        begin
          FromAccount:=0;
          ToAccount:=9999;
        end;
      If EditCheckTran.Text<>'' then
        begin
           FCheck:=StrToInt(EditCheckTran.Text);
           TCheck := FCheck;
        end
      else
        begin
          FCheck:=0;
          TCheck:=999999;
        end;
       If (TranTypeCombo.ItemIndex>1) or (TranTypeCombo.Text='') then
        begin
          FromPType:=0;
          ToPType:=1;
        end
      else
        begin
          FromPType:=TranTypeCombo.ItemIndex;
          ToPType:=FromPType;
        end;
    except
      ShowMessage('Check your values for check, account and type');
    end;
    With DataMod.ZQueryTrans do
      begin
        If not prepared then prepare;
        Close;
        Params[0].AsInteger:=FromPType;
        Params[1].AsInteger:=ToPType;
        Params[2].AsInteger:=FCheck;
        Params[3].AsInteger:=TCheck;
        Params[4].AsDateTime:=BegDate;
        Params[5].AsDateTime:=EndDate;
        Params[6].AsInteger:=FromAccount;
        Params[7].AsInteger:=ToAccount;
        Open;
      end;
      With DataMod.ZQueryLiabTotal do
      begin
        If not prepared then prepare;
        Close;
        Params[0].AsInteger:=FCheck;
        Params[1].AsInteger:=TCheck;
        Params[2].AsDateTime:=BegDate;
        Params[3].AsDateTime:=EndDate;
        Params[4].AsInteger:=FromAccount;
        Params[5].AsInteger:=ToAccount;
        Open;
        Liab:=FieldByName('SUM').AsFloat;
      end;
     With DataMod.ZQueryTranTotal do
      begin
        If not prepared then prepare;
        Close;
        Params[0].AsInteger:=FCheck;
        Params[1].AsInteger:=TCheck;
        Params[2].AsDateTime:=BegDate;
        Params[3].AsDateTime:=EndDate;
        Params[4].AsInteger:=FromAccount;
        Params[5].AsInteger:=ToAccount;
        Open;
        EditSumExp.Text:= Format('%m',[FieldByName('SUM').AsFloat]);
        EditSumLiab.Text:=Format('%m',[Liab]);
        {SumEdit.Text:=Format('%m',[Fields[0].AsFloat-Liab]);  }
      end;
    finally
      Screen.Cursor:=crDefault;
 end;
end;

procedure TCheckForm.EdClrBtnClick(Sender: TObject);
begin
  doTranSrchClr;
end;

procedure TCheckForm.doTranSrchClr;
begin
  TranTypeCombo.Text:='';
  EditCheckTran.Text:='';
  ComboTranAcc.Text:='';
  EditTranStart.Text:=DateToStr(BegMonth(StrToInt(YearEd.Text),1));
  EditTranEnd.Text:=DateToStr(EndMonth(StrToInt(YearEd.Text),12));
  TranTypeCombo.ItemIndex:=-1;
end;

procedure TCheckForm.VoidBtnClick(Sender: TObject);
var
  Chek: Integer;
begin
  try
    Chek:=StrToInt(VoidEdit.Text);
  except
    ShowMessage('Can not find check '+VoidEdit.Text);
    exit;
  end;
  With DataMod.ZQueryChecks do
  If not locate(IntToStr(Chek),DataMod.ZQueryChecks.FieldByName('CHECK_NO').AsInteger,[]) then
  //if not ZQueryChecks.FindKey([Chek]) then
    ShowMessage ('Can not find check '+VoidEdit.Text)
  else if MessageDlg(' Ok to void check '+VoidEdit.Text,
     mtInformation,[mbOk,mbCancel],0)=mrOk then
       try
         //DataMod.SQLTransactionEZ.StartTransaction;
         If not DataMod.ZQueryDelTran.Prepared then
            DataMod.ZQueryDelTran.Prepare;
         DataMod.ZQueryDelTran.Params[0].AsInteger:=Chek;
         DataMod.ZQueryDelTran.ExecSQL;
         DataMod.ZQueryDelTran.Close;
        // DataMod.ZTblDelTrans.Close;
        // DataMod.ZTblDelTrans.Open;
         DataMod.ZQueryChecks.Edit;
         DataMod.ZQueryChecks.FieldByName('Amount').AsFloat:=0.0;
         DataMod.ZQueryChecks.FieldByName('Vendor').AsString:='Void';
         DataMod.ZQueryChecks.Post;
  //*locate       If DataMod.ZTblPayStubs.FindKey([Chek]) then
            DataMod.ZTblPayStubs.Delete;
         DataMod.SQLTransactionEZ.Commit;
         ShowMessage('Check no '+VoidEDit.Text+' is voided');
       except
         DataMod.SQLTransactionEZ.RollBack;
         ShowMessage('Check '+VoidEdit.Text+' did not void.');
       end;
end;


procedure TCheckForm.TableViewTranAfterPost(DataSet: TDataset);
begin

end;

procedure TCheckForm.BtnDed1Click(Sender: TObject);
begin
  If EditDed1.Text<>'0.00' then
     begin
       EditDed1.Text:='0.00';
       Deduction[1]:=0.0;
     end
  else
    begin
      EditDed1.Text:=FormatFloat('0.00',FlatTax[1]);
      Deduction[1]:=FlatTax[1];
    end;
end;

procedure TCheckForm.BtnDed2Click(Sender: TObject);
begin
  If EditDed2.Text<>'0.00' then
     begin
       EditDed2.Text:='0.00';
       Deduction[2]:=0.0;
     end
  else
    begin
      EditDed2.Text:=FormatFloat('0.00',FlatTax[2]);
      Deduction[2]:=FlatTax[2];
    end;
end;

procedure TCheckForm.BtnDed3Click(Sender: TObject);
begin
  If EditDed3.Text<>'0.00' then
     begin
       EditDed3.Text:='0.00';
       Deduction[3]:=0.0;
     end
  else
    begin
      EditDed3.Text:=FormatFloat('0.00',FlatTax[3]);
      Deduction[3]:=FlatTax[3];
    end;
end;

procedure TCheckForm.BtnDed4Click(Sender: TObject);
begin
  If EditDed4.Text<>'0.00' then
     begin
       EditDed4.Text:='0.00';
       Deduction[4]:=0.0;
     end
  else
    begin
      EditDed4.Text:=FormatFloat('0.00',FlatTax[4]);
      Deduction[4]:=FlatTax[4];
    end;
end;

procedure TCheckForm.BtnDed5Click(Sender: TObject);
begin
  If EditDed5.Text<>'0.00' then
     begin
       EditDed5.Text:='0.00';
       Deduction[5]:=0.0;
     end
  else
    begin
      EditDed5.Text:=FormatFloat('0.00',FlatTax[5]);
      Deduction[5]:=FlatTax[5];
    end;
end;


procedure TCheckForm.RadioGrpDPClick(Sender: TObject);
var
  DPAmount: Double;
begin
  If EditDPAmnt.Text='' then exit;
  try
    DPAmount:=ABS(StrToFloat(EditDPAmnt.Text));
    EditDPAmnt.Text:=FormatFloat('0.00',DPAmount);
  except
    ShowMessage('Can not post amount '+EditDPAmnt.Text);
  end;
  MemoDP.SetFocus;
end;

procedure TCheckForm.PDEdKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 then EditDPAmnt.SetFocus;
end;

procedure TCheckForm.EditDPAmntKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 then MemoDP.SetFocus;
end;

procedure TCheckForm.MemoDPKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 then
    begin
      DirPostBtn.Visible:=True;
      DPCanBtn.Visible:=True;
      DirPostBtn.SetFocus;
   end;   
end;

procedure TCheckForm.CheckMemoChange(Sender: TObject);
begin
  MemoLabel.Caption:=CheckMemo.Text;
end;

procedure TCheckForm.DPCanBtnClick(Sender: TObject);
begin
  doDPCan;
end;

procedure TCheckForm.BtnSrchClearClick(Sender: TObject);
begin
  doCheckSrchClr;
end;

procedure TCheckForm.doCheckSrchClr;
begin
  SDateEdit.Text:=DateToStr(BegMonth(StrToInt(YearEd.Text),1));
  EDateEdit.Text:=DateToStr(EndMonth(StrToInt(YearEd.Text),12));
  EditCheckNo.Text:='';
  VendorLook.Text:='';
end;

function TCheckForm.AtoFloat(MonStr: String):Double;
var
  TmpStr: String;
begin
  try
    TmpStr:=MonStr;
    If Pos('$',MonStr)>0 then
      TmpStr:=copy(MonStr,Pos('$',MonStr)+1,20);
    Result:=StrToFloat(TmpStr);
  except
    Result:=0.0;
  end;
end;

function TCheckForm.getAccountNo(Const Account: String): Integer;
var
  AccStr: String;
  SPtr: Integer;
begin
  AccStr:='';
  SPtr:=1;
  While((Account[SPtr] >= '0') and (Account[SPtr] <= '9')) do
    begin
      AccStr:=AccStr+Account[SPtr];
      inc(SPtr);
    end;
  With DataMod.ZQueryAccNo do
    begin
      If not prepared then prepare;
        Close;
        Params[0].AsString := AccStr; //Account Number
        Open;
        if RecordCount = 0 then
          result := -1
        else
          result := FieldByName('ACCOUNT').AsInteger;
    end;
end;

function TCheckForm.getAccountName(Acc: Integer): String;
begin
  With DataMod.ZQueryAccName do
    begin
      If not prepared then prepare;
        Close;
        Params[0].AsInteger := Acc; //Account Number
        Open;
        result := FieldByName('NAME').AsString;
    end;
end;

function TCheckForm.GetAccType(Acc: Integer): Integer;
begin
 With DataMod.ZQueryAccType do
    begin
      If not prepared then prepare;
        Close;
        Params[0].AsInteger := Acc; //Account Number
        Open;
        if recordcount = 0 then
          result := -1
        else
          result := FieldByName('ACC_TYPE').AsInteger;
    end;
end;

procedure TCheckForm.DGridCheckTransDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);


{procedure TCheckForm.DGridCheckTransDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);    }
var
  R: TRect;
  TmpStr: String;
  CField: TField;
begin
   With  DGridCheckTrans, Canvas do
     begin
       CField := DataSource.Dataset.Fields[DataCol];
       R:=Rect;
       If (CField.FieldName='TRAN_TYPE')and (DataMod.ZQueryChecks.RecordCount>0) then
          begin
              If CField.AsInteger=0 then
               TmpStr:='Expense'
            else
               TmpStr:='Liability';
            TextRect(R,R.Left,R.Top,' '+TmpStr);
           end  //if
        else if (CField.FieldName='ACCOUNT') and
         (DataMod.ZQueryChecks.RecordCount>0) then
          begin
            TmpStr := getAccountName(CField.AsInteger);
             { If DataMod.ZTblAccounts.FindKey([Field.AsInteger]) then
                 TmpStr:=DataMod.ZTblAccounts.FieldByName('NAME').AsString
              else
                 TmpStr:='';    }
            TextRect(R,R.Left,R.Top,' '+TmpStr);
           end;   //else if
     end; //with
end;

procedure TCheckForm.FixAccGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

{procedure TCheckForm.FixAccGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);   }
var
  R: TRect;
  CField: TField;
  TmpStr: String;
  TmpInt: Integer;
begin
   TmpStr:='';
   R:=Rect;
   With  FixTranGrid, Canvas do
     begin
       CField := DataSource.Dataset.Fields[DataCol];
       If CField.FieldName='ACCOUNT' then
          begin
            TmpInt:=DataMod.ZTblTempTrans.FieldByName('ACCOUNT').AsInteger;
            TmpStr:=getAccountName(TmpInt);
            TextRect(R,R.Left,R.Top,' '+Copy(TmpStr,1,26));
          end
       else if CField.FieldName='ACC_TYPE' then
         begin
            TmpInt := CField.AsInteger;
            If (TmpInt>=0) and (TmpInt<=13) then
               TmpStr:=AccTypeDesc[TmpInt]
            else
               TmpStr:='Unknown';
             TextRect(R,R.Left,R.Top,' '+Copy(TmpStr,1,19));
          end;
    end; {With}
end;

procedure TCheckForm.PenTextEditChange(Sender: TObject);
begin
  If PenTextEdit.Text='$0.00' then
    begin
      Label121.Visible:=False;
      PenTextEdit.Visible:=False;
    end
  else
    begin
      Label121.Visible:=True;
      PenTextEdit.Visible:=True;
    end;
end;

procedure TCheckForm.EditVDed1Change(Sender: TObject);
begin
  If EditVDed1.Text='$0.00' then
    begin
      LabDed1.Visible:=False;
      EditVDed1.Visible:=False;
    end
  else
    begin
      LabDed1.Visible:=True;
      EditVDed1.Visible:=True;
    end;
end;

procedure TCheckForm.EditVDed2Change(Sender: TObject);
begin
  If EditVDed2.Text='$0.00' then
    begin
      LabDed2.Visible:=False;
      EditVDed2.Visible:=False;
    end
  else
    begin
      LabDed2.Visible:=True;
      EditVDed2.Visible:=True;
    end;
end;

procedure TCheckForm.EditVDed3Change(Sender: TObject);
begin
  If EditVDed3.Text='$0.00' then
    begin
      LabDed3.Visible:=False;
      EditVDed3.Visible:=False;
    end
  else
    begin
      LabDed3.Visible:=True;
      EditVDed3.Visible:=True;
    end;
end;

procedure TCheckForm.EditVDed4Change(Sender: TObject);
begin
   If EditVDed4.Text='$0.00' then
    begin
      LabDed4.Visible:=False;
      EditVDed4.Visible:=False;
    end
  else
    begin
      LabDed4.Visible:=True;
      EditVDed4.Visible:=True;
    end;
end;

procedure TCheckForm.EditVDed5Change(Sender: TObject);
begin
   If EditVDed5.Text='$0.00' then
    begin
      LabDed5.Visible:=False;
      EditVDed5.Visible:=False;
    end
  else
    begin
      LabDed5.Visible:=True;
      EditVDed5.Visible:=True;
    end;
end;

procedure TCheckForm.RetGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

{procedure TCheckForm.RetGridDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);  }
var
  R: TRect;
  CField:TField;
begin
   R:=Rect;
   With  RetGrid, Canvas do
     begin
       CField := DataSource.Dataset.Fields[DataCol];
       If (CField.FieldName='RETURNED') and (CField.Text='X') then
          begin
            Brush.Color:=clAqua;
            TextRect(R,R.Left,R.Top,' RET');
            Brush.Color:=clWhite;
          end;
     end;
end;

procedure TCheckForm.PenEdChange(Sender: TObject);
begin
 If PenEd.Text='0.00' then
      PenEd.Visible:=False
 else
      PenEd.Visible:=True;
 If PenEd.Text='0.00' then
      Label122.Visible:=False
 else
      Label122.Visible:=True;
end;

procedure TCheckForm.EditRDed1Change(Sender: TObject);
begin
   If EditRDed1.Text='0.00' then
      EditRDed1.Visible:=False
   else
      EditRDed1.Visible:=True;
   If EditRDed1.Text='0.00' then
      LabelRDed1.Visible:=False
   else
      LabelRDed1.Visible:=True;
end;

procedure TCheckForm.EditRDed2Change(Sender: TObject);
begin
   If EditRDed2.Text='0.00' then
      EditRDed2.Visible:=False
   else
      EditRDed2.Visible:=True;
   If EditRDed2.Text='0.00' then
      LabelRDed2.Visible:=False
   else
      LabelRDed2.Visible:=True;
end;

procedure TCheckForm.EditRDed3Change(Sender: TObject);
begin
  If EditRDed3.Text='0.00' then
      EditRDed3.Visible:=False
   else
      EditRDed3.Visible:=True;
   If EditRDed3.Text='0.00' then
      LabelRDed3.Visible:=False
   else
      LabelRDed3.Visible:=True;
end;

procedure TCheckForm.EditRDed4Change(Sender: TObject);
begin
  If EditRDed4.Text='0.00' then
      EditRDed4.Visible:=False
   else
      EditRDed4.Visible:=True;
   If EditRDed4.Text='0.00' then
      LabelRDed4.Visible:=False
   else
      LabelRDed4.Visible:=True;
end;

procedure TCheckForm.EditRDed5Change(Sender: TObject);
begin
  If EditRDed5.Text='0.00' then
      EditRDed5.Visible:=False
   else
      EditRDed5.Visible:=True;
   If EditRDed5.Text='0.00' then
      LabelRDed5.Visible:=False
   else
      LabelRDed5.Visible:=True;
end;

procedure TCheckForm.BtnClrVuClick(Sender: TObject);
begin
  EmpCombo.Text:='';
end;

procedure TCheckForm.SMonthBoxKeyPress(Sender: TObject; var Key: Char);
begin
   SMonthBox.ItemIndex:=-1;
end;

procedure TCheckForm.QuarterBoxKeyPress(Sender: TObject; var Key: Char);
begin
 QuarterBox.ItemIndex:=-1;
end;

procedure TCheckForm.SMonthBoxChange(Sender: TObject);
begin
 QuarterBox.ItemIndex:=-1;
end;

procedure TCheckForm.QuarterBoxChange(Sender: TObject);
begin
 SMonthBox.ItemIndex:=-1;
end;

procedure TCheckForm.Btn941Click(Sender: TObject);
begin
  Report941Print(Sender);// ReportSystem941.Execute;
end;

procedure TCheckForm.doTaxPrint(Sender: TObject;BDate,EDate: TDateTime);
const
  BOXLINEALL = 15;
  BOXLINENONE = 0;
var
  Sum,Total: Double;
  Account: Integer;
  TmpTab: PTab;
  TaxFont: FontType;
begin
   With EZPSClass do
     begin
        OpenPrintFile('941.ps');
        FreeTabs(1);
        TmpTab := NewTab(1,1.5,JUSTIFYLEFT,2.25,0.05,False,BOXLINENONE,0);
        TmpTab := NewTab(1,2.0,JUSTIFYLEFT,2.9,0.05,True,BOXLINENONE,0);
        TmpTab := NewTab(1,1.5,JUSTIFYRIGHT,2.9,0.05,True,BOXLINENONE,0);
        TaxFont.FontName := HELVETICA;
        TaxFont.FontSize := 10;
        Font := TaxFont;

        FreeTabs(2);
        TmpTab := NewTab(2,1.5,JUSTIFYLEFT,2.25,0.05,False,BOXLINENONE,5);
        TmpTab := NewTab(2,2.0,JUSTIFYLEFT,2.9,0.05,True,BOXLINENONE,0);
        TmpTab := NewTab(2,1.5,JUSTIFYRIGHT,2.9,0.05,True,BOXLINENONE,0);

        Total:=0.0;
          With DataMod.ZQueryPayAcc do
          begin
            Close;
            Params[0].AsString:='P';
            Params[1].AsInteger:=-1;
            Open;
            First;
            //RestoreTabs(1);
            while not EOF do {Get wages}
              With DataMod do
                begin
                   Account:=FieldByName('ACCOUNT').AsInteger;
                   ZQueryTranAcc.Close;
                   ZQueryTranAcc.Params[0].AsInteger:=Account;
                   ZQueryTranAcc.Open;
                   Sum:=ZQueryTranAcc.Fields[0].AsFloat;
                   PrintTab(1,FieldByName('ACCOUNT').AsString);
                   PrintTab(1,FieldByName('NAME').AsString);
                   PrintTab(1,FormatFloat('0.00',Sum));
                   NewLine;
                   Total:=Total+Sum;
                   next;
                end;
              Close;
              Params[0].AsString:='~';
              //RestoreTabs(2);
              PrintTab(2,'Wage Total = ');
              PrintTab(2,'');
              PrintTab(2,FormatFloat('0.00',Total));
              doPrint941(Sender,BDate,EDate);
              doPrintOther(Sender,Bdate,EDate);
        end; {With ZQueryPayTrans}
        ClosePrintFile;
    end; {with EZPSClass}
end;

procedure TCheckForm.doPrint941(Sender: TObject;BDate,EDate: TDateTime);
begin
  with EZPSClass  do
    begin
      PrintTaxAcc(Sender,CFEDERAL,1,BDate,EDate);
      PrintTaxAcc(Sender,CFICA,1,BDate,EDate);
      PrintTaxAcc(Sender,CMED,1,BDate,EDate);
    end;
end;

procedure TCheckForm.PrintTaxAcc(Sender: TObject;
      AccType,Mult: Integer;BDate,EDate: TDateTime);
var
  Account: Integer;
  Sum,Total: Double;
  AccDesc: String;
begin
  Total:=0.0;
  If (AccType>=0) and (AccType<=13) then
     AccDesc:=AccTypeDesc[AccType]
  else
    AccDesc:='Unknown';
  With EZPSClass, DataMod.ZQueryPayAcc do
    begin
      Close;
      Params[0].AsInteger:=AccType;
      Open;
      DataMod.ZQueryTranAcc.Close;
      If AccType>=CFEDERAL then
         DataMod.ZQueryTranAcc.Params[1].AsInteger:=1
      else
         DataMod.ZQueryTranAcc.Params[1].AsInteger:=0;
      First;
      NewLine;
      NewLine;
     //RestoreTabs(1);
     while not EOF do
       begin
         Account:=FieldByName('ACCOUNT').AsInteger;
         DataMod.ZQueryTranAcc.Close;
         DataMod.ZQueryTranAcc.Params[0].AsInteger:=Account;
         DataMod.ZQueryTranAcc.Open;
         Sum:=DataMod.ZQueryTranAcc.Fields[0].AsFloat;
         If Sum>0.0 then
           begin
             //RestoreTabs(1);
             PrintTab(1, FieldByName('ACCOUNT').AsString);
             PrintTab(1, FieldByName('NAME').AsString);
             PrintTab(1, FormatFloat('0.00',Mult*Sum));
             NewLine;
           end;
         Total:=Total+Mult*Sum;
         next;
       end;
       If Total<=0.0 then exit;
      // RestoreTabs(2);
       PrintTab(2, AccDesc+' Total = ');
       PrintTab(2, '');
       PrintTab(2, FormatFloat('0.00',Total));
    end;
end;


procedure TCheckForm.doPrintOther(Sender: TObject;BDate,EDate: TDateTime);
var
  Account,AccType,IDX: Integer;
  AccDesc: String;
begin
  With EZPSClass do
    begin
      PrintTaxAcc(Sender,CSTATE,1,BDate,EDate);
      PrintTaxAcc(Sender,CLOCAL,2,BDate,EDate);
      For IDX:=0 to 5 do
        begin
          AccType:=IDX+7;
          PrintTaxAcc(Sender,AccType,1,BDate,EDate);
        end; {For}
    end; {With Sender}
end;

procedure TCheckForm.VendorLookClick(Sender: TObject);
begin
  EditCheckNo.text:='';
end;




procedure TCheckForm.EditCkBalClick(Sender: TObject);
begin
  doBalance;
end;

procedure TCheckForm.HoursEditKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) then
    if (PayLookup.Text = '') then
       PayLookUp.SetFocus
    else
       doPayCheck;
end;

procedure TCheckForm.PenEditChange(Sender: TObject);
begin
  If PenEdit.Text='0.00' then
    begin
      LabelPen.Visible:=False;
      PenEdit.Visible:=False;
    end;
end;

procedure TCheckForm.VendorBoxChange(Sender: TObject);
begin
   VendorLabel.Caption:=ComboVendor.Text;
   DateLabel.Caption:=CheckDate.Text;
end;

procedure TCheckForm.FormClose(Sender: TObject);
begin
end;




procedure TCheckForm.EditDPAmntChange(Sender: TObject);
begin
 If Pos('-',EditDPAmnt.Text) >0 then
    EditDPAmnt.Font.Color:=clRed
  else
  EditDPAmnt.Font.Color:=clBlue;
end;


function  TCheckForm.Inside(X,Y: Integer;CControl: TComponent): Boolean;
var
  TmpControl: TControl;
  CRect: TRect;
  C1,C2: TPoint;
  XX,YY: Integer;
begin
  try
  TmpControl:=CControl as TControl;
  CRect:=TmpControl.BoundsRect;
  C1.X:=CRect.Left;C1.Y:=CRect.Top;
  C2.X:=CRect.Right;C2.Y:=CRect.Bottom;
  C1:=ClientToScreen(C1);
  C2:=ClientToScreen(C2);
  If (X>=C1.X) and (X<=C2.X) and
     (Y>=C1.Y) and (Y<=C2.Y) then
    Result:=True
  else
    Result:=False;
   except
    Result:=False;
    ShowMessage('False');
  end;
end;

procedure TCheckForm.ComboVendorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    ComboAcc.SetFocus;
  ComboAcc.ItemIndex := 0;
end;

procedure TCheckForm.ComboAccKeyPress(Sender: TObject; var Key: Char);
var
  TmpInt: Integer;
begin
  if Key<>#13 then exit;
  TmpInt := getAccountNo(ComboAcc.Text);
  if TmpInt <= 0 then
     begin
       ComboAcc.Text:='';
       ComboAcc.SetFocus;
     end
  else
    begin
      If Length(ComboAcc.Text)<5 then
        ComboAcc.Text:=ComboAcc.Text+'  '+
        DataMod.ZTblAccounts.FieldByName('Name').AsString;
       CheckAmount.SetFocus;
    end;
end;

procedure TCheckForm.ComboVendorChange(Sender: TObject);
begin
   VendorLabel.Caption:=ComboVendor.Text;
   DateLabel.Caption:=CheckDate.Text;
end;

procedure TCheckForm.ComboAccChange(Sender: TObject);
begin
 If Length(ComboAcc.Text)<4 then exit;
  CheckAmount.Text:='';
end;


procedure TCheckForm.ComboTranAccKeyPress(Sender: TObject; var Key: Char);
var
  TmpInt: Integer;
begin
 if Key<>#13 then exit;
 TmpInt := getAccountNo(ComboAcc.Text);
 If TmpInt <= 0 then
     begin
       ComboTranAcc.Text:='';
       ComboTranAcc.SetFocus;
     end
  else
    begin
      If Length(ComboTranAcc.Text)<5 then
        ComboTranAcc.Text:=ComboTranAcc.Text+'  '+
        DataMod.ZTblAccounts.FieldByName('Name').AsString;
       CheckAmount.SetFocus;
    end;

end;


procedure TCheckForm.AccPostBtnClick(Sender: TObject);
var
   AccAmount: Double;
   AccVal,TmpStr:    String;
   AccInt,ChkInt: Integer;
   AccDate: TDateTime;
begin
  MemoLabel.Caption:=CheckMemo.Text;
  DateLabel.Caption:=CheckDate.Text;
If Kosher=True then
     begin
       If AccPtr <=0 then
         begin
           If not doStartTran then exit;
         end;
       If AccPtr=1 then
          begin
            VendorLabel.Caption:=ComboVendor.Text;
            DateLabel.Caption:=CheckDate.Text;
            CheckDate.Enabled:=False;
          end;
       If MessageDlg(' Ok to post $'+CheckAmount.Text+
          ' to account '+ComboAcc.Text,
         mtInformation,[mbOk,mbCancel],0)=mrOk then
         begin
           AccAmount:=StrToFloat(CheckAmount.Text);
           AccInt:=GetAccountNo(ComboAcc.Text);
           ChkInt:=StrToInt(CheckEdit.Text);
           AccDate:=StrToDate(CheckDate.Text);
           If AccPtr > 1 then
             If not doAccountPost(ChkInt,AccInt,AccDate,AccAmount) then
               begin
                 AccPtr := 0;
                 exit;
               end;
           WriteScript(AccAmount);
           Inc(AccPtr); {We are in process of check writing}
           ComboVendor.Enabled:=False;
           TmpStr:=IntToStr(GlobalLeft)+'.';
           If GlobalRite<=9 then
              TmpStr:=TmpStr+'0';
           TmpStr:=TmpStr+IntToStr(GlobalRite);
              {Temporary post accounts}
           If Pos('.',TmpStr)<=0 then
              TmpStr:=TmpStr+'.00';
           AmountLabel.Caption:=TmpStr;
         end
      else
         begin
           CheckAmount.Text:='';
           ComboAcc.Text:='';
         end;
      end;
   DataMod.ZTblBalance.Close;
   DataMod.ZTblBalance.Open;
   DataMod.ZTblBalance.First;
end;


procedure TCheckForm.PayBtnClick(Sender: TObject);
var
  Occ,Pension,TmpRate :  Double;
  FICATax,MedTax,FedTax,StateTax,LocalTax:  Double;
  Account,PName,SocNum:  String;
  Chek,CkDate,PayAmount,TmpStr: String;
  IDX,TmpAcc: Integer;
begin
   If (PayLookUp.Text='') or (HoursEdit.Text='') then
      exit;
   Occ:=0;
   If MessageDlg(' Ok to post $'+NetEdit.Text+
           ' to Check '+PayCheck.Text+' for '+PayLookUp.Text,
         mtInformation,[mbOk,mbCancel],0)<> mrOk then exit;
   With DataMod do begin
   If StrToFloat(NetEdit.Text)>=1.0 then
      try
         DataMod.ZTblTempChecks.Close;
         DataMod.ZTblTempChecks.Open;
         Screen.cursor:=crHourGlass;
         //SQLTransactionEZ.StartTransaction;
         PayFlag:=False;
         Chek:=PayCheck.Text;
         CkDate:=PayCheckDate.Text;
         PName:=PayLookup.Text;
         SocNum:=SocList.Strings[PayLookUp.ItemIndex];
         PayAmount:=NetEdit.Text;
         with ZQueryPayroll do
           begin
             If not prepared then prepare;
             Close;
             Params[0].AsString := SocNum;
             Open;
            end;
         TmpStr:=ZQueryPayroll.FieldByName('Name').AsString;
         If TmpStr = '' then exit;
         SocNum:=ZQueryPayRoll.FieldByName('SOC_SEC_NO').AsString;
         TmpRate:=ZQueryPayroll.FieldByName('Wage').AsFloat;

         Account:=ZQueryPayroll.FieldByName('WAGE_ACCOUNT').AsString;
         if not ZPostTempChecks.active then ZPostTempChecks.Open;
         ZPostTempChecks.Insert;
         ZPostTempChecks.FieldByName('CHECK_NO').AsString:=Chek;
         ZPostTempChecks.FieldByName('VENDOR').AsString:=PName;
         ZPostTempChecks.FieldByName('CHECK_DATE').AsString:=CkDate;
         ZPostTempChecks.FieldByName('AMOUNT').AsString:=PayAmount;
         ZPostTempChecks.FieldByName('CHECKMEMO').AsString:='Payroll';
         ZPostTempChecks.FieldByName('CHECK_TYPE').AsString:='P';
         ZPostTempChecks.Post;
         ZPostTempChecks.ApplyUpdates;

         With ZTblPayStubs do
           try
             if not active then open;
             Insert;
             FieldByName('PCHECK_NO').AsString:=Chek;
             FieldByName('SOC_SEC_NO').AsString:=SocNum;
             FieldByName('RATE').AsFloat:=TmpRate;
             FieldByName('FED').AsString:=FedEdit.Text;
             FieldByName('FICA').AsString:=FICAEdit.Text;
             FieldByName('MED').AsString:=MedEdit.Text;
             FieldByName('STATE').AsString:=StateEdit.Text;
             FieldByName('LOCAL').AsString:=LocalEdit.Text;
             FieldByName('PENSION').AsString:=PenEdit.Text;
             FieldByName('NET').AsString:=NetEdit.Text;
             FieldByName('GROSS').AsString:=GrossEdit.Text;
             FieldByName('HOURS').AsFloat:=StrToFloat(HoursEdit.Text);
             {FieldByName('ACCOUNT').AsString:=Account; }
             FieldByName('PAY_DATE').AsDateTime:=StrToDate(PayCheckDate.Text);
             For IDX:=1 to 5 do
               If Deduction[IDX]>0.01 then
                begin
                  case IDX of
                    1: FieldByName('DEDUCT1').AsString:=EditDed1.Text;
                    2: FieldByName('DEDUCT2').AsString:=EditDed2.Text;
                    3: FieldByName('DEDUCT3').AsString:=EditDed3.Text;
                    4: FieldByName('DEDUCT4').AsString:=EditDed4.Text;
                    5: FieldByName('DEDUCT5').AsString:=EditDed5.Text;
                  end; {case}
                end;
             Post;
             ApplyUpdates;
           except
             ZTblPayStubs.Cancel;
             SQLTransactionEZ.RollBack;
             ShowMessage('Could not post paystub ');
             exit;
           end;
         With ZPostTempTrans do
           try
             {Net Pay}
             if not active then open;
             Insert;
             TmpAcc:=StrToInt(Account);
             FieldByName('CHECK_NO').AsString:=Chek;
             FieldByName('ACCOUNT').AsInteger:=TmpAcc;
             FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
             FieldByName('CHECK_NO').AsInteger:=StrToInt(Chek);
             FieldByName('CHECK_DATE').AsString:=CkDate;
             FieldByName('AMOUNT').AsString:=NetEdit.Text;
             Post;
             ApplyUpdates;
             If StrToFloat(FedEdit.Text)>0.01 then
               begin
                 Insert; {Fed Wage Tax}
                 FieldByName('CHECK_NO').AsString:=Chek;
                 TmpAcc:=ZQueryPayRoll.FieldByName('FED_ACCOUNT').AsInteger;
                 FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                 FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                 FieldByName('CHECK_DATE').AsString:=CkDate;
                 FieldByName('AMOUNT').AsString:=FedEdit.Text;
                 Post;
                 ApplyUpdates;
               end;
             If StrToFloat(FicaEdit.Text)>0.01 then
               begin
                 Insert; {FICA}
                 FieldByName('CHECK_NO').AsString:=Chek;
                 TmpAcc:=ZQueryPayRoll.FieldByName('FICA_ACCOUNT').AsInteger;
                 FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                 FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                 FieldByName('CHECK_DATE').AsString:=CkDate;
                 //Employee share + employer share
                 FieldByName('AMOUNT').AsFloat:=2.0*StrToFloat(FICAEdit.Text);
                 Post;
                 ApplyUpdates;
               end;
             If StrToFloat(MedEdit.Text)>0.01 then
               begin
                 Insert;   {Medicare}
                 FieldByName('CHECK_NO').AsString:=Chek;
                 TmpAcc:=ZQueryPayRoll.FieldByName('MED_ACCOUNT').AsInteger;
                 FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                 FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                 FieldByName('CHECK_DATE').AsString:=CkDate;
                 FieldByName('AMOUNT').AsFloat:=2.0*StrToFloat(MedEdit.Text);
                 Post;
                 ApplyUpdates;
               end;
             If StrToFloat(StateEdit.Text)>0.01 then
               begin
                 Insert;   {State Taxes}
                 FieldByName('CHECK_NO').AsString:=Chek;
                 TmpAcc:=ZQueryPayRoll.FieldByName('STATE_ACCOUNT').AsInteger;
                 FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                 FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                 FieldByName('CHECK_DATE').AsString:=CkDate;
                 FieldByName('AMOUNT').AsString:=StateEdit.Text;
                 Post;
                 ApplyUpdates;
               end;
             If StrToFloat(LocalEdit.Text)>0.01 then
               begin
                 Insert;   {Local Taxes}
                 FieldByName('CHECK_NO').AsString:=Chek;
                 TmpAcc:=ZQueryPayRoll.FieldByName('LOCAL_ACCOUNT').AsInteger;
                 FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                 FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                 FieldByName('CHECK_DATE').AsString:=CkDate;
                 FieldByName('AMOUNT').AsString:=LocalEdit.Text;
                 Post;
                 ApplyUpdates;
               end;
             If StrToFloat(PenEdit.Text)>0.01 then
                begin
                  Insert;   {Pension}
                  FieldByName('CHECK_NO').AsString:=Chek;
                  TmpAcc:=DedAccounts[0];
                  FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                  FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                  FieldByName('CHECK_DATE').AsString:=CkDate;
                  FieldByName('AMOUNT').AsString:=PenEdit.Text;
                  Post;
                  ApplyUpdates;
                end;
             For IDX:=1 to 5 do
               If Deduction[IDX]>0.01 then
                begin
                  Insert;   {Special deductions}
                  FieldByName('CHECK_NO').AsString:=Chek;
                  TmpAcc:=DedAccounts[IDX];
                  FieldByName('ACCOUNT').AsInteger:=TmpAcc;
                  FieldByName('ACC_TYPE').AsInteger:=GetAccType(TmpAcc);
                  FieldByName('CHECK_DATE').AsString:=CkDate;
                  case IDX of
                    1: FieldByName('AMOUNT').AsString:=EditDed1.Text;
                    2: FieldByName('AMOUNT').AsString:=EditDed2.Text;
                    3: FieldByName('AMOUNT').AsString:=EditDed3.Text;
                    4: FieldByName('AMOUNT').AsString:=EditDed4.Text;
                    5: FieldByName('AMOUNT').AsString:=EditDed5.Text;
                  end;
                  Post;
                  ApplyUpdates;
               end;
           except
             ZTblTempTrans.Cancel;
             SQLTransactionEZ.RollBack;
             ZTblTempTrans.Close;
             ZTblTempTrans.Open;
             ZTblTempChecks.Close;
             ZTblTempChecks.Open;
             ZTblPayStubs.Close;
             ZTblPayStubs.Open;
             ShowMessage('Could not post paycheck to accounts');
             exit;
           end;

        // TmpStr:=ZQueryPayroll.FieldByName('Name').AsString;
         incCheckSeed;
         ZTblBalance.Close;
         ZTblBalance.Open;
         SQLTransactionEZ.commit;
         {ChkBal:=ChkBal+StrToFloat(Amount); }

         PayFlag:=False;
         ClearPay;
         ZTblBalance.Open;
        // ZTblBalance.First;
         CheckEdit.Text:=ZTblBalance.FieldByName('CHECKSEED').AsString;
         PayCheck.Text:=CheckEdit.Text;
         CheckLabel.Caption:=CheckEdit.Text;
         PayCheckLabel.Caption:=CheckEdit.Text;
         PayLookup.Enabled:=False;
         SQLTransactionEZ.Commit;
         ZTblTempChecks.Close;
         ZTblTempTrans.Close;
         ZTblPayStubs.Close;
         ZTblBalance.Close;
         ZTblTempChecks.Open;
         ZTblTempTrans.Open;
         ZTblPayStubs.Open;
         ZTblBalance.Open;
         ZTblBalance.First;
      except
         ZTblTempChecks.Cancel;
         ZTblTempTrans.Cancel;
         ZTblPayStubs.Cancel;
         ZTblBalance.Cancel;
         Screen.Cursor:=crDefault;
         SQLTransactionEZ.RollBack;
         ShowMessage('There was an error for this paycheck');
      end;
     end;
    Screen.Cursor:=crDefault;
end;

procedure TCheckForm.BtnPayCanClick(Sender: TObject);
begin
  try
      DataMod.SQLTransactionEZ.RollBack;
  finally
    DataMod.ZTblTempTrans.Cancel;
    DataMod.ZTblTempChecks.Cancel;
    GlobalOcc:=False;
    PayFlag:=False;
    ClearPay;
  end;
end;


procedure TCheckForm.NetEditChange(Sender: TObject);
begin
   If NetEdit.Text<>'' then
      try
        PayAmountLabel.Caption:='$'+NetEdit.Text;
        ScriptLabel1.Caption:=MonToStr(StrToFloat(NetEdit.Text));
        VendorLabel1.Caption:=PayLookup.Text;
      except
      end
   else
      begin
        ScriptLabel1.Caption:='';
        PayAmountLabel.Caption:='';
        VendorLabel1.Caption:='';
     end;
end;

procedure TCheckForm.DBEdit1Exit(Sender: TObject);
begin
   CheckLabel.Caption:=PayCheck.Text;
end;

procedure TCheckForm.DBEdit2Exit(Sender: TObject);
begin
  DateLabel1.Caption:=PayCheckDate.Text;

end;


function TCheckForm.Pad(S: String; Sz: Integer):String;
var
  Long: Integer;
begin
  Long:=Sz-Length(S);
  If Long>0 then
     Result:=S+Copy(PadStr,1,Long)
  else
     Result:=S;
end;

function TCheckForm.Front(S: String; Sz: Integer):String;
var
  Long: Integer;
begin
  Long:=Sz-Length(S);
  If Long>0 then
     Result:=Copy(PadStr,1,Long)+S
  else
     Result:=S;
end;

 procedure TCheckForm.AccCanBtnClick(Sender: TObject);
begin
  If MessageDlg('OK to delete this check and its account Info?',
    mtInformation, [mbYes, mbNo], 0) = mrYes then
  try
      DoCheckCancel(StrToInt(CheckEdit.Text));
  except
     screen.cursor:=crDefault;
  end;
  screen.cursor:=crDefault;
end;

procedure TCheckForm.ChkPostBtnClick(Sender: TObject);
var
   Chk,TmpLeft,TmpRite,TmpInt,IDX: Integer;
   TmpFloat:  Double;
   ChekStr: String;
 begin
   If AccPtr <= 0 then
     begin
       ShowMessage('You must post at least one transaction before posting a check.');
       exit;
     end;
   If MessageDlg(' Ok to post $'+AmountLabel.Caption+
           ' to Check '+CheckLabel.Caption,
         mtInformation,[mbOk,mbCancel],0)=mrOk then
         try
           GlobalPost:=True;
           ComboVendor.Enabled:=True;
           if not doTempCheckPost(StrToInt(CheckEdit.Text),StrToFloat(AmountLabel.Caption)) then
             begin
               AccPtr := 0;
               DataMod.SQLTransactionEZ.RollBack;
               ShowMessage('Could not post check ');
               exit;
             end;
           {doBalPost(StrToFloat(AmountLabel.Caption)); }
           GlobalLeft:=0;
           GlobalRite:=0;
           ComboAcc.Text:='';
               {BalTbl.First;}
           ComboAcc.Text:='';
        {   AccNoEdit.Text:='';   }
        {   VendorNoEdit.Text:='';   }
           ScriptLabel.Caption:='';
           If AccPtr > 0 then
             begin
                incCheckSeed;
                DataMod.SQLTransactionEZ.Commit;
                ChekStr:=DataMod.ZIncCheckSeed.FieldByName('CHECKSEED').AsString;
             end
           else
              begin
                DataMod.SQLTransactionEZ.RollBack;
                ShowMessage('Could not post Check '+CheckEdit.Text);
              end;
           AccPtr := 0;
           GlobalPost:=False;
         Except
           GlobalPost:=False;
           DataMod.ZTblTempTrans.Cancel;
           DataMod.ZTblTempChecks.Cancel;
           DataMod.ZTblBalance.Cancel;
           ShowMessage('Could not post check');
           doBlankCheck;
           DataMod.SQLTransactionEZ.RollBack;
           DataMod.ZTblBalance.Close;
           DataMod.ZTblBalance.Open;
           DataMod.ZTblBalance.First;
           CheckEdit.Text:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsString;
           ComboAcc.Text:='';
           AccPtr := 0;
         end;
           doBlankCheck;
           DataMod.ZTblBalance.Close;
           DataMod.ZTblBalance.Open;
           DataMod.ZTblBalance.First;
           CheckEdit.Text:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsString;
           ComboAcc.Text:='';
           ComboVendor.Text:='';
           //AccPtr := 0;
 end;

procedure TCheckForm.incCheckSeed;
begin
  With DataMod.ZIncCheckSeed do
    begin
      if not active then
        open;
      edit;
      //FieldByName('CHECKSEED').AsInteger := FieldByName('CHECKSEED').AsInteger+1;
      Post;
      ApplyUpdates;
    end;
end;

function TCheckForm.doTempCheckPost(Chek: Integer;Amnt: Double): boolean;
begin
  result := false;
    begin
      initOpen;
      If AccPtr > 0 then
        With DataMod.ZPostTempChecks do
          try
            begin
              if ZFindKey('TEMP_TRANS', 'CHECK_NO', 'FALSE', Chek)  then
                begin
                  If not active then Open;
                  Insert;
                  FieldByName('CHECK_NO').AsInteger:=Chek;
                  FieldByName('VENDOR').AsString:=ComboVendor.Text;
                  FieldByName('CHECK_DATE').AsString:=CheckDate.Text;
                  FieldByName('AMOUNT').AsFloat:=StrToFloat(AmountLabel.Caption);
                  FieldByName('CHECKMEMO').AsString:=MemoLabel.Caption;
                  //FieldByName('CHECK_TYPE').AsString:='P';
                  Post;
                  result := true;
                end
              else
                ShowMEssage('You must post at least one transaction before posting a check.');
              end;
          except
            ShowMessage('Could not Post Check '+CheckEdit.Text);
            DataMod.ZPostTempChecks.Cancel;
            GlobalPost:=False;
            DataMod.SQLTransactionEZ.RollBack;
          end; //Try
      initOpen;
    end; //with CheckForm
  end;

function TCheckForm.doAccountPost(Chk,Acc: Integer;
                     ChkDate: TDateTime; Amnt: Double): Boolean;
var
  DidPost: Boolean;
begin
  DidPost:=False;
  CheckForm.CheckLabel.Caption := IntToStr(Chk);
  try
     if not DataMod.ZTblTempTrans.active then
            DataMod.ZTblTempTrans.open;
     DataMod.ZTblTempTrans.First;  //See if transactions have already been posted
     With DataMod.ZTblTempTrans do
        While not EOF do
          begin
            If (FieldByName('CHECK_NO'). asInteger=Chk) and
               (FieldByName('ACCOUNT').AsInteger=Acc) then
                DidPost:=True;
            next;
         end;
     If DidPost=True then
       begin
         Result:=False;
         ShowMessage('Account '+IntToStr(Acc)+' has already been posted'+
                     ' to this check');
         if MessageDlg('Ok to add this amount to it?',
            mtInformation, [mbYes, mbNo], 0) =0  then
            exit
         else
            begin   //Add another amount to account already posted to temp trans table
              DataMod.ZPostTempTrans.edit;
              DataMod.ZPostTempTrans.FieldByName('AMOUNT').AsFloat:=
                 DataMod.ZPostTempTrans.FieldByName('AMOUNT').AsFloat+Amnt;
              DataMod.ZPostTempTrans.Post;
              DataMod.ZPostTempTrans.ApplyUpdates;
              result := true;
            end;
       end
    else
       begin  //Inset a new post into temporary trans table
         With DataMod.ZPostTempTrans do
           begin
             if not active then open;
             insert;
             FieldByName('AMOUNT').AsFloat:=Amnt;
             FieldByName('CHECK_NO').AsInteger:=Chk;
             FieldByName('ACCOUNT').AsInteger:=Acc;
             FieldByName('ACC_TYPE').AsInteger:=EXPENSE;
             FieldByName('CHECK_DATE').AsDateTime:=ChkDate;
             Post;
             ApplyUpdates;
             result := true;
           end;
       end;
   except
     Showmessage('Could not post to account '+IntToStr(Acc));
     DataMod.ZPostTempTrans.Cancel;
     DataMod.SQLTransactionEZ.RollBack;
     GlobalPost:=False;
     Result:=False;
   end;
    initOpen;
 end;

procedure TCheckForm.CheckAmountEnter(Sender: TObject);
begin
   CheckAmount.Text:='';
end;

procedure TCheckForm.NoteBookChangeBounds(Sender: TObject);
begin
  end;

Procedure PrintSpace(Ct: Integer; Var F:TextFile);
var
  s: String;
  I: Integer;
begin
  S:='';
  For I:=1 to Ct do
     S:=S+' ';
  Write(F,S);
end;

procedure TCheckForm.NewLine(Ct: Integer; Var F:TextFile);
var
  I: integer;
begin
  For I:=1 to Ct do
     WriteLn(F,'');
end;

procedure TCheckForm.SingCheckBtnClick(Sender: TObject);
var
  CheckValue: String;
begin
  GlobTrial:=False;
  If DataMod.ZTblTempChecks.RecordCount<=0 then exit;
 // ShowMessage('Please make sure check is inserted correctly in printer. ');
  If InputQuery('Check Number','Input a Check Number',CheckValue) then
     try
       GlobStCheck:=StrToInt(CheckValue);
       GlobEndCheck:=StrToInt(CheckValue);
       CheckPrinterPrint;
     finally
     end;
  doBalance;
end;

procedure TCheckForm.TrialCheckBtnClick(Sender: TObject);
var
  CheckValue: String;
begin
  GlobTrial:=True;
  {Check Print here}
  If DataMod.ZTblTempChecks.RecordCount<=0 then exit;
  ShowMessage('Please print this on plain paper only ');
  If InputQuery('Check Number','Input a Check Number',CheckValue) then
     try
       GlobStCheck:=StrToInt(CheckValue);
       GlobEndCheck:=StrToInt(CheckValue);
       CheckPrinterPrint;
     finally
     end;
end;


procedure TCheckForm.AllCheckBtnClick(Sender: TObject);
  var Start,Stop:  String;
      Temp: Integer;
begin
  GlobTrial:=False;
  With DataMod.ZTblTempChecks do
     begin
       If RecordCount<=0 then exit;
       First;
       Start:=FieldByName('CHECK_NO').AsString;
       GlobStCheck:=FieldByName('CHECK_NO').AsInteger;
       Last;
       Stop:=FieldByName('CHECK_NO').AsString;
       GlobEndCheck:=FieldByName('CHECK_NO').AsInteger;
     end;
  If MessageDlg(' Ok to print '+Start+' through '+Stop,
         mtInformation,[mbOk,mbCancel],0)=mrOk then
     begin
      // ShowMessage('Please make sure checks are lined up in printer from '
        //      +Start+' To '+Stop);
     try
         //CheckPrinter.Execute;
         CheckPrinterPrint;
       except
         DataMod.ZTblTempChecks.Open;
         DataMod.ZTblTempTrans.Open;
       end;
       doBalance;
     end;
end;


procedure TCheckForm.CheckPrinterPrint;
const
  BOXLINENONE = 0;
 var
   fName: String;
   TmpTab: PTab;
   CkDate,Vend,Note:  String;
   CheckNo,Cnt: Integer;
   CkAmount: Double;
   MonText:   String;
   MonStr:    String;
   Accy,ScriptX,ScriptY,DupY,DateX,DateY: Double;
   VendX,VendY,MemoX,MemoY,AmountX,AmountY: Double;
   CheckFont: FontType;
 begin

   With EZPSClass do
     begin
       if PrintFileOpen then
         ClosePrintFile;
       If (GlobStCheck <> GlobEndCheck) then
         fName := 'checks'+IntToStr(GlobStCheck)+'-' + IntToStr(GlobEndCheck)+'.ps'
       else
         fName := 'check'+IntToStr(GlobStCheck)+'.ps';
       OpenPrintFile(fName);
       if not PrintFileOpen then
         begin
           ShowMessage('Could not open file '+fName+' for printing');
           exit;
         end;
       CheckFont.FontName := HELVETICA;
       CheckFont.FontSize := 10;
       Font := CheckFont;
       setTabBoxHeight(1,LineSpacing);
     end;  //With EZPSClass do
   for CheckNo:=GlobStCheck to GlobEndCheck do   //one check or a range of checks
     try
       If not ZFindKey('TEMP_CHECKS', 'CHECK_NO', 'FALSE', CheckNo) then
         begin
             EZPSClass.ClosePrintFile;
             exit;
           end;
       Cnt:=0;
       With DataMod.ZTblXY do   //get check format parameters
          begin
            if not active then open;
            First;
            VendX:=FieldByName('PAYX').AsFloat;
            VendY:=FieldByName('PAYY').AsFloat;
            DateX:=FieldByName('DateX').AsFloat;
            DateY:=FieldByName('DateY').AsFloat;
            ScriptX:=FieldByName('ScriptX').AsFloat;
            ScriptY:=FieldByName('ScriptY').AsFloat;
            MemoX:=FieldByName('MemoX').AsFloat;
            MemoY:=FieldByName('MemoY').AsFloat;
            DupY:=FieldByName('DupY').AsFloat;
            AmountX:=FieldByName('AmountX').AsFloat;
            AmountY:=FieldByName('AmountY').AsFloat;
            AccY:=FieldByName('AccountY').AsFloat;
          end;
      With DataMod.ZQueryTempCks do   //get check numbers and corresponding data from temporary check table
        begin
          if not active then open;
          Close;
          Params[0].AsInteger:=CheckNo;
          Open;
          First;
          Vend:=FieldByName('VENDOR').AsString;
          CkDate:=FieldByName('CHECK_DATE').AsString;
          CkAmount:=FieldByName('AMOUNT').AsFloat;
          Note:=FieldByName('CHECKMEMO').AsString;
          MonStr:=Format('%m',[CkAmount]);
          MonText:=MonToStr(CkAmount);
        end;

       If not GlobTrial then     //if not a trial check
         if not PostCheckPlusTrans(CheckNo) then   //insert the check and its transactions to permanent tables
           begin
             EZPSCLass.ClosePrintFile;
             exit;
           end;
       With EZPSClass do
      // With sender as TBaseReport do
         begin
           PrintXY(VendX,VendY,Vend);
           PrintXY(DateX,DateY,CkDate);
           PrintXY(ScriptX,ScriptY,MonText);
           PrintXY(AmountX,AmountY,MonStr);
           PrintXY(MemoX,MemoY,Note);
           With DataMod.ZQueryPrintTran do
             try
               Close;
               Params[0].AsInteger:=CheckNo;
               Open;
               First;
               FreeTabs(1);
               TmpTab := NewTab(1, 1.5,JUSTIFYLEFT,1.875,0.05,False,BOXLINENONE,0);
               setTabBoxHeight(1,LineSpacing);
               //SetTab(1.5,pjLeft,4.25,5,BOXLINENONE,0);
               PrintXY(1.0,AccY,'Payed to:  '+Vend);
               PrintXY(DateX,AccY,CkDate);
               CurY := InchToPoint(AccY);
               NewLine;
               NewLine;
               While (not EOF) and (Cnt<10) do
                 begin
                   Inc(Cnt);
                   PrintTab(1, 'Account  '+Fields[1].AsString+'  '+
                           Format('%m',[FieldByName('Amount').AsFloat]));
                   NewLine;
                   next;
                 end;
             except
               ShowMessage('Error in print check');
             end;
           PrintXY(VendX,DupY+VendY,Vend);
           PrintXY(DateX,DupY+DateY,CkDate);
           PrintXY(ScriptX,DupY+ScriptY,MonText);
           PrintXY(AmountX,DupY+AmountY,MonStr);
           PrintXY(MemoX,DupY+MemoY,Note);
           If CheckNo<>GlobEndCheck then
               EZPSCLass.PSProcs;
       end; //{With sender}
       If not GlobTrial then
         try
           {If ZFindKey('PAYSTUBS', 'PCHECK_NO', 'FALSE', CheckNo) then
             begin
               DataMod.ZTblPayStubs.Edit;
               DataMod.ZTblPayStubs.FieldByName('PCheck_No').AsInteger:=0;
               DataMod.ZTblPayStubs.Post;
             end;}

           if DeleteTempTrans(CheckNo) then
              DataMod.SQLTransactionEZ.Commit
           else
              DataMod.SQLTransactionEZ.RollBack;
           With DataMod do      //Refresh for grids
             begin
               ZTblTrans.Close;
               ZTblTrans.Open;
               ZTblChecks.Close;
               ZTblChecks.Open;
               ZTblCheckTrans.Close;
               ZTblCheckTrans.Open;
               ZTblTemptrans.Close;
               ZTblTempTrans.Open;
               ZTblTempChecks.Close;
               ZTblTempChecks.Open;
               ZTblChecks.Close;
               ZTblChecks.Open;
               ZTblBalance.Close;
               ZTblBalance.Open;
               ZTblBalance.First;
             end;
        except
          ShowMessage('Could not transfer data from temp to final accounts');
          DataMod.SQLTransactionEZ.RollBack;
        end;
    except
      ShowMessage('Check printing error');
    end;
    EZPSClass.PSPRocs;
    EZPSClass.ClosePrintFile;
end;


function TCheckForm.PostCheckPlusTrans(ChekNo: Integer):Boolean;
// post the transactions then the checks frim tenporary to permanent tables
var
  TranNo:   LongInt;
  Acc,AccType:   Integer;
  AccStr,TrType: String;
  Amnt: Double;
  PayChek: Boolean;
  TranDate: TDateTime;
begin
  PayChek:=False;
  Result:=False;
  AccType:=0;
  DataMod.ZTblTrans.Open;
  DataMod.ZTblTrans.Last;
  if ZFindKey('PAYSTUBS', 'PCHECK_NO', 'FALSE', ChekNo) then
    PayChek:=True;
  With DataMod.ZQueryPrintTran do      //do transactions first
     try
       Close;
       Params[0].AsInteger:=ChekNo;   //Get transactions from TEMP_TRANS for this check
       Open;
       First;
       DataMod.ZPostTrans.Open;       //Open query to insert temp transactions to permanent transactions
       While not EOF do               //Insert transactions - one by one - to permanent table
         try
           Amnt:=FieldByName('Amount').AsFloat;
           Acc:=FieldByName('ACCOUNT').AsInteger;
           AccType:=FieldByName('ACC_TYPE').AsInteger;
           TranDate := FieldByName('CHECK_DATE').AsDateTime;
           If AccType<0 then
              begin
                ShowMessage('Can not find account and/or type for '+
                           IntToStr(Acc)+' in account ZQuery');
                 DataMod.SQLTransactionEZ.RollBack;
               exit;
             end;
           If (AccType>1) and (PayChek) then
             AccType:=1
           else
             AccType:=0;

           With DataMod do   //Post temp transactions to permanent - one by one
             begin
               if not ZPostTrans.Prepared then
                  ZPostTrans.Prepare;
                ZPostTrans.Insert;
                ZPostTrans.FieldByName('CHECK_NO').AsInteger := ChekNo;
                ZPostTrans.FieldByName('ACCOUNT').AsInteger:=Acc;
                ZPostTrans.FieldByName('AMOUNT').AsFloat := Amnt;
                ZPostTrans.FieldByName('TRAN_TYPE').AsInteger := AccType;
                ZPostTrans.FieldByName('TRAN_DATE').AsDateTime:= TranDate;
                ZPostTrans.Post;
                ZPostTrans.ApplyUpdates;
             end;
             next;
         except
           DataMod.SQLTransactionEZ.Rollback;
           ShowMessage('Could not print check '+IntToStr(ChekNo));
           result := false;
           exit;
         end;

          If not TransferCheck(IntToStr(ChekNo)) then  {do check last}
            begin
              DataMod.SQLTransactionEZ.Rollback;
              result := false;
              exit;
            end;
     except
        DataMod.SQLTransactionEZ.Rollback;
        ShowMessage('Could not print check '+IntToStr(ChekNo));
        result := false;
     end;
   result := true;
end;

function TCheckForm.TransferCheck(ChekNo: String): Boolean;
 {Transfer from Temporary Check to Checking}
var
  CkFound: Boolean;
begin
  Result:=False;
  With DataMod do
    try
      If  ZFindKey('TEMP_CHECKS', 'CHECK_NO', ChekNo, StrToInt(ChekNo)) then
         With DataMod do
           begin
             ZPostChecks.Open;
             if not ZPostChecks.Prepared then
               ZPostChecks.Prepare;
             ZPostChecks.Insert;
             ZPostChecks.FieldByName('CHECK_NO').AsInteger:= ZQueryTempCks.FieldByName('CHECK_NO').AsInteger;
             ZPostChecks.FieldByName('AMOUNT').AsFloat:= ZQueryTempCks.FieldByName('AMOUNT').AsFloat;
             ZPostChecks.FieldByName('VENDOR').AsString:= ZQueryTempCks.FieldByName('VENDOR').AsString;
             ZPostChecks.FieldByName('CHECK_DATE').AsDateTime:= ZQueryTempCks.FieldByName('CHECK_DATE').AsDateTime;
             ZPostChecks.FieldByName('CHECKMEMO').AsString:= ZQueryTempCks.FieldByName('CHECKMEMO').AsString;
             ZPostChecks.FieldByName('VENDOR_NO').AsInteger:= ZQueryTempCks.FieldByName('VENDOR_NO').AsInteger;
             ZPostChecks.Post;
             ZPostChecks.ApplyUpdates;
             Result:=True;
         end  //end if ZFindKey
      else
         begin
           DataMod.SQLTransactionEZ.RollBack;
           Result := false;
           ShowMessage('Can not find check '+DataMod.ZTblTempChecks.FieldByName('CHECK_NO').AsString);
        end; //end else if ZFindkey
    except
      DataMod.SQLTransactionEZ.RollBack;
      result := false;
      ShowMessage('Could not post '+ChekNo+' to Checks/Transactions');
    end;
    Result := true;
end;


function TCheckForm.DeleteTempTrans(CheckNo: Integer): Boolean; //Checks and transactions from temp tables
begin
  With DataMod do
    try
      ZQueryDelTempTran.Params[0].AsInteger:= CheckNo;
      ZQueryDelTempTran.execSQL;
      Result := DeleteTempCheck(CheckNo);
    except
      ShowMessage('Error: Can not delete check '+IntToStr(CheckNo));
      DataMod.SQLTransactionEZ.Rollback;
      Result := false;
    end;
end;

function TCheckForm.DeleteTempCheck(CheckNo: Integer): Boolean; //Checks and transactions from temp tables
begin
  With DataMod do
    try
      ZQueryDelTempCk.Params[0].AsInteger:= CheckNo;
      ZQueryDelTempCk.ExecSQL;
      Result := true;
    except
      ShowMessage('Error: Can not delete check '+IntToStr(CheckNo));
      DataMod.SQLTransactionEZ.Rollback;
      Result := false;
    end;
end;

procedure TCheckForm.BtnClearViewPayClick(Sender: TObject);
begin
  doClearViewPay;
end;

procedure TCheckForm.BtnClrViewPayClick(Sender: TObject);
begin
  FromDt.Text:='';
  ToDt.Text:='';
end;

procedure TCheckForm.AccountLookChange(Sender: TObject);
begin
  If Length(ComboAcc.Text)<4 then exit;
  CheckAmount.Text:='';
end;

procedure TCheckForm.QueryTranSrcDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TCheckForm.FixTranGridDblClick(Sender: TObject);
begin
  If GlobalTemp then exit;
  GlobalTemp:=True;
  GlobalCheck:=DataMod.ZTblTempChecks.FieldByName('CHECK_NO').AsInteger;
  GlobalAmount:=DataMod.ZTblTempChecks.FieldByName('AMOUNT').AsFloat;
end;

function  TCheckForm.ParseDate(Dt: String): String;
var
  TmpStr, PStr: String;
  Delim, Len: Integer;
  DChar: String;
  S1, S2, S3, D,  M, Y: String;

begin
  result := '';
  DChar := '';
  TmpStr := Trim(Dt);
  Len := Length(TmpStr);
  Delim := PosEx(SepDate, TmpStr);

  If Delim > 0 then
     DChar := MidStr(TmpStr,Delim,1);

  If DChar = ''  then
    begin
      Delim := PosEx('/', TmpStr);
      If Delim > 0 then
         DChar := MidStr(TmpStr, Delim ,1);
   end;

   If DChar = ''  then
     begin
       Delim := PosEx(' ', TmpStr);
       If Delim > 0 then
          DChar := MidStr(TmpStr, Delim, 1);
     end;

   If (DChar = '') or (Delim <= 1)  then exit;
   try
     S1 := LeftStr(TmpStr, Delim - 1);
     TmpStr := RightStr(TmpStr, Len - Delim);
     Delim := PosEx(DChar, TmpStr);
     if Delim <=0 then exit;

     S2 := LeftStr(TmpStr, Delim - 1);
     Len := Length(TmpStr);
     S3 := RightStr(TmpStr, Len - Delim);

     if StrDate[1] = 'd' then
       D := S1
     else if StrDate[1] = 'm' then
       M := S1
     else if StrDate[1] = 'Y' then
       Y := S1;

     if StrDate[3] = 'd' then
       D := S2
     else if StrDate[3] = 'm' then
       M := S2
     else if StrDate[3] = 'Y' then
       Y := S2;

     if StrDate[5] = 'd' then
       D := S3
     else if StrDate[5] = 'm' then
       M := S3
     else if StrDate[5] = 'Y' then
       Y := S3;

     result := S1 + SepDate + S2 + SepDate + S3;
   finally
   end;
end;

procedure TCheckForm.InitDPGrid;
var
  I: Integer;
  S: String;
begin
  for I := 0 to 1 do
     begin
      GRidDP.Columns[I].alignment := taRightJustify;
      GRidDP.Columns[I].Title.alignment := taRightJustify;
     end;
  GRidDP.Columns[2].alignment := taLeftJustify;
  GRidDP.Columns[2].Title.alignment := taLeftJustify;
  GridDP.Columns[0].width := 480;
  GridDP.Columns[1].width := 120;
  GridDP.Columns[2].width := 100;
  GridDP.Columns[0].Field := DataMod.ZTblDP.Fields[2];
  GridDP.Columns[2].Field := DataMod.ZTblDP.Fields[0];
end;

procedure TCheckForm.FormActivate(Sender: TObject);
var
   Chk:   Integer;
   Bal:   Double;
   Month,Year,Day: Word;
begin
With CheckForm do
begin
   If activated then exit;
   activated := true;
   initDates;
   AccTypeDesc[1]:='Expense';
   AccTypeDesc[2]:='Federal Tax';
   AccTypeDesc[3]:='FICA';
   AccTypeDesc[4]:='Medicare';
   AccTypeDesc[5]:='State Tax';
   AccTypeDesc[6]:='Local Tax';
   AccTypeDesc[7]:='Pension';
   For Chk:=8 to 13 do
     AccTypeDesc[Chk]:='Deduction_'+IntToStr(chk-7);
   AccTypeDesc[7]:='Pension';
   AccTypeDesc[13]:='Other Deduction';
   Chk:=8;
   TranTypeCombo.Clear;
   TranTypeCombo.Items.Add('Expense');
   TranTypeCombo.Items.Add('Liability');
   TranTypeCombo.Items.Add('All Transactions');

  { With DataMod.ZTblDeductions do
     begin
       //If not Active then Open;
          First;
       For Chk:=8 to 12 do
         If Fields[Chk-8].AsString<>'' then
            AccTypeDesc[Chk]:=Fields[Chk-8].AsString;
     end;  }
   DecodeDate(Date,Year,Month,Day);
   If GlobalAct=True then
      exit;
   GlobalAct:=True;
   GlobalPost:=False;
   GlobalTemp:=False;
   PadStr:='                    ';
   GlobalOcc:=False;
   PayFlag:=False;
   MemoLabel.Caption:='';
   VendorLabel.Caption:='';
   AmountLabel.Caption:='';
   ScriptLabel.Caption:='';


  { make the number of Tabs = number of Pages,
    and have the same names }
  // NoteBook.PageIndex:=TabSet.TabIndex;
    initDisplay;
   doBalance;
   DataMod.ZQueryChecks.Close;
   DataMod.ZQueryChecks.Open;
   DataMod.ZQueryChecks.Last;
   DataMod.ZTblBalance.First;
   Chk:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsInteger;
   NoteBook.PageIndex:=0;
   OldTab:=0;
      begin
        CheckEdit.Text:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsString;
        PayCheck.Text:=CheckEdit.Text;
        CheckLabel.Caption:=CheckEdit.Text;
        PayCheckLabel.Caption:=CheckEdit.Text;
      end;
  { Exp101Tbl.First;  }
   ComboAcc.Text:='';
   ComboTranAcc.Text:='';
   GlobalLeft:=0;
   GlobalRite:=0;
   PartialCheck:=0;
   DataMod.ZTblBalance.First;
   Bal:=DataMod.ZTblBalance.FieldByName('BALANCE').AsFloat-
        DataMod.ZTblBalance.FieldByName('TEMPSUM').AsFloat;
   CkBal1.Text:=FormatFloat('0.00',Bal);
   PayBal.Text:=CkBal1.Text;
   initAccount;
   initVendor;
   initBalance;
   //initDisplay;
   NotCheck.Checked:=True;
   RetCheck.Checked:=False;
   ShortDateFormat := 'd/m/y';
   SepDate := DateSeparator;
   StrDate := ShortDateFormat;
   SearchReturn(RetCheck.Checked);
   initOpen;
   initDPGrid;
  end;
end;

procedure TCheckForm.initOpen;
begin
  With DataMod do
   begin
     ZTblTempChecks.Open;
     ZTblTempTrans.Open;
     ZTblChecks.Open;
     ZTblCheckTrans.Open;
     ZQueryTrans.Open;
     ZTblDP.Open;
     ZQueryReturn.Open;
     ZTblBalance.Open;
   end;
end;

procedure TCheckForm.BtnChkDelClick(Sender: TObject);
var
  TempCheck: Integer;
begin
   if MessageDlg('OK to delete check '+
     DataMod.ZTblTempChecks.FieldByName('CHECK_NO').AsString+'?',
    mtInformation, [mbYes, mbNo], 0) = mrNo then exit;
   TempCheck :=DataMod.ZTblTempChecks.FieldByName('CHECK_NO').AsInteger;
 try
   With DataMod do
     begin
       try
         ZQueryDelTempTran.Params[0].AsInteger:=TempCheck;
         ZQueryDelTempTran.ExecSQL;
       except
         exit;
       end;
       try
         ZQueryDelTempCk.Params[0].AsInteger:=TempCheck;
         ZQueryDelTempCk.ExecSQL;
       except
         exit;
       end;
       try
         ZQueryDelPayStub.Params[0].AsInteger:=TempCheck;
         ZQueryDelPayStub.ExecSQL;
       except
         exit;
       end;
   DataMod.SQLTransactionEZ.Commit;
   DataMod.ZTblTempChecks.Close;
   DataMod.ZTblTempChecks.Open;
   ShowMessage('You may need to reset the Next Check Number on the tools page.');
   ShowMessage('Make sure not to print the checks out of sequence.');
   end;
 except
   DataMod.SQLTransactionEZ.RollBack;
   ShowMessage('Could not delete this check.');
 end;
end;

procedure TCheckForm.PayLookUpChange(Sender: TObject);
begin
  If HoursEdit.Text <>'' then
    doPayCheck;
end;


procedure TCheckForm.DGridTransDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);

{procedure TCheckForm.GridTransDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState); }
var
  R: TRect;
  TmpStr: String;
  Account: Integer;
  CField: TField;
begin
   With  GridTrans, Canvas do
     begin
       CField := DataSource.Dataset.Fields[DataCol];
       R:=Rect;
       If (CField.FieldName='TRAN_TYPE')then
          begin
             Account:=DataMod.ZQueryTrans.FieldByName('ACCOUNT').AsInteger;
             TmpStr := getAccountName(Account);
             If TmpStr = '' then
                TmpStr:='Unknown';
            TextRect(R,R.Left,R.Top,' '+TmpStr);
           end;
    end;
end;

procedure TCheckForm.PayNameLUCBChange(Sender: TObject);
var
  BegDate,EndDate: TDateTime;
  GrossDt,NetDt,FedDt,FICADt,D1,D2,D3,D4,D5: double;
  MedDt,StateDt,LocalDt,PenDt,Hours: Double;
  Year,Month,Day: Word;
  SocNum: String;
begin
   try
      EndDate:=StrToDate(EditStubDate.Text);
      DecodeDate(EndDate,Year,Month,Day);
      BegDate:=BegMonth(Year,1);
    except
      EndDate:=EndMonth(StrToInt(YearEd.Text),12);
      BegDate:=BegMonth(StrToInt(YearEd.Text),1);
    end;
    GrossDt:=0.0;NetDt:=0.0;FedDt:=0.0;
    FICADt:=0.0;MedDt:=0.0;StateDt:=0.0;
    LocalDt:=0.0;PenDt:=0.0;
    D1:=0.0;D2:=0.0;D3:=0.0;D4:=0.0;D5:=0.0;

    SocNum:=String(PayNameLUCB.Keyvalue);
    PayName.Caption := GetNameFromSoc(String(PayNameLUCB.Keyvalue));
    With DataMod.ZQueryEmpSum do
      begin
        Close;
        Params[0].AsDateTime:=BegDate;  //FromDate
        Params[1].AsDateTime:=EndDate;    //ToDate
        Params[2].AsString:=SocNum;
       // Params[2].AsString:=EmpLookUp.Field.AsString; //Soc
        Open;
       // If not locate('CHECK_NO',DataMod.ZQueryReturn.FieldByName('CHECK_NO').AsInteger,[]) then
        if not ZFindKey('PAYSTUBS', 'SOC_SEC_NO', SocNum, 0)  then
          begin
            ClearStubs;
            ShowMessage('Cannot find this employee in paystub records');
            exit;
          end;
        //If not DataMod.ZQueryPayroll.FindKey([EmpLookup.Value]) then
        //  begin
         //   ShowMessage('Cannot find this employee in payroll Query');
         //   exit;
        //  end;
        NetDt:=FieldByName('Sum_1').AsFloat;
        GrossDt:=FieldByName('Sum_2').AsFloat;
        FedDt:=FieldByName('Sum_3').AsFloat;
        FICADt:=FieldByName('Sum_4').AsFloat;
        MedDt:=FieldByName('Sum_5').AsFloat;
        StateDt:=FieldByName('Sum_6').AsFloat;
        LocalDt:=FieldByName('Sum_7').AsFloat;
        PenDt:=FieldByName('Sum_8').AsFloat;
        Hours:=FieldByName('Sum').AsFloat;
        D1:=FieldByName('Sum_9').AsFloat;
        D2:=FieldByName('Sum_10').AsFloat;
        D3:=FieldByName('Sum_11').AsFloat;
        D4:=FieldByName('Sum_12').AsFloat;
        D5:=FieldByName('Sum_13').AsFloat;
    end;
    GrossEd.Text:=FormatFloat('0.00',GrossDt);
    NetEd.Text:=FormatFloat('0.00',NetDt);
    FedEd.Text:=FormatFloat('0.00',FedDt);
    FICAEd.Text:=FormatFloat('0.00',FICADt);
    MedEd.Text:=FormatFloat('0.00',MedDt);
    StEd.Text:=FormatFloat('0.00',StateDt);
    LocEd.Text:=FormatFloat('0.00',LocalDt);
    PenEd.Text:=FormatFloat('0.00',PenDt);
    If PenDt>0.00 then
      begin
        Label122.Visible:=True;
        PenEd.Visible:=True;
      end
    else
      begin
        Label122.Visible:=False;
        PenEd.Visible:=False;
      end;
    EditRDed1.Text:=FormatFloat('0.00',D1);
    EditRDed2.Text:=FormatFloat('0.00',D2);
    EditRDed3.Text:=FormatFloat('0.00',D3);
    EditRDed4.Text:=FormatFloat('0.00',D4);
    EditRDed5.Text:=FormatFloat('0.00',D5);
    doPayStubLabels(PenDt, D1,D2,D3,D4,D5);
    PayStubInfo.PYTDTotal:=FedDt+FICADt+MedDt+StateDt+LocalDt;
    With DataMod.ZQueryStub do
      begin
        Close;
        DataMod.ZQueryStub.Params[0].AsString:=SocNum;
        DataMod.ZQueryStub.Params[1].AsDateTime:=BegDate;
        Open;
        Last;
        PayStubInfo.PGross:=FieldByName('GROSS').AsFloat;
        PayStubInfo.PNet:=FieldByName('NET').AsFloat;
        PayStubInfo.PFed:=FieldByName('FED').AsFloat;
        PayStubInfo.PFICA:=FieldByName('FICA').AsFloat;
        PayStubInfo.PMed:=FieldByName('MED').AsFloat;
        PayStubInfo.PStait:=FieldByName('STATE').AsFloat;
        PayStubInfo.PLocal:=FieldByName('LOCAL').AsFloat;
        PayStubInfo.PPen:=FieldByName('PENSION').AsFloat;
        PayStubInfo.PRate:=FieldByName('RATE').AsFloat;
        PayStubInfo.PHours:=FieldByName('HOURS').AsFloat;
        PayStubInfo.PSocNo:=FieldByName('SOC_SEC_NO').AsString;
        PayStubInfo.PCheckNo:=FieldByName('PCHECK_NO').AsInteger;
        PayStubInfo.PDate:=DateToStr(FieldByName('PAY_DATE').AsDateTime);
        //PayStubInfo.PName:=GetNameFromSoc(PayStubInfo.PSocNo);
        PayStubInfo.PName := GetNameFromSoc(String(PayNameLUCB.Keyvalue));
        doPayLabel(PayStubInfo.PSocNo);
        PayStubInfo.PD1:=FieldByName('DEDUCT1').AsFloat;
        PayStubInfo.PD2:=FieldByName('DEDUCT2').AsFloat;
        PayStubInfo.PD3:=FieldByName('DEDUCT3').AsFloat;
        PayStubInfo.PD4:=FieldByName('DEDUCT4').AsFloat;
        PayStubInfo.PD5:=FieldByName('DEDUCT5').AsFloat;
      end;
    Datamod.ZTblPayroll.close;
      Datamod.ZTblPayroll.open;

end;

procedure TCheckForm.GridDPDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  WRect: TRect = (Left: 0; Top: 0; Right: 0; Bottom: 0);
var
  TmpStr: String;
  X,Y,Tmp: Integer;
  F: Double;
  sz: TSize;
begin
  //exit;
  Column.Font.color := clBlack;
  if DataCol <> 1 then exit; //AMOUNT
  F := GridDp.DataSource.DataSet.FieldByName('AMOUNT').AsFloat;
  With GridDP.Canvas do
    begin
      if F < 0.0 then
        Font.color := clRed
      else
        Font.color := clBlack;
      Y:=Rect.Top;
      Brush.color:=clWhite;
      WRect.Left:=Rect.Left;
      WRect.Top:=Rect.Top;
      WRect.Bottom:=Rect.Bottom;
      WRect.Right:=Rect.Right;
      FillRect(WRect);
      TmpStr := format('%*.*f', [8, 2,F]);
      sz := TextExtent(TmpStr);
       X := (Rect.Right - sz.cx - 3);// - sz.cx);
      TextOut(X,Y+2,TmpStr);
    end;
end;

procedure TCheckForm.DPNavClick(Sender: TObject; Button: TDBNavButtonType);
begin
  if not DataMod.ZTblDP.active then DataMod.ZTblDP.Open;
end;


Function TCheckForm.ScriptMoney(MLeft,MRite: Integer):String;
Var
  Thou,Hun,Ten,One,TmpInt1,Lint:    Integer;
  TmpStr,Tmod:              String;
begin
  Tmod:='';
  TmpStr:='';
  Lint:=MLeft;
  If (MLeft+MRite>0) and (MLeft<10000) Then
     begin
      If MLeft>0 then
          Begin
            Thou:=Lint DIV 1000;
            Lint:=Lint-(Thou*1000);
            Hun:=Lint DIV 100;
            Lint:=Lint-(Hun*100);
            Ten:=Lint DIV 10;
            One:=Lint MOD 10;
            If Thou>0 then
               TmpStr:=Script[Thou]+' Thousand ';
            If Hun>0 then
               TmpStr:=TmpStr+Script[Hun]+' Hundred ';
            If Ten=0 then
               Tmod:=Script[One]
            Else If Ten=1 Then
               begin
                 If One=0 then
                    Tmod:='Ten'
                 Else If One=1 then
                    Tmod:='Eleven'
                 Else If One=2 then
                    Tmod:='Twelve'
                 Else If One=3 then
                    Tmod:='Thirteen'
                 Else If One=4 then
                    Tmod:='Fourteen'
                 Else If One=5 then
                    Tmod:='Fifteen'
                 Else If One>5 then
                    Tmod:=Script[One]+'teen'
               end
            Else If Ten>1 then
               Tmod:=Scripty[Ten]+Script[One];
          end;
       TmpStr:=TmpStr+Tmod+' And '+IntToStr(MRite)+'/100';
     end;
  Result:=TmpStr;
end;

function TCheckForm.MonToStr(Money: Double):String;
var
  LeftN,RiteN,Dot:  Integer;
  LeftStr,RiteStr,MonStr:  String;
begin
  MonStr:=FormatFloat('0.00',Money);
  LeftStr:='';
  Dot:=Pos('.',MonStr);
  If Dot>1 then
     LeftStr:=Copy(MonStr,1,Dot-1);
  RiteStr:=Copy(MonStr,Dot+1,2);
  If Length(RiteStr)=1 Then
     RiteStr:=RiteStr+'0';
  LeftN:=StrToInt(LeftStr);
  RiteN:=StrToInt(RiteStr);
  Result:=ScriptMoney(LeftN,RiteN);
end;

function TCheckForm.getSocFromName(NM: String): String;
begin
   With DataMod.ZQuerySocPay do
     begin
      If not Prepared then Prepare;
      Close;
      Params[0].AsString := NM;
      Open;
      result := Fields[0].AsString;
    end;
end;
function TCheckForm.FindPayroll(SocNo: String):Boolean;
begin
  With DataMod.ZQueryPayroll do
    begin
      If not Prepared then Prepare;
      Close;
      Params[0].AsString := SocNo;
      Open;
      result := (RecordCount > 0);
    end;
end;

procedure TCheckForm.GetDedType(Var D1,D2,D3,D4,D5: Integer);   //Return by side effect
var
  Acc1, Acc2, Acc3, Acc4, Acc5: Integer;
begin
  D1:=0;D2:=0;D3:=0;D4:=0;D5:=0;
  With DataMod.ZQueryPayroll do
   begin
    if findPayroll(PayStubInfo.PSocNo) then
      begin
       Acc1 := FieldByName('Deduct1_Acc').AsInteger;
       Acc2 := FieldByName('Deduct2_Acc').AsInteger;
       Acc3 := FieldByName('Deduct3_Acc').AsInteger;
       Acc4 := FieldByName('Deduct4_Acc').AsInteger;
       Acc5 := FieldByName('Deduct5_Acc').AsInteger;

       IF Acc1 > 0 then
          D1:=getAccType(Acc1);
       IF Acc2 > 0 then
          D2:=getAccType(Acc2);
       IF Acc3 > 0 then
          D3:=getAccType(Acc3);
       IF Acc4 > 0 then
          D4:=getAccType(Acc4);
       IF Acc5 > 0 then
          D5:=getAccType(Acc5);
      end;
   end;
end;

procedure TCheckForm.PrintBtnClick(Sender: TObject);
var
  IDX: Integer;
begin
  If GrossEd.Text='' then exit;
  With EZPSClass do
    begin
     // fName := 'paystub' + '-' + EmpLookup.Field.Text+'-'+DateToStr(Date)+'.ps';
     fName := 'paystub' + '-'+DateToStr(Date)+'.ps';
      OpenPrintFile(fName);
      //LineSpacing := 0.30;
      SetPageMargins(0.1,0.5,0.5,0.5);
      Home;
      NewLine;
      NewLine;
      NewLine;
      doPayPrint(PayStubInfo, LineSpacing);
      For IDX:=1 to 18 do
        NewLine;
      doPayPrint(PayStubInfo, LineSpacing);
    end;
end;

function TextToFloat(InStr: String): Double;
begin
  Try
    Result:=StrToFloat(InStr);
  except
    Result:=0.0;
  end;
end;

procedure TCheckForm.doPayPrint(Info: PayInfo; BH: Double);
const
  TABLISTINDEX = 1;
var
  TaxTotal: Double;
  DedType: Array[1..5] of Integer;
  TmpTab: PTab;
  PayFont: FontType;
begin
  With Info do
    begin
      GetDedType(DedType[1],DedType[2],DedType[3],DedType[4],DedType[5]);
      TaxTotal:=PFed+PFICA+PMed+PStait+PLocal+PD1+PD2+PD3+PD4+PD5;
    end;
  With EZPSClass do
    begin
      PayFont.FontName := HELVETICA;
      PayFont.FontSize := 8;
      Font := PayFont;
      setTabBoxHeight(1,BH);

      PrintCenterPage('Pay Stub');
      TmpTab := NewTab(TABLISTINDEX,0.5,JUSTIFYLEFT,1.875,0.05,False,BOXLINEALL,1);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYLEFT,1.875,0.05,True,BOXLINEALL,1);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYLEFT,1.875,0.05,True,BOXLINEALL,1);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYLEFT,1.875,0.05,True,BOXLINEALL,1);
      NewLine;
      NewLine;

      ResetTab(TABLISTINDEX);
      printTab(TABLISTINDEX,'Check No');
      printTab(TABLISTINDEX,'Soc Sec#');
      printTab(TABLISTINDEX,'Name');
      printTab(TABLISTINDEX,'Pay Date');

      NewLine;
      ResetTab(TABLISTINDEX);
      printTab(TABLISTINDEX, IntToStr(Info.PCheckNo));
      printTab(TABLISTINDEX, Info.PSocNo);
      printTab(TABLISTINDEX, Info.PName);
      printTab(TABLISTINDEX, Info.PDate);

      NewLine;
      FreeTabs(TABLISTINDEX);
      setTabBoxHeight(1,BH);

      TmpTab := NewTab(TABLISTINDEX,0.5,JUSTIFYCENTER,2.5,0.05,False,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,2.5,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,2.5,0.05,True,BOXLINEALL,0);

      ResetTab(TABLISTINDEX);
      printTab(TABLISTINDEX, 'EARNINGS');
      printTab(TABLISTINDEX, 'TAXES');
      printTab(TABLISTINDEX, 'OTHER DEDUCTIONS');
      FreeTabs(TABLISTINDEX);
      //setTabFont(TABLISTINDEX, 10,HELVETICA);

      NewLine;
      FreeTabs(TABLISTINDEX);
      setTabBoxHeight(1,BH);


      TmpTab := NewTab(TABLISTINDEX,0.5,JUSTIFYRIGHT,0.834,0.05,False,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.834,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.833,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.833,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYLEFT,0.834,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.833,0.05,True,BOXLINEALL,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.833,0.05,True,BOXLINEALL,0);

      ResetTab(TABLISTINDEX);
      printTab(TABLISTINDEX, 'Hours');
      printTab(TABLISTINDEX, 'Rate');
      printTab(TABLISTINDEX, 'Amnt');
      printTab(TABLISTINDEX, 'Tax');
      printTab(TABLISTINDEX, 'Current');
      printTab(TABLISTINDEX, 'YTD');
      printTab(TABLISTINDEX, 'Deduct');
      printTab(TABLISTINDEX, 'Current');
      printTab(TABLISTINDEX, 'YTD');

      NewLine;
      FreeTabs(TABLISTINDEX);

      setTabBoxHeight(1,BH);

      TmpTab := NewTab(TABLISTINDEX,0.5,JUSTIFYRIGHT,0.833,0.05,False,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYLEFT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYLEFT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINELEFT,0);
      TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINELEFT+BOXLINERIGHT,0);

      ResetTab(TABLISTINDEX);
      printTab(TABLISTINDEX, FormatFloat('0',Info.PHours));
      printTab(TABLISTINDEX, FormatFloat('0.00',Info.PRate));
      printTab(TABLISTINDEX, FormatFloat('0.00',Info.PGross));
      PrintTab(TABLISTINDEX, 'FIT W/H');
      printTab(TABLISTINDEX, FormatFloat('0.00',Info.PFed));
      printTab(TABLISTINDEX, CheckForm.FedEd.Text);

      if (Info.PPen>0.0) then
        begin
          printTab(TABLISTINDEX, 'Pension');
          printTab(TABLISTINDEX, FormatFloat('0.00',Info.PPen));
          printTab(TABLISTINDEX, CheckForm.PenEd.Text);
        end
     else
        begin
           printTab(TABLISTINDEX,'');
           printTab(TABLISTINDEX,'');
           printTab(TABLISTINDEX,'');
        end;

      NewLine;
      printTab(TABLISTINDEX,'');
      printTab(TABLISTINDEX,'');
      printTab(TABLISTINDEX,'');
      printTab(TABLISTINDEX,'FICA');
      printTab(TABLISTINDEX, FormatFloat('0.00',Info.PFICA));
      printTab(TABLISTINDEX, CheckForm.FICAEd.Text);

      if (Info.PD1>0.0) and (DedType[1]=9) then        //Second set of columns
        begin
          printTab(TABLISTINDEX,Copy(CheckForm.LabelRDed1.Caption,1,10));
          PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD1));
          PrintTab(TABLISTINDEX, CheckForm.EditRDed1.Text);
        end
       else
         begin
           printTab(TABLISTINDEX,'');
           printTab(TABLISTINDEX,'');
           printTab(TABLISTINDEX,'');
         end;

       NewLine;
       printTab(TABLISTINDEX,'');
       printTab(TABLISTINDEX,'');
       printTab(TABLISTINDEX,'');
       printTab(TABLISTINDEX,'Medicare');
       printTab(TABLISTINDEX,FormatFloat('0.00',Info.PMed));
       PrintTab(TABLISTINDEX, CheckForm.MedEd.Text);

       If (Info.PD2>0.0) and (DedType[1]=9) then
          begin
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed2.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD2));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed2.Text);
          end
        else
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
          end;

        NewLine;
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, 'PA');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PStait));
        PrintTab(TABLISTINDEX, CheckForm.StEd.Text);

         If (Info.PD3>0.0) and (DedType[1]=9) then
           begin
             PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed3.Caption,1,10));
             PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD3));
             PrintTab(TABLISTINDEX, CheckForm.EditRDed3.Text);
           end
         else
           begin
             PrintTab(TABLISTINDEX, '');
             PrintTab(TABLISTINDEX, '');
             PrintTab(TABLISTINDEX, '');
          end;

        NewLine;
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, 'Local');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PLocal));
        PrintTab(TABLISTINDEX, CheckForm.LocEd.Text);

        If (Info.PD4>0.0) and (DedType[1]=9) then
          begin
        PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed4.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD4));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed4.Text);
          end
        else
          begin
            PrintTab(TABLISTINDEX, '');
            printTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
          end;

        NewLine;
        If (Info.PD1>0.0) and (DedType[1]=8) then
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed1.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD1));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed1.Text);
            If (Info.PD5>0.0) and (DedType[5]=9) then
              begin
                PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed5.Caption,1,10));
                PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD5));
                PrintTab(TABLISTINDEX, CheckForm.EditRDed5.Text);
                NewLine;
              end
            else
              begin
                PrintTab(TABLISTINDEX, '');
                PrintTab(TABLISTINDEX, '');
                PrintTab(TABLISTINDEX, '');
                NewLine;
              end;
          end
        else if (Info.PD5>0.0) and (DedType[1]=9) then
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed5.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD5));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed5.Text);
            NewLine;
          end;

        If (Info.PD2>0.0) and (DedType[2]=8) then
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed2.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD2));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed2.Text);
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            NewLine;
          end;
        If (Info.PD3>0.00) and (DedType[3]=9) then
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed3.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD3));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed3.Text);
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            NewLine;
          end;

        If (Info.PD4>0.00) and (DedType[4]=9) then
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed4.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD4));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed4.Text);
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            NewLine;
          end;

        If (Info.PD5>0.0) and (DedType[5]=9) then
          begin
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, Copy(CheckForm.LabelRDed5.Caption,1,10));
            PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PD5));
            PrintTab(TABLISTINDEX, CheckForm.EditRDed5.Text);
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            PrintTab(TABLISTINDEX, '');
            NewLine;
          end;
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, '');
        NewLine;

        FreeTabs(TABLISTINDEX);
        setTabBoxHeight(1,BH);

        TmpTab := NewTab(TABLISTINDEX,0.5,JUSTIFYRIGHT,0.834,0.05,False,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.834,0.05,True,BOXLINEALL,1);

        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,0.834,0.05,True,BOXLINEALL,1);

        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.833,0.05,True,BOXLINEALL,0);

        PrintTab(TABLISTINDEX, FormatFloat('0',Info.PHours));
        PrintTab(TABLISTINDEX, '');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PGross));
        PrintTab(TABLISTINDEX, 'Totals');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',TaxTotal));
        PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PYTDTotal));
        PrintTab(TABLISTINDEX, 'Totals');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PPen));
        PrintTab(TABLISTINDEX, CheckForm.PenEd.Text);
        NewLine;

        FreeTabs(TABLISTINDEX);
        setTabBoxHeight(1,BH);

        TmpTab := NewTab(TABLISTINDEX,0.5,JUSTIFYCENTER,1.666,0.05,True,BOXLINEALL,2);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.834,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,2.5,0.05,True,BOXLINELEFT+BOXLINETOP,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYCENTER,1.666,0.05,True,BOXLINEALL,0);
        TmpTab := NewTab(TABLISTINDEX,0.0,JUSTIFYRIGHT,0.834,0.05,True,BOXLINEALL,0);

        PrintTab(TABLISTINDEX, 'Gross Pay YTD');
        PrintTab(TABLISTINDEX, CheckForm.GrossEd.Text);
        PrintTab(TABLISTINDEX, ' ');
        PrintTab(TABLISTINDEX, 'NetPay');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',Info.PNet));
        NewLine;
        PrintTab(TABLISTINDEX, 'Net Pay YTD');
        PrintTab(TABLISTINDEX, FormatFloat('0.00',TextToFloat(CheckForm.NetEd.Text)));
        FreeTabs(TABLISTINDEX);
     end; //do
end;

procedure TCheckForm.ClearPay;
var
  Chk:   Integer;
begin
      HoursEdit.Text:='';
      PayLookup.Text:='';
      GrossEdit.Text:='';
      FedEdit.Text:='';
      FICAEdit.Text:='';
      MedEdit.Text:='';
      StateEdit.Text:='';
      LocalEdit.Text:='';
      NetEdit.Text:='';
      ScriptLabel1.Caption:='';
      PayAmountLabel.Caption:='';
      VendorLabel1.Caption:='';

     { DataMod.ZTblTempChecks.Last;
      Chk:=DataMod.ZTblChecks.Fields[0].AsInteger+1;
      DataMod.ZTblChecks.Insert;
      DataMod.ZTblChecks.Fields[0].AsInteger:=Chk;
      DataMod.ZTblChecks.Fields[2].AsString:=DateToStr(Date);
      CheckLabel.Caption:=PayCheck.Text;
      PayDateLabel.Caption:=PayCheckDate.Text;
      AccTbl.Insert;   }
      HoursEdit.SetFocus;
      PayLookup.Enabled:=False;
end;

procedure TCheckForm.doAccCancel;
    begin
      DataMod.ZTblTempTrans.Cancel;
      ComboAcc.Visible:=True;
      AccEd.Visible:=True;
      AccDel.Visible:=True;
      AccEditPost.Visible:=False;
      AccCan.Visible:=False;
      FixTranGrid.Enabled:=False;
      try
        DataMod.SQLTransactionEZ.RollBack;
        FixChkGrid.Enabled:=true;
        FIxTranGrid.Enabled:=true;
        FixChkGrid.Datasource.DataSet.Active:=true;
        FixTranGrid.Datasource.DataSet.Active:=true;
      finally
    end;

end;


function TCheckForm.FmtAccountNo(Const Account: String): Integer;
var
  Temp: String;
  IDX: Integer;
begin
  Temp:='';
  for IDX:=1 to Length(Account) do
    If (Account[IDX]<'0') or (Account[IDX]>'9') then
       break
    else
       Temp:=Temp+Account[IDX];
  try
    If Temp='' then
      Result:=-1
    else
      Result:=StrToInt(Temp);
  except
    Result:=-1;
  end;
end;

procedure TCheckForm.initDates;
var
  Year,Month,Day: Word;
begin
  DecodeDate(Date,Year,Month,Day);
  YearEd.Text:=IntToStr(Year);
  EditRetYear.Text:=YearEd.Text;
  MonthEd.Text:=IntToStr(Month);
  FromDt.Text:=DateToStr(BegMonth(StrToInt(YearEd.Text),1));
  ToDt.Text:=DateToStr(EndMonth(StrToInt(YearEd.Text),Month));
  doCheckSrchClr;
  doTranSrchClr;
  EditStubDate.Text:=DateToStr(Date);
  PayCheckDate.Text:=DateToStr(Date);
  CheckDate.Text:=DateToStr(Date);
  PDEd.Text:=DateToStr(Date);
  {CDateEd.Text:=DateToStr(Date); }
end;

function TCheckForm.doStartTran: Boolean;
var
  TmpRes, CkFound: Boolean;
  AccNo: Integer;
begin
  With CheckForm do
    begin
      TmpRes:=(CheckEdit.Text<>'') and (CheckAmount.Text<>'') and (CheckDate.Text<>'')
         and (ComboVendor.Text<>'') and (ComboAcc.Text<>'');
       If TmpRes=True then
           CkFound :=CheckForm.ZFindKey('TEMP_CHECKS', 'CHECK_NO', 'FALSE', StrToInt(CheckEdit.Text));
       If TmpRes=True then
          With DataMod.ZTblTempTrans do
           try
               if CkFound then
                 begin
                   ShowMessage('Check number '+CheckEdit.Text+' has already been used!');
                   TmpRes:=False;
                 end
              else
                 try
                  // DataMod.IBConnectionEZ.StartTransaction;
                   Insert;
                   FieldByName('CHECK_NO').AsString:=CheckEdit.Text;
                   AccNo := GetAccountNo(ComboAcc.Text);
                   FieldByName('ACCOUNT').AsInteger:=AccNo;
                   FieldByName('ACC_TYPE').AsInteger:=GetAccType(AccNo);
                   FieldByName('CHECK_DATE').AsString:=CheckDate.Text;
                   FieldByName('AMOUNT').AsFloat:=StrToFloat(CheckAMount.Text);
                   Post;
                   TmpRes:=True;
                 except
                   DataMod.ZTblTempTrans.Cancel;
                   Result:=False;
                 end;
              except
                Result:=False;
              end;
         Result:=TmpRes;
         if Result then inc(AccPtr);
      end;
end;

procedure TCheckForm.doBlankCheck;
var
  Chk: Integer;
begin
  initOpen;
  DataMod.ZTblBalance.First;
  Chk:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsInteger;
  CheckEdit.Text:=IntToStr(Chk);
  CheckLabel.Caption:=IntToStr(Chk);
  ScriptLabel.Caption:='';
  ComboAcc.Text:='';
  AccPtr:=0;
  ComboVendor.Enabled:=True;
  AmountLabel.Caption:='';
  VendorLabel.Caption:='';
  MemoLabel.Caption:='';
  DateLabel.Caption:='';
  CheckAmount.Text:='';
  CheckMemo.Text:='';
  CheckDate.Enabled:=True;
 end;

procedure TCheckForm.doRefresh;
begin
  DataMod.ZTblBalance.Close;
  DataMod.ZTblBalance.Open;
  DataMod.ZTblBalance.First;
  DataMod.ZTblChecks.Close;
  DataMod.ZTblChecks.Open;
  DataMod.ZTblChecks.Last;
  DataMod.ZTblTempChecks.Close;
  DataMod.ZTblTempChecks.Open;
  DataMod.ZTblTempChecks.Last;
end;


procedure TCheckForm.hideDeduct;
begin
  EditDed1.Visible:=False;
  BtnDed1.Visible:=False;
  LabelDed1.Visible:=False;
  EditDed2.Visible:=False;
  BtnDed2.Visible:=False;
  LabelDed2.Visible:=False;
  EditDed3.Visible:=False;
  BtnDed3.Visible:=False;
  LabelDed3.Visible:=False;
  EditDed4.Visible:=False;
  BtnDed4.Visible:=False;
  LabelDed4.Visible:=False;
  EditDed5.Visible:=False;
  BtnDed5.Visible:=False;
  LabelDed5.Visible:=False;
end;

procedure TCheckForm.doDedArray(GrossAmnt: Double);
var
  Tax: Double;
begin
  Deduction[0]:=0.0;Deduction[1]:=0.0;Deduction[2]:=0.0;
  Deduction[3]:=0.0;Deduction[4]:=0.0;Deduction[5]:=0.0;
  With DataMod.ZTblPayRoll do
    begin
      LabelPen.Visible:=False;
      LabelDed1.Visible:=False;
      LabelDed2.Visible:=False;
      LabelDed3.Visible:=False;
      LabelDed4.Visible:=False;
      LabelDed5.Visible:=False;
      BtnDed1.Visible:=False;
      BtnDed2.Visible:=False;
      BtnDed3.Visible:=False;
      BtnDed4.Visible:=False;
      BtnDed5.Visible:=False;
      PenEdit.visible:=False;
      EditDed1.Visible:=False;
      EditDed2.Visible:=False;
      EditDed3.Visible:=False;
      EditDed4.Visible:=False;
      EditDed5.Visible:=False;
      Tax:=FieldByName('Pension').AsFloat;
      DedAccounts[0]:=FieldByName('PENSION_ACCOUNT').AsInteger;
      If Tax>0.0 then
        begin
           LabelPen.Visible:=True;
           FlatTax[0]:=0.0;
           PenEdit.Visible:=True;
           Deduction[0]:=Tax;
           If Tax<0.5 then
              Deduction[0]:=Deduction[0]*GrossAmnt;
           PenEdit.Text:=FormatFloat('0.00',Deduction[0]);
        end;

      Tax:=FieldByName('Deduct1').AsFloat;
      DedAccounts[1]:=FieldByName('DEDUCT1_ACC').AsInteger;
      If Tax>0.0 then
         begin
           FlatTax[1]:=0.0;
           EditDed1.Visible:=True;
           LabelDed1.Visible:=True;
           Deduction[1]:=Tax;
           If Tax<0.5 then
              Deduction[1]:=Deduction[1]*GrossAmnt
           else
             begin
               FlatTax[1]:=Tax;
               BtnDed1.Visible:=True;
               Deduction[1]:=0.0;
             end;
           EditDed1.Text:=FormatFloat('0.00',Deduction[1])
         end;

         Tax:=FieldByName('Deduct2').AsFloat;
         DedAccounts[2]:=FieldByName('DEDUCT2_ACC').AsInteger;
         If Tax>0.0 then
         begin
           Tax:=FieldByName('Deduct2').AsFloat;
           FlatTax[2]:=0.0;
           EditDed2.Visible:=True;
           LabelDed2.Visible:=True;
           Deduction[2]:=Tax;
           If Tax<0.5 then
              Deduction[2]:=Deduction[2]*GrossAmnt
           else
             begin
               FlatTax[2]:=Tax;
               BtnDed2.Visible:=True;
               Deduction[2]:=0.0;
             end;
           EditDed2.Text:=FormatFloat('0.00',Deduction[2])
         end;

         Tax:=FieldByName('Deduct3').AsFloat;
         DedAccounts[3]:=FieldByName('DEDUCT3_ACC').AsInteger;
         If Tax>0.0 then
         begin
           Tax:=FieldByName('Deduct3').AsFloat;
           FlatTax[3]:=0.0;
           EditDed3.Visible:=True;
           LabelDed3.Visible:=True;
           Deduction[3]:=Tax;
           If Tax<0.5 then
              Deduction[3]:=Deduction[3]*GrossAmnt
           else
             begin
               FlatTax[3]:=Tax;
               BtnDed3.Visible:=True;
               Deduction[3]:=0.0;
             end;
           EditDed3.Text:=FormatFloat('0.00',Deduction[3])
         end;

         Tax:=FieldByName('Deduct4').AsFloat;
         DedAccounts[4]:=FieldByName('DEDUCT4_ACC').AsInteger;
         If Tax>0.0 then
         begin
           Tax:=FieldByName('Deduct4').AsFloat;
           FlatTax[4]:=0.0;
           EditDed4.Visible:=True;
           LabelDed4.Visible:=True;
           Deduction[4]:=Tax;
           If Tax<0.5 then
              Deduction[4]:=Deduction[4]*GrossAmnt
           else
             begin
               FlatTax[4]:=Tax;
               BtnDed4.Visible:=True;
               Deduction[4]:=0.0;
             end;
           EditDed4.Text:=FormatFloat('0.00',Deduction[4])
         end;

         Tax:=FieldByName('Deduct5').AsFloat;
         DedAccounts[5]:=FieldByName('DEDUCT5_ACC').AsInteger;
         If Tax>0.0 then
         begin
           Tax:=FieldByName('Deduct5').AsFloat;
           FlatTax[5]:=0.0;
           EditDed5.Visible:=True;
           LabelDed5.Visible:=True;
           Deduction[5]:=Tax;
           If Tax<0.5 then
              Deduction[5]:=Deduction[5]*GrossAmnt
           else
             begin
               FlatTax[5]:=Tax;
               BtnDed5.Visible:=True;
               Deduction[5]:=0.0;
             end;
           EditDed5.Text:=FormatFloat('0.00',Deduction[5])
         end;
    end; {With DataMod.ZTblPayRoll}
end;

function TCheckForm.FindSocNo(Soc: String): Boolean;
begin
  With DataMod.ZQueryPayroll do
    begin
      if not prepared then prepare;
      close;
      params[0].AsString := Soc;
      open;
      result := (RecordCount > 0);
    end;
end;

procedure TCheckForm.doPayCheck;
var
  PName,SocNo:   String;
  Hours,Rate:  Double;
begin
  FedTax:=0.0;FICATax:=0.0;MedTax:=0.0;StateTax:=0.0;LocalTax:=0.0;
  NetWage:=0.0;GrossWage:=0.0;Pension:=0.0;
  if HoursEdit.Text<>'' then
     try
       PayFlag:=True;
       Hours:=StrToFloat(HoursEdit.Text);
       PName:=PayLookup.Text;
       SocNo:=SocList.Strings[PayLookUp.ItemIndex];
       VendorLabel1.Caption:=PName;
       With DataMod.ZQueryPayRoll do
          begin
            close;
            Params[0].AsString := SocNo;
            Open;
            If FieldByName('SOC_SEC_NO').AsString ='' then exit;
            Rate:=FieldByName('WAGE').AsFloat;
            GrossWage:=Hours*Rate;
            doDedArray(GrossWage); {Get other deductions if any}
            doPayLabel(SocNo);
            FedTax:=(GrossWage-Pension)*FieldByName('FED').AsFloat;
            FICATax:=(GrossWage-Pension)*FieldByName('FICA').AsFloat;
            MedTax:=(GrossWage-Pension)*FieldByName('MED').AsFloat;
            StateTax:=GrossWage*FieldByName('STATE').AsFloat;
            LocalTax:=GrossWage*FieldByName('LOCAL').AsFloat;
            GrossEdit.Text:=FormatFloat('0.00',GrossWage);
            FedEdit.Text:=FormatFloat('0.00',FedTax);
            FICAEdit.Text:=FormatFloat('0.00',FICATax);
            MedEdit.Text:=FormatFloat('0.00',MedTax);
            StateEdit.Text:=FormatFloat('0.00',StateTax);
            LocalEdit.Text:=FormatFloat('0.00',LocalTax);
            PenEdit.Text:= FormatFloat('0.00',Deduction[0]);
            EditDed1.Text:=FormatFloat('0.00',Deduction[1]);
            EditDed2.Text:=FormatFloat('0.00',Deduction[2]);
            EditDed3.Text:=FormatFloat('0.00',Deduction[3]);
            EditDed4.Text:=FormatFloat('0.00',Deduction[4]);
            EditDed5.Text:=FormatFloat('0.00',Deduction[5]);
            NetWage:=GrossWage-AtoFloat(FedEdit.Text)-AtoFloat(FICAEdit.Text)-
                     AtoFloat(MedEdit.Text)-AtoFloat(StateEdit.Text)-
                     AtoFloat(LocalEdit.Text);
            If PenEdit.Text<>'' then
               NetWage:=NetWage-AtoFloat(PenEdit.Text);
            If EditDed1.Text<>'' then
               NetWage:=NetWage-AtoFloat(EditDed1.Text);
            If EditDed2.Text<>'' then
               NetWage:=NetWage-AtoFloat(EditDed2.Text);
            If EditDed3.Text<>'' then
               NetWage:=NetWage-AtoFloat(EditDed3.Text);
            If EditDed4.Text<>'' then
               NetWage:=NetWage-AtoFloat(EditDed4.Text);
            If EditDed5.Text<>'' then
               NetWage:=NetWage-AtoFloat(EditDed5.Text);
            NetEdit.Text:=FormatFloat('0.00',NetWage);
            FillPayCheck;
          end;
     except
       ShowMessage('Could not post pay check');
     end;
  end;

procedure TCheckForm.FillPayCheck;
begin
   try
      PayAmountLabel.Caption:=NetEdit.Text;
   finally
     CheckLabel.Caption:=PayCheck.Text;
     DateLabel1.Caption:=PayCheckDate.Text;
     LabelPayMemo.Caption:='Pay Check';
     VendorLabel1.Caption := PayLookup.Text;
     ScriptLabel1.Caption:=MonToStr(StrToFloat(NetEdit.Text));
   end;
end;

function TCheckForm.Kosher: Boolean;
var
  tmpAmount: Double;
begin
   Result:=False;
   try
     If ComboVendor.Text='' then
        ShowMessage('Must provide a vendor')
     Else if CheckEdit.Text='' then
        ShowMessage('Must provide a check number')
     Else if CheckDate.Text='' then
        ShowMessage('Must provide a check date ')
     Else if CheckAmount.Text='' then
        ShowMessage('Must provide an amount')
     Else if ComboAcc.Text='' then
        ShowMessage ('Must Provide an account description')
     Else if StrToFloat(CheckAmount.Text)<=0 then
        ShowMessage('Amount must be greater than zero')
     Else if StrToInt(CheckLabel.Caption)<=0 then
        ShowMessage('Bad check number')
     Else if StrToDate(DateLabel.Caption)<Date then
        ShowMessage('Date must be greater then yesterday')
     else if getAccountNo(ComboAcc.Text) < 0 then
        Result:=False
     else
        Result:=True
   Except
     ShowMessage('Bad check number or missing data ');
     Result:=False;
   end;
end;


function TCheckForm.MonDate(D: String):String;
Var
  TmpStr:   String;
  MonStr:   String;
  DayStr:   String;
  DayTmp:   Integer;
  YearStr:  String;
  TmpInt,Jnk:   Integer;
  MonInt:   Integer;
begin
   TmpStr:=D;
   TmpInt:=Pos('/',TmpStr);
   MonStr:=Copy(D,1,TmpInt-1);
   TmpStr:=Copy(D,TmpInt+1,8);
   TmpInt:=Pos('/',TmpStr);
   DayStr:=Copy(TmpStr,1,TmpInt-1);
   DayTmp:=StrToInt(DayStr);
   MonInt:=StrToInt(MonStr);
   If DayTmp<20 then MonInt:=MonInt-1;
   YearStr:=Copy(TmpStr,TmpInt+1,4);
   Result:=MonStr+' '+YearStr;
end;

function TCheckForm.prnMoney(MonStr: String):String;
var
  Dot: Integer;
  TmpStr: String;
begin
  If Pos('-',MonStr)=1 then
    TmpStr:='-$'+Copy(MonStr,2,12)
  else
    TmpStr:='$'+MonStr;
  Dot:=Pos('.',TmpStr);
  If Dot<=0 then
    TmpStr:=TmpStr+'.00'
  else if Length(TmpStr)-Dot=1 then
    TmpStr:=TmpStr+'0';
  TmpStr:=Front(TmpStr,8);
  result:=TmpStr;
end;

procedure TCheckForm.initEmpNames;
var
  Emp,SocNo: String;
  IDX: Integer;
begin
  IDX:=0;
  if not DataMod.ZTblPayroll.Active then
    DataMod.ZTblPayroll.open;
  DataMod.ZTblPayRoll.First;
  With DataMod.ZTblPayRoll do
    while not EOF do
      begin
        Emp:=FieldByName('Name').AsString;
        SocNo:=FieldByName('Soc_Sec_No').AsString;
        PayLookUp.Items.Add(Emp);
        EmpCombo.Items.Add(Emp);
        //EmpCombo.Items[IDX]:=PayLookUp.Items[IDX];
        SocList.Add(SocNo);
        inc(IDX);
        Next;
      end;
    EmpCombo.Items.Add('Everyone');
  //  EmpCombo.Items[IDX]:='Everyone';
end;

procedure TCheckForm.initVendor;
begin
  If not DataMod.ZTblVendor.Active then
    DataMod.ZTblVendor.Open;
  DataMod.ZTblVendor.First;
  With DataMod.ZTblVendor do
    while not EOF do
      begin
        ComboVendor.Items.Add(FieldByName('Vendor_Name').AsString);
        VendorLook.Items.Add(FieldByName('Vendor_Name').AsString);
        Next;
      end;
  DataMod.ZTblVendor.Close;
end;

procedure TCheckForm.initAccount;
var
  Account: String;
begin
  If not DataMod.ZTblAccounts.Active then
    DataMod.ZTblAccounts.Open;
  DataMod.ZTblAccounts.First;
  With DataMod.ZTblAccounts do
    while not EOF do
      begin
        Account:=FieldByName('Account').AsString;
        Account:=Account+copy('        ',1,8-Length(account))+
           FieldByName('Name').AsString;
        ComboAcc.Items.Add(Account);
        ComboTranAcc.Items.Add(Account);
        Next;
      end;
end;

procedure TCheckForm.initFunds;
var
  FundStr: String;
begin
  If DataMod.ZTblFund.Active=False then
     DataMod.ZTblFund.Open;
  DataMod.ZTblFund.First;
  With DataMod.ZTblFund do
    while not EOF do
      begin
        FundStr:=FieldByName('DETAIL_FUND_NO').AsString;
        FundStr:=FundStr+copy('        ',1,8-Length(FundStr))+
           FieldByName('DESCRIPTION').AsString;
        Next;
      end;
end;

{function TCheckForm.IndexOfName(IName: String; ArrDex: Integer): Integer;
var
  IX,IY,Equal,St,En: Integer;
  SubStr: String;
begin
  Result:=-1;
  If ArrDex>17 then exit;
  With HelpArr[ArrDex] do
     For IX:=0 to HelpArr[ArrDex].Count-1 do
       begin
         SubStr:=HelpArr[ArrDex].Strings[IX];
         Equal:=Pos('=',SubStr);
         If IName=copy(SubStr,1,Equal-1) then
           begin
             Result:=IX;
             Exit;
           end;
       end;
end;   }

{function TCheckForm.getValues(IDX,IDY: Integer):Integer;
var
  Str1,Str2: String;
  Equal: Integer;
begin
  With HelpArr[IDY] do
     begin
        Str1:=Strings[IDX];
        Equal:=Pos('=',Str1);
        Str2:=Copy(Str1,Equal+1,32);
        try
          Result:=StrToInt(Str2);
        except
          Result:=-1;
        end;
    end;
end;   }

procedure TCheckForm.SumPay(SocNum: String; FDate,EDate: TDateTime);
var
  Year, Month, Day: Word;
  YDate,FromDate,ToDate: TDateTime;
  GrossAmnt,NetAmnt,E941Amnt,FedAmnt,FICAAmnt,HourAmnt: Double;
  MedAmnt,StateAmnt,LocalAmnt,FedTot,NetTot,PenAmnt: Double;
  Ded1Amnt,Ded2Amnt,Ded3Amnt,Ded4Amnt,Ded5Amnt: Double;
  TranType,TmpName,TS: String;
  TranNo,TmpAccount: Integer;
begin
  {Screen.Cursor:=crHourGlass;  }
  DecodeDate(Date,Year, Month, Day);
  PenAmnt:=0.0;GrossAmnt:=0.0;NetAmnt:=0.0;
  E941Amnt:=0.0;FedAmnt:=0.0;FICAAmnt:=0.0;
  MedAmnt:=0.0;StateAmnt:=0.0;LocalAmnt:=0.0;
  Ded1Amnt:=0.0;Ded2Amnt:=0.0;Ded3Amnt:=0.0;Ded4Amnt:=0.0;Ded5Amnt:=0.0;
  NetTot:=0.0;
  HourAmnt:=0.0;

  With DataMod.ZQueryEmpSum do
    begin
      Close;
      Params[0].AsDateTime:=FDate;
      Params[1].AsDateTime:=EDate;
      Params[2].AsString:=SocNum;
      Open;
      First;
      HourAmnt:=Fields[0].AsFloat;
      NetAmnt:=Fields[1].AsFloat;
      GrossAmnt:=Fields[2].AsFloat;
      FedAmnt:=Fields[3].AsFloat;
      FICAAmnt:=Fields[4].AsFloat;
      MedAmnt:=Fields[5].AsFloat;
      StateAmnt:=Fields[6].AsFloat;
      LocalAmnt:=Fields[7].AsFloat;
      PenAmnt:=Fields[8].AsFloat;
      Ded1Amnt:=Fields[9].asFloat;
      Ded2Amnt:=Fields[10].asFloat;
      Ded3Amnt:=Fields[11].asFloat;
      Ded4Amnt:=Fields[12].asFloat;
      Ded5Amnt:=Fields[13].asFloat;

      If EmpCombo.Text='' then
         EmpCombo.Text:='EveryOne';
      E941Amnt:=2*(FICAAmnt+MedAmnt)+FedAmnt;
      Net.Text:=Format('%m',[NetAmnt]);
      StateEd.Text:=Format('%m',[StateAmnt]);
      LocalEd.Text:=Format('%m',[LocalAmnt]);
      Gross.Text:=Format('%m',[GrossAmnt]);
      Federal.Text:=Format('%m',[FedAmnt]);
      FICA.Text:=Format('%m',[FICAAmnt]);
      Medicare.Text:=Format('%m',[MedAmnt]);
      PenTextEdit.Text:=Format('%m',[PenAmnt]);
      HrTextEdit.Text:=FormatFloat('0.00',HourAmnt);
      EditVDed1.Text:=Format('%m',[Ded1Amnt]);
      EditVDed2.Text:=Format('%m',[Ded2Amnt]);
      EditVDed3.Text:=Format('%m',[Ded3Amnt]);
      EditVDed4.Text:=Format('%m',[Ded4Amnt]);
      EditVDed5.Text:=Format('%m',[Ded5Amnt]);
   end;
   {Screen.Cursor:=crDefault;}
end;

function getAccName(Acc,Ded: Integer): String;
begin
With CheckForm do
begin
  try
    DataMod.ZQueryAccName.Close;
    DataMod.ZQueryAccName.Params[0].AsInteger:=Acc;
    DataMod.ZQueryAccName.Open;
    Result := DataMod.ZQueryAccName.FieldByName('NAME').AsString;
    If Result = '' then
      result:='Deduction_'+IntToStr(Ded);
     Result:=copy(Result,1,15);
  except
    Result := 'Unknown';
  end;
end;
end;

procedure TCheckForm.doPayLabel(SocNo: String);
begin
  LabDed1.Caption:='Deduction1';
  LabDed2.Caption:='Deduction2';
  LabDed3.Caption:='Deduction3';
  LabDed4.Caption:='Deduction4';
  LabDed5.Caption:='Deduction5';
  With DataMod.ZTblPayRoll do
    If SocNo<>'%' then
      With DataMod.ZTblPayRoll do
        begin
         if FindSocNo(SocNo) then
            begin
              LabDed1.Caption:=
                 getAccName(FieldByName('Deduct1_Acc').AsInteger,1);
              LabDed2.Caption:=
                 getAccName(FieldByName('Deduct2_Acc').AsInteger,2);
              LabDed3.Caption:=
                 getAccName(FieldByName('Deduct3_Acc').AsInteger,3);
              LabDed4.Caption:=
                 getAccName(FieldByName('Deduct4_Acc').AsInteger,4);
              LabDed5.Caption:=
                 getAccName(FieldByName('Deduct5_Acc').AsInteger,5);
           end;
        end;
    LabelRDed1.Caption:=LabDed1.Caption;
    LabelRDed2.Caption:=LabDed2.Caption;
    LabelRDed3.Caption:=LabDed3.Caption;
    LabelRDed4.Caption:=LabDed4.Caption;
    LabelRDed5.Caption:=LabDed5.Caption;
    LabelDed1.Caption:=LabDed1.Caption;
    LabelDed2.Caption:=LabDed2.Caption;
    LabelDed3.Caption:=LabDed3.Caption;
    LabelDed4.Caption:=LabDed4.Caption;
    LabelDed5.Caption:=LabDed5.Caption;
end;

procedure TCheckForm.WriteScript(FAmnt: Double);
var
  TmpLeft,TmpRite,TmpInt: LongInt;
  TmpFloat:  Double;
begin
  TmpFloat:=FAmnt;
  TmpInt:=Trunc(TmpFloat)*100;
  TmpLeft:=Round(TmpFloat*100);
  TmpRite:=TmpLeft-TmpInt;
  TmpLeft:=TmpInt DIV 100;
  GlobalLeft:=GlobalLeft+TmpLeft;
  GlobalRite:=GlobalRite+TmpRite;
  If GlobalRite>100 then
     begin
       GlobalLeft:=GlobalLeft+1;
       GlobalRite:=GlobalRite-100;
     end;
  ScriptLabel.Caption:=ScriptMoney(GlobalLeft,GlobalRite);
end;

procedure TCheckForm.initBalance;
begin
  DataMod.ZQuerySumTempTrans.Close;
  DataMod.ZQuerySumTempTrans.Open;
  DataMod.ZQuerySumTempChecks.Close;
  DataMod.ZQuerySumTempChecks.Open;
  DataMod.ZQuerySumTempTrans.Close;
  DataMod.ZQuerySumTempTrans.Open;
  DataMod.ZTblChecks.Close;
  DataMod.ZTblChecks.Open;
  If DataMod.ZQuerySumTempChecks.Fields[0].AsFloat<>
     DataMod.ZQuerySumTempTrans.Fields[0].AsFloat then
     begin
       ShowMessage('Un-posted Checks total( '+
         FormatFloat('0.00',DataMod.ZQuerySumTempChecks.Fields[0].AsFloat)+
         ' do not equal Transactions( '+
         FormatFloat('0.00',DataMod.ZQuerySumTempTrans.Fields[0].AsFloat));
        ShowMessage('Please edit. ')
     end
  else
    begin
       DataMod.ZTblBalance.First;
      DataMod.ZTblBalance.Edit;
      DataMod.ZTblBalance.FieldByName('TEMPSUM').AsFloat:=
         DataMod.ZQuerySumTempChecks.Fields[0].AsFloat;
      DataMod.ZTblBalance.Post;
    end;
end;

function  TCheckForm.GetRet(SDate,EDate: TDateTime; Ret: Integer): Double;
begin
With DataMod.ZQuerySumReturn do
  try
    Close;
    Params[1].AsDateTime:=SDate;
    Params[2].AsDateTime:=EDate;
    Params[0].AsInteger:=Ret;
    Open;
    Result:=Fields[0].AsFloat;
  except
    ShowMessage('ZQuery for returned/unreturned checks failed');
    Result:=0.0;
  end;
end;

procedure TCheckForm.doRetSearch(SDate,EDate: TDateTime);
begin
  If RetCheck.Checked=True then
     RetSum.Text:=FormatFloat('0.00',GetRet(SDate,EDate,0))
  else
     RetSum.Text:=FormatFloat('0.00',GetRet(SDate,EDate,15000));

  With DataMod.ZQueryReturn do
     begin
       //DisableControls;
       Close;
       Params[1].AsDateTime:=SDate;
       Params[2].AsDateTime:=EDate;
       If RetCheck.Checked=True then
          Params[0].AsInteger:=0
       else
          Params[0].AsInteger:=15000;
       Open;
       First;
       //EnableControls;
    end;
     With DataMod.ZQuerySumReturn do
     begin
       //DisableControls;
       Close;
       Params[1].AsDateTime:=SDate;
       Params[2].AsDateTime:=EDate;
       If RetCheck.Checked=True then
          Params[0].AsInteger:=0
       else
          Params[0].AsInteger:=15000;
       Open;
       First;
       //EnableControls;
    end;
end;


procedure TCheckForm.DoCheckCancel(Chek: Integer);
begin
  {Screen.cursor:=crHourGlass;  }
  GlobalLeft:=0;
  GlobalRite:=0;
  try
    GlobalPost:=False;
    DataMod.SQLTransactionEZ.RollBack;
  finally
  doBlankCheck;
  DataMod.ZTblTempTrans.Close;
  DataMod.ZTblTempChecks.Close;
  DataMod.ZTblTempTrans.Open;
  DataMod.ZTblTempChecks.Open;
  DataMod.ZTblBalance.Close;
  DataMod.ZTblBalance.Open;
  DataMod.ZTblBalance.First;
  ShowMessage('All amounts and accounts for check '
               +IntToStr(Chek)+' have been canceled');
 end;
end;

procedure TCheckForm.doDPCan;
begin
  DataMod.ZTblDP.Close;
  DataMod.ZTblDP.Open;
  DataMod.ZTblBalance.Close;
  DataMod.ZTblBalance.Open;
  DataMod.ZTblBalance.First;
  DirPostBtn.Visible:=False;
  EditDPAmnt.Text:='';
  MemoDP.Text:='';
  EditDPAmnt.SetFocus;
end;

procedure TCheckForm.ShowCheckNo;
begin
  CheckEdit.Text:=DataMod.ZTblBalance.FieldByName('CHECKSEED').AsString;
  PayCheck.Text:=CheckEdit.Text;
  CheckLabel.Caption:=CheckEdit.Text;
  PayCheckLabel.Caption:=CheckEdit.Text;
end;

{function TCheckForm.TX(ST: TDataSetState):String;
begin
With CheckForm do
begin
  If ST=dsInactive then
     result:='Inactive'
  else if ST=dsBrowse then
     result:='Browse'
  else if ST=dsEdit then
     result:='Edit'
  else if ST=dsInsert then
     result:='Insert'
  else if ST=dsSetKey then
     result:='SetKey'
  else if ST=dsCalcFields then
     result:='CalcFields'
  else
     result:='Unknown';
end;
}
procedure TCheckForm.doTempTotals;
begin
   DataMod.ZQuerySumTempChecks.Close;
   DataMod.ZQuerySumTempChecks.Open;
   EditCheckTotal.Text:=
   FormatFloat('0.00',DataMod.ZQuerySumTempChecks.Fields[0].AsFloat);
   DataMod.ZQuerySumTempTrans.Close;
   DataMod.ZQuerySumTempTrans.Open;
   EditTranTotal.Text:=
   FormatFloat('0.00',DataMod.ZQuerySumTempTrans.Fields[0].AsFloat);
end;


procedure TCheckForm.fixCheckAmount;
var
  CheckSum: Double;
begin
  CheckSum:=0.0;
       With DataMod.ZTblTempTrans do
         begin
           First;
           While not EOF do
             begin
               CheckSum:=CheckSum+FieldByName('AMOUNT').AsFloat;
               Next;
             end;
         end;
       With DataMod.ZTblTempChecks do
         try
           Edit;
           FieldByName('AMOUNT').AsFloat:=CheckSum;
           Post;
         except
           ShowMessage('There was an error in the check sum.');
         end;
end;

procedure TCheckForm.doClearViewPay;
begin
 EditVDed1.Text:='';
 EditVDed2.Text:='';
 EditVDed3.Text:='';
 EditVDed4.Text:='';
 EditVDed5.Text:='';
 EmpCombo.Text:='';
 PenTextEdit.Text:='';
 Gross.Text:='';
 Federal.Text:='';
 FICA.Text:='';
 Medicare.Text:='';
 Net.Text:='';
 StateEd.Text:='';
 LocalEd.Text:='';
 HrTextEdit.Text:='';
end;


procedure TCheckForm.CheckHelpOpen;
begin
  if HForm <> nil then
    if not HForm.visible then
       HForm.visible := true;

  if HForm = nil then
       HForm := THelpForm.Create(Self);
  HForm.ShowOnTop;
end;

procedure TCheckForm.initDisplay;
var
  I: Integer;
begin
   With DataMod.ZQueryTrans do
     begin
       FieldByName('ACCOUNT').DisplayLabel:='ACCOUNT';
       FieldByName('ACCOUNT').DisplayWidth:=7;
       FieldByName('AMOUNT').DisplayLabel:=' AMOUNT';
       FieldByName('AMOUNT').DisplayWidth:=9;
       FieldByName('CHECK_NO').DisplayLabel:=' CHECK';
       FieldByName('CHECK_NO').DisplayWidth:=7;
       FieldByName('TRAN_TYPE').DisplayLabel:=' DESCRIPTION';
       FieldByName('TRAN_TYPE').DisplayWidth:=23;
       FieldByName('TRAN_DATE').DisplayLabel:=' DATE';
       FieldByName('TRAN_DATE').DisplayWidth:=10;
     end;
   With DataMod.ZQueryChecks do
     begin
       FieldByName('CHECK_NO').DisplayLabel:=' CHECK';
       FieldByName('CHECK_NO').DisplayWidth:=7;
       FieldByName('AMOUNT').DisplayWidth:=8;
       FieldByName('VENDOR').DisplayWidth:=20;
       FieldByName('CHECK_DATE').DisplayLabel:=' DATE';
       FieldByName('CHECK_DATE').DisplayWidth:=10;
     end;
   With DataMod.ZTblCheckTrans do
     begin
       FieldByName('CHECK_NO').DisplayLabel:=' CHECK';
       FieldByName('CHECK_NO').DisplayWidth:=7;
       FieldByName('ACCOUNT').DisplayWidth:=20;
       FieldByName('AMOUNT').DisplayWidth:=9;
       FieldByName('TRAN_TYPE').DisplayLabel:=' TYPE';
       FieldByName('TRAN_TYPE').DisplayWidth:=8;
       FieldByName('TRAN_DATE').DisplayLabel:=' DATE';
       FieldByName('TRAN_DATE').DisplayWidth:=10;
     end;
   With DataMod.ZTblDP do
     begin
       FieldByName('AMOUNT').DisplayWidth:=8;
       FieldByName('MEMO').DisplayWidth:=22;
       FieldByName('POST_DATE').DisplayLabel:=' DATE';
     end;
   With DataMod.ZTblTempTrans do
     begin
       FieldByName('CHECK_NO').DisplayLabel:='CHECK';
       FieldByName('CHECK_DATE').DisplayLabel:=' DATE';
       FieldByName('CHECK_NO').DisplayWidth:=7;
       FieldByName('ACCOUNT').DisplayWidth:=25;
       FieldByName('ACC_TYPE').DisplayWidth:=19;
       FieldByName('AMOUNT').DisplayWidth:=8;
     end;
  With DataMod.ZQueryPayCheck do
     begin
       FieldByName('CHECK_NO').DisplayLabel:=' CHECK';
       FieldByName('CHECK_NO').DisplayWidth:=6;
       FieldByName('CHECK_DATE').DisplayLabel:=' DATE';
       FieldByName('CHECK_DATE').DisplayWidth:=9;
       FieldByName('VENDOR').DisplayLabel:='EMPLOYEE';
       FieldByName('VENDOR').DisplayWidth:=27;
     end;
     initEmpNames;
     initFunds;
     Activated:=True;
     ComboVendor.SetFocus;
end;

procedure TCheckForm.ShowContext(Sender: TObject; Button: TMouseButton;
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

function TCheckForm.ZFindKey(TName, Fld, Key: String; IntKey: Integer): boolean;
var
  Q: String;
begin
 If UpperCase(Key) = 'FALSE' then
   Q := 'Select Count(*) from ' + TName + ' where ' + fld + ' = ' + IntToStr(IntKey)
  else
    Q := 'Select COUNT(*) from ' + TName + ' where ' + fld + ' like ''' + Key+'''';

  With DataMod.ZQFindkey do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Q);
      Open;
      if Fields[0].value = 0 then
        result := false
      else
        result := true;
     end;
end;
//initialization
//  {$I accounts.lrs}

end.


