import TP_2.*
import Armadura.*


class Arma{
	const property unidad = 3
	method unidadesDeLucha(portador) = self.unidad()
	method precio() = self.unidad() * 5
}

class CollarDivino{
	var property perlas = 1
	method unidadesDeLucha(portador) = self.perlas()
	method precio() = self.perlas() * 2
}

object espejoFantastico{
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

class MascaraOscura{
	var property indiceOscuridad
	var property minimo = 4
	method unidadesDeLucha(portador) = (self.minimo()).max(mundo.fuerzaOscura()/2 * self.indiceOscuridad())
}

