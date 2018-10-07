class Personaje{
	const property artefactos = []
	var property hechizoPreferido = espectroMalefico
	var property basePelea = 1
	
	method basePoder () = 3
	method nivelDeHechiceria() = self.basePoder() * self.hechizoPreferido().poder() + mundo.fuerzaOscura()
	
	method agregaArtefacto(unArtefacto) = self.artefactos().add(unArtefacto)
	method removeArtefacto(unArtefacto) = self.artefactos().remove(unArtefacto)
	method removeTodosLosArtefactos() = self.artefactos().clear()
	
	method teCreesPoderoso() = self.hechizoPreferido().esPoderoso()

	method valorDeLucha() = self.basePelea() + self.poderDeArtefactos()
	
	method poderDeArtefactos() = self.artefactos().sum({artefacto => artefacto.unidadesDeLucha(self)})
	
	method mejorLuchadorQueMago() = self.valorDeLucha() > self.nivelDeHechiceria()
	
	method estasCargado() = self.artefactos().size() >= 5
	
	method mejorArtefacto() = self.artefactosSin(espejoFantastico).max({artefacto => artefacto.unidadesDeLucha(self)})
	
	method artefactosSin(unArtefacto) = self.artefactos().filter({artefacto => artefacto != unArtefacto})
	
	method cantidadDeArtefactosSin(unArtefacto) = self.artefactosSin(unArtefacto).size()	

}

object espectroMalefico{
	var property nombre = "Espectro Maléfico"
	method poder() = self.nombre().size()
	method sosPoderoso() = self.poder() > 15
	method unidadesDeLucha(portador) = self.poder()
}

object hechizoBasico{
	method poder() = 10
	method sosPoderoso() = false
	method unidadesDeLucha(portador) = self.poder()
}

class OtroHechizo{
	var property poder
	method unidadesDeLucha(portador) = self.poder() 
}

class Logos{
	var property nombre = null
	var property multiplicador = null
	method poder() = self.nombre().size() * self.multiplicador()
	method sosPoderoso() = self.poder() > 15
}

object mundo{
	var property fuerzaOscura = 5
	method eclipse(){fuerzaOscura *= 2}
}

object espadaDelDestino{
	method unidadesDeLucha(portador) = 3
}

object otrasEspadas{
	method unidadesDeLucha(portador) = 3
}

class CollarDivino{
	var property perlas = 1
	method unidadesDeLucha(portador) = perlas
}

class MascaraOscura{
	var property indiceOscuridad = 0
	method unidadesDeLucha(portador) = 4.max(mundo.fuerzaOscura()/2 * self.indiceOscuridad())
}

class Armadura{
	var property refuerzo = ningunRefuerzo
	var property valorBase = 2
	
	method unidadesDeLucha(portador){
			return self.valorBase() + self.unidadesDeLucha(portador)
	}
}

object ningunRefuerzo{
	method unidadesDeLucha(portador) = 0
}
class CotaDeMalla{
	var property cantidadUnidadDeLucha = 1
	method unidadesDeLucha(portador) = self.cantidadUnidadDeLucha()
}

object bendicion{
	method unidadesDeLucha(portador) = portador.nivelDeHechiceria()
}

object espejoFantastico{
	method cantidadDeArtefactos(portador) = portador.artefactos().size()

	method unidadesDeLucha(portador){
		if(portador.cantidadDeArtefactoSin(self) >= 1){
			return portador.mejorArtefacto().unidadesDeLucha(portador)
		}
		else{
			return 0
		}
	}
}

class LibroDeHechizos{
	const property hechizos = []
	
	method poder() = self.hechizosPoderosos().sum({hechizo => hechizo.poder()})
	
	method hechizos(nuevosHechizos){
		self.hechizos().clear()
		self.hechizos().addAll(nuevosHechizos)
	}
	
	method hechizosPoderosos() = self.hechizosSin(self).filter({hechizo => hechizo.sosPoderoso()})
	
	method unidadesDeLucha(portador) = self.hechizosPoderosos().sum({hechizo => hechizo.unidadesDeLucha(portador)})
	
	method hechizosSin(unHechizo) = self.hechizos().filter({hechizo => hechizo != unHechizo})
}
