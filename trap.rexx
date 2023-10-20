/** :set makeprg=regina\ %  **/

/* SIGNAL ON NOVALUE NAME handleProblem */
varValue = ""
VALUE(varName, varValue)
/* SAY LEFT(varValue, LENGTH(varValue) - 1)*/
EXIT

handleProblem:
  SAY ERRORTEXT(40)
  SAY "problem" RC CONDITION() CONDITION('D')
  RETURN
