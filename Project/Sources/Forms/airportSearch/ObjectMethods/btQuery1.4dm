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
//$sets:=New collection()


////MARK:-Searches for airport fields
//If (String(Form.search.city)#"")
//QUERY([Airport]; [Airport]city=Form.search.city)

//$setName:=$setPrefix+"airportCity"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.location)#"")
//QUERY([Airport]; [Airport]location=Form.search.location)
//$setName:=$setPrefix+"airportLocation"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.countryCode)#"")
////QUERY([Airport]; [Country]isoCode_2=Form.search.countryCode)
//QUERY BY ATTRIBUTE([Airport]; [Country]codes; "iso2"; =; Form.search.countryCode)
//$setName:=$setPrefix+"airportCountryCode"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.country)#"")
//QUERY([Airport]; [Country]name=Form.search.country)
//$setName:=$setPrefix+"airportCountry"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.IATAcode)#"")
//QUERY BY ATTRIBUTE([Airport]; [Airport]codes; "IATA"; =; Form.search.IATAcode)
//$setName:=$setPrefix+"airportIATAcode"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.ICAOcode)#"")
//QUERY BY ATTRIBUTE([Airport]; [Airport]codes; "ICAO"; =; Form.search.ICAOcode)
//$setName:=$setPrefix+"airportICAOcode"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (Bool(Form.search.airportIntl))
//QUERY([Airport]; [Airport]international=True)
//$setName:=$setPrefix+"airportIntl"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (Bool(Form.search.airportIntlHub))
//QUERY([Airport]; [Airport]intlHub=True)
//$setName:=$setPrefix+"airportIntlHub"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (Bool(Form.search.airportDomestic))
//QUERY([Airport]; [Airport]domestic=True)
//$setName:=$setPrefix+"airportDomestic"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 



////MARK:-Searches for airlines

//If (String(Form.search.airline.name)#"")
//QUERY([Slot]; [Airline]name=Form.search.airline.name)
//RELATE ONE SELECTION([Slot]; [Line])

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
//CREATE SET([Airport]; $setPrefix+"airportFrom")

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
//CREATE SET([Airport]; $setPrefix+"airportTo")

//$setName:=$setPrefix+"airlineName"
//$sets.push($setName)
//UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

//CLEAR SET($setPrefix+"airportFrom")
//CLEAR SET($setPrefix+"airportTo")
//End if 

//Case of 
//: (String(Form.search.airline.countryCode)#"")
//QUERY BY ATTRIBUTE([Airline]; [Country]codes; "iso2"; =; Form.search.airline.countryCode)
//RELATE ONE SELECTION([Airline]; [Slot])
//RELATE ONE SELECTION([Slot]; [Line])

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
//CREATE SET([Airport]; $setPrefix+"airportFrom")

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
//CREATE SET([Airport]; $setPrefix+"airportTo")

//$setName:=$setPrefix+"airlineCountryCode"
//$sets.push($setName)

//UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

//CLEAR SET($setPrefix+"airportFrom")
//CLEAR SET($setPrefix+"airportTo")

//: (String(Form.search.airline.country)#"")
//QUERY([Airline]; [Country]name=Form.search.airline.country)
//RELATE ONE SELECTION([Airline]; [Slot])
//RELATE ONE SELECTION([Slot]; [Line])

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
//CREATE SET([Airport]; $setPrefix+"airportFrom")

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
//CREATE SET([Airport]; $setPrefix+"airportTo")

//$setName:=$setPrefix+"airlineCountry"
//$sets.push($setName)

//UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

//CLEAR SET($setPrefix+"airportFrom")
//CLEAR SET($setPrefix+"airportTo")
//End case 

//If (String(Form.search.airline.IATAcode)#"")
////QUERY BY ATTRIBUTE([Flight]; [Airline]codes; "IATA"; =; Form.search.airline.IATAcode)
//QUERY([Slot]; [Airline]designator=Form.search.airline.IATAcode)
//RELATE ONE SELECTION([Slot]; [Line])

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
//CREATE SET([Airport]; $setPrefix+"airportFrom")

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
//CREATE SET([Airport]; $setPrefix+"airportTo")

