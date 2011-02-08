unit cont;

  {$mode objfpc}{$H+}
  {$R cont.lfm}

interface

Uses
Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
ExtCtrls, DBGrids, LResources, sqldb, DbCtrls, chelp, IBConnection, db, Grids,
ComCtrls, Spin, Menus, StrUtils, LHelpControl, newpsclass, Keyboard;

type

  { TFormCont }

  TFormCont = class(TForm)
    Bevel1: TBevel;
    BtnCan: TButton;
    BtnPost: TButton;
    BtnView: TButton;
    CBMember: TCheckBox;
    CheckBoxPostNet: TCheckBox;
    DBNameGrid: TDBGrid;
    Label47: TLabel;
    Label8: TLabel;
    NotebookCont: TPageControl;
    PageEntry: TTabSheet;
    PageDetail: TTabSheet;
    PageContrib: TTabSheet;
    PagePledge: TTabSheet;
    PageQuery: TTabSheet;
    PageReport: TTabSheet;
    PageMisc: TTabSheet;
    PageLabels: TTabSheet;
    Label23: TLabel;
    Label4: TLabel;
    EditSrchEnv: TEdit;
    Label1: TLabel;
    EditEnv: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditAmount: TEdit;
    Label5: TLabel;
    GridSrchEnv: TDBGrid;
    AGroupFunds: TGroupBox;
    Label24: TLabel;
    GridDetail: TDBGrid;
    AGroupTors: TGroupBox;
    Label13: TLabel;
    PipMenuNil: TPopupMenu;
    PopMenuNil: TPopupMenu;
    SEFontSize: TSpinEdit;
    Timer1: TTimer;
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
    LabelSPL: TLabel;
    LabelSPT: TLabel;
    EDXPos: TEdit;
    EdYPos: TEdit;
    EdFontSize: TEdit;
    Label43: TLabel;
    Label44: TLabel;
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
    procedure BtnViewClick(Sender: TObject);
    procedure EditFromDateExit(Sender: TObject);
    procedure EditToDateExit(Sender: TObject);
    procedure FunAccBoxChange(Sender: TObject);
    procedure LabelBoxClick(Sender: TObject);
    procedure LookUpEnvChange(Sender: TObject);
    function  DeletePledge(EnvNo, Fund: Integer): Boolean;
    function  findName(EnvNo: Integer): String;
    procedure ShowContext(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure srchEnvelope;
    procedure sumCont;
    procedure findContributor(Env: String);
    procedure upPledgeList(EnvNo,Title,FName,GName: String);

    procedure OpenAfterPost;
    procedure FindPledge(Env: Integer);
    procedure doEnvKey(Key: Char);
    function  removeSpace(Str: String): String;
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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnMonPrntClick(Sender: TObject);
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
    procedure BtnQueryClrClick(Sender: TObject);
    procedure DBNameGridDblClick(Sender: TObject);
    procedure BtnDelTorsClick(Sender: TObject);
    procedure FunAccBoxClick(Sender: TObject);
    procedure ComboPledgeFundKeyPress(Sender: TObject; var Key: Char);
    procedure ComboPledgeFundClick(Sender: TObject);
    procedure EditPledgeFundKeyPress(Sender: TObject; var Key: Char);
    procedure QueryBoxClick(Sender: TObject);
    procedure QueryBoxKeyPress(Sender: TObject; var Key: Char);
    procedure EditQFundKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridPledgeDblClick(Sender: TObject);
    procedure EdNumRowsExit(Sender: TObject);
    procedure EdNumColsExit(Sender: TObject);
    procedure EdLeftMarginExit(Sender: TObject);
    procedure EdTopMarginExit(Sender: TObject);
    procedure EdLabelWideExit(Sender: TObject);
    procedure EdSpaceWideExit(Sender: TObject);
    procedure EdSpaceHighExit(Sender: TObject);
    procedure EdFontSizeExit(Sender: TObject);
    procedure BtnLabClrClick(Sender: TObject);
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
    procedure ReportLabel(Src: TDataSource; Outline: Boolean);
    procedure ReportContributions;
   // procedure MonthDayBeforePrint;
    procedure setConTabs;
    procedure setMonthDayTabs;
    procedure CheckHelpOpen;
   procedure initPledges;
   procedure initfunds;
   procedure initOpenTables;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  {procedure ShowOrdinal (pti: PTypeInfo; sList: TStrings);
  procedure ListEnum (pti: PTypeInfo; sList: TStrings);  }
const
   HelpFN: String='../help/ezcont.chm';
   LINESIZE = 0.28;

var
  FormCont: TFormCont;
  HForm: THelpForm;
  LogFile: Text;
  Activated: Boolean;
  RPrinter: TPostScriptClass;
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
       ApplyUpdates;
       DataMod.SQLTransactionEZ.commit;
       Result:=True;
     end;
 except
   ShowMessage('Error: Check your entries.');
   DataMod.SQLTransactionEZ.RollBack;
   Result:=False;
 end;
   OpenAfterPost;
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
   if activated then exit;
   Activated := true;
   If GlobRun then exit;
  // ScaleScreen;
   WindowState := wsNormal;
   Activated := true;
  GlobLabel:=False;
  GlobFontSize:=10;
  RadioSum.ItemIndex:=0;
  RadioCash.ItemIndex:=0;
  RadioRepType.ItemIndex:=0;
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
  If RPrinter <> nil then
    With RPrinter do
      begin
        PutCurrentFont(HELVETICA,10);
      end;
   initPledges;
   initFunds;
   initOpenTables;
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
 // If GlobIns then exit;
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
      if CBMember .checked then
         DataMod.TableEditEnv.FieldByName('MEMBER').AsString := 'X'
      else
        DataMod.TableEditEnv.FieldByName('MEMBER').AsString := '';
      DataMod.TableEditEnv.Post;
      DataMod.TableEditEnv.ApplyUpdates;
      DataMod.SQLTransactionEZ.Commit;
      DataMod.TableEnvNo.Close;
      DataMod.TableEnvNo.Open;
      DataMod.TableEnvNo.Last;
    //  GlobIns:=True;
      BtnCanTors.SetFocus;
      upPledgeList(Cells[1,1],Cells[1,2],Cells[1,3],Cells[1,4]);
    except
      ShowMessage('Could not enter this data, check the entries.');
    end;
   initOpenTables;
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
  CBMember.Checked := false;
  TitleCombo.SetFocus;
end;

procedure TFormCont.FindPledge(Env: Integer);
var
  EnvNo, Fund: Integer;
  FundDescript: String;
begin
 With DataMod.QueryEnvPledge do
   If Env >= 0 then
      begin
        Close;
        Params[0].AsInteger:=Env;
        Open;
        try
           If not GlobRun then exit;
           GridPledge.Cells[1,1]:=IntToStr(Env);
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
          // findContributor(Env);
      except
      end;
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
  // fName := 'contributions'+'-'+DateToStr(Date)+'.ps';
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
           ReportContributions;
        //   If DataMod.ZFindKey('MEMBERS', 'ENV_NO', 'FALSE', GlobEnv) then
           If GetDetailDesc(GlobEnv) <> '' then
              begin
                DataMod.TableEditEnv.Edit;
                DataMod.TableEditEnv.FieldByName('PRINT').AsString:='X';
                DataMod.TableEditEnv.Post;
              end;
           next;
         end;
          RPrinter.ViewFile;
       except
         ShowMessage('Error: check your entries.');
       end;
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
  Activated := False;
  GlobFrom:='';
  GlobThru:='';
  ConList:=TStringList.Create;
  WindowState := WSNormal;
  Caption := 'Contributions';
end;

procedure TFormCont.FormDestroy(Sender: TObject);
var
  IDX: Integer;
begin
  ConList.Free;
      if HForm <> nil then HForm.close;
   If RPrinter <>nil then
     begin
       RPrinter.free;
       RPrinter := nil;
     end;
end;

procedure TFormCont.CheckHelpOpen;
begin
  if HForm <> nil then
    if not HForm.visible then
       HForm.visible := true;

  if HForm = nil then
       HForm := THelpForm.Create(Self);
  HForm.ShowOnTop;
end;


procedure TFormCont.ShowContext(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  hcontext: Integer;
  URL: String;
begin
  URL := 'file://'+HelpFN;
 if (Button = mbRight) then
   begin
    CheckHelpOpen;
    hcontext:=TControl(Sender).HelpContext;
    If HForm <> nil then
      HForm.OpenUrl(Url,hContext);
    HForm.ShowOnTop;
   end;
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
  If RPrinter = nil then
       RPrinter := TPostscriptClass.Create;
  RPrinter.PageNo:=0;
  If not DataMod.TableRFund.active then DataMod.TableRFund.open;
  DataMod.TableRFund.First;
  ReportMonthDay
end;


procedure TFormCont.setMonthDayTabs;
var
  TmpTab: PTab;
  BH12: Double;
  CheckFont: FontType;
begin
   With RPrinter do
    begin
      CheckFont.FontName := HELVETICA;
      CheckFont.FontSize := 10;
      Font := CheckFont;
      FreeTabs(1);
      FreeTabs(2);
      FreeTabs(3);
      FreeTabs(4);
      FreeTabs(5);

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
      TmpTab := NewTab(3, 6.00,JUSTIFYRIGHT,1.50,0.05,False,BOXLINEALL,0);

      TmpTab := NewTab(4, 0.5,JUSTIFYCENTER,8.0,0.05, False,BOXLINENONE,0);
      PutTabFont(1, HELVETICA, 10);
      PutTabFont(2, HELVETICA, 10);
      PutTabFont(3, HELVETICA, 10);
      PutTabFont(4, HELVETICA, 10);
    end;
end;


procedure TFormCont.MonthDayNewPage;
var
  RepFont: FontType;
begin
  With RPrinter do
    begin
      NewPage;
      If PageNo<=0 then
        begin
         RepFont.FontName := 'HELVETICA';

          RepFont.FontSize := 12;
          Font := RepFont;
          Bold:=True;
          If RadioRepType.ItemIndex<=0 then
              PrintPSTab(4,'Contributions Entered on  '+PickerRep.Text)
          else
            PrintPSTab(4,'Financial Report for the Month of '+ConRepBox.Text +' '+
                    YearEd.Text);
          RepFont.FontSize := 10;
          Font := RepFont;
          PSNewline;
          Bold := False;
        end; //if PageNo

       PageNo := PageNo + 1;
       PSNewline;
      // RestoreTabs(2);
      // SetFont('Arial',10);
       Bold:=True;
       PrintPSTab(2,'Fund');
       PrintPSTab(2,'Description');
       PrintPSTab(2,'Cash');
       PrintPSTab(2,'Checks');
       PrintPSTab(2,YearEd.Text+' to Date');
       PSNewline;
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
    if RPrinter = nil then
       RPrinter := TPostscriptClass.Create;

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
            If RPrinter.LinesLeft(LINESIZE) <3 then MonthDayNewPage;
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

            RPrinter.PrintPSTab(1,DataMod.QueryFGroup.FieldByName('Detail_Fund_No').AsString);
            RPrinter.PrintPSTab(1,DataMod.QueryFGroup.FieldByName('Description').asString);
            RPrinter.PrintPSTab(1,Format('%m',[CashTotal]));
            RPrinter.PrintPSTab(1,Format('%m',[CheckTotal]));
            RPrinter.PrintPSTab(1,Format('%m',[YrTotal]));

              DataMod.QueryFGroup.Next;
         except
            ShowMessage('Error doing report queries, contributions');
         end;   //While QueryFGroup not EOF

         If RPrinter.LinesLeft(LINESIZE)<3 then MonthDayNewPage;

         RPrinter.PrintPSTab(3,DataMod.TableFundGroups.FieldByName('FUND_GROUP').AsString);
         RPrinter.PrintPSTab(3,DataMod.TableFundGroups.FieldByName('DESCRIPTION').AsString);
         RPrinter.PrintPSTab(3,Format('%m',[CashGroupTotal]));
         RPrinter.PrintPSTab(3,Format('%m',[GroupTotal]));
         RPrinter.PrintPSTab(3,Format('%m',[GroupTotalYear]));
         RPrinter.PSNewline;
         DataMod.TableFundGroups.Next;
     end; //While TableFundGroups not EOF/

     If RPrinter.LinesLeft(LINESIZE)<3 then MonthDayNewPage;
     RPrinter.PSNewline;
     RPrinter.PrintPSTab(3,'All');
     RPrinter.PrintPSTab(3,'Funds');
     RPrinter.PrintPSTab(3,Format('%m',[CashReportTotal]));
     RPrinter.PrintPSTab(3,Format('%m',[ReportTotal]));
     RPrinter.PrintPSTab(3,Format('%m',[ReportTotalYear]));
     DataMod.TableRFund.Next;
  end;
  RPrinter.CLosePrintFile;
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
    SrchEnvelope;
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
      ApplyUpdates;
      DataMod.SQLTransactionEZ.commit;
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
var
  IDX, envNo: Integer;
begin
   IDX := DBNameGrid.selectedIndex;
   If IDX <> 0 then exit;
   EnvNo := DBNameGrid.SelectedField.AsInteger;
  With DataMod.QueryEnvNo do
    try
      close;
      Params[0].AsInteger := EnvNo;
      open;
      GridEditEnv.Cells[1,1]:=IntToStr(EnvNo);
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
var
  LName, FName, Title: String;
  Envelope: Integer;
begin
  With DataMod.TableEnvNo do
    begin
      if MessageDlg('OK to delete '+ FieldByName('TITLE').AsString+' '+
       FieldByName('FNAME').AsString+' '+
       FieldByName('NAME').AsString+' ?',
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
      try
        Envelope := FieldByName('ENV_NO').AsInteger;
        Title := FieldByName('TITLE').AsString;
        FName := FieldByName('FNAME').AsString;
        Name := FieldByName('NAME').AsString;
        If not DeletePledge(Envelope, 0) then
          ShowMessage('Unable to delete pledges for '+Title+' '+FName+' '+Name)
        else
          begin
            DataMod.QueryDelMember.Params[0].AsInteger := Envelope;
            DataMod.QueryDelMember.Params[1].AsString := Title;
            DataMod.QueryDelMember.Params[2].AsString := FName;
            DataMod.QueryDelMember.Params[3].AsString := Name;
            DataMod.QueryDelMember.ExecSQL;
            DataMod.SQLTransactionEZ.commit;
          end;
      except
        DataMod.SQLTransactionEZ.RollBack;
      end;
      DataMod.TableEnvNo.Close;
      DataMod.TableEnvNo.Open;
      DataMod.TablePledge.Close;
      DataMod.TablePledge.Open;
      BtnCanTorsClick(Sender as TObject);
      BtnCanPledgeClick(Sender as TObject);
    end;
end;

function TFormCont.DeletePledge(EnvNo, Fund: Integer): Boolean;
begin
   result := true;
     try
        DataMod.QueryDelPledge.Params[0].AsInteger:=EnvNo;
        DataMod.QueryDelPledge.Params[1].AsInteger:=Fund;
        DataMod.QueryDelPledge.ExecSQL;
        DataMod.SQLTransactionEZ.commit;
      except
        DataMod.SQLTransactionEZ.RollBack;
        DataMod.TablePledge.Close;
        DataMod.TablePledge.Open;
        result := false;
      end;
      DataMod.TablePledge.Close;
      DataMod.TablePledge.Open;
end;

procedure TFormCont.BtnPledgeDelClick(Sender: TObject);
var
   Envelope, Fund: Integer;
begin
  With DataMod.TablePledge do
    begin
      if MessageDlg('OK to delete pledge for envelope '+
         FieldByName('ENV_NO').AsString+' for fund '+
         FieldByName('FUND').AsString+' for amount $'+
         FieldByName('AMOUNT').AsString+' ?',
      mtConfirmation, [mbNo, mbYes], 0) = mrYes then
      try
        Envelope := FieldByName('ENV_NO').AsInteger;
        Fund := FieldByName('FUND').AsInteger;
        DeletePledge(Envelope, Fund);
        DataMod.QueryDelPledge.Params[0].AsInteger:=Envelope;
        DataMod.QueryDelPledge.Params[1].AsInteger:=Fund;
        DataMod.QueryDelPledge.ExecSQL;
        DataMod.SQLTransactionEZ.commit;
      finally
        DataMod.TablePledge.Close;
        DataMod.TablePledge.Open;
      end;
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

procedure TFormCont.FunAccBoxClick(Sender: TObject);
begin
  {Edit4.Text:=DataMod.TableDetail.FieldByName('Description').AsString;   }
  GridPledge.Cells[1,2]:=copy(FunAccBox.Text,1,Pos(' ',FunAccBox.Text)-1);
  //GridPledge.Cells[1,2]:=copy(FunAccBox.Text,1,Pos(' ',FunAccBox/desda.Text)-1);
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

procedure TFormCont.LookUpEnvChange(Sender: TObject);
  var
  EnvNo: Integer;
begin
 try
   EnvNo:=GetInt(LookUpEnv.Text);
   If EnvNo>0 then
     begin
       GridPledge.Cells[1,1]:=IntToStr(EnvNo);
       FindPledge(EnvNo);
     end;
 except
 end;
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




procedure TFormCont.EditFromDateExit(Sender: TObject);
begin
  EditFromDate.Text := FormatDate(EditFromDate.Text);
end;

procedure TFormCont.EditToDateExit(Sender: TObject);
begin
    EditToDate.Text := FormatDate(EditToDate.Text);
end;

<<<<<<< .mine
procedure TFormCont.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;

=======
>>>>>>> .r71
procedure TFormCont.FunAccBoxChange(Sender: TObject);
begin
    {Edit4.Text:=DataMod.TableDetail.FieldByName('Description').AsString;   }
  GridPledge.Cells[1,2]:=copy(FunAccBox.Text,1,Pos(' ',FunAccBox.Text)-1);
  //GridPledge.Cells[1,2]:=copy(FunAccBox.Text,1,Pos(' ',FunAccBox/desda.Text)-1);
  GridPledge.SetFocus;
  GridPledge.Row:=4;
end;

procedure TFormCont.BtnLabelClick(Sender: TObject);
begin
  ReportLabel(DataMod.SrcMemAll, false);
end;

procedure TFormCont.BtnViewClick(Sender: TObject);
begin
  ReportLabel(DataMod.SrcMemAll, true);
end;

 procedure TFormCont.ReportLabel(Src: TDataSource; Outline: Boolean);
var
  X,Y: Single;
  EZLabelClass: TAddressLabelClass;
  Add1,ZipCode, fName: String;
  LabelFont: FontType;
  TmpScale: Double;
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
     //fName := 'Labels' + '-'+DateToStr(Date)+'.ps';
    // EZLabelClass.OpenPrintFile(fName);
     If EdFontSize.Tag <> 0 then
       LabelFont.FontSize := EdFontSize.Tag
     else
       LabelFont.FontSize := 10;

       EdFontSize.Tag := 0;
       LabelFont.FontName := 'Helvetica';
       LabelFont.FontSize := SEFontSize.value;
     With EZLabelClass do
       try
         TmpScale := LineScale;
         LineScale := 1.12;
         Font:= LabelFont;
         PrintPostNet := CheckBoxPostNet.Checked;
         PostNetHeight := 0.22;
         NumDown :=  strToInt(EdNumRows.Text);
         NumAcross := StrToInt(EdNumCols.text);
         //MarginTop := StrToFloat(EdTopMargin.text);
        // MarginLeft := StrToFloat(EdLeftMargin.text);
         TextMarginTop := StrToFloat(EdYPos.Text);
         TextMarginLeft := StrToFloat(EDXPos.Text);
         LabelWidth := StrToFloat(EdLabelWide.Text);
         LabelHeight := StrToFloat(EdLabelHigh.Text);
         SpacingLeft := StrToFloat(EdLeftMargin.Text);
         SpacingTop  := StrToFloat(EdTopMargin.Text);
         SpacingWidth := StrToFloat(EdSpaceWide.Text);
         SpacingHeight := StrToFloat(EdSpaceHigh.Text);
         Radius := 0.25; //Just for visual effect
         PrintPSLabels(Src, Outline);
         //ClosePrintFile;
        // Destroy;
         ViewFile;
       except
         ShowMessage('Bad number in at least one label edit box.');
         EZLabelClass.Free;
         EZLabelClass := nil;
       end;
       EZLabelClass.LineScale := TmpScale;
       EZLabelClass.Free;
       EZLabelClass := nil;
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
    PSNewline;

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
  CheckFont: FontType;
begin
  With RPrinter do
  begin
     BH10 := PointToInch(Round(10 * LineScale));
     BH12 := PointToInch(Round(12 * LineScale));
    for I := 1 to 9 do
      begin
        FreeTabs(I);
        CheckFont.FontName := HELVETICA;
        CheckFont.FontSize := 10;
        Font := CheckFont;
      end;
    TmpTab := NewTab(1, 0.5,JUSTIFYLEFT, 1.25,0.05, ABSOLUT, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYRIGHT, 1.0,0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYRIGHT, 0.875,0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYLEFT, 2.125,0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(1, 0.0, JUSTIFYRIGHT, 1.0,0.05, RELATIVE, BOXLINENONE,0);
    PutTabFont(1, HELVETICA, 10);

    TmpTab := NewTab(2, 0.5, JUSTIFYLEFT, 1.25,0.05, ABSOLUT,BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(2, 0.0, JUSTIFYRIGHT, 1.0,0.05, RELATIVE, BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,2);
    TmpTab := NewTab(2, 0.0, JUSTIFYCENTER, 0.5,0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(2, 0.0, JUSTIFYLEFT, 2.5,0.05, RELATIVE, BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(2, 0.0, JUSTIFYRIGHT,1.0,0.05, RELATIVE, BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,2);
    PutTabFont(2, HELVETICA, 10);

    TmpTab := NewTab(3,0.5,JUSTIFYLEFT,5.35,0.05,ABSOLUT, BOXLINEALL,2);
    TmpTab := NewTab(3,5.95,JUSTIFYRIGHT,1.3,0.05,ABSOLUT, BOXLINEALL,2);
    PutTabFont(3, HELVETICA, 10);

    TmpTab := NewTab(4, 4.5,JUSTIFYRIGHT,3.0,0.05, ABSOLUT, BOXLINENONE,0);
    PutTabFont(4, HELVETICA, 10);

    TmpTab := NewTab(5, 0.5, JUSTIFYLEFT, 0.8, 0.05, ABSOLUT, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYLEFT, 1.75, 0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYRIGHT, 1.4, 0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYRIGHT, 1.4, 0.05, RELATIVE, BOXLINENONE,0);
    TmpTab := NewTab(5, 0.0, JUSTIFYRIGHT, 1.4, 0.05, RELATIVE, BOXLINENONE,0);
    PutTabFont(5, HELVETICA, 10);

    TmpTab := NewTab(6,0.5,JUSTIFYLEFT,0.8,0.05,ABSOLUT,BOXLINELEFT+BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYLEFT,1.75,0.05,RELATIVE,BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYRIGHT,1.4,0.05,RELATIVE,BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYRIGHT,1.4,0.05,RELATIVE,BOXLINETOP+BOXLINEBOTTOM,2);
    TmpTab := NewTab(6,0.0,JUSTIFYRIGHT,1.4,0.05,RELATIVE,BOXLINETOP+BOXLINERIGHT+BOXLINEBOTTOM,2);
    PutTabFont(6, HELVETICA, 10);

    TmpTab := NewTab(8,4.5,JUSTIFYRIGHT,3.0,0.05,ABSOLUT,BOXLINENONE,0);
    PutTabFont(8, HELVETICA, 10);

    TmpTab := NewTab(9,4.5,JUSTIFYRIGHT,3.0,0.05,ABSOLUT,BOXLINENONE,0);
    PutTabFont(9, HELVETICA, 10);
  end;
end;

function  TFormCont.removeSpace(Str: String): String;
var
  S: String;
  I, L: Integer;
begin
  L := Length(Str);
  for I := 1 to L do
    if (Str[I] > ' ') then
       S := S + Str[I];
  result := S;
end;

procedure TFormCont.ReportContributions;
var
  ConSumStr, FundDesc, ChurchName: String;
  ConDate,TmpDate: TDateTime;
  AmtSum,ConSum,FundSum: Double;
  MB: TBookMark;
  TmpTab: PTab;
begin
  ConSum:=0.0;
  FundSum:=0.0;
  TmpDate:=0.0;
   if RPrinter = nil then
    RPrinter := TPostScriptClass.Create;
  SetConTabs;
  With DataMod.TableChurch do
    begin
      if not active then open;
      Churchname := removeSpace(FieldByName('NAME').AsString);
      First;
    end;


  With RPrinter,DataMod.QueryRCbutions do
      begin
       first;
      //BH10 := PointToInch(Round(10*LineScale));
      Bold:=True;
      IndexFont(2); //Helvetica 10

      RPrinter.Newpage;
      PSNewline;
      PSNewline;
      PrintPSCenterPage(ChurchName);
      PSNewline;
      PSNewline;
     // SetFont('Arial',10);
      PrintPSLeft(GlobTitle+' '+GlobFName+' '+GlobName,0.5);
      PrintPSCenterPage('Contributions');
      PrintPSRight(GlobFrom+' Thru '+GlobThru, 7.5);
      Bold:=False;
      PSNewline;
      PSNewline;

      PSNewline;
      PrintPSTab(2,'DATE');
      PrintPSTab(2,'AMOUNT');
      PrintPSTab(2,' ');
      PrintPSTab(2,'FUND DESCRIPTION');
      PrintPSTab(2,'AMOUNT');
      //PSNewline;

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
                 PrintPSTab(1, DateTimeToStr(TmpDate))
              else
                 PrintPSTab(1, ' ');
              PrintPSTab(1, ConSumStr);
              PrintPSTab(1, FieldByName('DETAIL_FUND').AsString);

              With DataMod.QueryFundDesc do
             begin
               FundDesc :=getDetailDesc(DataMod.QueryRCButions.FieldByName('DETAIL_FUND').AsInteger);
               If FundDesc <> '' then
                  PrintPSTab(1, FundDesc)
               else
                  PrintPSTab(1, ' ');
             end;

              PrintPSTab(1, Format('%m',[FieldByName('AMOUNT').AsFloat]));
              FundSum:=FundSum+FieldByName('AMOUNT').AsFloat;
              //PSNewline;
              If LinesLeft(LINESIZE)<3 then NewPage;
              TmpDate:=0.0;
              ConSumStr:='';
              ChkList(FieldByName('DETAIL_FUND').AsString);
              Next;
            end; //while Field
         //next;
       end; //While not eof

      PrintPSTab(2, ' ');
      PrintPSTab(2, Format('%m',[ConSum]));
      PrintPSTab(2, ' ');
      PrintPSTab(2, 'Total');
      PrintPSTab(2, Format('%m',[FundSum]));
       If LinesLeft(LINESIZE)<3 then NewPage;
       doConFunds;
       If LinesLeft(LINESIZE)<3 then NewPage;
       doMultiFunds;
       PSNewline;
       PSNewline;
       PSNewline;
       If LinesLeft(LINESIZE)<4 then
          NewPage;

       Bold:=True;
       PrintPSTab(3,'Total Contributions for period '+
                 GlobFrom+' Thru '+GlobThru);

       PrintPSTab(3,Format('%m',[FundSum]));
       PSNewline;
       PSNewline;
       PrintPSCenterPage('Thank you for contributing to these ministries.');
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
    With RPrinter do
    begin
      TotAmnt:=0.0;TotPledge:=0.0;TotRem:=0.0;
      PSNewline;
      PSNewline;
      PSNewline;
      Bold:=True;
      PrintPSCenterPage('Single Year Summary ');
      Bold:=False;
      PrintPSRight(GlobFrom+' Thru '+GlobThru, 7.50);
      //PrintPSTab(4, GlobFrom+' Through '+GlobThru);
      PSNewline;
      PSNewline;

      PSNewline;
      ResetTab(6);
      PrintPSTab(6,'FUND');
      PrintPSTab(6,'DESCRIPTION');
      PrintPSTab(6,'AMOUNT');
      PrintPSTab(6,'PLEDGE');
      PrintPSTab(6,'REMAINDER');
     // PSNewline;
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
           PrintPSTab(5, IntToStr(Junk));
           With DataMod.QueryFundDesc do
             begin
               close;
               params[0].AsInteger := Junk;
               open;
               if FieldByName('DESCRIPTION').AsString <> '' then
                  PrintPSTab(5, FieldByName('DESCRIPTION').AsString)
               else
                  PrintPSTab(5, ' ');
             end;

           Amnt:=Fields[0].AsFloat;
           TotAmnt:=TotAmnt+Amnt;
           PrintPSTab(5, Format('%m',[Amnt]));
           If (DataMod.QueryRPledge.RecordCount>0) and
              (DataMod.QueryRPledge.FieldByName('Type').AsString<>'F') then
                 begin
                   Pledge:=DataMod.QueryRPledge.FieldByName('AMOUNT').AsFloat;
                   TotPledge:=TotPledge+Pledge;
                   Rem:=Pledge-Amnt;
                   TotRem:=TotRem+Rem;
                   If Rem<0 then Rem:=0.0;
                   PrintPSTab(5,Format('%m',[Pledge]));
                   PrintPSTab(5,Format('%m',[Rem]));
                 end;
              //PSNewline;
        end; {for IDX}

        PrintPSTab(6,' ');
        PrintPSTab(6,'Totals');
        PrintPSTab(6,Format('%m',[TotAmnt]));
        PrintPSTab(6,Format('%m',[TotPledge]));
        PrintPSTab(6,Format('%m',[TotRem]));
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
      With RPrinter do
        begin
          PSNewline;
          PSNewline;
          PSNewline;
          Bold:=True;
          PrintPSCenter('Multi Year Summary', 4.0);
          Bold:=False;
          PrintPSTab(8, BDateStr+' Thru '+GlobThru);
          PSNewline;
          PSNewline;

          PrintPSTab(6, 'FUND');
          PrintPSTab(6, 'DESCRIPTION');
          PrintPSTab(6, 'AMOUNT');
          PrintPSTab(6, 'PLEDGE');
          PrintPSTab(6, 'REMAINDER');
         // PSNewline;

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
              PrintPSTab(5, IntToStr(Junk));
              fDesc := getDetailDesc(Junk);
                 if FDesc <>'' then
                   PrintPSTab(5, FDesc)
                 else
                   PrintPSTab(5, ' ');

              Amnt:=DataMod.QueryFund.Fields[0].AsFloat;
              TotAmnt:=TotAmnt+Amnt;
              PrintPSTab(5,Format('%m',[Amnt]));
              If DataMod.QueryMulti.RecordCount>0 then
                 begin
                   Pledge:=DataMod.QueryMulti.FieldByName('AMOUNT').AsFloat;
                   TotPledge:=TotPledge+Pledge;
                   Rem:=Pledge-Amnt;
                   TotRem:=TotRem+Rem;
                   If Rem<0 then Rem:=0.0;
                   PrintPSTab(5, Format('%m',[Pledge]));
                   PrintPSTab(5, Format('%m',[Rem]));
                 end;
             // PSNewline;
              next;
            end; //While

          PrintPSTab(6, ' ');
          PrintPSTab(6,'Totals');
          PrintPSTab(6, Format('%m',[TotAmnt]));
          PrintPSTab(6, Format('%m',[TotPledge]));
          PrintPSTab(6, Format('%m',[TotRem]));
        end; //With RPrinter
     end; //with datamod.QueryMulti
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


procedure TFormCont.initPledges;
var
  EnvNo: String;
begin
  DataMod.TableEnvNo.First;
  With DataMod.TableEnvNo do
    while not EOF do
      begin
        EnvNo:=FieldByName('Env_No').AsString;
        EnvNo:=EnvNo+copy('  ',1,8-Length(EnvNo))+
           FieldByName('Name').AsString;
        LookUpEnv.Items.Add(EnvNo+' ,'+
           (FieldByName('TITLE').AsString)+' '+
           (FieldByName('FNAME').AsString));
        Next;
      end;
end;

procedure TFormCont.initOpenTables;
begin
  With DataMod do
    begin
      QueryNow.Open;
      TableEditEnv.Open;
      TableEditDetail.Open;
      TableEditCont.Open;
      TablePledge.Open;
      QueryPledge.Open;
      TableLabel.Open;
    end;
   DBNameGrid.Width := 920;
   DBNameGrid.Columns.Items[0].Width := 70;
   DBNameGrid.Columns.Items[1].Width := 120;
   DBNameGrid.Columns.Items[2].Width := 124;
   DBNameGrid.Columns.Items[3].Width := 124;
   DBNameGrid.Columns.Items[4].Width := 210;
   DBNameGrid.Columns.Items[5].Width := 160;
   DBNameGrid.Columns.Items[6].Width := 160;
   GridSrchEnv.Columns.Items[2].Width := 124;
   GridSrchEnv.Columns.Items[3].Width := 124;
end;

procedure TFormCont.initFunds;
var
  Fund: String;
begin
  DataMod.TableDetail.First;
  With DataMod.TableDetail do
    while not EOF do
      begin
        Fund:=FieldByName('Detail_Fund_No').AsString;
        Fund:=Fund+copy('        ',1,8-Length(Fund))+
           FieldByName('Description').AsString;
        FunAccBox.Items.Add(Fund);
        ComboDetail.Items.Add(Fund);
        ComboPledgeFund.Items.Add(Fund);
        QueryBox.Items.Add(Fund);
        Next;
      end;
end;

procedure TFormCont.OpenAfterPost;
begin
   With DataMod do
     begin
       TableEditDetail.Open;
       TableEditCont.Open;
       TablePledge.Open;
       TableLabel.Open;
       TableCont.Open;
       TableEditEnv.Open;
       QueryPledge.Open;
     end;
end;

procedure TFormCont.ComboDetailChange(Sender: TObject);
begin
  EditAmount.Text:='';
end;

//initialization
//  {$i cont.lrs}

end.

