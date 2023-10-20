/** :set makeprg=regina\ %  **/

/*xmlstring = '&lt;GTBL rows="2" cols="2"&gt;&lt;TBL_COL index="0"&gt;&lt;RD&gt;%SUB01%&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;/TBL_COL&gt;&lt;TBL_COL index="1"&gt;&lt;RD&gt;*DSNAGDEF&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;/TBL_COL&gt;&lt;/GTBL&gt;'*/
xmlstring = '&lt;GTBL rows="2" cols="2"&gt;' 
/* xmlstring = replace(xmlstring, "&lt;", "<") */
xmlstring = replace(xmlstring, "&gt;", ">")
say xmlstring
/*
bigstring = '<DIALOG CLASS="candle.ks3.dialogs.DSGExportAttributesDialog" ID="DSATTR_EXTRACT_ID" GUIVER="1"><FIELD NAME="ToolDSAllocSecVal"><V>1</V></FIELD><FIELD NAME="CBCT_CommandType"><V>7</V></FIELD><DATAPARM NAME="%SUB01%"><ATTR>*DSNAGDEF</ATTR><PATT>%%</PATT><VALUE>UERORVdU</VALUE></DATAPARM></DIALOG>'
PARSE VAR bigstring '<DIALOG CLASS="' dialogClass '" ID="' dialogId '" GUIVER="' guiVersion '">' rest
SAY "dialogClass="dialogClass
SAY "dialogId="dialogId      
SAY "guiVersion="guiVersion  

PARSE VAR rest '<FIELD NAME="' fieldName '"><V>' fieldValue '</V>' rest             
DO WHILE fieldName <> ""                                                            
  SAY fieldName"="fieldValue                                                      
  PARSE VAR rest '<FIELD NAME="' fieldName '"><V>' fieldValue '</V>' rest           
END                                                                                 
                                                                                    
PARSE VAR bigstring '<DATAPARM NAME="' dataParmName '">' rest
SAY "dataparm Name="dataParmName

PARSE VAR rest '<ATTR>' dataParmAttr '</ATTR><PATT>' dataParmPatt '</PATT><VALUE>' dataParmValue '</VALUE>' rest             
DO WHILE dataParmAttr <> ""
  SAY dataParmAttr","dataParmPatt","dataParmValue
  PARSE VAR rest '<ATTR>' dataParmAttr '</ATTR><PATT>' dataParmPatt '</PATT><VALUE>' dataParmValue '</VALUE>' rest             
END                                                                                 
*/

exit 

replace: PROCEDURE  
  target = ARG(1)
  pattern = ARG(2)
  replacement = ARG(3)
  
  head = target
  parse var target head (pattern) tail
  do until tail=''
    target = head||replacement||tail
    parse var target head (pattern) tail
  end
  /*
  say "head="head
  say "tail="tail
  */
  return target
