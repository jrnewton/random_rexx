/** :set makeprg=regina\ %  **/

/* SIGNAL ON NOVALUE */
say "this variable does not exit:"foobar

myName = 3
varName='var_UPNAME&lt /RD&gt &lt RD&gt ORIG' 
SAY symbol('myName')
SAY symbol(varName)
SAY symbol("var_UPNAME")

varValue=''
returnCode = VALUE(varName, varValue)
SAY returnCode
