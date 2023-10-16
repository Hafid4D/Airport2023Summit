Class constructor
	This:C1470.UTest:=cs:C1710.UTest.new()
	This:C1470.sut:=cs:C1710.Account.new()
	This:C1470.testMethods:=New collection:C1472("canResetPassword_test")
	
Function canResetPassword_test()
	// Scenario 1
	$user:={id: 4; isAdmin: True:C214}
	$result:=This:C1470.sut.canResetPassword($user)
	This:C1470.UTest\
		.describe("Can resest password: user not owner but admin")\
		.expect($result)\
		.toBe(True:C214)
	
	// Scenario 2
	$user:={id: 1; isAdmin: False:C215}
	$result:=This:C1470.sut.canResetPassword($user)
	This:C1470.UTest.describe("Can resest password: user is owner and not admin")\
		.expect($result)\
		.toBe(True:C214)
	
	// Scenario 3
	$user:={id: 2; isAdmin: False:C215}
	$result:=This:C1470.sut.canResetPassword($user)
	This:C1470.UTest.describe("Can't resest password: user not owner and not admin")\
		.expect($result)\
		.toBe(False:C215)
	
Function isRedFlag_test()
	$httpClientMock:=This:C1470.UTest.createMock("getGithubAccount"; {open_issues_count: 20})
	This:C1470.sut.httpClient:=$httpClientMock
	
	$result:=This:C1470.sut.isRedFlag("https://api.github.com/repos/lHafid/shiny-dollop")
	This:C1470.UTest.describe("Test if an account is a red flag: It's a red flag account")\
		.expect($result)\
		.toBe(True:C214)
	
	
	$httpClientMock:=This:C1470.UTest.createMock("getGithubAccount"; {open_issues_count: 0})
	This:C1470.sut.httpClient:=$httpClientMock
	
	$result:=This:C1470.sut.isRedFlag("https://api.github.com/repos/lHafid/shiny-dollop")
	This:C1470.UTest.describe("Test if an account is a red flag: It's not a red flag account")\
		.expect($result)\
		.toBe(False:C215)