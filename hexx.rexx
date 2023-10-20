/** :set makeprg=regina\ %  **/

xpayload = '<DIALOG CLASS="candle.ks3.dialogs.ToolAdhocCommandDialog" ID="DSATTR_EXTRACT_ID" GUIVER="1"><FIELD NAME="ToolDSAllocSecVal"><V>50</V></FIELD><FIELD NAME="CBCT_CommandType"><V>7</V></FIELD><FIELD NAME="RS_StartPm1"><V>false</V></FIELD><FIELD NAME="TACT_Command"><V>EXTDA %SUB01%  DATASET(&apos;PDNEWT.DAGX.MAR15A&apos;)  MOD BLOCK(17000) SPACE(10,50) VOLUME(TSP104)</V></FIELD><FIELD NAME="ToolDSAllocUnitsVal2"><V>17000</V></FIELD><FIELD NAME="CS_Every"><V>false</V></FIELD><FIELD NAME="CS_Fri"><V>false</V></FIELD><FIELD NAME="CG_RunNow"><V>true</V></FIELD><FIELD NAME="TFS_InMin"><V>0</V></FIELD><FIELD NAME="CS_Sun"><V>false</V></FIELD><FIELD NAME="CS_Tue"><V>false</V></FIELD><FIELD NAME="TFActionName"><V>TEP15_DAGX</V></FIELD><FIELD NAME="RS_In"><V>true</V></FIELD><FIELD NAME="CG_UseDefault"><V>false</V></FIELD><FIELD NAME="CS_Mon"><V>false</V></FIELD><FIELD NAME="CBS_Year"><V>0</V></FIELD><FIELD NAME="ToolDSAllocMgtClsVal"><V></V></FIELD><FIELD NAME="RS_StartPm"><V>false</V></FIELD><FIELD NAME="CS_Sat"><V>false</V></FIELD><FIELD NAME="DSAllocDsnNameVal"><V>pdnewt.dagx.mar15a</V></FIELD><FIELD NAME="TFS_Time"><V>01:00</V></FIELD><FIELD NAME="TFS_InHour"><V>0</V></FIELD><FIELD NAME="RS_At1"><V>false</V></FIELD><FIELD NAME="CS_Thur"><V>false</V></FIELD><FIELD NAME="TFG_DeleteAfter"><V></V></FIELD><FIELD NAME="RS_StartAm1"><V>true</V></FIELD><FIELD NAME="ToolDSAllocPrimVal"><V>10</V></FIELD><FIELD NAME="ToolDAGAllocDispVal"><V>0</V></FIELD><FIELD NAME="RS_At"><V>false</V></FIELD><FIELD NAME="AlcVolume"><V>&lt;GTBL rows=&quot;6&quot; cols=&quot;1&quot;&gt;&lt;TBL_COL index=&quot;0&quot;&gt;&lt;RD&gt;TSP104&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;/TBL_COL&gt;&lt;/GTBL&gt;</V></FIELD><FIELD NAME="TAJT_Replacement"><V>//PDNEWTZ JOB (ACCT),&apos;NAME&apos;,CLASS=A, //   MSGCLASS=X,MSGLEVEL=(1,1),NOTIFY=&amp;SYSUID.,REGION=0M //* ******************************************************************* </V></FIELD><FIELD NAME="CG_Situation"><V>false</V></FIELD><FIELD NAME="TCT_Variables"><V>&lt;GTBL rows=&quot;4&quot; cols=&quot;2&quot;&gt;&lt;TBL_COL index=&quot;0&quot;&gt;&lt;RD&gt;%SUB01%&lt;/RD&gt;&lt;RD&gt;%GROUP%&lt;/RD&gt;&lt;RD&gt;%ORIGINNODE%&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;/TBL_COL&gt;&lt;TBL_COL index=&quot;1&quot;&gt;&lt;RD&gt;*DSNAGDEF&lt;/RD&gt;&lt;RD&gt;Group Name&lt;/RD&gt;&lt;RD&gt;Managed System&lt;/RD&gt;&lt;RD&gt;&lt;/RD&gt;&lt;/TBL_COL&gt;&lt;/GTBL&gt;</V></FIELD><FIELD NAME="TFS_InDay"><V>0</V></FIELD><FIELD NAME="CBS_Day"><V>14</V></FIELD><FIELD NAME="CG_DeleteOneRun"><V>false</V></FIELD><FIELD NAME="CS_Wed"><V>false</V></FIELD><FIELD NAME="ToolDSAllocDsClsVal"><V></V></FIELD><FIELD NAME="TAJT_Extra"><V></V></FIELD><FIELD NAME="CJT_CopyLog"><V>true</V></FIELD><FIELD NAME="CBS_Month"><V>2</V></FIELD><FIELD NAME="RS_StartAm"><V>true</V></FIELD><FIELD NAME="TFG_MaxOutput"><V></V></FIELD><FIELD NAME="ToolDSAllocStorClsVal"><V></V></FIELD><FIELD NAME="TFJT_Prefix"><V></V></FIELD><FIELD NAME="TAActionDescription"><V></V></FIELD><FIELD NAME="TFS_Time1"><V>01:00</V></FIELD><FIELD NAME="ToolDAGAllocUnitsVal"><V>2</V></FIELD><DATAPARM NAME="%SUB01%"><ATTR>*DSNAGDEF</ATTR><PATT></PATT><VALUE>UERORVdU</VALUE></DATAPARM><DATAPARM NAME="%GROUP%"><ATTR>DAG_SUMM.GROUPNAME</ATTR><PATT></PATT><VALUE>PDNEWT</VALUE></DATAPARM><DATAPARM NAME="%ORIGINNODE%"><ATTR>DAG_SUMM.ORIGINNODE</ATTR><PATT></PATT><VALUE>S3TMS98:RS22:STORAGE</VALUE></DATAPARM></DIALOG>'
payload = 'short string                                                                                                                                                                                                                                          '
qpayload = ''

lineLength = 32 
offset = 0

IF payload = '' THEN DO 
  SAY "string is empty"
END

prevLine = ""
firstEmptyOffset = -1
emptyLines = 0

DO WHILE LENGTH(payload) > 0 
  line = SUBSTR(payload, 1, lineLength, ".")

  IF line = "" THEN DO
    IF firstEmptyOffset = -1 THEN DO
      firstEmptyOffset = offset
    END
    emptyLines = emptylines + 1
  END
  ELSE DO
    IF firstEmptyOffset >= 0 THEN DO
      SAY D2X(firstEmptyOffset,8)"  skipping empty" emptylines "lines"
      firstEmptyOffset = -1
      emptyLines = 0
    END
    SAY D2X(offset,8)"  "hexDump(line)" |"line"|"
  END

  payload = SUBSTR(payload, lineLength+1)
  offset = offset + lineLength
  prevLine = line
END                                           

exit


hexDump: PROCEDURE
  line = ARG(1)
  hex = C2X(line)
  i = 8
  DO WHILE i <= 64
    hex = INSERT(" ", hex, i)
    i = i + 8 + 1
  END

  RETURN hex
