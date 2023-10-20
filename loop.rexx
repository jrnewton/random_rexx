/** :set makeprg=regina\ %  **/

SIGNAL ON ERROR NAME ERR
SIGNAL ON NOVALUE NAME NOV
SIGNAL ON SYNTAX NAME SYN

value = "//PDNEWTZ JOB (ACCT),&apos;NAME&apos;,CLASS=A, //   MSGCLASS=X,MSGLEVEL=(1,1),NOTIFY=&amp;SYSUID.,REGION=0M //* ******************************************************************* "
hexRC = hexDump(value)
EXIT

ERR:
  SAY "got an error"
  RETURN

NOV:
  SAY "got no value"
  RETURN

SYN:
  SAY "got syntax"
  RETURN 

hexDump: PROCEDURE                                                         
  ignore = VALUE(".&$*#*@","foobar")
  argCount = ARG()                                                         
  IF argCount = 0 THEN DO                                                  
    CALL warn "Incorrect number of args given to HEXDUMP: "argCount"."     
              "At least 1 is required."                                    
    RETURN 8                                                               
  END                                                                      
                                                                           
  payload = ARG(1)                                                         
  IF payload = "" THEN DO                                                  
    SAY "hexDump: empty string"                                            
    RETURN 0                                                               
  END                                                                      
                                                                           
  trimLength = 32                                                          
  offset = 0                                                               
  /* loop protection */                                                    
  lineCount = 0                                                            
  maxLineCount = 500                                                       
                                                                           
  DO WHILE LENGTH(payload) > 0 & lineCount < maxLineCount                  
    line = SUBSTR(payload, 1, trimLength, ".")                             
    IF line = "" THEN DO                                                   
      SAY "hexDump: empty string"                                          
    END                                                                    
    ELSE DO
      SAY D2X(offset,8)"  "hexFormat(C2X(line))" |"line"|"                 
    END                                                                    
    lineCount = lineCount + 1                                              
    payload = SUBSTR(payload, trimLength+1)                                
    offset = offset + trimLength                                           
  END                                                                      
                                                                           
  RETURN 0
                                                                           
hexFormat: PROCEDURE                                                       
  hex = ARG(1)                                                             
  i = 8                                                                    
  DO WHILE i <= 64                                                         
    hex = INSERT(" ", hex, i)                                              
    i = i + 8 + 1                                                          
  END                                                                      
  RETURN hex                                                               

warn: PROCEDURE
  SAY ARG(1)
  RETURN
