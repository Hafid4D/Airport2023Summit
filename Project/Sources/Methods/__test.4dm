//%attributes = {}
var $account : cs:C1710.Account
var $httpClient : cs:C1710.HTTPClient

$httpClient:=cs:C1710.HTTPClient.new()

$account:=cs:C1710.Account.new()
$account.httpClient:=$httpClient
$isRegFlag:=$account.isRedFlag("https://api.github.com/repos/Hafid4D/UTest")
