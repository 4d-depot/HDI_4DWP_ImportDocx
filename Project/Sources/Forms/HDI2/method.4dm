C_TEXT:C284($path)
C_LONGINT:C283($page)
C_PICTURE:C286($pict)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY TEXT:C222(Tabs; 0)
		ALL RECORDS:C47([DOC:1])
		ORDER BY:C49([DOC:1]; [DOC:1]Order:4; >)
		SELECTION TO ARRAY:C260([DOC:1]Title:3; tabs)
		
		GOTO SELECTED RECORD:C245([DOC:1]; 1)
		WParea:=[DOC:1]SampleDoc:2
		
		// LOG
		
		WParea.importLog:=New object:C1471()
		WParea.importLog.user:=New collection:C1472
		
		Form:C1466.icons:=New object:C1471
		
		READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Warning_48@2x.png"; $pict)
		TRANSFORM PICTURE:C988($pict; Crop:K61:7; 1; 97; 96; 96)
		Form:C1466.icons.warning:=$pict
		
		READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Error_48@2x.png"; $pict)
		TRANSFORM PICTURE:C988($pict; Crop:K61:7; 1; 97; 96; 96)
		Form:C1466.icons.error:=$pict
		
		READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"Images"+Folder separator:K24:12+"Info_48@2x.png"; $pict)
		TRANSFORM PICTURE:C988($pict; Crop:K61:7; 1; 97; 96; 96)
		Form:C1466.icons.info:=$pict
		
		Form:C1466.messageLong:="Hover any row to get some more information."
		Form:C1466.icon:=Form:C1466.icons.info_48
		
		// DOC LIST
		
		Form:C1466.documents:=New collection:C1472
		$path:=Get 4D folder:C485(Database folder:K5:14)+"Docx Samples"
		DOCUMENT LIST:C474($path; $_documents; Ignore invisible:K24:16)
		SORT ARRAY:C229($_documents; >)
		ARRAY TO COLLECTION:C1563(Form:C1466.documents; $_documents)
		
		SET TIMER:C645(-1)
		
		Form:C1466.trace:=False:C215
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		$page:=FORM Get current page:C276
		
		If ($page<=2)
			GOTO SELECTED RECORD:C245([DOC:1]; $page)
			WParea:=[DOC:1]SampleDoc:2
		End if 
		
End case 