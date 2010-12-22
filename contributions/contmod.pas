unit contmod;

{$mode objfpc}{$H+}
{$R contmod.lfm}

interface

uses
  Classes, SysUtils, db, sqldb, IBConnection, FileUtil, LResources, Forms,
  Controls, Dialogs;

type

  { TDataMod }

  TDataMod = class(TDataModule)
    SrcLabel: TDatasource;
    QueryDetailACCOUNT: TSmallintField;
    QueryDetailDESCRIPTION: TStringField;
    QueryDetailDETAIL_FUND_NO: TSmallintField;
    QueryFundDescDESCRIPTION: TStringField;
    QueryIsMemberCOUNT: TLongintField;
    QueryMem: TSQLQuery;
    QueryMemPrintENV_NO1: TLongintField;
    QueryMemPrintFNAME1: TStringField;
    QueryMemPrintNAME1: TStringField;
    QueryLabel: TSQLQuery;
    QueryDetail: TSQLQuery;
    QueryIsMember: TSQLQuery;
    TableChurch: TSQLQuery;
    SrcMemAll: TDatasource;
    QueryEnvNo: TSQLQuery;
    QueryDelMember: TSQLQuery;
    QueryDelPledge: TSQLQuery;
    TableEditCont: TSQLQuery;
    TableEditContADDRESS_1: TStringField;
    TableEditContADDRESS_2: TStringField;
    TableEditContCITY: TStringField;
    TableEditContENV_NO: TLongintField;
    TableEditContFNAME: TStringField;
    TableEditContMEMBER: TStringField;
    TableEditContNAME: TStringField;
    TableEditContPHONE: TStringField;
    TableEditContSTATE: TStringField;
    TableEditContTITLE: TStringField;
    TableEditContZIP: TStringField;
    TableMem: TSQLQuery;
    SrcNow: TDatasource;
    SrcMem: TDatasource;
    FundSrc: TDataSource;
    QueryContAMOUNT: TBCDField;
    QueryContC_DATE: TDateField;
    QueryContDETAIL_FUND: TSmallintField;
    QueryContENV_NO: TSmallintField;
    QueryContTYPE: TStringField;
    QueryEnvPledge: TSQLQuery;
    QueryMemPrintENV_NO: TLongintField;
    QueryMemPrintFNAME: TStringField;
    QueryMemPrintNAME: TStringField;
    QueryNowAMOUNT: TBCDField;
    QueryNowDETAIL_FUND: TSmallintField;
    QueryNowENV_NO: TSmallintField;
    QueryPledgeAMOUNT: TBCDField;
    QueryPledgeBDATE: TDateField;
    QueryPledgeEDATE: TDateField;
    QueryPledgeENV_NO: TSmallintField;
    QueryPledgeFUND: TSmallintField;
    QueryPledgeTYPE: TStringField;
    QuerySrchNameENV_NO: TLongintField;
    QuerySrchNameFNAME: TStringField;
    QuerySrchNameNAME: TStringField;
    QuerySrchNameTITLE: TStringField;
    TableLabel: TSQLQuery;
    SQLQueryLiabOwe: TSQLQuery;
    SQLTransactionEZ: TSQLTransaction;
    SrcEnvNo: TDataSource;
    SrcSrchName: TDataSource;
    SrcEditDetail: TDataSource;
    SrcSeditCont: TDataSource;
    SrcEditEnv: TDataSource;
    SrcPledge: TDataSource;
    QueryContSrc: TDataSource;
    SrcQPledge: TDataSource;
    FBConnectionEZ: TIBConnection;
    SQLTransactionEX: TSQLTransaction;
    TableEnvNo: TSQLQuery;
    TableDetail: TSQLQuery;
    QuerySrchName: TSQLQuery;
    QuerySrchFund: TSQLQuery;
    TableEditDetail: TSQLQuery;
    QueryFund: TSQLQuery;
    QueryMulti: TSQLQuery;
    QueryMember: TSQLQuery;
    QueryMemPrint: TSQLQuery;
    QueryRContrib: TSQLQuery;
    QueryRCbutions: TSQLQuery;
    QueryRPledge: TSQLQuery;
    QueryCont: TSQLQuery;
    QuerySummary: TSQLQuery;
    QueryNow: TSQLQuery;
    QueryFGroup: TSQLQuery;
    QueryPledge: TSQLQuery;
    TableMemADDRESS_1: TStringField;
    TableMemADDRESS_2: TStringField;
    TableMemCITY: TStringField;
    TableMemFNAME: TStringField;
    TableMemNAME: TStringField;
    TableMemSTATE: TStringField;
    TableMemTITLE: TStringField;
    TableMemZIP: TStringField;
    TablePledge: TSQLQuery;
    TableAmounts: TSQLQuery;
    TableEditEnv: TSQLQuery;
    TableFundGroups: TSQLQuery;
    QuerySumCont: TSQLQuery;
    QueryPledgeSum: TSQLQuery;
    TablePledgeAMOUNT: TBCDField;
    TablePledgeBDATE: TDateField;
    TablePledgeEDATE: TDateField;
    TablePledgeENV_NO: TSmallintField;
    TablePledgeFUND: TSmallintField;
    TablePledgeTYPE: TStringField;
    TableRFund: TSQLQuery;
    TableCont: TSQLQuery;


    QFindKey: TSQLQuery;
    QueryMemberData: TSQLQuery;
    QueryFundDesc: TSQLQuery;
    QueryFundData: TSQLQuery;
    QueryPledgeData: TSQLQuery;

    procedure SrcMemDataChange(Sender: TObject; Field: TField);
    procedure TableEditDetailAfterDelete(DataSet: TDataSet);
    procedure TableEditDetailAfterPost(DataSet: TDataSet);
    procedure TableEditDetailBeforePost(DataSet: TDataSet);
  //  function ZFindKey(TName, Fld, Key: String; IntKey: Integer): boolean;
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

implementation

{ TDataMod }


procedure TDataMod.SrcMemDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TDataMod.TableEditDetailAfterDelete(DataSet: TDataSet);
begin
    With TableEditDetail do
    begin
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      open;
    end;
end;

procedure TDataMod.TableEditDetailAfterPost(DataSet: TDataSet);
begin
  With TableEditDetail do
    begin
      Tag := 0;
      applyUpdates;
      SQLTransactionEZ.commit;
      close;
      open;
      If Tag = SQLINSERT then
         ShowMessage('New data has been inserted into Groups')
      else if Tag = SQLEDIT then
         ShowMessage('Groups have been edited.');
    end;
end;

procedure TDataMod.TableEditDetailBeforePost(DataSet: TDataSet);
begin
   if (DataSet.State = dsInsert) then
     TableEditDetail.Tag := SQLINSERT
  else if (DataSet.State = dsEdit) then
    TableEditDetail.Tag := SQLEDIT;
end;

//initialization

//  {$I contmod.lrs}
end.

{function TDataMod.ZFindKey(TName, Fld, Key: String; IntKey: Integer): boolean;
var
  Q: String;
begin
 If UpperCase(Key) = 'FALSE' then
   Q := 'Select Count(*) from ' + TName + ' where ' + fld + ' = ' + IntToStr(IntKey)
  else
   Q := 'Select Count(*) from ' + TName + ' where ' + fld + ' like ' + Key;

  With ZQFindkey do
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
     }
