/** :set makeprg=regina\ %  **/

/* 
  - A function returns a value and is invoked as "someValue = XXX(arg1, arg2, arg3)".
  - A subroutine is not required to return a value and is invoked as "CALL XXX arg1,arg2,arg3". 
  - A subroutine return value can be accessed via built-in 'RESULT' variable.
  - By default functions and subroutines do not have their own private scope. Use PROCEDURE to define a private scope.
  - An external function has an implicit PROCEDURE statement.
*/

varname = "var_FOOBAR"
varvalue = "hello"
SAY VALUE(varName, varValue)
varvalue = "hello, again"
CALL VALUE varname,varValue
SAY RESULT
SAY var_FOOBAR

CALL warn "via call", "function.rexx"
ignore = warn("via function", "function.rexx")

value = "new"
SAY "value before set "value
CALL setValue
SAY "value after set "value

value = "new"
SAY "value before set "value
ignore = setValue()
SAY "value after set "value

exit

warn:
  SAY "warning: "ARG(1) "at location "ARG(2)
  RETURN 0

setValue:
  value = "modified"
  RETURN 0

