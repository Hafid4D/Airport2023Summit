////MARK:-Set the options

//If (Bool(Form.search.trace))
//TRACE
//End if 

//If (Bool(Form.search.logs))
//Use (Storage.logs)
//Storage.logs.sequentialNumber+=1
//End use 
//SET DATABASE PARAMETER(4D Server log recording; Num(Storage.logs.sequentialNumber))
//End if 

//$setPrefix:=Bool(Form.search.useLocalSet) ? "$" : ""

////MARK:-Init the necessary elements
//var $airports : cs.AirportSelection

//If (Form.search.conjonction.index=0)
//$airports:=ds.Airport.all()
//$conjonction:="and"
//Else 
//$airports:=ds.Airport.newSelection()
//$conjonction:="or"
//End if 

////MARK:-Searches for airport fields
//If (String(Form.search.city)#"")
//$airportsTemp:=ds.Airport.query("city = :1"; Form.search.city)
//$airports:=$airports[$conjonction]($airportsTemp)

//End if 

//If (String(Form.search.location)#"")
//$airportsTemp:=ds.Airport.query("location = :1"; Form.search.location)
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (String(Form.search.countryCode)#"")
//$airportsTemp:=ds.Country.query("codes.iso2 = :1"; Form.search.countryCode).airports
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (String(Form.search.country)#"")
//$airportsTemp:=ds.Country.query("name = :1"; Form.search.country).airports
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (String(Form.search.IATAcode)#"")
//$airportsTemp:=ds.Airport.query("codes.IATA = :1"; Form.search.IATAcode)
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (String(Form.search.ICAOcode)#"")
//$airportsTemp:=ds.Airport.query("codes.ICAO = :1"; Form.search.ICAO)
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (Bool(Form.search.airportIntl))
//$airportsTemp:=ds.Airport.query("international = True")
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (Bool(Form.search.airportIntlHub))
//$airportsTemp:=ds.Airport.query("intlHub = True")
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (Bool(Form.search.airportDomestic))
//$airportsTemp:=ds.Airport.query("domestic = True")
//$airports:=$airports[$conjonction]($airportsTemp)
//End if 



////MARK:-Searches for airlines

//If (String(Form.search.airline.name)#"")

//$lines:=ds.Slot.query("airline.name = :1"; Form.search.airline.name).line

//$airportsTemp:=$lines.toAirport.or($lines.fromAirport)

//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//Case of 
//: (String(Form.search.airline.countryCode)#"")

//$lines:=ds.Country.query("codes.iso2 = :1"; Form.search.airline.countryCode).airlines.slots.line

//$airportsTemp:=$lines.toAirport.or($lines.fromAirport)

//$airports:=$airports[$conjonction]($airportsTemp)

//: (String(Form.search.airline.country)#"")
//$lines:=ds.Country.query("name = :1"; Form.search.country).airlines.slots.line

//$airportsTemp:=$lines.toAirport.or($lines.fromAirport)

//$airports:=$airports[$conjonction]($airportsTemp)
//End case 

//If (String(Form.search.airline.IATAcode)#"")
//$lines:=ds.Slot.query("airline.designator = :1"; Form.search.airline.IATAcode).line

//$airportsTemp:=$lines.toAirport.or($lines.fromAirport)

//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

//If (String(Form.search.airline.ICAOcode)#"")
//$lines:=ds.Slot.query("airline.ICAOdesignator = :1"; Form.search.airline.ICAOcode).line

//$airportsTemp:=$lines.toAirport.or($lines.fromAirport)

//$airports:=$airports[$conjonction]($airportsTemp)
//End if 


////MARK:-Searches for aircraft
//If (String(Form.search.aircraft.name)#"")
//$lines:=ds.Slot.query("aircraft.name = :1"; Form.search.aircraft.name).line

//$airportsTemp:=$lines.toAirport.or($lines.fromAirport)

//$airports:=$airports[$conjonction]($airportsTemp)
//End if 

////MARK:-Searches for departures

//If (String(Form.search.flightsFrom.city)#"")
//$lines:=ds.Airport.query("city = :1"; Form.search.flightsFrom.city).departureLines

//$airports:=$airports[$conjonction]($lines.toAirport)
//End if 

//If (String(Form.search.flightsFrom.location)#"")
//$lines:=ds.Airport.query("location = :1"; Form.search.flightsFrom.location).departureLines

//$airports:=$airports[$conjonction]($lines.toAirport)
//End if 

//Case of 
//: (String(Form.search.flightsFrom.countryCode)#"")

//$lines:=ds.Country.query("codes.iso2 = :1"; Form.search.flightsFrom.countryCode).airports.departureLines

//$airports:=$airports[$conjonction]($lines.toAirport)

//: (String(Form.search.flightsFrom.country)#"")

//$lines:=ds.Country.query("name = :1"; Form.search.flightsFrom.country).airports.departureLines

//$airports:=$airports[$conjonction]($lines.toAirport)

//End case 

//// TODO: --Flights from / arrival time 
////If (Time(Form.search.flightsFrom.arrivalTimeFrom)#?00:00:00?)
////End if 
////If (Time(Form.search.flightsFrom.arrivalTimeTo)#?00:00:00?)
////End if 

//// TODO: --Flights from Period



////MARK:-Searches for destinations
//If (String(Form.search.flightsTo.city)#"")
//$lines:=ds.Airport.query("city = :1"; Form.search.flightsTo.city).arrivalLines

//$airports:=$airports[$conjonction]($lines.fromAirport)

//End if 

//If (String(Form.search.flightsTo.location)#"")
//$lines:=ds.Airport.query("location = :1"; Form.search.flightsTo.location).arrivalLines

//$airports:=$airports[$conjonction]($lines.fromAirport)

//End if 

//Case of 
//: (String(Form.search.flightsTo.countryCode)#"")
//$lines:=ds.Country.query("codes.iso2 = :1"; Form.search.flightsTo.countryCode).airports.arrivalLines

//$airports:=$airports[$conjonction]($lines.fromAirport)

//: (String(Form.search.flightsTo.country)#"")
//$lines:=ds.Country.query("name = :1"; Form.search.flightsTo.country).airports.arrivalLines

//$airports:=$airports[$conjonction]($lines.fromAirport)
//End case 



//// TODO: --Flights to / departure time 
////If (Time(Form.search.flightsTo.departureTimeFrom)#?00:00:00?)
////End if 
////If (Time(Form.search.flightsTo.departureTimeTo)#?00:00:00?)
////End if 

//// TODO: -- Flights to / Period



//If (Bool(Form.search.logs))
//SET DATABASE PARAMETER(4D Server log recording; 0)
//End if 



////MARK:-Apply the result
//Form.lb_items:=$airports
//ACCEPT

////MARK:-call logsDisplayer

//If (Bool(Form.search.logs))
//SET DATABASE PARAMETER(Client log recording; 0)
//$p:=New process("logsDisplayer"; 0; "$logsDisplayer"; *)
//CALL FORM(Storage.logsDisplayer.window; "logsDisplayer_update")
//End if 