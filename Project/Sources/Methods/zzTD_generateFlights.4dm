//%attributes = {}
//var $line : cs.LineEntity
//var $flight : cs.FlightEntity
//$nb:=0
//$NbLine:=0

//For each ($line; ds.Line.query("nbOfFlights = 0"))
//If (Undefined($line.fromAirport)=False) && (Undefined($line.toAirport)=False)
//$routes:=ds.Routes.query("Source_airport = :1 & Destination_airport = :2 & Codeshare # \"Y\""; $line.fromAirport.codeIATA; $line.toAirport.codeIATA)
//For each ($route; $routes)

//$airlines:=ds.Airline.query("designator = :1"; $route.Airline)
//If ($airlines.length=0)
//break
//Else 
//$uuidAirline:=$airlines.first().UUID
//End if 

//$aircrafts:=Split string($route.Equipment; " ")
//If ($aircrafts.length=0)
//break
//End if 
//$aircrafts:=ds.Aircraft.query("IATA = :1"; $aircrafts[Random%$aircrafts.length])
//If ($aircrafts.length=0)
//break
//End if 

//$uuidAircraft:=$aircrafts.first().UUID


//For ($x; 1; $line.rotationPerDay; 1)
//$flight:=ds.Flight.new()
//$flight.UUID_Line:=$line.UUID
//$flight.flightDuration:=Time($line.flightDuration+600)
//$flight.UUID_Airline:=$uuidAirline
//$flight.UUID_Aircraft:=$uuidAircraft

//$isNight:=False
//$chanceNight:=$line.rotationPerDay=5 ? 100 : $line.rotationPerDay-1*11
//If (Random%100+1>=$chanceNight) & ($x=1)
//$isNight:=True
//End if 

//$start:=$isNight=True ? (?21:00:00?+0) : (?05:00:00?+0)  // 21 : 5
//$range:=$isNight=True ? (?06:00:00?+0) : (?16:00:00?+0)  // 6 : 16

//$seed:=((Random*Random)%86400)\60*60
//$timeSecond:=($start+($seed%$range))%86400
//$flight.takeOffTime:=Time($timeSecond)


//$ok:=False
//While ($ok#True)
//If (zzTD_isTimeSlotFree($flight; True)=True)

//$time:=Time($flight.takeOffTime+$flight.flightDuration)
//$flight.landingTime:=$time>=86400 ? Time($time-86400) : $time
//$okArrival:=False

//While ($okArrival#True)

//If (zzTD_isTimeSlotFree($flight; False)=True)
//$okArrival:=True
//Else 
//$time:=Time($flight.landingTime+60)
//$flight.flightDuration:=Time($flight.flightDuration+60)
//$flight.landingTime:=$time>=86400 ? Time($time-86400) : $time
//End if 

//End while 
//$ok:=True
//Else 
//$time:=Time($flight.takeOffTime+60)
//$flight.takeOffTime:=$time>=86400 ? Time($time-86400) : $time
//End if 
//End while 


//// day of the week
//$obj:=New object()
//$obj["1"]:=(Random%10=0 ? False : True)
//$obj["2"]:=(Random%10=0 ? False : True)
//$obj["3"]:=(Random%10=0 ? False : True)
//$obj["4"]:=(Random%10=0 ? False : True)
//$obj["5"]:=(Random%10=0 ? False : True)
//$obj["6"]:=(Random%10=0 ? False : True)
//$obj["7"]:=(Random%10=0 ? False : True)

//$flight.daysOfWeek:=$obj

//$flight.save()
//$nb:=$nb+1
//End for 

//End for each 
//End if 
//$NbLine:=$NbLine+1
//End for each 