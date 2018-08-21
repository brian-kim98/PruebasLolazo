object firulais {
	var edad = 25
	method edadPosta(){
		return edad * 7
	}	
}

object pepe {
	var edad = 57
	method edadPosta(){
		return edad
	}
}

object casa{
	const habitantes = [firulais, pepe]
	method habitantes() = habitantes
	method edadPromedio(){
		const edades = habitantes.map({habitante => habitante.edadPosta()})
		return edades.sum() / habitantes.size()
	}
}

//en una linea sería:
// return habitantes.map({habitante => habitante.edadPosta()}).sum() / habitantes.size()

// - O SINO -
// return habitantes.sum({habitante => habitante.edadPosta()}) / habitantes.size()

