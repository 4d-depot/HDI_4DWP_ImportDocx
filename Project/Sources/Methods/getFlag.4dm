//%attributes = {}
C_TEXT:C284($1)
C_PICTURE:C286($0)

Case of 
	: ($1="warning")
		$0:=Form:C1466.flags.orange
	: ($1="error")
		$0:=Form:C1466.flags.red
	: ($1="info")
		$0:=Form:C1466.flags.green
End case 
