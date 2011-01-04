unit setupmod;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, sqldb, IBConnection, FileUtil, LResources, Forms,
  Controls, Dialogs;

type

  { TDataMod }

  TDataMod = class(TDataModule)
    AccSrc: TDatasource;
    SrcChurch: TDatasource;
    FundSrc: TDatasource;
    IBConnectionEZ: TIBConnection;
    PaySrc: TDatasource;
    QueryUpdatePayroll: TSQLQuery;
    ZDeletePay: TSQLQuery;
    ZQuerySumOldDP: TSQLQuery;
    ZTblPayroll: TSQLQuery;
    TableSpecial: TSQLQuery;
    TableChurch: TSQLQuery;
    ZQueryAccName: TSQLQuery;
    SrcAccounts: TDatasource;
    SrcFundGroups: TDatasource;
    SrcFunds: TDatasource;
    SrcGroup: TDatasource;
    VendSrc: TDatasource;
    ZQueryAccounts: TSQLQuery;
    ZQueryAccountsACCOUNT: TLongintField;
    ZQueryAccountsACC_TYPE: TSmallintField;
    ZQueryAccountsBUDGET: TBCDField;
    ZQueryAccountsNAME: TStringField;
    ZQueryDelOldChk: TSQLQuery;
    ZQueryDelOldCont: TSQLQuery;
    ZQueryDelOldDP: TSQLQuery;
    ZQueryFindKey: TSQLQuery;
    ZQueryGroupDesc: TSQLQuery;
    ZQueryLiab: TSQLQuery;
    ZQueryLiabOwe: TSQLQuery;
    ZQueryLiabPay: TSQLQuery;
    ZQueryNegDP: TSQLQuery;
    ZQueryPlusDP: TSQLQuery;
    ZQuerySumCont: TSQLQuery;
    ZQuerySumOldChk: TSQLQuery;
    ZQuerySumOldCont: TSQLQuery;
    ZQuerySumTrans: TSQLQuery;
    ZQueryTotalCont: TSQLQuery;
    ZQueryTotalDP: TSQLQuery;
    ZQueryTotalTrans: TSQLQuery;
    ZTblAccACCOUNT: TLongintField;
    ZTblAccACC_TYPE: TSmallintField;
    ZTblAccBUDGET: TBCDField;
    ZTblAccGROUP_NO: TSmallintField;
    ZTblAccNAME: TStringField;
    ZTblAccounts: TSQLQuery;
    ZTblAcc: TSQLQuery;
    ZTblAccountsACCOUNT: TLongintField;
    ZTblAccountsACC_TYPE: TSmallintField;
    ZTblAccountsBUDGET: TBCDField;
    ZTblAccountsGROUP_NO: TSmallintField;
    ZTblAccountsNAME: TStringField;
    ZTblAccountsPAYROLL: TStringField;
    ZTblAccPAYROLL: TStringField;
    ZTblBal: TSQLQuery;
    ZTblBalance: TSQLQuery;
    ZTblFund: TSQLQuery;
    ZTblFundACCOUNT: TSmallintField;
    ZTblFundDESCRIPTION: TStringField;
    ZTblFundDETAIL_FUND_NO: TSmallintField;
    ZTblFunds: TSQLQuery;
    ZTblFundGroups: TSQLQuery;
    ZTblFundGroupsDESCRIPTION: TStringField;
    ZTblFundGroupsFUND_GROUP: TSmallintField;
    SQLTransactionEZ: TSQLTransaction;
    ZTblFundsACCOUNT: TSmallintField;
    ZTblFundsDESCRIPTION: TStringField;
    ZTblFundsDETAIL_FUND_NO: TSmallintField;
    ZTblGroup: TSQLQuery;
    ZTblPay: TSQLQuery;
    ZQueryPayroll: TSQLQuery;
    ZEditPay: TSQLQuery;
    ZTblVendor: TSQLQuery;
    ZTblXY: TSQLQuery;
    procedure ZDeletePayAfterDelete(DataSet: TDataSet);
    procedure ZEditPayAfterDelete(DataSet: TDataSet);
    procedure ZEditPayAfterPost(DataSet: TDataSet);
    function ZFindKey(TName, Fld, Key: String; IntKey: Integer): boolean;
    procedure ZTblAccountsAfterDelete(DataSet: TDataSet);
    procedure ZTblAccountsAfterPost(DataSet: TDataSet);
    procedure ZTblAccountsBeforePost(DataSet: TDataSet);
    procedure ZTblFundGroupsAfterDelete(DataSet: TDataSet);
    procedure ZTblFundGroupsAfterPost(DataSet: TDataSet);
    procedure ZTblFundGroupsBeforePost(DataSet: TDataSet);
    procedure ZTblFundsAfterDelete(DataSet: TDataSet);
    procedure ZTblFundsAfterPost(DataSet: TDataSet);
    procedure ZTblFundsBeforePost(DataSet: TDataSet);
    procedure ZTblGroupAfterDelete(DataSet: TDataSet);
    procedure ZTblGroupAfterPost(DataSet: TDataSet);
    procedure ZTblGroupBeforePost(DataSet: TDataSet);
    procedure OpenTables;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  SQLINSERT = 1;
  SQLEDIT = 2;

