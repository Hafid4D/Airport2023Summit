


Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		$ptr_city_departure:=OBJECT Get pointer:C1124(Object named:K67:5; "city_departure")
		
		$ptr_airport_from:=OBJECT Get pointer:C1124(Object named:K67:5; "airport_from")
		ARRAY TEXT:C222($ptr_airport_from->; 0)
		
		$_airports_departure:=ds:C1482.Airport.query("city = :1 order by groupOfAirport asc"; $ptr_city_departure->).toCollection("*, country.name")
		$groups:=$_airports_departure.distinct("groupOfAirport")
		
		Form:C1466.departures:=New collection:C1472
		If ($groups.length#0)
			For each ($item; $groups)
				$airports:=$_airports_departure.query("groupOfAirport = :1"; $item)
				
				If ($airports.length=1)
					$departure_from:=$airports[0].city+" - "+$airports[0].location+" - "+$airports[0].country.name
				Else 
					$departure_from:=$airports[0].city+" - "+$airports[0].country.name
				End if 
				
				APPEND TO ARRAY:C911($ptr_airport_from->; $departure_from)
				Form:C1466.departures.push(New object:C1471("group_id"; $item))
			End for each 
			
			$ptr_airport_from->:=1
			Form:C1466.departure:=Form:C1466.departures[0]
		End if 
		
	: (Form event code:C388=On Before Keystroke:K2:6)
		$ptr_city_departure:=OBJECT Get pointer:C1124(Object named:K67:5; "city_departure")
		Tools_Fill_Var_From_index($ptr_city_departure; ->[Airport:6]city:2)
		
		
End case 