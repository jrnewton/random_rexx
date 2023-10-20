/** :set makeprg=regina\ %  **/

SIGNAL ON SYNTAX NAME SYN
CALL badFunction
SAY "after badFunction"
ignore = VALUE(".&$*#*@","foobar")
EXIT

SYN:
  PARSE UPPER SOURCE . callsite execName .
  SAY execName":"SIGL CONDITION('C') "trap. " CONDITION('D') 
  SAY ERRORTEXT(RC)
  RETURN 

badFunction: PROCEDURE
  ignore = VALUE(".&$*#*@","foobar")
  SIGNAL OFF SYNTAX
  RETURN 0
