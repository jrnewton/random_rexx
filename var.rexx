/** :set makeprg=regina\ %  **/

/*SAY VALUE("var_ZSELCOLS")*/

ignore = load('VARENTRY 123456789abcdef')
ignore = load('VARENTRY ZSELCOLS                         GROUPNAME  DSNCOUNT   ')
ignore = load('VARENTRY ZDEBUG                            xx')
/*
var_ZDEBUG = "blahblah"
SAY "var_ZDEBUG:"var_ZDEBUG
CALL load 'VARENTRY ZDEBUG '
SAY "var_ZDEBUG:"var_ZDEBUG
CALL load 'VARENTRY ZHUBCKINT                        3 '
CALL load 

VALUE('var_ZDEBUG', "yohoo")
SAY "var_ZDEBUG:"var_ZDEBUG
*/

EXIT

load:
/* Each item pulled from queue has this format: 
   'VARENTRY ZSELCOLS                         GROUPNAME  DSNCOUNT   '   */ 
  data = ARG(1) 
  PARSE VAR data 1 varType +8 . +1 varName +32 . +1 varValue
  say "'"varType"'" "'"varName"'" "'"varValue"'"

  IF varType = "VARENTRY" THEN DO 
    IF varName \= "" THEN DO
      varName = "var_"STRIP(varName)
      IF SYMBOL(varName) = 'BAD' THEN DO 
        SAY "bad"
      END
      ELSE DO 
        varValue = STRIP(varValue)
        valueResult = VALUE(varName,varValue)
        SAY "    VALUE("varName","varValue")"
        SAY "      -> "valueResult
      END
    END
  END

  RETURN 0

