CHURCHFUNDS - programs for church finances and membership Don Whitbeck 2010

Churchfunds is an attempt to create a Linux version of the old EZFunds software for windows (see http://whitsoftware.com)

I am now using firebird for a database. I have trouble starting that automatically so have included a shell script (startfb.sh) but for firbird 2.5 just start the daemon fb_smp_server.

Programming is done using Lazarus. Context sensitive help is done via lhelp. Here is one link for lhelp installation. http://www.lazarus.freepascal.org/index.php?action=printpage;topic=7998.0
Packages installed include -

  SQLDBlaz 1.0.1
  Printer4Lazarus 0.5

I have began a rudimentary report printer which will preview and print reports.
See newpsclass.pas. There is work to be done in proving out report generation,
debugging the chm files for the help system and general debugging.

The goal of the program is to provide an easy, checkbook style of accounting since most small church treasurers and financial secretaries are not accountants. Also report printing is designed to be simple and informative without requiring knowledge of querying or SQL. Payroll should be simple and data entry should be intuitive with context sensitive help available for each data entry function.
I designed the original EZFunds package for windows in the early 90's and used it successfully for over one year. I have no idea how many other people used it. Other similar packages at that time were buggy, complicated and painfully slow, not to mention expensive.
Any help would be appreciated or if you want to fork your own version, be my guest. Let's develop a reliable, GPL'd program for small church finances using the Linux operating system.

Note that lazarus needs the correct paths. in lazarus project/compier options/paths.
Here is a typical Other unit files(-Fu) - you may be able to pare this list down.

$(LazarusDir)/lcl
../data
..
../help
$(LazarusDir)/lcl/widgetset
$(LazarusDir)/lcl/interfaces/gtk2
$(LazarusDir)/components/chmhelp/packages/help
$(LazarusDir)/components/turbopower_ipro
$(LazarusDir)/components/printers
$(LazarusDir)/components/printers/unix
$(LazarusDir)/components/chmhelp/lhelp
$(LazarusDir)/ideintf
$(LazarusDir)/lcl/forms
$(LazarusDir)/lcl/nonwin32
$(LazarusDir)/components/synedit 

and a typical include files (-Fi)
$(ProjOutDir)
$(LazarusDir)/lcl/include
$(LazarusDir)/components/printers/unix  

Here is my output directory (-Fu)
/home/don/Programs/contributions

Look at the package graph, it should include Printer4Lazarus 0.5 and SQLDBLaz 1.0.1.

If not add those packages. Package/install uninstall packages

$(LazarusDir) is set with environment/lazarus directory and is the location of the lazarus source
here is an example,  /home/don/lazarus/ this is where i did my lazarus svn checkout
Also in environment you need to tell lazarus where the FPC source directory is and where the FPC compiler is located.

Note that in the data modules, the TIbConnection component needs the path to the ezfunds.fb file. I haven't figured
put a way to use relative path names. After changine that you have to activate the connection and the TSQLTransaction component. Then you will need to make those query components labeled as 'tbl' or 'table' active. The table notation is left over from when ezfunds used DBISAM componentes which differentiated between tables and queries. In Firebird, everything is a query.

Also note that the lhelp package needs some minor changes. See Lazarus Bug tracker issue #0017835
http://62.166.198.202/view.php?id=17835


Don Whitbeck
