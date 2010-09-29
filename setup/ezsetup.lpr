program ezsetup;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, ezsetupunit, setupmod,SQLDBLaz, lhelpcontrolpkg
  { you can add units after this };

{$IFDEF WINDOWS}{$R projectEZTest.rc}{$ENDIF}

begin
 // {$I ezsetup.lrs}
  Application.Run;
end.


