class Armadura{
	var property refuerzo = ningunRefuerzo
	var property valorBase = 2
	
	method unidadesDeLucha(portador){
			return self.valorBase() + self.refuerzo().unidadesDeLucha(portador)
	}
	
	method precio() = self.refuerzo().precioRefuerzo()
}

object ningunRefuerzo{
	method unidadesDeLucha(portador) = 0
	method precioRefuerzo(armadura) = 2
}
class CotaDeMalla{
	var property cantidadUnidadDeLucha = 1
	method unidadesDeLucha(portador) = self.cantidadUnidadDeLucha()
	method precioRefuerzo(armadura) = self.cantidadUnidadDeLucha()/2
}

object bendicion{
	method unidadesDeLucha(portador) = portador.nivelDeHechiceria()
	method precioRefuerzo(armadura) = armadura.valorBase()
}
