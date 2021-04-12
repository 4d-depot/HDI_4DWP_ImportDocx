C_TEXT:C284($path; $directory)

var $win : Integer
var $path : Text

If (Form:C1466.trace)
	TRACE:C157
End if 


If (Form:C1466.currentPosition#0)
	
	
	$directory:=Get 4D folder:C485(Database folder:K5:14)
	$path:=$directory+"Docx Samples"+Folder separator:K24:12+Form:C1466.documents[Form:C1466.currentPosition-1]
	
	WParea:=WP Import document:C1318($path; wk docx:K81:277)
	//SET TIMER(-1)
	
End if 
