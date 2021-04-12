var $mouseX; $mouseY; $mouseZ; $col; $row : Integer


Form:C1466.messageLong:="Hover any row to get some more information."
Form:C1466.icon:=Form:C1466.icons.info

Case of 
		
	: (Form event code:C388=On Mouse Move:K2:35)
		
		GET MOUSE:C468($mouseX; $mouseY; $mouseZ)
		LISTBOX GET CELL POSITION:C971(*; "LB1"; $mouseX; $mouseY; $col; $row)
		
		If (Not:C34(Undefined:C82(WParea.importLog)))
			If ($row>0) & ($row<=WParea.importLog.user.length)
				Form:C1466.messageLong:=WParea.importLog.user[$row-1].messageLong
				Form:C1466.icon:=getIcon(WParea.importLog.user[$row-1].type; 48)
			End if 
		End if 
		
End case 