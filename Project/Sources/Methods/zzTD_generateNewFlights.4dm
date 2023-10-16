//%attributes = {}
//PAUSE INDEXES([Flight])
//$nbDay:=Year of(Current date)%4=0 ? 366 : 365

//$slots:=New object

//For ($x; 1; 7; 1)
//$queryString:="daysOfWeek."+String($x)+" = true"
//$obj:=New object
//$obj.slotsOfTheDay:=ds.Slot.query($queryString)

//$slots[String($x)]:=$obj

//End for 

//$nbFlight:=0
//For ($x; 0; $nbDay-1; 1)
//$date:=Date("01/01/2023")+$x
//$day:=Day number($date)

//$slotsOfTheDay:=$slots[String($day)].slotsOfTheDay
//For each ($slot; $slotsOfTheDay)
//$flight:=ds.Flight.new()
//$flight.UUID_Slot:=$slot.UUID

//$delayRand:=Random%100
//Case of 
//: ($delayRand<80)
//$delay:=0
//: ($delayRand<83)
//$delay:=10
//: ($delayRand<85)
//$delay:=15
//: ($delayRand<87)
//$delay:=20
//: ($delayRand<90)
//$delay:=30
//: ($delayRand<93)
//$delay:=60
//: ($delayRand<95)
//$delay:=90
//: ($delayRand<97)
//$delay:=120
//: ($delayRand<98)
//$delay:=180
//: ($delayRand<99)
//$delay:=240
//Else 
//$delay:=-1
//End case 

//$flight.delayDeparture:=Time($delay*60)

//If ($delay#-1)
//If (Random%8=0)
//If (Random%2=0)
//$flight.delayArrival:=Time(($flight.delayDeparture-(Int($slot.flightDuration/80)-(Int($slot.flightDuration/100)%60)\60*60))\300*300)
//Else 
//$flight.delayArrival:=Time(($flight.delayDeparture+(Int($slot.flightDuration/80)-(Int($slot.flightDuration/100)%60)\60*60))\300*300)
//End if 
//Else 
//$flight.delayArrival:=$flight.delayDeparture
//End if 
//Else 
//$flight.delayArrival:=$flight.delayDeparture
//End if 



//$flight.date:=$date
//$flight.save()
//$nbFlight:=$nbFlight+1
//End for each 

//End for 
//RESUME INDEXES([Flight])