var
  DataMod: TDataMod;
  Book: TBookMark;

implementation

{ TDataMod }

procedure TDataMod.OpenTables;
begin
       ZTblGroup.open;
       ZTblFunds.Open;
       ZTblAccounts.Open;
       ZTblVendor.Open;
       ZTblPayroll.Open;
       ZTblFundGroups.Open;
end;

function TDataMod.ZFindKey(TName, Fld, Key: String; IntKey: Integer): boolean;
var
  Q: String;
  begin
   If UpperCase(Key) = 'FALSE' then
     Q := 'Select Count(*) from ' + TName + ' where ' + fld + ' = ' + IntToStr(IntKey)
    else
     Q := 'Select Count(*) from ' + TName + ' where ' + fld + ' like ' + Key;

    With ZQueryFindkey do
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

procedure TDataMod.ZEditPayAfterDelete(DataSet: TDataSet);
begin
   With ZEditPay do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      OpenTables;
    end;
end;

procedure TDataMod.ZDeletePayAfterDelete(DataSet: TDataSet);
begin
    With ZDeletePay do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      OpenTables;
    end;
end;

procedure TDataMod.ZEditPayAfterPost(DataSet: TDataSet);
begin
  With ZEditPay do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
    end;
  OpenTables;
end;


procedure TDataMod.ZTblAccountsAfterDelete(DataSet: TDataSet);
begin
   With ZTblAccounts do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      OpenTables;
    end;
end;

procedure TDataMod.ZTblAccountsAfterPost(DataSet: TDataSet);
begin
  With ZTblAccounts do
    try
      applyUpdates;
      SQLTransactionEZ.commit;
      Book := GetBookmark;
      close;
      open;
      If Tag = SQLINSERT then
         ShowMessage('New data has been inserted into Accounts')
      else if Tag = SQLEDIT then
         ShowMessage('Accounts have been edited.');
      GotoBookmark(Book);
    finally
      FreebookMark(Book);
      Tag := 0;
    end;
    OpenTables;
end;

procedure TDataMod.ZTblAccountsBeforePost(DataSet: TDataSet);
begin
  Book := ZTblAccounts.GetBookmark;
  if (DataSet.State = dsInsert) then
     ZTblFundGroups.Tag := SQLINSERT
  else if (DataSet.State = dsEdit) then
    ZTblFundGroups.Tag := SQLEDIT;
end;

procedure TDataMod.ZTblFundGroupsAfterDelete(DataSet: TDataSet);
begin
  With ZTblFundGroups do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      OpenTables;
    end;
end;

procedure TDataMod.ZTblFundGroupsAfterPost(DataSet: TDataSet);
begin
  With ZTblFundGroups do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      openTables;
      If Tag = SQLINSERT then
        ShowMessage('New data has been inserted into Funds Groups')
      else if Tag = SQLEDIT then
        ShowMessage('Fund Groups have been edited.');
      Tag := 0;
    end;
end;


procedure TDataMod.ZTblFundGroupsBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     ZTblFundGroups.Tag := SQLINSERT
  else if (DataSet.State = dsEdit) then
    ZTblFundGroups.Tag := SQLEDIT;
end;

procedure TDataMod.ZTblFundsAfterDelete(DataSet: TDataSet);
begin
   With ZTblFunds do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      openTables;
    end;
end;

procedure TDataMod.ZTblFundsAfterPost(DataSet: TDataSet);
begin
    With ZTblFunds do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      openTables;
      If Tag = SQLINSERT then
         ShowMessage('New data has been inserted into Groups')
      else if Tag = SQLEDIT then
         ShowMessage('Groups have been edited.');
      Tag := 0;
    end;
end;

procedure TDataMod.ZTblFundsBeforePost(DataSet: TDataSet);
begin
   if (DataSet.State = dsInsert) then
     ZTblFunds.Tag := SQLINSERT
  else if (DataSet.State = dsEdit) then
    ZTblFunds.Tag := SQLEDIT;
end;

procedure TDataMod.ZTblGroupAfterDelete(DataSet: TDataSet);
begin
  With ZTblGroup do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      openTables;
    end;
end;

procedure TDataMod.ZTblGroupAfterPost(DataSet: TDataSet);
begin
  With ZTblGroup do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      openTables;
      If Tag = SQLINSERT then
         ShowMessage('New data has been inserted into Groups')
      else if Tag = SQLEDIT then
         ShowMessage('Groups have been edited.');
      Tag := 0;
    end;
end;

procedure TDataMod.ZTblGroupBeforePost(DataSet: TDataSet);
begin
   if (DataSet.State = dsInsert) then
     ZTblGroup.Tag := SQLINSERT
  else if (DataSet.State = dsEdit) then
    ZTblGroup.Tag := SQLEDIT;
end;


 initialization
  {$I setupmod.lrs}

end.
