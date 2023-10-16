//%attributes = {}

//C_TEXT($name)
//C_LONGINT($age)
//C_BOOLEAN($isAdult)
//C_DATE($birthday)
//C_OBJECT($options)
//C_OBJECT($employee)
//C_OBJECT($employees)
//C_OBJECT($chart)
//C_OBJECT($file)
//C_BLOB($body)


//var $name : Text
//var $age : Integer
//var $isAdult : Boolean
//var $birthday : Date
//var $options : Object
//var $employee : cs.EmployeeEntity
//var $employees : cs.EmployeeSelection
//var $chart : cs.chart
//var $file : 4D.File
//var $body : 4D.Blob

//C_TEXT(<>charCR)
//<>charCR:=Char(Carriage return)
//$text:="First line"+<>charCR+"Second line"


//C_TEXT(<>charDoubleQuote)
//<>charDoubleQuote:=Char(Double quote)
//$text:="Do you really want to delete "+<>charDoubleQuote+$customerName+<>charDoubleQuote+" ?"

//C_REAL(<>pi)
//<>pi:=3.14159

//$area:=<>pi*($radius^2)


//C_TEXT(<>folderSep)
//If (Is macOS)
//<>folderSep:=":"
//Else 
//<>folderSep:="\""
//End if 

//$subfolder:=Get 4D folder(Current resources folder)+"image"+<>folderSep+"logo"
//$subfolder:=Get 4D folder(Current resources folder)+Folder separator+<>folderSep+"logo"

//var $myObject : Object


//#DECLARE($person : Pointer)
//OB SET($person->; "lastName"; "Hardy")


//var $geometry : Object

//OB SET($geometry; "latitude"; 45.4; "longitude"; 1.5; "elevation"; 400)

//$geometry:={latitude: 45.4; longitude: 1.5; elevation: 400}

//$geometry:=New object
//$geometry["latitude"]:=45.4
//$geometry["longitude"]:=1.5
//$geometry["elevation"]:=400

//$geometry:=New object
//$geometry.latitude:=45.4
//$geometry.longitude:=1.5
//$geometry.elevation:=400

//$coordinate:="latitude"
//$geometry[$coordinate]:=45.4

//$vAge:=$employee.children[2].age


//var $myColl : Collection
//$myColl:=["alpha"; "bravo"; 66; ->myPtr; Current date; $obj1; $myOtherCollection]

//$casting:=[{first: "Stan"; last: "Laurel"}; {first: "Oliver"; last: "Hardy"}]

//$nbOfActors:=$casting.length






//var $obj1; $obj4 : Object
//var $myColl : Collection
//$obj1:=New object("prop1"; "blah")
//$myColl:=New collection("alpha"; "bravo"; 66; $obj1)
//$text:=$myColl[3].prop1  //blah  
//$obj4:=$myColl[3]
//$obj4.prop1:="other"
//$text:=$myColl[3].prop1  //other

//$obj4:=OB Copy($myColl[3])

//$mySharedObject:=New shared object("customer_ID"; 1235)
//$goldMedalist:=$standings[0].runner
//$silverMedalist:=$standings[1].runner

//Use ($mySharedObject)
//$mySharedObject.customer_ID:=6478
//End use 

//Use ($smtpServer)
//$ipAddress:=$smtpServer.ip
//$portAddress:=$smtpServer.port
//$login:=$smtpServer.login
//$password:=$smtpServer.pw
//End use 
//$customer_ID:=$mySharedObject.customer_ID