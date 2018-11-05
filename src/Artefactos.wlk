import TP_2.*
import Armadura.*

class Artefacto{
	
	var property peso
	var property diasDesdeLaCompra = 0
	
	method cuantoPesas() = self.peso() - self.factorDeCorreccion()
	
	method factorDeCorreccion() = (self.diasDesdeLaCompra()/1000).min(1)
	
}

class Arma inherits Artefacto{
	const property unidad = 3
	method unidadesDeLucha(portador) = self.unidad()
	method precio() = self.unidad() * 5
}

class CollarDivino inherits Artefacto{
	var property perlas = 1
	method unidadesDeLucha(portador) = self.perlas()
	method precio() = self.perlas() * 2
	override method cuantoPesas() = super() + self.perlas()*0.5
	
}

object espejoFantastico inherits Artefacto{
	method cantidadDeArtefactos(portador) = portador.artefactos().size()

	method unidadesDeLucha(portador){
		if(portador.cantidadDeArtefactosSin(self) >= 1){
			return portador.mejorArtefacto().unidadesDeLucha(portador)
		}
		else{
			return 0
		}
	}
	
	method precio() = 90
}

class MascaraOscura inherits Artefacto{
	var property indiceOscuridad
	var property minimo = 4
	method unidadesDeLucha(portador) = (self.minimo()).max(mundo.fuerzaOscura()/2 * self.indiceOscuridad())
	override method cuantoPesas() =  super() + self.pesoExtra()
	
	method pesoExtra() { 
		if(self.unidadesDeLucha(self) >= 3){
		
		return self.unidadesDeLucha(self) - 3 
	}
		else{
			return 0
		}
	}
	
	
}

