/** :set makeprg=regina\ %  **/
SIGNAL ON NOVALUE

varname = "var_FOOBAR"
varvalue = "hello"
prevValue = VALUE(varName, varValue)
SAY prevValue"->"varValue
IF prevValue \= varname THEN SAY "overwritten"

varvalue = "hello, again"
prevValue = VALUE(varname,varValue)
SAY prevValue"->"varValue
IF prevValue \= UPPER(varname) THEN SAY "overwritten"

EXIT
