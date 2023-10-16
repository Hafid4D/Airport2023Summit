Class constructor
	This:C1470.UTest:=cs:C1710.UTest.new()
	This:C1470.sut:=cs:C1710.Util.new()
	This:C1470.testMethods:=New collection:C1472("fact_test")
	
	
Function fact_test()
	$result:=This:C1470.sut.fact(1)
	This:C1470.UTest\
		.describe("test factotial function with paramter 1")\
		.expect($result)\
		.toBe(1)
	
	$result:=This:C1470.sut.fact(2)
	This:C1470.UTest\
		.describe("test factotial function with paramter 2")\
		.expect($result)\
		.toBe(2)
	
	$result:=This:C1470.sut.fact(5)
	This:C1470.UTest\
		.describe("test factotial function with paramter 5")\
		.expect($result)\
		.toBe(120)
	
	
	
	
	
	