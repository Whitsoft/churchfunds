program ezsetup;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Forms, Interfaces, ezsetupunit, setupmod,SQLDBLaz, printer4lazarus;

{$IFDEF WINDOWS}{$R projectEZTest.rc}{$ENDIF}

begin
  Application.initialize;
  Application.CreateForm(TFormSetup, FormSetup);
  Application.CreateForm(TDataMod, DataMod);
  Application.Run;
end.


