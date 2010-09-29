unit Unit30; 

{$mode objfpc}{$H+}
{$R unit30.lfm}

interface

uses
  Classes, SysUtils, db, sqldb, IBConnection, FileUtil, LResources, Forms,
  Controls, Dialogs;

type

  { TDataMod }

  TDataMod = class(TDataModule)
    CheckingSrc: TDatasource;
    DelTranSrc: TDatasource;
    ZTblPayroll: TSQLQuery;
    ZTblPayrollDEDUCT1: TBCDField;
    ZTblPayrollDEDUCT1_ACC: TSmallintField;
    ZTblPayrollDEDUCT2: TBCDField;
    ZTblPayrollDEDUCT2_ACC: TSmallintField;
    ZTblPayrollDEDUCT3: TBCDField;
    ZTblPayrollDEDUCT3_ACC: TSmallintField;
    ZTblPayrollDEDUCT4: TBCDField;
    ZTblPayrollDEDUCT4_ACC: TSmallintField;
    ZTblPayrollDEDUCT5: TBCDField;
    ZTblPayrollDEDUCT5_ACC: TSmallintField;
    ZTblPayrollFED: TBCDField;
    ZTblPayrollFED_ACCOUNT: TSmallintField;
    ZTblPayrollFICA: TBCDField;
    ZTblPayrollFICA_ACCOUNT: TSmallintField;
    ZTblPayrollLOCAL: TBCDField;
    ZTblPayrollLOCAL_ACCOUNT: TSmallintField;
    ZTblPayrollMED: TBCDField;
    ZTblPayrollMED_ACCOUNT: TSmallintField;
    ZTblPayrollNAME: TStringField;
    ZTblPayrollPENSION: TBCDField;
    ZTblPayrollPENSION_ACCOUNT: TSmallintField;
    ZTblPayrollSOC_SEC_NO: TStringField;
    ZTblPayrollSTATE: TBCDField;
    ZTblPayrollSTATE_ACCOUNT: TSmallintField;
    ZTblPayrollWAGE: TBCDField;
    ZTblPayrollWAGE_ACCOUNT: TSmallintField;
    ZQueryAccTypeACC_TYPE: TSmallintField;
    ZQueryPayStubs1: TSQLQuery;
    ZTblBalanceBALANCE: TBCDField;
    ZTblBalanceBEGBALANCE: TBCDField;
    ZTblBalanceCHECKSEED: TLongintField;
    ZTblBalanceTEMPSUM: TBCDField;
    ZTblDelTran: TSQLQuery;
    ZQueryAccNo: TSQLQuery;
    ZQueryAccName: TSQLQuery;
    SrcTempChecks: TDatasource;
    SrcTempTrans: TDatasource;
    RetSrc: TDatasource;
    PayCheckSrc: TDatasource;
    DPSrc: TDatasource;
    EmpSrc: TDatasource;
    IBConnectionEZ: TIBConnection;
    PaySrc: TDatasource;
    QueryTranSrc: TDatasource;
    ZQueryChecks: TSQLQuery;
    ZQueryTrans: TSQLQuery;
    ZQueryTransACCOUNT: TSmallintField;
    ZQueryTransAMOUNT: TBCDField;
    ZQueryTransCHECK_NO: TLongintField;
    ZQueryTransNAME: TStringField;
    ZQueryTransTRAN_DATE: TDateField;
    ZQueryTransTRAN_TYPE: TSmallintField;
    ZTblChecksAMOUNT: TBCDField;
    ZTblChecksCHECKMEMO: TStringField;
    ZTblChecksCHECK_DATE: TDateField;
    ZTblChecksCHECK_NO: TLongintField;
    ZTblChecksRETURNED: TStringField;
    ZTblChecksVENDOR: TStringField;
    ZTblChecksVENDOR_NO: TSmallintField;
    ZTblCheckTransACCOUNT: TSmallintField;
    ZTblCheckTransAMOUNT: TBCDField;
    ZTblCheckTransCHECK_NO: TLongintField;
    ZTblCheckTransTRAN_DATE: TDateField;
    ZTblCheckTransTRAN_TYPE: TSmallintField;
    ZTblDPAMOUNT: TBCDField;
    ZTblDPMEMO: TStringField;
    ZTblDPPOST_DATE: TDateField;
    ZTblFindTrans: TSQLQuery;
    ZTblPayStubs: TSQLQuery;
    ZTblPayStubsDEDUCT1: TBCDField;
    ZTblPayStubsDEDUCT2: TBCDField;
    ZTblPayStubsDEDUCT3: TBCDField;
    ZTblPayStubsDEDUCT4: TBCDField;
    ZTblPayStubsDEDUCT5: TBCDField;
    ZTblPayStubsFED: TBCDField;
    ZTblPayStubsFICA: TBCDField;
    ZTblPayStubsGROSS: TBCDField;
    ZTblPayStubsHOURS: TSmallintField;
    ZTblPayStubsLOCAL: TBCDField;
    ZTblPayStubsMED: TBCDField;
    ZTblPayStubsNET: TBCDField;
    ZTblPayStubsPAY_DATE: TDateField;
    ZTblPayStubsPCHECK_NO: TLongintField;
    ZTblPayStubsPENSION: TBCDField;
    ZTblPayStubsRATE: TBCDField;
    ZTblPayStubsSOC_SEC_NO: TStringField;
    ZTblPayStubsSTATE: TBCDField;
    ZTblTempTrans: TSQLQuery;
    ZTblVendor: TSQLQuery;
    ZTblVendorVENDOR_NAME: TStringField;
    SQLTransactionEZ: TSQLTransaction;
    SrcCheckTrans: TDatasource;
    SrcQueryChecks: TDatasource;
    SrcVoid: TDatasource;
    VendorSrc: TDatasource;
    ZQueryAccChecks: TSQLQuery;
    ZQueryAccType: TSQLQuery;
    ZQueryCheckSum: TSQLQuery;
    ZQueryCheckTotal: TSQLQuery;
    ZQueryConTotal: TSQLQuery;
    ZQueryDelTempTran: TSQLQuery;
    ZQueryDelTran: TSQLQuery;
    ZQueryDP: TSQLQuery;
    ZQueryDPTotal: TSQLQuery;
    ZQueryEmpSum: TSQLQuery;
    ZQueryLiabTotal: TSQLQuery;
    ZQueryPayAcc: TSQLQuery;
    ZQueryPayCheck: TSQLQuery;
    ZQueryPayroll: TSQLQuery;
    ZQueryPayStubs: TSQLQuery;
    ZQueryPrintTran: TSQLQuery;
    ZQueryReturn: TSQLQuery;
    ZQueryStub: TSQLQuery;
    ZQuerySumReturn: TSQLQuery;
    ZQuerySumTempChecks: TSQLQuery;
    ZQuerySumTempTrans: TSQLQuery;
    ZQueryTempCks: TSQLQuery;
    ZQueryTranAcc: TSQLQuery;
    ZQueryTranTotal: TSQLQuery;
    ZQueryVoidChecks: TSQLQuery;
    ZTblAccounts: TSQLQuery;
    ZTblBalance: TSQLQuery;
    ZTblChecks: TSQLQuery;
    ZTblCheckTrans: TSQLQuery;
    ZTblDP: TSQLQuery;
    ZTblFund: TSQLQuery;
    ZTblTempChecks: TSQLQuery;
    ZTblTrans: TSQLQuery;
    ZTblXY: TSQLQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure SrcTempChecksDataChange(Sender: TObject; Field: TField);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  DataMod: TDataMod;

implementation

{ TDataMod }

procedure TDataMod.DataModuleCreate(Sender: TObject);
  //ShowMessage('Mod created');
begin
 end;

procedure TDataMod.SrcTempChecksDataChange(Sender: TObject; Field: TField);
begin
  With ZTblTempTrans do
    begin
      close;
      Params[0].AsInteger:=ZTblTempChecks.FieldByName('CHECK_NO').ASInteger;
      open;
    end;
end;

//initialization
//  {$I unit30.lrs}

end.

