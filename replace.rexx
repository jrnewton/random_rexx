/** :set makeprg=regina\ %  **/

parse value "&lt;" with head "&gt;" tail
say head
say tail

/*
call test('&lt;&gt;')
call test('&gt;&lt;')
*/
call test('&gt;')
/*
call test('&lt;')
*/
exit 

test: PROCEDURE
  xmlstring = ARG(1)
  xmlstring = replace(xmlstring, "&lt;", "<")
  xmlstring = replace(xmlstring, "&gt;", ">")
  say ARG(1) "->" xmlstring
  return

replace: PROCEDURE  
  target = ARG(1)
  pattern = ARG(2)
  replacement = ARG(3)
  
/*  say "pattern='"pattern"'" */

  if target = pattern then do
    say "first hit"
    returnValue = replacement
  end
  else do
    head = target
    parse var target head (pattern) tail
    say "  '"target"', '"head"', '"tail"'" 
    do forever
      if head = "" then do 
        leave
      end
      else if tail = "" then do 
        target = head||replacement
        leave
      end
      else do
        target = head||replacement||tail
        parse var target head (pattern) tail
      end
      say "  '"target"', '"head"', '"tail"'" 
    end
    returnValue = target
  end

  return returnValue
