unit cont;

  {$mode objfpc}{$H+}
  {$R cont.lfm}

interface

Uses
Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
StdCtrls, ExtCtrls, DBGrids, LResources, sqldb, DbCtrls,
IBConnection, db, Grids, Calendar, StrUtils, LHelpControl, newpsclass, Keyboard;

type

  { TFormCont }

  TFormCont = class(TForm)
    BtnPrintAll: TButton;
    CheckBoxPostNet: TCheckBox;
    Label47: TLabel;
    NotebookCont: TNotebook;
    PageEntry: TPage;
    PageDetail: TPage;
    PageContrib: TPage;
    PagePledge: TPage;
    PageQuery: TPage;
    PageReport: TPage;
    PageMisc: TPage;
    PageLabels: TPage;
    Timer1: TTimer;
    Label23: TLabel;
    Label4: TLabel;
    EditSrchEnv: TEdit;
    Label1: TLabel;
    EditEnv: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditAmount: TEdit;
    Label5: TLabel;
    BtnPost: TButton;
    BtnCan: TButton;
    GridSrchEnv: TDBGrid;
    AGroupFunds: TGroupBox;
    Label24: TLabel;
    GridDetail: TDBGrid;
    AGroupTors: TGroupBox;
    DBNameGrid: TDBGrid;
    Label13: TLabel;
    TitleCombo: TComboBox;
    GridEditEnv: TStringGrid;
    BtnPostTors: TButton;
    BtnCanTors: TButton;
    BtnDelTors: TButton;
    AGroupPledge: TGroupBox;
    DBGridPledge: TDBGrid;
    Label7: TLabel;
    GridPledge: TStringGrid;
    Label26: TLabel;
    RadioType: TRadioGroup;
    BtnCanPledge: TButton;
    BtnInsPledge: TButton;
    BtnAddYear: TButton;
    AGroupQuery: TGroupBox;
    Label22: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    EditQEnv: TEdit;
    EditQFund: TEdit;
    EditQFromDate: TEdit;
    EditQToDate: TEdit;
    BtnQuery: TButton;
    BtnQueryClr: TButton;
    GridQuery: TDBGrid;
    AGroupRep: TGroupBox;
    Label20: TLabel;
    BtnPrint: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditFromEnv: TEdit;
    EditToEnv: TEdit;
    EditFromDate: TEdit;
    EditToDate: TEdit;
    BtnRepClr: TButton;
    Label21: TLabel;
    BtnMonPrnt: TButton;
    ConRepBox: TComboBox;
    YearEd: TEdit;
    Bevel1: TBevel;
    AGroupSum: TGroupBox;
    Label25: TLabel;
    Label18: TLabel;
    EditPledgeFund: TEdit;
    Label19: TLabel;
    EditPledgeSum: TEdit;
    RadioSum: TRadioGroup;
    BtnPledgeQuery: TButton;
    BtnClearSum: TButton;
    AGroupCont: TGroupBox;
    Label27: TLabel;
    FunAccBox: TComboBox;
    ComboDetail: TComboBox;
    LookUpEnv: TComboBox;
    Label6: TLabel;
    MonLabel: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    ComboPledgeFund: TComboBox;
    QueryBox: TComboBox;
    EditSumCont: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    RadioRepType: TRadioGroup;
    RadioCash: TRadioGroup;
    AGroupLabel: TGroupBox;
    LabelBox: TComboBox;
    EdNumRows: TEdit;
    EdNumCols: TEdit;
    EdTopMargin: TEdit;
    EdLeftMargin: TEdit;
    EdLabelHigh: TEdit;
    EdLabelWide: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    EdSpaceWide: TEdit;
    EdSpaceHigh: TEdit;
    Label39: TLabel;
    Label40: TLabel;
    GridMem: TDBGrid;
    BtnLabel: TButton;
    BtnLabClr: TButton;
 //   ReportSysLabel: TRvSystem;
    Label41: TLabel;
    Label42: TLabel;
    EDXPos: TEdit;
    EdYPos: TEdit;
    EdFontSize: TEdit;
    Label43: TLabel;
    Label44: TLabel;
 //   ReportSystemCon: TRvSystem;
    RadioPreview: TRadioGroup;
    EdVuBox: TCheckBox;
    LabelTitle: TLabel;
    PickerRep: TEdit;
    BtnPledgeDel: TButton;
    BtnFundClr: TButton;
    BtnSumFund: TButton;
    GridNow: TDBGrid;
    Label45: TLabel;
    Label46: TLabel;
    LabelName: TLabel;
    procedure BtnLabelClick(Sender: TObject);
    procedure BtnPrintAllClick(Sender: TObject);
    procedure CheckBoxPostNetChange(Sender: TObject);
    procedure EditFromDateExit(Sender: TObject);
    procedure EditToDateExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure LabelBoxClick(Sender: TObject);
    procedure RadioCashClick(Sender: TObject);
    procedure ScaleScreen;
    function  getValues(IDX,IDY: Integer):Integer;
    function  IndexOfName(IName: String;ArrDex: Integer): Integer;
    function  getGroup:Integer;
    function  findName(EnvNo: Integer): String;
    procedure ShowContext(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure srchEnvelope;
    procedure sumCont;
    procedure findContributor(Env: String);
  //  procedure LabelChange(Lab: Integer);
   // procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
    procedure upPledgeList(EnvNo,Title,FName,GName: String);

    procedure FindPledge;
    procedure doEnvKey(Key: Char);
    function  TitleOK(Title: String): Boolean;
    function  GetInt(INStr: String): Integer;
    function  GetTitle(FNT: String): String;
    function  GetFirstName(FNT: String): String;
    function  Dollar(DolStr: String): String;
    function  incYear(YrDate: String):String;
    function  PledgeExist(Env,Fund: Integer): Boolean;
    function  doPost: Boolean;
    procedure TryPost;
    procedure LastDateP(var Str2: String);
    function  BegMonth(Mnth,Year: Word):TDateTime;
    function  EndMonth(Mnth,Year: Word):TDateTime;
    function  MonDate(D: String):String;
    procedure ChkList(TmpStr: String);

    procedure BtnPostClick(Sender: TObject);
    procedure BtnCanClick(Sender: TObject);
    procedure EditEnvKeyPress(Sender: TObject; var Key: Char);
    procedure EditAmountKeyPress(Sender: TObject; var Key: Char);
    procedure getLabels;
    procedure FormActivate(Sender: TObject);
    procedure ComboDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboDetailKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure GridSrchEnvKeyPress(Sender: TObject; var Key: Char);
    procedure GridSrchEnvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TableEditDetailBeforeDelete(DataSet: TDataset);
    procedure GridEditEnvKeyPress(Sender: TObject; var Key: Char);
    procedure BtnPostTorsClick(Sender: TObject);
    procedure BtnCanTorsClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure EditFromEnvKeyPress(Sender: TObject; var Key: Char);
    procedure EditToEnvKeyPress(Sender: TObject; var Key: Char);
    procedure EditFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure BtnRepClrClick(Sender: TObject);
//    procedure ReportSystem1NewPage(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
//    procedure ReportSystem1BeforePrint(Sender: TObject);
  //  procedure NotebookContPageChanged(Sender: TObject);
//    procedure TabSetChange(Sender: TObject; NewTab: Integer;
//      var AllowChange: Boolean);
    procedure BtnMonPrntClick(Sender: TObject);
 //   procedure ReportSystem2Print(Sender: TObject);
 //   procedure ReportSystem2BeforePrint(Sender: TObject);
 //   procedure ReportSystem2NewPage(Sender: TObject);
    procedure BtnQueryClick(Sender: TObject);
    procedure EditSrchEnvKeyPress(Sender: TObject; var Key: Char);
    procedure TitleComboChange(Sender: TObject);
    procedure RadioTypeClick(Sender: TObject);
    procedure BtnCanPledgeClick(Sender: TObject);
    procedure DBGridPledgeDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BtnInsPledgeClick(Sender: TObject);
    procedure GridPledgeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnAddYearClick(Sender: TObject);
    procedure BtnPledgeQueryClick(Sender: TObject);
    procedure BtnClearSumClick(Sender: TObject);
    procedure PledgeSumBoxClick(Sender: TObject);
    procedure BtnCanKeyPress(Sender: TObject; var Key: Char);
    procedure EditDetailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
//    procedure ReportSystem2PrintHeader(Sender: TObject);
    procedure BtnQueryClrClick(Sender: TObject);
    procedure DBNameGridDblClick(Sender: TObject);
    procedure BtnDelTorsClick(Sender: TObject);
    procedure LookUpEnvClick(Sender: TObject);
    procedure LookUpEnvKeyPress(Sender: TObject; var Key: Char);
    procedure FunAccBoxClick(Sender: TObject);
    procedure ComboPledgeFundKeyPress(Sender: TObject; var Key: Char);
    procedure ComboPledgeFundClick(Sender: TObject);
    procedure EditPledgeFundKeyPress(Sender: TObject; var Key: Char);
    procedure QueryBoxClick(Sender: TObject);
    procedure QueryBoxKeyPress(Sender: TObject; var Key: Char);
    procedure EditQFundKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridPledgeDblClick(Sender: TObject);
   // procedure LabelBoxClick(Sender: TObject);
    procedure EdNumRowsExit(Sender: TObject);
    procedure EdNumColsExit(Sender: TObject);
    procedure EdLeftMarginExit(Sender: TObject);
    procedure EdTopMarginExit(Sender: TObject);
    procedure EdLabelWideExit(Sender: TObject);
    procedure EdSpaceWideExit(Sender: TObject);
    procedure EdSpaceHighExit(Sender: TObject);
//    procedure LabelShellLabelPrint(ReportPrinter: TBaseReport;
//      LabelShell: TLabelShell; var Valid: Boolean);
//    procedure LabelShellReportBefore(ReportPrinter: TBaseReport;
 //     LabelShell: TLabelShell);
 //   procedure BtnLabelClick(Sender: TObject);
 //   procedure LabelShellLabelAfter(ReportPrinter: TBaseReport;
 //     LabelShell: TLabelShell; var Valid: Boolean);
//    procedure ReportSysLabelPrint(Sender: TObject);
    procedure EdFontSizeExit(Sender: TObject);
    procedure BtnLabClrClick(Sender: TObject);
//    procedure ReportSystemConPrint(Sender: TObject);
    procedure RadioPreviewClick(Sender: TObject);
    procedure EdVuBoxClick(Sender: TObject);
    procedure GridQueryDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure BtnPledgeDelClick(Sender: TObject);
    procedure BtnFundClrClick(Sender: TObject);
    procedure BtnSumFundClick(Sender: TObject);
    procedure GridSrchEnvDblClick(Sender: TObject);
    procedure EditEnvExit(Sender: TObject);
    procedure EditSrchEnvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditEnvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditAmountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    function formatDate(D: String): String;
    function getDetailDesc(Detail: Integer): String;
    function  isMember(Env: Integer): Boolean;
    procedure ComboDetailChange(Sender: TObject);
    procedure MonthDayNewPage;
    procedure ReportMonthDay;
    procedure doConFunds;
    procedure doMultiFunds;
    procedure ReportLabel(Src: TDataSource);
    procedure ReportContributions;
   // procedure MonthDayBeforePrint;
    procedure setConTabs;
    procedure setMonthDayTabs;
    procedure CheckHelpOpen;
    procedure ShowHelp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
   { procedure ConReportHeader;
    procedure ConReportTitle;
    procedure ConReportNewPage;
    procedure LabellReportNewPage;
    procedure LabelRowPrint;
    procedure LabelReportSetup;
    procedure LabelBodyHeader;}
    {procedure ShowOrdinal (pti: PTypeInfo; sList: TStrings);
    procedure ListEnum (pti: PTypeInfo; sList: TStrings); }

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  {procedure ShowOrdinal (pti: PTypeInfo; sList: TStrings);
  procedure ListEnum (pti: PTypeInfo; sList: TStrings);  }
const
   HelpFN: String='../help/ezconthelp.chm';
   HelpCK: String='./CKHelp';

var
  FormCont: TFormCont;
  Help: TLHelpConnection;
  LogFile: Text;
  EZPClass: TPostScriptClass;
  GlobRun: Boolean;
  GlobLabel: Boolean;
  GlobPage: Integer;
  GlobFontSize: Integer;
  Page: Integer;
  GlobPost: Boolean;
  GlobIns: Boolean;
  MyList: TStringList;
  ConList: TStringList;

  GlobFrom,GlobThru: String;
  GlobEnv: Integer;
  GlobTitle,GlobName,GlobFName: String;
  HelpArr: array[0..7] of TStringList;
  ContainerArr: array[0..7] of TWinControl;
  GroupTotal,GroupTotalYear,ReportTotal,ReportTotalYear: Double;
  CashGroupTotal,CashReportTotal: Double;

Implementation
   uses contmod;


procedure TFormCont.BtnPostClick(Sender: TObject);
begin;
  TryPost;
  srchEnvelope;
end;

procedure TFormCont.BtnCanClick(Sender: TObject);
begin
  ComboDetail.Text:='';
  EditAmount.Text:='';
  EditEnv.Text:='';
  EditSrchEnv.Text:='';
  LabelTitle.Caption:='';
  LabelName.Caption:='';
  {GridSrchEnv.Visible:=False; }
  EditSrchEnv.SetFocus;
end;

procedure TFormCont.EditEnvKeyPress(Sender: TObject; var Key: Char);
begin
  If Key<>#13 then exit;
  If EditEnv.Text='' then
    begin
      ComboDetail.SetFocus;
      ComboDetail.DroppedDown:=True;
      ComboDetail.ItemIndex:=0;
      Exit;
    end;
  doEnvKey(Key);
end;

procedure TFormCont.doEnvKey(Key: Char);
var
  I: Integer;
begin
  If Key<>#13 then Exit;
  try
    I:=StrToInt(EditEnv.Text);
    With DataMod.QueryMemberData do
       begin
         close;
         Params[0].AsInteger := I;
         open;
         if FieldByName('ENV_NO').AsInteger = I then
           begin
             EditSrchEnv.Text:=FieldByName('Name').AsString;
             {With QuerySrchName do
                 try
                   Close;
                   ParamByName('PName').AsString:='ZZZZZXCXCZX';
                   ParamByName('PEnv').AsInteger:=StrToInt(EditEnv.Text);
                   Open;
                 except;
                 end;  }
             LabelTitle.Caption:=FieldByName('Title').AsString+' '+
                               FieldByName('FName').AsString;
             LabelName.Caption:=FieldByName('Name').AsString;
             LabelTitle.Visible:=True;
             LabelName.Visible:=True;
             GridSrchEnv.Visible:=True;
             ComboDetail.SetFocus;
             ComboDetail.DroppedDown:=True;
           end
        else
          begin
            ShowMessage('Can not find envelope number '+EditEnv.Text);
            EditEnv.Text:='';
            EditEnv.SetFocus;
          end;
       end;
  except
    ShowMessage('Can not find envelope number '+EditEnv.Text);
    EditEnv.Text:='';
    EditEnv.SetFocus;
 end;   //try
end;

procedure TFormCont.EditAmountKeyPress(Sender: TObject; var Key: Char);
var
  Dol: Integer;
begin
 If Key<>#13 then Exit;
  Dol:=Pos('$',EditAmount.Text);
  If Dol>0 then
    EditAmount.Text:=copy(EditAmount.Text,Dol+1,40);
  Dol:=Pos(' ',EditAmount.Text);
  If Dol=1 then
    EditAmount.Text:=copy(EditAmount.Text,2,40);
  BtnPost.SetFocus;
end;

procedure TFormCont.TryPost;
begin
  { If not GlobPost then
     begin
       GlobPost:=True;
       Exit;
     end;
   GlobPost:=False; }
   If (EditEnv.Text='') or (ComboDetail.Text='') or (EditAmount.Text='') then
     begin
       BtnCan.SetFocus;
       Exit;
     end;
  if doPost then
    begin
      Label5.Visible:=True;
      Timer1.Enabled:=True;
    end
  else
    ShowMessage('Contribution did not post.');
  GlobPost:=True;
end;

function TFormCont.doPost: Boolean;
var
  I,Fund: Integer;
  F: Double;
  Amount: String;
begin
 Try
   try
     With DataMod.QueryRContrib do
       begin
         Close;
         Params[0].AsInteger:=StrToInt(EditEnv.Text);
         Params[1].AsInteger:=StrToInt(EditEnv.Text);
         Open;
         If EOF then
           begin
             ShowMessage(' Envelope number '+EditEnv.Text+' is not valid.');
             exit;
           end;
       end;
   except
     ShowMessage(' Envelope number '+EditEnv.Text+' is not valid.');
     exit;
   end;
   Fund:=GetInt(ComboDetail.Text);
   If Fund<=0 then
     begin
       ShowMessage('You must provide a fund');
       ComboDetail.SetFocus;
       exit;
     end;
   Amount:= EditAmount.Text;
   I:=Pos('$',Amount);
   If I>0 then
      Amount:= Copy(Amount,I+1,20);
   F:=StrToFloat(Amount);
   If F<=0.0 then
     begin
       BtnCan.SetFocus;
       exit;
     end;
   With DataMod.TableCont do
     begin
       Insert;
       FieldByName('ENV_NO').AsString:=EditEnv.Text;
       FieldByName('DETAIL_FUND').AsInteger:=Fund;
       FieldByName('AMOUNT').AsString:=Amount;
       FieldByName('C_DATE').AsDateTime:=Date;
       If RadioCash.ItemIndex=1 then
         FieldByName('TYPE').AsString:='K'
       else
         FieldByName('TYPE').AsString:='C';
       Post;
       Result:=True;
     end;
 except
   ShowMessage('Error: Check your entries.');
   Result:=False;
 end;
  EditSrchEnv.SetFocus;
end;

procedure TFormCont.getLabels;
var
  Avery: String;
begin
  DataMod.TableLabel.First;
  With DataMod.TableLabel do
    While not EOF do
      begin
        Avery:=FieldByName('LabelStyle').AsString;
        LabelBox.Items.Add(Avery);
        next;
      end;
end;

procedure TFormCont.FormActivate(Sender: TObject);
var
  Year, Month, Day: Word;
 begin
   If GlobRun then exit;
   ScaleScreen;
   WindowState := wsMaximized;

  GlobLabel:=False;
  GlobFontSize:=10;
  RadioSum.ItemIndex:=0;
  RadioCash.ItemIndex:=0;
  RadioRepType.ItemIndex:=0;
  RadioPreview.ItemIndex:=0;
  PickerRep.Text:=DateToStr(Date);
  ConRepBox.ItemIndex:=0;
  ComboDetail.ItemIndex:=0;
  DecodeDate(Now, Year, Month, Day);
  try
    YearEd.Text:=IntToStr(Year);
  finally
    With DataMod.QueryNow do
      begin
        FieldByName('ENV_NO').DisplayLabel:='ENV NO';
        FieldByName('DETAIL_FUND').DisplayLabel:=' FUND';
        FieldByName('ENV_NO').DisplayWidth:=6;
        FieldByName('DETAIL_FUND').DisplayWidth:=6;
      end;
    With GridEditEnv do
      begin
        Cells[0,1]:='Envelope Number';
        Cells[0,2]:='Title ';
        Cells[0,3]:='First Name';
        Cells[0,4]:='Last Name';
        Cells[0,5]:='Address Line One';
        Cells[0,6]:='Address Line Two';
        Cells[0,7]:='City';
        Cells[0,8]:='State';
        Cells[0,9]:='Zip Code';
        Cells[0,10]:='Phone';
        Cells[1,0]:='Contributor Entries';
      end;
     With GridPledge do
      begin
        Cells[0,1]:='Envelope Number';
        Cells[0,2]:='Fund';
        Cells[0,3]:='Pledge Type';
        Cells[0,4]:='Starting Date';
        Cells[0,5]:='Ending Date';
        Cells[0,6]:='Amount';
        Cells[0,7]:='State';
        Cells[1,0]:='Entries';
      end;
    With DataMod.QueryCont do
      begin
        FieldByName('ENV_NO').DisplayLabel:='ENV NO';
        FieldByName('DETAIL_FUND').DisplayLabel:='FUND NO';
        FieldByName('C_DATE').DisplayLabel:='DATE';
        FieldByName('TYPE').DisplayWidth:=6;
      end;
    With DataMod.QueryMem do
      begin
        FieldByName('ENV_NO').DisplayWidth:=6;
        FieldByName('FNAME').DisplayWidth:=10;
        FieldByName('NAME').DisplayWidth:=20;
      end;
    DataMod.TableDetail.FieldByName('DETAIL_FUND_NO').DisplayLabel:=' Fund No';
    DataMod.TableDetail.FieldByName('DETAIL_FUND_NO').DisplayWidth:=8;
    With DataMod.TablePledge do
     begin
        FieldByName('ENV_NO').DisplayWidth:=8;
        FieldByName('FUND').DisplayWidth:=20;
        FieldByName('TYPE').DisplayWidth:=9;
        FieldByName('TYPE').DisplayLabel:='  TYPE';
        FieldByName('BDATE').DisplayLabel:='BEG_DATE';
        FieldByName('EDATE').DisplayLabel:='END_DATE';
      end;
    With DataMod.QueryPledge do
      begin
        FieldByName('ENV_NO').DisplayWidth:=8;
        FieldByName('FUND').DisplayWidth:=20;
        FieldByName('TYPE').DisplayWidth:=9;
        FieldByName('TYPE').DisplayLabel:='  TYPE';
        FieldByName('BDATE').DisplayLabel:='BEG_DATE';
        FieldByName('EDATE').DisplayLabel:='END_DATE';
      end;
    With DataMod.QuerySrchName do
      begin
        FieldByName('ENV_NO').DisplayLabel:=' ENV';
        FieldByName('ENV_NO').DisplayWidth:=5;
        FieldByName('NAME').DisplayWidth:=16;
      end;
    GlobPost:=False;
    If NoteBookCont.PageIndex=0 then
       EditSrchEnv.SetFocus;
    DataMod.TableEnvNo.Close;
    DataMod.TableEnvNo.Open;
    DataMod.TableEnvNo.Last;
    RadioType.ItemIndex:=0;
  end;
  EdVuBox.Checked:=False;
  GridQuery.Color:=clAqua;
  NoteBookCont.PageIndex:=0;
  EditSrchEnv.SetFocus;
  GlobRun:=True;
  EdXPos.Text:='0.19';
  EdYPos.Text:='0.19';
  EdFontSize.Text := '10';
  getlabels;
  DataMod.TableDetail.First;
  If EZPClass <> nil then
    With EZPClass do
      begin
        SaveFontName(1, HELVETICA);
        SaveFontSize(1,12);
        SaveFontName(2, HELVETICA);
        SaveFontSize(1,10);
      end;

  AssignFile(LogFile,HelpCK);
  Rewrite(LogFile);
  {ShowOrdinal(PTypeInfo(TypeInfo(TLabelBrand)),LabelBox.Items);  }
end;

procedure TFormCont.ComboDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ComboDetail.DroppedDown:=True;
  ComboDetail.SetFocus;
  exit;
end;

 function TFormCont.isMember(Env: Integer): Boolean;
 begin
   With DataMod.QueryIsMember do
     begin
       close;
       params[0].AsInteger:=Env;
       open;
       if FieldByName('COUNT').AsInteger > 0 then
         result := True
       else
         result := False;
     end;
 end;

function TFormCont.getDetailDesc(Detail: Integer): String;
begin
  With DataMod.QueryDetail do
    begin
      close;
      Params[0].AsInteger := Detail;
      Open;
      Result := FieldByName('DESCRIPTION').AsString;
    end;
end;

procedure TFormCont.ComboDetailKeyPress(Sender: TObject; var Key: Char);
var
   I: Integer;
begin
  If Key<>#13 then Exit;
  If ComboDetail.Text='' then
    begin
      EditEnv.SetFocus;
      Exit;
    end;
  I:=GetInt(ComboDetail.Text);
  If I<0 then
     With DataMod.QuerySrchFund do
       begin
         Close;
         Params[0].AsString:=UpperCase(ComboDetail.Text)+'%';
         Open;
         ComboDetail.Text:=FieldByName('Detail_Fund_No').AsString+
         '     '+FieldByName('Description').AsString;
         If RecordCount>0 then
            EditAmount.SetFocus
         else
           begin
             ComboDetail.Text:='';
             ComboDetail.Cursor := crDefault;
             ComboDetail.SetFocus;
             Exit;
           end;
       end
  else
    begin
      //if DataMod.ZFindKey('FUNDS', 'DETAIL_FUND_NO', 'FALSE', I) then
      If GetDetailDesc(I) <> '' then
        begin
          ComboDetail.Text:=DataMod.QueryDetail.FieldByName('Detail_Fund_No').AsString+
          '     '+DataMod.QueryDetail.FieldByName('Description').AsString;
          EditAmount.SetFocus;
        end
      else
        begin
          ComboDetail.Text:='';
          ComboDetail.Cursor := crDefault;
          ComboDetail.SetFocus;
        end;
    end;
end;

function TFormCont.Dollar(DolStr: String): String;
var
  DotPos,DollarPos,DollarLen: Integer;
  TmpStr: String;
begin
  TmpStr:='';
  DotPos:=Pos('.',DolStr);
  DollarPos:=Pos('$',DolStr);
  DollarLen:=Length(DolStr);
  If DotPos<=0 then
     TmpStr:=DolStr+'.00'
  else if (DotPos>0) and (DollarLen=DotPos)   then    {No Cents}
      TmpStr:=DolStr+'00'
  else if (DotPos>0) and (DollarLen=DotPos+1) then    {1 to 9 Cents}
      TmpStr:=DolStr+'0'
  else if DollarLen>DotPos+2 then
      TmpStr:=Copy(DolStr,1,DotPos+2);
  If DollarPos<=0 then
      TmpStr:='$'+TmpStr;
  Result:=TmpStr;
end;

procedure TFormCont.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  Label5.Visible:=False;
  {EditAmount.Text:='';
  EditEnv.Text:='';  }
  EditSrchEnv.Text:='';
  {LabelTitle.Caption:=''; }
  {EditSrchEnv.SetFocus;}
end;

procedure TFormCont.GridSrchEnvKeyPress(Sender: TObject; var Key: Char);
begin
  If Key=#13 then ComboDetail.SetFocus;
end;

procedure TFormCont.GridSrchEnvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key=kbdRight then
      ComboDetail.SetFocus;
end;

procedure TFormCont.TableEditDetailBeforeDelete(DataSet: TDataset);
begin
   if MessageDlg('Ok to Delete this record?',
   mtInformation, [mbYes, mbNo], 0) <> mrYes then
     DataMod.TableEditDetail.Cancel;
end;

function TFormCont.TitleOK(Title: String): Boolean;
var
  IDX: Integer;
begin
  Result:=False;
  For IDX:=1 to TitleCombo.Items.Count do
     If Title=TitleCombo.Items[IDX] then
         begin
           Result:=True;
           Break;
         end;
end;

procedure TFormCont.GridEditEnvKeyPress(Sender: TObject; var Key: Char);
begin
  If Key<>#13 then exit;
  With GridEditEnv do
    begin
      If (Row=2) and (not TitleOK(cells[1,2])) then
        begin
          Cells[1,2]:='';
          TitleCombo.SetFocus;
          TitleCombo.DroppedDown:=True;
          exit;
        end;
      If Row=10 then
        begin
          Row:=1;
          BtnPostTors.SetFocus;
        end
      else
      Row:=Row+1;
   end;
end;

procedure TFormCont.BtnPostTorsClick(Sender: TObject);
var
  Env: Integer;
begin
  If GlobIns then exit;
  Env := StrToInt(GridEditEnv.Cells[1,1]);
  With GridEditEnv do
    try
      try
        if isMember(env) then
           DataMod.TableEditEnv.Edit
        else
           DataMod.TableEditEnv.Insert;
      except
        exit;
      end;
      DataMod.TableEditEnv.FieldByName('ENV_NO').AsString:=Cells[1,1];
      DataMod.TableEditEnv.FieldByName('TITLE').AsString:=Cells[1,2];
         DataMod.TableEditEnv.FieldByName('FNAME').AsString:=Cells[1,3];
      DataMod.TableEditEnv.FieldByName('NAME').AsString:=Cells[1,4];
      DataMod.TableEditEnv.FieldByName('ADDRESS_1').AsString:=Cells[1,5];
      DataMod.TableEditEnv.FieldByName('ADDRESS_2').AsString:=Cells[1,6];
      DataMod.TableEditEnv.FieldByName('CITY').AsString:=Cells[1,7];
      DataMod.TableEditEnv.FieldByName('STATE').AsString:=Cells[1,8];
      DataMod.TableEditEnv.FieldByName('ZIP').AsString:=Cells[1,9];
      DataMod.TableEditEnv.FieldByName('PHONE').AsString:=Cells[1,10];
      DataMod.TableEditEnv.Post;
      DataMod.TableEnvNo.Close;
      DataMod.TableEnvNo.Open;
      DataMod.TableEnvNo.Last;
      GlobIns:=True;
      BtnCanTors.SetFocus;
      upPledgeList(Cells[1,1],Cells[1,2],Cells[1,3],Cells[1,4]);
    except
      ShowMessage('Could not enter this data, check the entries.');
    end;
end;

procedure TFormCont.upPledgeList(EnvNo,Title,FName,GName: String);
var
  EnvNum: String;
begin
   EnvNum:=EnvNo+copy('  ',1,8-Length(EnvNo))+ GName;
   LookUpEnv.Items.Add(EnvNum+' ,'+Title+' '+FName);
end;

procedure TFormCont.BtnCanTorsClick(Sender: TObject);
var
  I: Integer;
begin
  With GridEditEnv do
     For I:=1 to 10 do
       Cells[1,I]:='';
  GlobIns:=False;
  TitleCombo.SetFocus;
end;

procedure TFormCont.FindPledge;
begin
 With DataMod.QueryPledge do
   If GridPledge.Cells[1,1]<>'' then
      begin
        Close;
        Params[0].AsInteger:=StrToInt(GridPledge.Cells[1,1]);
        Open;
      end;
   GridPledge.SetFocus;
   GridPledge.Row:=4;
end;


procedure TFormCont.BtnPrintClick(Sender: TObject);
var
  EnvNo,EnvNo1: Integer;
  FromDt,ToDt: TDateTime;
  fName: String;
begin
   {EditRepTitle.Text:=ReportPrinter1.port; }
   fName := 'contributions'+'-'+DateToStr(Date)+'.ps';
   EZPClass.OpenPrintFile(fName);
   With DataMod.QueryRContrib do
     try
       EnvNo:=StrToInt(EditFromEnv.Text);
       EnvNo1:=StrToInt(EditToEnv.Text);
       FromDt:=StrToDate(EditFromDate.Text);
       ToDt:=StrToDate(EditToDate.Text);
       Close;
       Params[0].AsInteger:=EnvNo;
       Params[1].AsInteger:=EnvNo1;
       Open;
       First;
       GlobFrom:=EditFromDate.Text;
       GlobThru:=EditToDate.Text;
       DataMod.QueryRCButions.Close;
       DataMod.QueryRCButions.Params[1].AsDateTime:=FromDt;
       DataMod.QueryRCButions.Params[2].AsDateTime:=ToDt;
       If EnvNo1=0 then
         begin
           DataMod.QueryRCButions.Params[0].AsInteger:=GlobEnv;
           DataMod.QueryRCButions.Open;
           GlobPage:=1;
       //    ReportSystemCon.Execute;

           ReportContributions;
         end
       else
       While not EOF do
         begin
           DataMod.QueryRCButions.Close;
           GlobEnv:=DataMod.QueryRContrib.FieldByName('ENV_NO').AsInteger;
           GlobTitle:=DataMod.QueryRContrib.FieldByName('TITLE').AsString;
           GlobFName:=DataMod.QueryRContrib.FieldByName('FName').AsString;
           GlobName:=DataMod.QueryRContrib.FieldByName('NAME').AsString;
           DataMod.QueryRCButions.Params[0].AsInteger:=GlobEnv;
           DataMod.QueryRCButions.Open;
           DataMod.QueryRPledge.Close;
           DataMod.QueryRPledge.Params[0].AsInteger:=GlobEnv;
           DataMod.QueryRPledge.Open;
           GlobPage:=1;
       //   ReportSystemCon.Execute;
           ReportContributions;
        //   If DataMod.ZFindKey('MEMBERS', 'ENV_NO', 'FALSE', GlobEnv) then
           If GetDetailDesc(GlobEnv) <> '' then
              begin
                DataMod.TableEditEnv.Edit;
                DataMod.TableEditEnv.FieldByName('PRINT').AsString:='X';
                DataMod.TableEditEnv.Post;
              end;
           {If RadioPreview.ItemIndex<=0 then
              if MessageDlg('Preview another contributor',
                 mtConfirmation, [mbYes, mbNo], 0) = mrNo then
                   begin
                     ShowMessage('Exiting from reports.');
                     exit;
                   end;   }
           next;
         end;
       except
         ShowMessage('Error: check your entries.');
       end;
    EZPClass.ClosePrintFile;
end;

procedure TFormCont.EditFromEnvKeyPress(Sender: TObject; var Key: Char);
begin
  If Key<>#13 then exit;
     EditToEnv.SetFocus;
end;

procedure TFormCont.EditToEnvKeyPress(Sender: TObject; var Key: Char);
begin
  If Key<>#13 then exit;
     EditFromDate.SetFocus;
end;

procedure TFormCont.EditFromDateKeyPress(Sender: TObject; var Key: Char);
begin
  If Key<>#13 then exit;
     EditToDate.SetFocus;
end;

procedure TFormCont.BtnRepClrClick(Sender: TObject);
begin
  EditFromEnv.Text:='';
  EditToEnv.Text:='';
  EditFromDate.Text:='';
  EditToDate.Text:='';
  EditFromEnv.SetFocus;
end;


procedure TFormCont.ChkList(TmpStr: String);
var
  IDX: Integer;
begin
  For IDX:=0 to ConList.Count-1 do
    If TmpStr=ConList[IDX] then
       exit;
  ConList.Add(TmpStr);
end;


procedure TFormCont.FormCreate(Sender: TObject);
var
  IDX: Integer;
begin
  GlobFrom:='';
  GlobThru:='';
  ConList:=TStringList.Create;
  {LabelList.Create;
  EditList.Create;}
  Help := TLHelpConnection.Create;
  EZPClass := TPostscriptClass.Create;
 // Application.OnMessage:=AppMessage;
end;

procedure TFormCont.FormDestroy(Sender: TObject);
var
  IDX: Integer;
begin
  For IDX:=0 to 8 do
    HelpArr[IDX].Free;
  ConList.Free;
  {LabelList.Free;  }
end;

procedure TFormCont.CheckHelpOpen;
var
  S: String;
  A: String;
begin
  A := 'ACTIVE';
  try
  //  AssignFile(LogFile,HelpCK);
    Reset(LogFile);
    Readln(LogFile,S);

    if S <> '' then
      exit;
    Rewrite(LogFile);
    Writeln(LogFile, A);
    Help.StartHelpServer('lhelpServer', '../help/lhelp --display=:0.0');
    Help.OpenFile(helpFN);
  except
      CloseFile(LogFile);
  end;
end;

procedure TFormCont.ShowHelp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TFormCOnt.ShowContext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  hcontext: Integer;
begin
 if (Button = mbRight) or (Button = mbLeft) then exit;
   CheckHelpOpen;
 hcontext:=TControl(Sender).HelpContext;
 Help.OpenContext(helpFN,hContext);
end;

procedure TFormCont.LastDateP(var Str2: String);
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

function TFormCont.MonDate(D: String):String;
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


function TFormCont.BegMonth(Mnth,Year: Word):TDateTime;
begin
  Result:=EncodeDate(Year,Mnth,1);
end;

Function TFormCont.EndMonth(Mnth,Year: Word):TDateTime;
begin
    If Mnth=12 then
       Year:=Year+1
    Else
       Mnth:=Mnth+1;
    Result:=EncodeDate(Year,Mnth,1)-1;
end;

{procedure TFormCont.NotebookContPageChanged(Sender: TObject);
begin
   If NoteBookCont.PageIndex=0 then
     EditEnv.SetFocus;
end;  }

{procedure TFormCont.TabSetChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
   NoteBookCont.PageIndex:=NewTab;
   If NewTab=3 then
     begin
       RadioType.ItemIndex:=0;
       GridPledge.Cells[1,3]:='Annual';
       LookUpEnv.SetFocus;
     end;
   If NewTab=5 then
     EditFromEnv.SetFocus
   else if NewTab>5 then
     EdFontSize.Text:=IntToStr(GlobFontSize);
   If NewTab=0 then EditSrchEnv.SetFocus;
end; }

procedure TFormCont.BtnMonPrntClick(Sender: TObject);
begin
  If EZPClass = nil then exit;
  EZPClass.PageNo:=0;
  If not DataMod.TableRFund.active then DataMod.TableRFund.open;
  DataMod.TableRFund.First;
  ReportMonthDay
end;


procedure TFormCont.setMonthDayTabs;
var
  TmpTab: PTab;
  BH10: Double;
begin
   With EZPClass do
    begin
      BH10 := PointToInch(Round(10 * LineScale));
      FreeTabs(1);
      FreeTabs(2);
      FreeTabs(3);
      FreeTabs(4);

      TmpTab := NewTab(1, 1.25,JUSTIFYLEFT,0.85,0.05,False,BOXLINENONE,0);
      TmpTab := NewTab(1, 2.05,JUSTIFYLEFT,1.95,0.05,False,BOXLINENONE,0);
      TmpTab := NewTab(1, 4.00,JUSTIFYRIGHT,1.00,0.05,False,BOXLINENONE,0);
      TmpTab := NewTab(1, 5.00,JUSTIFYRIGHT,1.00,0.05,False,BOXLINENONE,0);
      TmpTab := NewTab(1, 6.00,JUSTIFYRIGHT,1.50,0.05,False,BOXLINENONE,0);

      TmpTab := NewTab(2, 1.15,JUSTIFYLEFT,0.85,0.05,False,BOXLINEALL,2);
      TmpTab := NewTab(2, 2.10,JUSTIFYLEFT,1.85,0.05,False,BOXLINEALL,2);
      TmpTab := NewTab(2, 4.05,JUSTIFYRIGHT,0.95,0.05,False,BOXLINEALL,2);
      TmpTab := NewTab(2, 5.05,JUSTIFYRIGHT,0.95,0.05,False,BOXLINEALL,2);
      TmpTab := NewTab(2, 6.05,JUSTIFYRIGHT,1.50,0.05,False,BOXLINEALL,2);

      TmpTab := NewTab(3, 1.15,JUSTIFYLEFT,0.85,0.05,False,BOXLINEALL,0);
      TmpTab := NewTab(3, 2.10,JUSTIFYLEFT,1.85,0.05,False,BOXLINEALL,0);
      TmpTab := NewTab(3, 4.05,JUSTIFYRIGHT,0.95,0.05,False,BOXLINEALL,0);
      TmpTab := NewTab(3, 5.05,JUSTIFYRIGHT,0.95,0.05,False,BOXLINEALL,0);
      TmpTab := NewTab(3, 6.00
      ,JUSTIFYRIGHT,1.50,0.05,False,BOXLINEALL,0);

      TmpTab := NewTab(4, 0.5,JUSTIFYCENTER,8.0,0.05, False,BOXLINENONE,0);
      setTabBoxHeight(1,BH10);
      setTabBoxHeight(2,BH10);
      setTabBoxHeight(3,BH10);
      setTabBoxHeight(4,BH10);
    end;
end;


procedure TFormCont.MonthDayNewPage;
var
  RepFont: FontType;
begin
  With EZPClass do
    begin
      If PageNo<=0 then
        begin
         RepFont.FontName := 'HELVETICA';

          RepFont.FontSize := 12;
          Font := RepFont;
          Bold:=True;
          If RadioRepType.ItemIndex<=0 then
              PrintTab(4,'Contributions Entered on  '+PickerRep.Text)
          else
            PrintTab(4,'Financial Report for the Month of '+ConRepBox.Text +' '+
                    YearEd.Text);
          RepFont.FontSize := 10;
          Font := RepFont;
          NewLine;
          Bold := False;
        end; //if PageNo

       PageNo := PageNo + 1;
       NewLine;
      // RestoreTabs(2);
      // SetFont('Arial',10);
       Bold:=True;
       PrintTab(2,'Fund');
       PrintTab(2,'Description');
       PrintTab(2,'Cash');
       PrintTab(2,'Checks');
       PrintTab(2,YearEd.Text+' to Date');
       NewLine;
    end; //With Repclass
end;

procedure TFormCont.ReportMonthDay;
var
  Fund: Integer;
  Year: Word;
  BegDate,FromDate,ThruDate: TDateTime;
  CashTotal,CheckTotal,YrTotal: Double;
  fName: String;
begin
  ReportTotal:=0.0;ReportTotalYear:=0.0;
  CashGroupTotal:=0.0;CashReportTotal:=0.0;
  try
    fName := 'finances'+'-'+DateToStr(Date)+'.ps';
    EZPClass.OpenPrintFile(fName);
    EZPClass.setPageMargins(0.25, 0.25, 0.25, 0.5);
    setMonthDayTabs;
    Year:=StrToInt(YearEd.Text);
    BegDate:=BegMonth(1,Year);
    If RadioRepType.ItemIndex<=0 then
      try
        FromDate:=StrToDate(PickerRep.Text);
        ThruDate:=FromDate;
      except
        ShowMessage(PickerRep.Text+' is not a valid date');
      end
    else
      begin
        FromDate:=BegMonth(ConRepBox.ItemIndex+1,Year);
        ThruDate:=EndMonth(ConRepBox.ItemIndex+1,Year);
      end;
  except
    ShowMessage('Year or Month is not correct');
    exit;
  end;
  MonthDayNewPage;
  If not DataMod.TableFundGroups.active then DataMod.TableFundGroups.open;
  DataMod.TableFundGroups.First;
  With DataMod.QuerySummary do
    begin
    While not DataMod.TableFundGroups.EOF do
     begin
       GroupTotal:=0.0;GroupTotalYear:=0.0;
       CashGroupTotal:=0.0;
       DataMod.QueryFGroup.Close;
       DataMod.QueryFGroup.Params[0].AsInteger:=
            DataMod.TableFundGroups.FieldByName('FUND_GROUP').AsInteger;
       DataMod.QueryFGroup.Params[1].AsInteger:=
            DataMod.TableFundGroups.FieldByName('FUND_GROUP').AsInteger+99;
       DataMod.QueryFGroup.Open;
       DataMod.QueryFGroup.First;
       While not DataMod.QueryFGroup.EOF do
         try
            If EZPClass.LinesLeft<3 then MonthDayNewPage;
            Fund:=DataMod.QueryFGroup.FieldByName('DETAIL_FUND_NO').AsInteger;
            Close;   //QuerySummary Checks
            Params[0].AsDateTime:=FromDate;            //ByName('FromDate')
            Params[1].AsDateTime:=ThruDate;            //ByName('ToDate')
            Params[2].AsInteger:=Fund;                 //ByName('FundParm')
            Params[3].AsString:='K';                   //ByName('TypeParm')
            Open;
            CheckTotal:=Fields[0].AsFloat;
            Close;   //QuerySummary Cash
            Params[3].AsString:='C';
            Open;
            CashTotal:=Fields[0].AsFloat;
            Close;   //QuerySummary all
            Params[0].AsDateTime:=BegDate;
            Params[3].AsString:='A';
            Open;
            YrTotal:=Fields[0].AsFloat;

            CashGroupTotal:=CashGroupTotal+CashTotal;
            GroupTotal:=GroupTotal+CheckTotal;
            GroupTotalYear:=GroupTotalYear+YrTotal;
            ReportTotal:=ReportTotal+CheckTotal;
            CashReportTotal:=CashReportTotal+CashTotal;
            ReportTotalYear:=ReportTotalYear+YrTotal;

            EZPClass.PrintTab(1,DataMod.QueryFGroup.FieldByName('Detail_Fund_No').AsString);
            EZPClass.PrintTab(1,DataMod.QueryFGroup.FieldByName('Description').asString);
            EZPClass.PrintTab(1,Format('%m',[CashTotal]));
            EZPClass.PrintTab(1,Format('%m',[CheckTotal]));
            EZPClass.PrintTab(1,Format('%m',[YrTotal]));

              DataMod.QueryFGroup.Next;
         except
            ShowMessage('Error doing report queries, contributions');
         end;   //While QueryFGroup not EOF

         If EZPClass.LinesLeft<3 then MonthDayNewPage;

         EZPClass.PrintTab(3,DataMod.TableFundGroups.FieldByName('FUND_GROUP').AsString);
         EZPClass.PrintTab(3,DataMod.TableFundGroups.FieldByName('DESCRIPTION').AsString);
         EZPClass.PrintTab(3,Format('%m',[CashGroupTotal]));
         EZPClass.PrintTab(3,Format('%m',[GroupTotal]));
         EZPClass.PrintTab(3,Format('%m',[GroupTotalYear]));
         EZPClass.NewLine;
         DataMod.TableFundGroups.Next;
     end; //While TableFundGroups not EOF/

     If EZPClass.LinesLeft<3 then MonthDayNewPage;
     EZPClass.NewLine;
     EZPClass.PrintTab(3,'All');
     EZPClass.PrintTab(3,'Funds');
     EZPClass.PrintTab(3,Format('%m',[CashReportTotal]));
     EZPClass.PrintTab(3,Format('%m',[ReportTotal]));
     EZPClass.PrintTab(3,Format('%m',[ReportTotalYear]));
     DataMod.TableRFund.Next;
  end;
  EZPCLass.CLosePrintFile;
end;

procedure TFormCont.BtnQueryClick(Sender: TObject);
var
  Year, Month, Day: Word;
  Fund: Integer;
begin
  DecodeDate(Now, Year, Month, Day);
  Fund:=0;
  try
    If EditQFund.Text<>'' then
       Fund:=StrToInt(EditQFund.Text)
  except
    Fund:=0;
  end;
  With DataMod.QueryCont do
    try
     Close;
     If EditQEnv.Text='' then
       begin
         Params[4].AsInteger:=0;      //('EnvParm1')
         Params[5].AsInteger:=9999;   //('EnvParm2')
       end
     else if UpperCase(EditQEnv.Text)='CASH' then
       begin
         Params[4].AsInteger:=0;
         Params[5].AsInteger:=0;
       end
     else
       begin
         Params[4].AsInteger:=StrToInt(EditQEnv.Text);
         Params[5].AsInteger:=StrToInt(EditQEnv.Text);
       end;
     If Fund=0 then
       begin
         Params[2].AsInteger:=100;    //('FundParm1')
         Params[3].AsInteger:=999;    //('FundParm2')
       end
      else if Fund MOD 100 = 0 then
        begin
          Params[2].AsInteger:=Fund;
          Params[3].AsInteger:=Fund+99;
        end
      else
        begin
          Params[2].AsInteger:=Fund;
          Params[3].AsInteger:=Fund;
        end;
      If EditQFromDate.Text='' then
        EditQFromDate.Text:=DateTimeToStr(BegMonth(1,Year));
      If EditQToDate.Text='' then
        EditQToDate.Text:=DateTimeToStr(Date);
      Params[0].AsDateTime:=StrToDate(EditQFromDate.Text);  //('FromDate')
      Params[1].AsDateTime:=StrToDate(EditQToDate.Text);      //('ToDate')
      Open;
      sumCont;
    except
      ShowMessage('Can not complete query, check your entries.');
      Open;
    end;
end;

procedure TFormCont.sumCont;
var
  Year, Month, Day: Word;
  Fund: Integer;
begin
  DecodeDate(Now, Year, Month, Day);
  Fund:=0;
  try
    If EditQFund.Text<>'' then
      Fund:=StrToInt(EditQFund.Text);
  except
    Fund:=0;
  end;
 With DataMod.QuerySumCont do
    try
     Close;
     If EditQEnv.Text='' then
       begin
         Params[4].AsInteger:=0;        //('EnvParm1')
         Params[5].AsInteger:=9999;     //('EnvParm2')
       end
     else if UpperCase(EditQEnv.Text)='CASH' then
       begin
         Params[4].AsInteger:=0;
         Params[5].AsInteger:=0;
       end
     else
       begin
         Params[4].AsInteger:=StrToInt(EditQEnv.Text);
         Params[5].AsInteger:=StrToInt(EditQEnv.Text);
       end;
     If Fund=0 then
       begin
         Params[2].AsInteger:=100;
         Params[3].AsInteger:=999;
       end
      else if Fund MOD 100 = 0 then
        begin
          Params[2].AsInteger:=Fund;        //('FundParm1')
          Params[3].AsInteger:=Fund+99;     //('FundParm2')
        end
      else
        begin
          Params[2].AsInteger:=Fund;
          Params[3].AsInteger:=Fund;
        end;
      If EditQFromDate.Text='' then
        EditQFromDate.Text:=DateTimeToStr(BegMonth(1,Year));
      If EditQToDate.Text='' then
        EditQToDate.Text:=DateTimeToStr(Date);
      Params[0].AsDateTime:=StrToDate(EditQFromDate.Text);   //('FromDate')
      Params[1].AsDateTime:=StrToDate(EditQToDate.Text);       //('ToDate')
      Open;
      EditSumCont.Text:=FormatFloat('0.00',Fields[0].AsFloat);
    except
      Open;
    end;
end;
procedure TFormCont.EditSrchEnvKeyPress(Sender: TObject; var Key: Char);
begin
  If Key<>#13 then exit;
  EditAmount.Text:='';
  EditEnv.Text:='';
  LabelTitle.Caption:='';
  LabelName.Caption:='';
  If EditSrchenv.Text='' then
    begin
      EditEnv.SetFocus;
      exit;
    end;
   With DataMod.QuerySrchName do
     begin
       close;
       Params[0].AsString:=UpperCase(EditSrchEnv.text)+'%';  //('PName')
       Params[1].AsInteger:=-1;                               //('PEnv')
       open;
     end;
   EditEnv.Text:=DataMod.QuerySrchName.FieldByName('ENV_NO').AsString;
   LabelTitle.Caption:= DataMod.QuerySrchName.FieldByName('TITLE').AsString+' '+
                        DataMod.QuerySrchName.FieldByName('FNAME').AsString;
   EditSrchEnv.Text:= DataMod.QuerySrchName.FieldByName('NAME').AsString;
   LabelName.Caption:= EditSrchEnv.Text;
   If EditSrchEnv.Text<>'' then
     begin
       LabelTitle.Visible:=True;
       LabelName.Visible:=True;
       GridSrchEnv.Visible:=True;
       EditEnv.SetFocus;
     end;
end;

procedure TFormCont.TitleComboChange(Sender: TObject);
var
  NextEnv: Integer;
begin
   try
     DataMod.TableEnvNo.Last;
     NextEnv:=DataMod.TableEnvNo.FieldByName('Env_No').AsInteger;
     If GridEditEnv.Cells[1,1]='' then
        GridEditEnv.Cells[1,1]:=IntToStr(NextEnv+1);
     GridEditEnv.Cells[1,2]:=TitleCombo.Text;
     GridEditEnv.SetFocus;
     GridEditEnv.Row:=3;
  except
  end;
end;

procedure TFormCont.RadioTypeClick(Sender: TObject);
begin
 If not GlobRun then exit;
 try
   If RadioType.ItemIndex=0 then
      GridPledge.Cells[1,3]:='Annual'
   else
      GridPledge.Cells[1,3]:='Fixed';
   GridPledge.Row:=4;
   GridPledge.SetFocus;
 except
 end;
end;

procedure TFormCont.BtnCanPledgeClick(Sender: TObject);
begin
  With GridPledge do
    begin
      Cells[1,1]:='';
      Cells[1,6]:='';
      LookUpEnv.Text:='';
      FunAccBox.Text:='';
      LookUpEnv.SetFocus;
     { Edit4.Text:='';  }
    end;
end;

function TFormCont.findName(EnvNo: Integer): String;
var
  IDX: Integer;
  Env: String;
begin
  Result:='Unknown';
  try
    Env:=IntToStr(EnvNo);
  except
    exit;
  end;
  With LookUpEnv do
    for IDX:=0 to Items.Count-1  do
      begin
        If pos(Env,Items[IDX])>0 then
          begin
            Result:=Items[IDX];
            Break;
          end;
       end;
end;

procedure TFormCont.DBGridPledgeDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  R: TRect;
  TmpStr: String;
begin
   TmpStr:='';
   If DataMod.TablePledge.RecordCount<=0 then exit;
   With  DBGridPledge, Canvas do
     begin
       R:=Rect;
       If (Field.FieldName='TYPE') then
          begin
              If Field.AsString='A' then
                TmpStr:='Annual'
              else if Field.AsString='F' then
                TmpStr:='Fixed';
              TextRect(R,R.Left,R.Top,' '+TmpStr);
           end
       else if (Field.FieldName='FUND') and (DataMod.TablePledge.RecordCount>0) then
          With DataMod.QueryFundDesc do
             begin
               close;
               params[0].AsInteger := Field.asInteger;
               open;
               TmpStr := FieldByName('DESCRIPTION').AsString;
               TextRect(R,R.Left,R.Top,' '+TmpStr);
          end;
     end;
end;

function TFormCont.PledgeExist(Env,Fund: Integer): Boolean;
begin
   With DataMod.QueryPledgeData do
     begin
       close;
       params[0].AsInteger := Env;
       params[1].AsInteger := Fund;
       Open;
       If FieldByName('ENV_NO').AsInteger = env then
         result := true
       else
         result := false;
     end;
    //Result:=DataMod.ZFindKey('TablePledge.FindKey([Env,Fund]);
end;

procedure TFormCont.BtnInsPledgeClick(Sender: TObject);
var
  Env,Fund: Integer;
begin
  With GridPledge do
    For Env:=1 to 6 do
      If Cells[1,Env]='' then
        begin
          ShowMessage('You must have values for all fields before posting.');
          exit;
        end;
  With DataMod.TablePledge do
    try
      Env:=StrToInt(GridPledge.Cells[1,1]);
      Fund:=StrToInt(GridPledge.Cells[1,2]);
      If PledgeExist(Env,Fund) then
        Edit
      else
        Insert;
      FieldByName('ENV_NO').AsInteger:=Env;
      FieldByName('FUND').AsInteger:=Fund;
      If GridPledge.Cells[1,3]='Fixed' then
         FieldByName('TYPE').AsString:='F'
      else
         FieldByName('TYPE').AsString:='A';
      If (GridPledge.Cells[1,4]='') then
         begin
           ShowMessage('Must enter a starting date.');
           GridPledge.Row:=4;
           GridPledge.SetFocus;
           DataMod.TablePledge.Cancel;
           exit;
         end;
      If (GridPledge.Cells[1,5]='') then
         begin
           ShowMessage('Must enter an ending date.');
           GridPledge.Row:=5;
           GridPledge.SetFocus;
           DataMod.TablePledge.Cancel;
           exit;
         end;
      FieldByName('BDATE').AsDateTime:=StrToDate(GridPledge.Cells[1,4]);
      FieldByName('EDATE').AsDateTime:=StrToDate(GridPledge.Cells[1,5]);
      FieldByName('AMOUNT').AsFloat:=StrToFloat(GridPledge.Cells[1,6]);
      Post;
      DataMod.TablePledge.Close;
      DataMod.TablePledge.Open;
   // CHECK THIS   DataMod.TablePledge.FindKey([Env]);
      DataMod.TablePledge.Last;
      BtnCanPledge.SetFocus;
   except
     ShowMessage('Data insertion failed, check your entries.');
   end;
end;

procedure TFormCont.GridPledgeKeyPress(Sender: TObject; var Key: Char);
begin
 If Key<>#13 then exit;
  With GridPledge do
    If Row=6 then
      begin
        Row:=1;
        BtnInsPledge.SetFocus;
      end
    else
      Row:=Row+1;
end;

function TFormCont.incYear(YrDate: String):String;
var
  TmpDate: TDateTime;
  Year,Month,Day: Word;
begin
  Result:='';
  try
    TmpDate:=StrToDate(YrDate);
    DecodeDate(TmpDate,Year,Month,Day);
    Inc(Year);
    TmpDate:=EncodeDate(Year,Month,Day);
    Result:=DateToStr(TmpDate);
  except
  end;
end;

procedure TFormCont.BtnAddYearClick(Sender: TObject);
begin
  With GridPledge do
    begin
     If (Cells[1,4]='') or (Cells[1,5]='') then
       begin
         ShowMessage('You must have a start date and end date to increment.');
         exit;
       end;
     if MessageDlg('OK to add another year for Env. No. ' +Cells[1,1]+
     ' to fund '+ Cells[1,2]+' ?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     try
       Cells[1,4]:=incYear(Cells[1,4]);
       Cells[1,5]:=incYear(Cells[1,5]);
     except
     end;
   end;  
end;

procedure TFormCont.BtnPledgeQueryClick(Sender: TObject);
var
  Fund: Integer;
begin

  try
    If EditPledgeFund.Text<>'' then
       Fund:=StrToInt(EditPledgeFund.Text)
    else
       Fund:=0;
  except
    Fund:=0;
  end;
  With DataMod.QueryPledgeSum do
    try
     Close;
     If Fund=0 then
       begin
         Params[0].AsInteger:=100;     //('Fund1')
         Params[1].AsInteger:=999;     //('Fund2')
       end
      else if Fund MOD 100 = 0 then
        begin
          Params[0].AsInteger:=Fund;
          Params[1].AsInteger:=Fund+99;
        end
      else
        begin
          Params[0].AsInteger:=Fund;
          Params[1].AsInteger:=Fund;
        end;
      If RadioSum.ItemIndex<=0 then
         begin
           Params[2].AsString:='A';
           Params[3].AsString:='F';
         end
      else if RadioSum.ItemIndex=1  then
         begin
           Params[2].AsString:='A';            //('Type1')
           Params[3].AsString:='A';            //('Type2')
         end
      else
         begin
           Params[2].AsString:='F';
           Params[3].AsString:='F';
         end;
      Open;
      EditPledgeSum.Text:=FormatFloat('0.00',Fields[0].AsFloat);
    except
      ShowMessage('Can not complete query, check your entries.');
      Open;
    end;

end;

procedure TFormCont.BtnClearSumClick(Sender: TObject);
begin
  ComboPledgeFund.Text:='';
  EditPledgeSum.Text:='';
  EditPledgeFund.SetFocus;
  EditPledgeFund.Text:='';
end;

procedure TFormCont.PledgeSumBoxClick(Sender: TObject);
begin
  DataMod.TableDetail.Open;
  DataMod.TableDetail.First;
end;

procedure TFormCont.BtnCanKeyPress(Sender: TObject; var Key: Char);
begin
  BtnCanClick(Sender as TObject);
end;

procedure TFormCont.EditDetailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key=kbdRight then
     ComboDetail.SetFocus;
end;


procedure TFormCont.BtnQueryClrClick(Sender: TObject);
begin
   EditQEnv.Text:='';
   QueryBox.Text:='';
   EditQFund.Text:='';
   EditSumCont.Text:='';
   EditQEnv.SetFocus;
end;

function TFormCont.GetFirstName(FNT: String): String;
var
  IDX: Integer;
  LocStr,Lnth,OldLnth: Integer;
  Junk: String;
begin
  LocStr:=0;Lnth:=0;OldLnth:=0;
  With TitleCombo do
    for IDX:=0 to Items.Count-1 do
      begin
         Junk:=Items[IDX];
         LocStr:=Pos(Items[IDX],FNT);
         If LocStr>0 then
           begin
             Lnth:=Length(Items[IDX]);
             If Lnth > OldLnth then
               OldLnth:=Lnth;
           end;
      end;
    Result:=Copy(FNT,OldLnth+2,127);
end;

function TFormCont.GetTitle(FNT: String): String;
var
  IDX: Integer;
  LocStr,Lnth,OldLnth: Integer;
  Junk: String;
begin
  LocStr:=0;Lnth:=0;OldLnth:=0;
  With TitleCombo do
    for IDX:=0 to Items.Count-1 do
      begin
         Junk:=Items[IDX];
         LocStr:=Pos(Items[IDX],FNT);
         If LocStr>0 then
           begin
             Lnth:=Length(Items[IDX]);
             If Lnth > OldLnth then
               OldLnth:=Lnth;
           end;
      end;
    Result:=Copy(FNT,1,OldLnth);
end;

procedure TFormCont.DBNameGridDblClick(Sender: TObject);
begin
  With DataMod.TableEnvNo do
    try
      GridEditEnv.Cells[1,1]:=IntToStr(FieldByName('ENV_NO').AsInteger);
      GridEditEnv.Cells[1,2]:=FieldByName('TITLE').AsString;
      GridEditEnv.Cells[1,3]:=FieldByName('FNAME').AsString;
      GridEditEnv.Cells[1,4]:=FieldByName('NAME').AsString;
      GridEditEnv.Cells[1,5]:=FieldByName('ADDRESS_1').AsString;
      GridEditEnv.Cells[1,6]:=FieldByName('ADDRESS_2').AsString;
      GridEditEnv.Cells[1,7]:=FieldByName('CITY').AsString;
      GridEditEnv.Cells[1,8]:=FieldByName('STATE').AsString;
      GridEditEnv.Cells[1,9]:=FieldByName('ZIP').AsString;
      GridEditEnv.Cells[1,10]:=FieldByName('PHONE').AsString;
    except
    end;
end;

procedure TFormCont.BtnDelTorsClick(Sender: TObject);
begin
  With DataMod.TableEnvNo do
    begin
      if MessageDlg('OK to delete '+ FieldByName('TITLE').AsString+' '+
       FieldByName('FNAME').AsString+' '+
       FieldByName('NAME').AsString+' ?',
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
        Delete;
      DataMod.TableEnvNo.Close;
      DataMod.TableEnvNo.Open;
      DataMod.TablePledge.Close;
      DataMod.TablePledge.Open;
      BtnCanTorsClick(Sender as TObject);
      BtnCanPledgeClick(Sender as TObject);
    end;
end;

procedure TFormCont.BtnPledgeDelClick(Sender: TObject);
begin
  With DataMod.TablePledge do
    begin
      if MessageDlg('OK to delete pledge for envelope '+
         FieldByName('ENV_NO').AsString+' for fund '+
         FieldByName('FUND').AsString+' for amount $'+
         FieldByName('AMOUNT').AsString+' ?',
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
        Delete;
      DataMod.TablePledge.Close;
      DataMod.TablePledge.Open;
    end;
end;

function  TFormCont.GetInt(INStr: String): Integer;
var
  IDX: Integer;
begin
  result:=-1;
  try
    If Pos(' ',INStr)=0 then
       Result:=StrToInt(INStr)
    else
      begin
        For IDX:=1 to Length(INStr) do
          If INStr[IDX]=' ' then break;
        result:=StrToInt(Copy(INStr,1,IDX-1));
      end;
  except
    Result:=-1;
  end;
end;

procedure TFormCont.LookUpEnvClick(Sender: TObject);
var
  EnvNo: Integer;
begin
 try
   EnvNo:=GetInt(LookUpEnv.Text);
   If EnvNo>0 then
     begin
       GridPledge.Cells[1,1]:=IntToStr(EnvNo);
       FindPledge;
     end;
 except
 end;
end;

procedure TFormCont.LookUpEnvKeyPress(Sender: TObject; var Key: Char);
var
  EnvNo: Integer;
begin
   If Key<>#13 then exit;
   EnvNo:=GetInt(LookUpEnv.Text);
   If EnvNo<=0 then exit;
   With DataMod.QueryEnvPledge do
     begin
       close;
       params[0].AsInteger := EnvNo;
       open;
       If FieldByName('ENV_NO').AsInteger = EnvNo then
         begin
           GridPledge.Cells[1,1]:=DataMod.TableEnvNo.FieldByName('ENV_NO').AsString;
           LookupEnv.Text:=findName(EnvNo);
           FindPledge;
         end;
     end;    
end;

procedure TFormCont.FunAccBoxClick(Sender: TObject);
begin
  {Edit4.Text:=DataMod.TableDetail.FieldByName('Description').AsString;   }
  GridPledge.Cells[1,2]:=copy(FunAccBox.Text,1,Pos(' ',FunAccBox.Text)-1);
  GridPledge.SetFocus;
  GridPledge.Row:=4;
end;



procedure TFormCont.ComboPledgeFundKeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
begin
  If Key<>#13 then Exit;
  If ComboPledgeFund.Text='' then
    begin
      ComboPledgeFund.SetFocus;
      Exit;
    end;
  I:=GetInt(ComboPledgeFund.Text);
  try
    EditPledgeFund.Text:=IntToStr(I);
    BtnPledgeQuery.SetFocus;
  except
    EditPledgeFund.Text:='';
    EditPledgeFund.SetFocus;
 end;
end;

procedure TFormCont.ComboPledgeFundClick(Sender: TObject);
var
  I: Integer;
begin
  If ComboPledgeFund.Text='' then
    begin
      ComboPledgeFund.SetFocus;
      Exit;
    end;
  I:=GetInt(ComboPledgeFund.Text);
  try
    EditPledgeFund.Text:=IntToStr(I);
    BtnPledgeQuery.SetFocus;
  except
    EditPledgeFund.Text:='';
    EditPledgeFund.SetFocus;
 end;
end;

procedure TFormCont.EditPledgeFundKeyPress(Sender: TObject; var Key: Char);
var
  IDX: Integer;
begin
  If Key<>#13 then exit;
  try
    For IDX:=0 to ComboPledgeFund.Items.Count-1 do
       If pos(EditPledgeFund.Text,ComboPledgeFund.Items[IDX])>0 then
          begin
            ComboPledgeFund.Text:=ComboPledgeFund.Items[IDX];
            Break;
          end;
  except
  end;        
end;


procedure TFormCont.QueryBoxClick(Sender: TObject);
var
  I: Integer;
begin
  If QueryBox.Text='' then
    begin
      QueryBox.SetFocus;
      Exit;
    end;
  I:=GetInt(QueryBox.Text);
  try
    EditQFund.Text:=IntToStr(I);
    BtnQuery.SetFocus;
  except
    EditQFund.Text:='';
    EditQFund.SetFocus;
 end;
end;

procedure TFormCont.QueryBoxKeyPress(Sender: TObject; var Key: Char);
var
  I: Integer;
begin
  If QueryBox.Text='' then
    begin
      QueryBox.SetFocus;
      Exit;
    end;
  I:=GetInt(QueryBox.Text);
  try
    EditQFund.Text:=IntToStr(I);
    BtnQuery.SetFocus;
  except
    EditQFund.Text:='';
    EditQFund.SetFocus;
  end;
end;

procedure TFormCont.EditQFundKeyPress(Sender: TObject; var Key: Char);
var
  IDX: Integer;
begin
  If Key<>#13 then exit;
  try
    For IDX:=0 to QueryBox.Items.Count-1 do
       If pos(EditQFund.Text,QueryBox.Items[IDX])>0 then
          begin
            QueryBox.Text:=QueryBox.Items[IDX];
            Break;
          end;
  except
  end;
end;


function TFormCont.getGroup:Integer;
var
  IDX: Integer;
begin
  IDX:=NoteBookCont.PageIndex;
  Case IDX of
    0: result:=AGroupCont.HelpContext;
    1: result:=AGroupFunds.HelpContext;
    2: result:=AGroupTors.HelpContext;
    3: result:=AGroupPledge.HelpContext;
    4: result:=AGroupQuery.HelpContext;
    5: result:=AGroupRep.HelpContext;
    6: result:=AGroupSum.HelpContext;
    7: result:=AGroupLabel.HelpContext;
   else
     result:=-1;
   end;

end;

{procedure TFormCont.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin
  If msg.message = wm_RBUTTONDOWN then
     If CallHelp(Msg.Pt) then
       Handled:=true;
end;    }

procedure TFormCont.DBGridPledgeDblClick(Sender: TObject);
var
  Fund: Integer;
  FundDescript: String;
begin
 If not GlobRun then exit;
  With DataMod.TablePledge do
    try
      GridPledge.Cells[1,1]:=IntToStr(FieldByName('ENV_NO').AsInteger);
      Fund:=FieldByName('FUND').AsInteger;
      FundDescript := getDetailDesc(Fund);

      If FundDescript <> '' then
         GridPledge.Cells[1,2]:= DataMod.QueryDetail.FieldByName('DETAIL_FUND_NO').AsString;

      If FieldByName('TYPE').AsString='A' then
         GridPledge.Cells[1,3]:='Annual'
      else
         GridPledge.Cells[1,3]:='Fixed';
      GridPledge.Cells[1,4]:=DateToStr(FieldByName('BDATE').AsDateTime);
      GridPledge.Cells[1,5]:=DateToStr(FieldByName('EDATE').AsDateTime);
      GridPledge.Cells[1,6]:=FieldByName('Amount').AsString;
      GridPledge.SetFocus;
      GridPledge.Row:=6;
      findContributor(FieldByName('ENV_NO').AsString);
    except
    end;
end;

procedure TFormCont.findContributor(Env: String);
var
  IDX: Integer;
begin
 LookUpEnv.Text:='';
  With LookUpEnv do
    For IDX:=0 to Items.Count-1 do
      If pos(ENV,Items[IDX]) >0 then
        begin
          ItemIndex:=IDX;
          break;
        end;
end;

{procedure ListEnum (pti: PTypeInfo; sList: TStrings);
var
  I: Integer;
begin
  {with GetTypeData(pti)^ do
    for I := MinValue to MaxValue do
      sList.Add (GetEnumName (pti, I));    }
end;   }

{procedure ShowOrdinal (pti: PTypeInfo; sList: TStrings);
var
  ptd: PTypeData;
begin  }
  { protect against misuse
  if not (pti^.Kind in [tkInteger, tkChar,
      tkEnumeration, tkSet, tkWChar]) then
    raise Exception.Create ('Invalid type information');

  if pti^.Kind = tkEnumeration then
      ListEnum (pti, sList); }
//end;


procedure TFormCont.LabelBoxClick(Sender: TObject);
begin
   With DataMod.QueryLabel do
     try
       close;
       params[0].AsString := LabelBox.Items[LabelBox.ItemIndex];
       open;
       GlobLabel:=True;
      // LabelBrand:=TLabelBrand(LabelBox.ItemIndex);
       EdNumRows.Text:=IntToStr(FieldByName('NumDown').AsInteger);
       EdNumCols.Text:=IntToStr(FieldByName('NumAcross').AsInteger);
       EdTopMargin.Text :=FormatFloat('0.000',FieldByName('SpacingTop').AsFloat);
       EdLeftMargin.Text:=FormatFloat('0.000',FieldByName('SpacingLeft').AsFloat);
       EdLabelWide.Text :=FormatFloat('0.000',FieldByName('LabelWidth').AsFloat);
       EdSpaceWide.Text :=FormatFloat('0.000',FieldByName('SpacingWidth').AsFloat);
       EdLabelHigh.Text :=FormatFloat('0.000',FieldByName('LabelHeight').AsFloat);
       EdSpaceHigh.Text :=FormatFloat('0.000',FieldByName('SpacingHeight').AsFloat);
    finally
      GlobLabel:=False;
    end;
end;

procedure TFormCont.RadioCashClick(Sender: TObject);
begin

end;


procedure TFormCont.EdNumRowsExit(Sender: TObject);
begin
// LabelChange(1);
end;

procedure TFormCont.EdNumColsExit(Sender: TObject);
begin
 // LabelChange(2);
end;

procedure TFormCont.EdLeftMarginExit(Sender: TObject);
begin
// LabelChange(3);
end;

procedure TFormCont.EdTopMarginExit(Sender: TObject);
begin
 //LabelChange(4);
end;

procedure TFormCont.EdLabelWideExit(Sender: TObject);
begin
 // LabelChange(5);
end;

procedure TFormCont.EdSpaceWideExit(Sender: TObject);
begin
// LabelChange(6);
end;

procedure TFormCont.EdSpaceHighExit(Sender: TObject);
begin
// LabelChange(8);
end;



procedure TFormCont.BtnPrintAllClick(Sender: TObject);
begin
  if MessageDlg('OK to print labels for all members ?',
    mtConfirmation, [mbNo, mbYes], 0) = mrYes then
     ReportLabel(DataMod.SrcMemAll);
end;

procedure TFormCont.CheckBoxPostNetChange(Sender: TObject);
begin

end;

procedure TFormCont.EditFromDateExit(Sender: TObject);
begin
  EditFromDate.Text := FormatDate(EditFromDate.Text);
end;

procedure TFormCont.EditToDateExit(Sender: TObject);
begin
    EditToDate.Text := FormatDate(EditToDate.Text);
end;

procedure TFormCont.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
   CloseFile(LogFile);
end;

procedure TFormCont.BtnLabelClick(Sender: TObject);
begin
  ReportLabel(DataMod.SrcMem);
end;

 procedure TFormCont.ReportLabel(Src: TDataSource);
var
  X,Y: Single;
  EZLabelClass: TAddressLabelClass;
  Add1,ZipCode, fName: String;
  LabelFont: FontType;
begin
    try
      If EdXPos.Text<>'' then
        X:=StrToFloat(EdXPos.Text)
      else
        X:=0.25;
      If EdYPos.Text<>'' then
        Y:=StrToFloat(EdYPos.Text)
      else
        Y:=0.25;
     except
       ShowMessage('Text edge information is not correct, check your entries.');
       exit;
     end;

     EZLabelClass := TAddressLabelClass.Create;
     fName := 'Labels' + '-'+DateToStr(Date)+'.ps';
     EZLabelClass.OpenPrintFile(fName);
     If EdFontSize.Tag <> 0 then
       LabelFont.FontSize := EdFontSize.Tag
     else
       LabelFont.FontSize := 10;

       EdFontSize.Tag := 0;
       LabelFont.FontName := 'Helvetica';
     With EZLabelClass do
       try
         Font:= LabelFont;
         PrintPostNet := CheckBoxPostNet.Checked;
         NumDown :=  strToInt(EdNumRows.Text);
         NumAcross := StrToInt(EdNumCols.text);
         MarginTop := StrToFloat(EdTopMargin.text);
         MarginLeft := StrToFloat(EdLeftMargin.text);
         TextMarginTop := StrToFloat(EdYPos.Text);
         TextMarginLeft := StrToFloat(EDXPos.Text);
         LabelWidth := StrToFloat(EdLabelWide.Text);
         LabelHeight := StrToFloat(EdLabelHigh.Text);
         SpacingWidth := StrToFloat(EdSpaceWide.Text);
         SpacingHeight := StrToFloat(EdSpaceHigh.Text);

         PrintLabels(Src);
         ClosePrintFile;
         Destroy;
       except
         ShowMessage('Bad number in at least one label edit box.');
       end;
 end;

{procedure TFormCont.LabelShellLabelPrint(ReportPrinter: TBaseReport;
  LabelShell: TLabelShell; var Valid: Boolean);
var
  X,Y: Single;
  BarCode : TRPBarsBase;
  Add1,ZipCode: String;
begin
 If not Valid then exit;
 With ReportPrinter,DataMod.QueryMemPrint do
   begin
    try
      If EdXPos.Text<>'' then
        X:=StrToFloat(EdXPos.Text)
      else
        X:=0.25;
      If EdYPos.Text<>'' then
        Y:=StrToFloat(EdYPos.Text)
      else
        Y:=0.25;
     except
       ShowMessage('Text edge information is not correct, check your entries.');
       exit;
     end;
    YPos:=Y;
    XPos:=X;
    Println(FieldByName('Title').AsString+' '+
            FieldByName('FNAME').AsString+' '+
            FieldByName('NAME').AsString);
    Add1:=FieldByName('ADDRESS_1').AsString;
    If Add1 <> '' then
      begin
        XPos:=X;
        Println(Add1);
      end;  //if

    If FieldByName('ADDRESS_2').AsString <> '' then
      begin
        XPos:=X;
        Println(FieldByName('ADDRESS_2').AsString);
      end;  //if
    XPos:=X;
    Print(FieldByName('CITY').AsString);

    If FieldByName('STATE').AsString <> '' then
      begin
        Print(', ' + FieldByName('STATE').AsString);
      end;  //if
    ZIPCode:=FieldByName('ZIP').AsString;
    If ZipCode <> '' then
      begin
        Print('  ' + ZipCode);
        Y:=LabelShell.SpacingHeight-0.25;
        PrintBarCode(ReportPrinter,Add1,ZipCode,X,Y);
      end;  //if
    NewLine;

  end;  //with
end; }


procedure TFormCont.EdFontSizeExit(Sender: TObject);
var
  FS: Integer;
begin
  If EdFontSize.Text='' then exit;
  try
    FS:=StrToInt(EdFontSize.Text);
    If (FS<=7) or (FS>=14) then
      ShowMessage('Font size should be between 8 and 14.');
    GlobFontSize:=FS;
  except
    ShowMessage('Font  size is not valid, check your entries.');
  end;
    EdFontSize.Tag := FS;
 end;

procedure TFormCont.BtnLabClrClick(Sender: TObject);
begin
  DataMod.TableEditEnv.First;
  With DataMod.TableEditEnv do
     while not EOF do
       begin
         Edit;
         FieldByName('PRINT').AsString:='';
         Post;
         Next;
       end;
   DataMod.QueryMem.Close;
   DataMod.QueryMem.Open;
   EdFontSize.Tag := 0;
   EdNumCols.Text := '0';
   EdNumRows.Text := '0';
end;

procedure TFormCont.setConTabs;
var
  I: Integer;
  TmpTab: PTab;
  BH10: Double;
  BH12: Double;
begin
  With EZPClass do
  begin
     BH10 := PointToInch(Round(10 * LineScale));
     BH12 := PointToInch(Round(12 * LineScale));
    for I := 1 to 9 do
      begin
        FreeTabs(I);
        setTabBoxHeight(I,BH10);
      end;
    TmpTab := NewTab(1, 0.5,JUSTIFYLEFT, 1.25,0.05, False, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYRIGHT, 1.0,0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYRIGHT, 0.875,0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYLEFT, 2.125,0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYRIGHT, 1.0,0.05, True, BOXLINENONE,0);


    TmpTab := NewTab(2, 0.5, JUSTIFYLEFT, 1.25,0.05, False,BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(2, 0.0, JUSTIFYRIGHT, 1.0,0.05, True, BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,2);
    TmpTab := NewTab(2, 0.0, JUSTIFYCENTER, 0.5,0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(2, 0.0, JUSTIFYLEFT, 2.5,0.05, True, BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(2, 0.0, JUSTIFYRIGHT,1.0,0.05, True, BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,2);

    TmpTab := NewTab(3,0.5,JUSTIFYLEFT,4.50,0.05,False, BOXLINEALL,2);
    TmpTab := NewTab(3,5.95,JUSTIFYRIGHT,1.3,0.05,False, BOXLINEALL,2);

    TmpTab := NewTab(4, 4.5,JUSTIFYRIGHT,3.0,0.05, False, BOXLINENONE,0);

    TmpTab := NewTab(5, 0.5, JUSTIFYLEFT, 0.8, 0.05, False, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYLEFT, 1.75, 0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYRIGHT, 1.4, 0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYRIGHT, 1.4, 0.05, True, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYRIGHT, 1.4, 0.05, True, BOXLINENONE,0);

    TmpTab := NewTab(6,0.5,JUSTIFYLEFT,0.8,0.05,False,BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYLEFT,1.75,0.05,True,BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYRIGHT,1.4,0.05,True,BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYRIGHT,1.4,0.05,True,BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYRIGHT,1.4,0.05,True,BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,2);

    TmpTab := NewTab(8,4.5,JUSTIFYRIGHT,3.0,0.05,False,BOXLINENONE,0);

    TmpTab := NewTab(9,4.5,JUSTIFYRIGHT,3.0,0.05,False,BOXLINENONE,0);
  end;
end;

procedure TFormCont.ReportContributions;
var
  ConSumStr, FundDesc, ChurchName: String;
  ConDate,TmpDate: TDateTime;
  AmtSum,ConSum,FundSum, BH10: Double;
  MB: TBookMark;
  TmpTab: PTab;
begin
  ConSum:=0.0;
  FundSum:=0.0;
  TmpDate:=0.0;
  SetConTabs;
  ChurchName := DataMod.TableChurch.FieldByName('NAME').AsString;
  DataMod.QueryRCbutions.first;
  With EZPClass,DataMod.QueryRCbutions do
      begin
      BH10 := PointToInch(Round(10*LineScale));
      Bold:=True;
      RestoreFont(2); //Helvetica 10
      setPageMargins(0.5, 0.25, 0.25, 0.25);
      PrintCenterPage(ChurchName);
      Newline;
      NewLine;
     // SetFont('Arial',10);
      PrintLeft(GlobTitle+' '+GlobFName+' '+GlobName,0.5);
      PrintCenterPage('Contributions');
      PrintRight(GlobFrom+' Through '+GlobThru, 7.10);
      Bold:=False;
      NewLine;


      NewLine;
      PrintTab(2,'DATE');
      PrintTab(2,'AMOUNT');
      PrintTab(2,' ');
      PrintTab(2,'FUND DESCRIPTION');
      PrintTab(2,'AMOUNT');
      //NewLine;

      While not EOF do
        begin
          //Look ahead to get sum for contribution date
          MB:=GetBookMark;
          AmtSum:=0.0;
          ConDate:=FieldByName('C_DATE').AsDateTime;
          While (ConDate=FieldByName('C_DATE').AsDateTime) and
                 (not EOF)  do
            begin
               //Add contributions until date changes
               AmtSum:=AmtSum+FieldByName('AMOUNT').AsFloat;
               Next;
            end; //While ConDate
          //Go back to original record

          DataMod.QueryRCbutions.GotoBookMark(MB);
          DataMod.QueryRCbutions.FreeBookMark(MB);
          ConSum:=ConSum+AmtSum;
          ConSumStr:=Format('%m',[AmtSum]);
          TmpDate:=ConDate;
          While (FieldByName('C_DATE').AsDateTime=ConDate) and
                (not EOF) do
            begin
              If TmpDate<>0.0 then
                 PrintTab(1, DateTimeToStr(TmpDate))
              else
                 PrintTab(1, ' ');
              PrintTab(1, ConSumStr);
              PrintTab(1, FieldByName('DETAIL_FUND').AsString);

              With DataMod.QueryFundDesc do
             begin
               FundDesc :=getDetailDesc(DataMod.QueryRCButions.FieldByName('DETAIL_FUND').AsInteger);
               If FundDesc <> '' then
                  PrintTab(1, FundDesc)
               else
                  PrintTab(1, ' ');
             end;

              PrintTab(1, Format('%m',[FieldByName('AMOUNT').AsFloat]));
              FundSum:=FundSum+FieldByName('AMOUNT').AsFloat;
              //NewLine;
              If LinesLeft<3 then NewPage;
              TmpDate:=0.0;
              ConSumStr:='';
              ChkList(FieldByName('DETAIL_FUND').AsString);
              Next;
            end; //while Field
         //next;
       end; //While not eof

      PrintTab(2, ' ');
      PrintTab(2, Format('%m',[ConSum]));
      PrintTab(2, ' ');
      PrintTab(2, 'Total');
      PrintTab(2, Format('%m',[FundSum]));
       If LinesLeft<3 then NewPage;
       doConFunds;
       If LinesLeft<3 then NewPage;
       doMultiFunds;
       NewLine;
       NewLine;
       NewLine;
       If LinesLeft<4 then
          NewPage;

       Bold:=True;
       PrintTab(3,'Total Contributions for period '+
                 GlobFrom+' Through '+GlobThru);

       PrintTab(3,Format('%m',[FundSum]));
       NewLine;
       NewLine;
       PrintCenterPage('Thank you for contributing to these ministries.');
       EndPage;
   end; //With
end;

procedure TFormCont.doConFunds;
var
  IDX,Junk: Integer;
  Amnt,Pledge,Rem: Double;
  TotAmnt,TotPledge,TotRem: Double;
begin
  With DataMod.QueryFund do
    With EZPClass do
    begin
      TotAmnt:=0.0;TotPledge:=0.0;TotRem:=0.0;
      NewLine;
      NewLine;
      NewLine;
      Bold:=True;
      PrintCenterPage('Single Year Summary ');
      Bold:=False;
      PrintRight(GlobFrom+' Through '+GlobThru, 7.10);
      //PrintTab(4, GlobFrom+' Through '+GlobThru);
      NewLine;


      NewLine;
      ResetTab(6);
      PrintTab(6,'FUND');
      PrintTab(6,'DESCRIPTION');
      PrintTab(6,'AMOUNT');
      PrintTab(6,'PLEDGE');
      PrintTab(6,'REMAINDER');
     // NewLine;
      Close;
      Params[0].AsInteger:=GlobEnv;   //ByName('EnvNo')
      Params[1].AsDateTime:=StrToDate(GlobFrom); //ByName('FromDate')
      Params[2].AsDateTime:=StrToDate(GlobThru);  //ByName('ToDate')
      Params[3].AsInteger:=          //ByName('FundParm')
          DataMod.QueryRPledge.FieldByName('Fund').asInteger;


      For IDX:=0 to ConList.Count-1 do
        begin
           Close;
           Junk:=StrToInt(ConList[IDX]);
           Params[3].AsInteger:=Junk;     //ByName('FundParm')
           Open;
           DataMod.QueryRPledge.Close;
           DataMod.QueryRPledge.Params[0].AsInteger:=GlobEnv;  //ByName('EnvNo')
           DataMod.QueryRPledge.Params[1].AsInteger:=Junk;     //ByName('Fund')
           DataMod.QueryRPledge.Params[2].AsString:='%';      //ByName('Type')
           DataMod.QueryRPledge.Open;
           PrintTab(5, IntToStr(Junk));
           With DataMod.QueryFundDesc do
             begin
               close;
               params[0].AsInteger := Junk;
               open;
               if FieldByName('DESCRIPTION').AsString <> '' then
                  PrintTab(5, FieldByName('DESCRIPTION').AsString)
               else
                  PrintTab(5, ' ');
             end;

           Amnt:=Fields[0].AsFloat;
           TotAmnt:=TotAmnt+Amnt;
           PrintTab(5, Format('%m',[Amnt]));
           If (DataMod.QueryRPledge.RecordCount>0) and
              (DataMod.QueryRPledge.FieldByName('Type').AsString<>'F') then
                 begin
                   Pledge:=DataMod.QueryRPledge.FieldByName('AMOUNT').AsFloat;
                   TotPledge:=TotPledge+Pledge;
                   Rem:=Pledge-Amnt;
                   TotRem:=TotRem+Rem;
                   If Rem<0 then Rem:=0.0;
                   PrintTab(5,Format('%m',[Pledge]));
                   PrintTab(5,Format('%m',[Rem]));
                 end;
              //NewLine;
        end; {for IDX}

        PrintTab(6,' ');
        PrintTab(6,'Totals');
        PrintTab(6,Format('%m',[TotAmnt]));
        PrintTab(6,Format('%m',[TotPledge]));
        PrintTab(6,Format('%m',[TotRem]));
    end;
end;

procedure TFormCont.doMultiFunds;
var
  MBDate,MEDate: TDateTime;
  BDateStr, FDesc: String;
  IDX,Junk: Integer;
  Amnt,Pledge,Rem: Double;
  TotAmnt,TotPledge,TotRem: Double;
  TmpTab: PTab;
begin
  with DataMod.QueryMulti do
    begin
      TotAmnt:=0.0;TotPledge:=0.0;TotRem:=0.0;
      Close;
      Params[0].AsInteger:=GlobEnv;    //ByName('EnvNo')
      Params[1].AsString:='F';         //ByName('Type')
      Open;
      MBDate:=FieldByName('BDATE').AsDateTime;
      BDateStr:=FieldByName('BDATE').AsString;
      If RecordCount<=0 then exit;
      With EZPClass do
        begin
          NewLine;
          NewLine;
          NewLine;
          Bold:=True;
          PrintCenter('Multi Year Summary', 4.0);
          Bold:=False;
          PrintTab(8, BDateStr+' Through '+GlobThru);
          NewLine;
         // NewLine;

          PrintTab(6, 'FUND');
          PrintTab(6, 'DESCRIPTION');
          PrintTab(6, 'AMOUNT');
          PrintTab(6, 'PLEDGE');
          PrintTab(6, 'REMAINDER');
         // NewLine;

          While not EOF do
            begin
              DataMod.QueryFund.Close;
              DataMod.QueryFund.Params[0].AsInteger:=GlobEnv;         //ByName('EnvNo')
              DataMod.QueryFund.Params[1].AsDateTime:=MBDate;         //ByName('FromDate')
              DataMod.QueryFund.Params[2].AsDateTIme:=StrToDate(GlobThru);  //ByName('ToDate')
              DataMod.QueryFund.Params[3].AsInteger:=                      //ByName('FundParm')
                   FieldByName('Fund').asInteger;


              DataMod.QueryFund.Open;
              Junk:=FieldByName('Fund').AsInteger;
              PrintTab(5, IntToStr(Junk));
              fDesc := getDetailDesc(Junk);
                 if FDesc <>'' then
                   PrintTab(5, FDesc)
                 else
                   PrintTab(5, ' ');

              Amnt:=DataMod.QueryFund.Fields[0].AsFloat;
              TotAmnt:=TotAmnt+Amnt;
              PrintTab(5,Format('%m',[Amnt]));
              If DataMod.QueryMulti.RecordCount>0 then
                 begin
                   Pledge:=DataMod.QueryMulti.FieldByName('AMOUNT').AsFloat;
                   TotPledge:=TotPledge+Pledge;
                   Rem:=Pledge-Amnt;
                   TotRem:=TotRem+Rem;
                   If Rem<0 then Rem:=0.0;
                   PrintTab(5, Format('%m',[Pledge]));
                   PrintTab(5, Format('%m',[Rem]));
                 end;
             // NewLine;
              next;
            end; //While

          PrintTab(6, ' ');
          PrintTab(6,'Totals');
          PrintTab(6, Format('%m',[TotAmnt]));
          PrintTab(6, Format('%m',[TotPledge]));
          PrintTab(6, Format('%m',[TotRem]));
        end; //With EZPClass
     end; //with datamod.QueryMulti
end;

procedure TFormCont.RadioPreviewClick(Sender: TObject);
begin
  { With ReportSystemCon do
     begin
       If RadioPreview.ItemIndex<=0 then
          DefaultDest:=rdPreview
       else
          DefaultDest:=rdPrinter;
     end; }
end;

procedure TFormCont.EdVuBoxClick(Sender: TObject);
begin
   With EdVuBox do
     begin
       If Checked then
         begin
           GridQuery.Color:=clWhite;
           GridQuery.Options:=GridQuery.Options+[dgEditing];
         end
       else
         begin
           GridQuery.Color:=clAqua;
           GridQuery.Options:=GridQuery.Options-[dgEditing];
           SumCont;
         end;
    end;
end;

function TFormCont.IndexOfName(IName: String; ArrDex: Integer): Integer;
var
  IX,IY,Equal,St,En: Integer;
  SubStr: String;
begin
  Result:=-1;
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
end;

function TFormCont.getValues(IDX,IDY: Integer):Integer;
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
end;

procedure TFormCont.GridQueryDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
var
  R: TRect;
  TmpStr: String;
begin
   If DataMod.QueryCont.RecordCount<=0 then exit;
   With  GridQuery, Canvas do
     begin
       R:=Rect;
       If (Field.FieldName='TYPE') then
          begin
              If Field.AsString='K' then
               TmpStr:='Cash'
            else if Field.AsString='C' then
               TmpStr:='Check'
            else
               TmpStr:='?';
            TextRect(R,R.Left,R.Top,' '+TmpStr)
           end;
     end;
end;

procedure TFormCont.BtnFundClrClick(Sender: TObject);
begin
  QueryBox.ItemIndex:= -1;
  EditQFund.Text:='';
end;

procedure TFormCont.BtnSumFundClick(Sender: TObject);
begin
  ComboPledgeFund.ItemIndex:= -1;
  EditPledgeFund.Text:='';
end;

procedure TFormCont.srchEnvelope;
begin
  If EditEnv.Text='' then exit;
  try
    With DataMod.QueryNow do
      begin
        Close;
        Params[0].AsInteger:=StrToInt(EditEnv.Text);    //('NEnv')
        Params[1].AsDateTime:=Date;                    //('NDate')
        Open;
      end;
  except
  end;
end;

procedure TFormCont.GridSrchEnvDblClick(Sender: TObject);
var
  Env: Integer;
begin
  Env:=DataMod.QuerySrchName.FieldByName('ENV_NO'). AsInteger;
  try
    EditEnv.Text:=IntToStr(Env);
    doEnvKey(#13);
  except
  end;
end;

procedure TFormCont.EditEnvExit(Sender: TObject);
begin
 SrchEnvelope;
end;

procedure TFormCont.EditSrchEnvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=kbdDown then
    EditEnv.SetFocus;
end;

procedure TFormCont.EditEnvKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 If Key=kbdUp then
    EditSrchEnv.SetFocus
 else if Key=kbdDown then
    ComboDetail.SetFocus;
end;

procedure TFormCont.EditAmountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   If Key=kbdUp then
    ComboDetail.SetFocus
 else if Key=kbdDown then
    BtnPost.SetFocus;
end;

function TFormCont.formatDate(D: String): String;
var
  I: Integer;
  Res: String;
begin
  Res := '';
  for I := 1 to length(D) do
    if D[I] = '/' then
       Res := Res + '-'
    else
       Res := Res + D[I];
  Result := Res;
end;

procedure TFormCont.ScaleScreen;
var
  X,Y: Integer;
  NewX,NewY: Double;
begin
{  FormCont.Scaled:=True;
  X:=getSystemMetrics(SM_CXSCREEN);
  Y:=getSystemMetrics(SM_CYSCREEN);
  NewX:=100.0*(FormCont.Width/X);
  NewY:=100.0*(FormCont.Height/Y);
  If NewX>=NewY then
     ScaleControls(100,trunc(NewX))
  else
     ScaleControls(100,trunc(NewY));
  if (X<>Screen.Height) or (Y<>Screen.Width) then
    begin
      FormCont.Height:=FormCont.Height*X DIV Screen.Width;
      FormCont.Width:=FormCont.Width*Y DIV Screen.Height;
    end; }
end;





procedure TFormCont.ComboDetailChange(Sender: TObject);
begin
  EditAmount.Text:='';
end;

//initialization
//  {$i cont.lrs}

end.

