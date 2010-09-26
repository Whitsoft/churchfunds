CHURCHFUNDS - programs for church finances and membership Don Whitbeck 2010

Churchfunds is an attempt to create a Linux version of the old EZFunds software for windows (see http://whitsoftware.com)

I am now using firebird for a database. I have trouble starting that automatically so have included a shell script (startfb.sh)

Programming is done using Lazarus. Context sensitive help is done via lhelp. Here is one link for lhelp installation. http://www.lazarus.freepascal.org/index.php?action=printpage;topic=7998.0

I have began a rudimentary report printer which generates postscript. There is work to be done in proving out report generation, debugging the chm files for the help system and general debugging.

The goal of the program is to provide an easy, checkbook style of accounting since most small church treasurers and financial secretaries are not accountants. Also report printing is designed to be simple and informative without requiring knowledge of querying or SQL. Payroll should be simple and data entry should be intuitive with context sensitive help available for each data entry function.
I designed the original EZFunds package for windows in the early 90's and used it successfully for over one year. I have no idea how many other people used it. Other similar packages at that time were buggy, complicated and painfully slow, not to mention expensive.
Any help would be appreciated or if you want to fork your own version, be my guest. Let's develop a reliable, GPL'd program for small church finances using the Linux operating system.

Don Whitbeck