//$setName:=$setPrefix+"airlineIATAcode"
//$sets.push($setName)

//UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

//CLEAR SET($setPrefix+"airportFrom")
//CLEAR SET($setPrefix+"airportTo")
//End if 

//If (String(Form.search.airline.ICAOcode)#"")
//QUERY([Slot]; [Airline]ICAOdesignator=Form.search.airline.ICAOode)

//RELATE ONE SELECTION([Slot]; [Line])

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
//CREATE SET([Airport]; $setPrefix+"airportFrom")

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
//CREATE SET([Airport]; $setPrefix+"airportTo")

//$setName:=$setPrefix+"airlineICAOcode"
//$sets.push($setName)
//UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

//CLEAR SET($setPrefix+"airportFrom")
//CLEAR SET($setPrefix+"airportTo")
//End if 


////MARK:-Searches for aircraft
//If (String(Form.search.aircraft.name)#"")
//QUERY([Slot]; [Aircraft]name=Form.search.aircraft.name)
//RELATE ONE SELECTION([Slot]; [Line])

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
//CREATE SET([Airport]; $setPrefix+"airportFrom")

//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
//CREATE SET([Airport]; $setPrefix+"airportTo")

//$setName:=$setPrefix+"aircraftName"
//$sets.push($setName)

//UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

//CLEAR SET($setPrefix+"airportFrom")
//CLEAR SET($setPrefix+"airportTo")

//End if 

////MARK:-Searches for departures

//If (String(Form.search.flightsFrom.city)#"")

//QUERY([Airport]; [Airport]city=Form.search.flightsFrom.city)
//RELATE MANY SELECTION([Line]UUID_Airport_From)

//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)

//$setName:=$setPrefix+"flightsFromCity"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.flightsFrom.location)#"")
//QUERY([Airport]; [Airport]location=Form.search.flightsFrom.location)
//RELATE MANY SELECTION([Line]UUID_Airport_From)

//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)

//$setName:=$setPrefix+"flightsFromLocation"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//Case of 
//: (String(Form.search.flightsFrom.countryCode)#"")

//QUERY BY ATTRIBUTE([Airport]; [Country]codes; "iso2"; =; Form.search.flightsFrom.countryCode)
//RELATE MANY SELECTION([Line]UUID_Airport_From)

//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)

//$setName:=$setPrefix+"flightsFromCountryCode"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)

//: (String(Form.search.flightsFrom.country)#"")

//QUERY([Airport]; [Country]name=Form.search.flightsFrom.country)
//RELATE MANY SELECTION([Line]UUID_Airport_From)

//DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)

//$setName:=$setPrefix+"flightsFromCountry"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)

//End case 

////If (Time(Form.search.flightsFrom.arrivalTimeFrom)#?00:00:00?)
////QUERY([Flight]; [Flight]landingTime>=Form.search.flightsFrom.arrivalTimeFrom)
////RELATE ONE SELECTION([Flight]; [Line])

////DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
////DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
////CREATE SET([Airport]; $setPrefix+"airportFrom")

////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
////CREATE SET([Airport]; $setPrefix+"airportTo")

////$setName:=$setPrefix+"flightsFromTimeFrom"
////$sets.push($setName)
////UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

////$sets.push($setName)
////CREATE SET([Airport]; $setName)

////End if 

////If (Time(Form.search.flightsFrom.arrivalTimeTo)#?00:00:00?)
////QUERY([Flight]; [Flight]landingTime<=Form.search.flightsFrom.arrivalTimeTo)
////RELATE ONE SELECTION([Flight]; [Line])

////DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
////DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
////CREATE SET([Airport]; $setPrefix+"airportFrom")

////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
////CREATE SET([Airport]; $setPrefix+"airportTo")

////$setName:=$setPrefix+"flightsFromTimeTo"
////$sets.push($setName)
////UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

