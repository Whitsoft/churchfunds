program checks;

{$mode objfpc}{$H+}


uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,  LResources, accounts, unit30, SQLDBLaz, lhelpcontrolpkg ;

begin
  {$I checks.lrs}
  Application.Initialize;
  Application.CreateForm(TCheckForm, CheckForm);
  Application.CreateForm(TDataMod, DataMod);
  Application.Run;
end.

