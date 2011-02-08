program checks;

{$mode objfpc}{$H+}


uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
<<<<<<< .mine
  Forms, accounts, Unit30;
=======
  Forms, accounts, unit30, SQLDBLaz,
  printer4lazarus;
>>>>>>> .r71

begin
 // {$I checks.lrs}
  Application.Initialize;
  Application.CreateForm(TCheckForm, CheckForm);
  Application.CreateForm(TDataMod, DataMod);
  Application.Run;
end.
