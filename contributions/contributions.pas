program contributions;

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, contmod, cont;

{$IFDEF WINDOWS}{$R projcont.rc}{$ENDIF}

{$R *.res}

begin
  Application.initialize;
  Application.CreateForm(TFormCont, FormCont);
  Application.CreateForm(TDataMod, DataMod);
  Application.Run;
end.
