/** :set makeprg=regina\ %  **/

bigstring = '<DIALOG CLASS="candle.ks3.dialogs.DSGExportAttributesDialog" ID="DSATTR_EXTRACT_ID" GUIVER="1"><FIELD NAME="ToolDSAllocSecVal"><V>1</V></FIELD><FIELD NAME="CBCT_CommandType"><V>7</V></FIELD><DATAPARM NAME="%SUB01%"><ATTR>*DSNAGDEF</ATTR><PATT>%%</PATT><VALUE>UERORVdU</VALUE></DATAPARM></DIALOG>'
PARSE VAR bigstring '<DIALOG CLASS="' dialogClass '" ID="' dialogId '" GUIVER="' guiVersion '">' rest
SAY "dialogClass="dialogClass
SAY "dialogId="dialogId      
SAY "guiVersion="guiVersion  

/* say replace("This is a 'single' quote", "'", "@")
say replace("This is a 'single' quote", "'", "''")
say replace("This is a 'escaped single'' quote", "'", "''")
*/
exit 
/*
bigstring = 'apple banana 25 cod 25 dog elephant giraffe harry 25 xxxxx'
say bigstring
parse var bigstring singleEntry '25' tail
say 'bigstring is ' bigstring
say 'singleEntry is ' singleEntry
say 'tail is ' tail
units = 'Tracks'
if units = 'tracks' then do 
  say 'i found tracks'
end
*/

replace: procedure
  newString = ""
  oldString = ARG(1)
  pattern = ARG(2)
  patternLength = LENGTH(pattern)
  replacement = ARG(3)
  index = POS(pattern, oldString)
  do while index > 0
/*    say "1. old="oldString"; new="newString"; index="index*/
    newString = newString || substr(oldString, 1, index-1) || replacement
    index = index + patternLength
    oldString = substr(oldString, index)
/*    say "2. old="oldString"; new="newString"; index="index*/
    index = POS(pattern, oldString)
  end
  newString = newString || oldString
  return newString
