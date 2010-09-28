program projcont;

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,  LResources, contmod, cont, SQLDBLaz, lhelpcontrolpkg ;

{$IFDEF WINDOWS}{$R projcont.rc}{$ENDIF}

begin
  {$I projcont.lrs}
  Application.initialize;
  Application.Run;
end.