////$sets.push($setName)
////CREATE SET([Airport]; $setName)

////End if 

//// MARK: ---Todo Flights from Period


////MARK:-Searches for destinations
//If (String(Form.search.flightsTo.city)#"")
//QUERY([Airport]; [Airport]city=Form.search.flightsTo.city)
//RELATE MANY SELECTION([Line]UUID_Airport_To)

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)

//$setName:=$setPrefix+"flightsToCity"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//If (String(Form.search.flightsTo.location)#"")

//QUERY([Airport]; [Airport]location=Form.search.flightsTo.location)
//RELATE MANY SELECTION([Line]UUID_Airport_To)

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)

//$setName:=$setPrefix+"flightsToLocation"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End if 

//Case of 
//: (String(Form.search.flightsTo.countryCode)#"")
//QUERY BY ATTRIBUTE([Airport]; [Country]codes; "iso2"; =; Form.search.flightsTo.countryCode)
//RELATE MANY SELECTION([Line]UUID_Airport_To)

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)

//$setName:=$setPrefix+"flightsToCountryCode"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)

//: (String(Form.search.flightsTo.country)#"")

//QUERY([Airport]; [Country]name=Form.search.flightsTo.country)
//RELATE MANY SELECTION([Line]UUID_Airport_To)

//DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
//QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)

//$setName:=$setPrefix+"flightsToCountry"
//$sets.push($setName)
//CREATE SET([Airport]; $setName)
//End case 

////If (Time(Form.search.flightsTo.departureTimeFrom)#?00:00:00?)
////QUERY([Flight]; [Flight]takeOffTime>=Form.search.flightsTo.departureTimeFrom)
////RELATE ONE SELECTION([Flight]; [Line])

////DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)

////$sets.push($setName)
////CREATE SET([Airport]; $setName)

////End if 

////If (Time(Form.search.flightsTo.departureTimeTo)#?00:00:00?)
////QUERY([Flight]; [Flight]takeOffTime<=Form.search.flightsTo.departureTimeTo)
////RELATE ONE SELECTION([Flight]; [Line])

////DISTINCT VALUES([Line]UUID_Airport_From; $_uuidAirportFrom)
////DISTINCT VALUES([Line]UUID_Airport_To; $_uuidAirportTo)

////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportFrom)
////CREATE SET([Airport]; $setPrefix+"airportFrom")

////QUERY WITH ARRAY([Airport]UUID; $_uuidAirportTo)
////CREATE SET([Airport]; $setPrefix+"airportTo")

////$setName:=$setPrefix+"flightsToTimeTo"
////$sets.push($setName)
////UNION($setPrefix+"airportTo"; $setPrefix+"airportFrom"; $setName)

////$sets.push($setName)
////CREATE SET([Airport]; $setName)

////End if 

//// MARK: ---Todo Flights to Period



////MARK:-operate the sets
//$firstSet:=$sets.shift()
//For each ($setName; $sets)
//If (Form.search.conjonction.index=0)
//INTERSECTION($firstSet; $setName; $firstSet)
//Else 
//UNION($firstSet; $setName; $firstSet)
//End if 
//End for each 
//If ($firstSet#Null)
//USE SET($firstSet)
//End if 

////MARK:-clean the sets

//For each ($setName; $sets.push($firstSet))
//If ($setName#Null)
//CLEAR SET($setName)
//End if 
//End for each 

//If (Bool(Form.search.logs))
//SET DATABASE PARAMETER(4D Server log recording; 0)
//End if 



////MARK:-Apply the result
//$airports:=Create entity selection([Airport])
//Form.lb_items:=$airports
//ACCEPT

////MARK:-call logsDisplayer

//If (Bool(Form.search.logs))
//SET DATABASE PARAMETER(Client log recording; 0)
//$p:=New process("logsDisplayer"; 0; "$logsDisplayer"; *)
//CALL FORM(Storage.logsDisplayer.window; "logsDisplayer_update")
//End if 