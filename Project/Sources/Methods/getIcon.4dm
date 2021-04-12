//%attributes = {}
var $1; $type : Text
var $2; $size : Integer
var $0 : Picture

$type:=$1
If (Count parameters:C259>=2)
	$size:=$2
Else 
	$size:=32
End if 


$0:=Form:C1466.icons[$type]  // ex : .error   .warning
