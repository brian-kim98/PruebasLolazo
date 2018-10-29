import hechizos.*
import Artefactos.*

class Personaje{
	const property artefactos = []
	var property hechizoPreferido
	var property basePelea = 1
	var property monedas = 100
	
	method basePoder () = 3
	
	method nivelDeHechiceria() = self.basePoder() * self.hechizoPreferido().poder() + mundo.fuerzaOscura()
	
	method agregaLosArtefactos(unosArtefactos) = self.artefactos().addAll(unosArtefactos)
	method agregaArtefacto(unArtefacto) = self.agregaLosArtefactos([unArtefacto])
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
	
	method monedas(nuevaCantidad){
		monedas = nuevaCantidad
	}
	
	method cumplisObjetivo(){
		self.ganasMonedas(10)
	}
	
	method ganasMonedas(monedasGanadas){
		self.monedas(self.monedas() + monedasGanadas)
	}
	
	method compraArtefacto(artefactoAComprar) {
		
		if(self.podesComprarArtefacto(artefactoAComprar).negate()){
			
			throw new NoTenesMonedas("Te faltan un par de monedas en la billetera para comprar el artefacto")
		}
		
			self.agregaArtefacto(artefactoAComprar)

			self.monedas(self.monedas() - artefactoAComprar.precio())
	}
		
	
	
	method podesComprarArtefacto(artefactoAComprar) =
		artefactoAComprar.precio() <= self.monedas()
	

	method compraHechizo(nuevoHechizo){
		var descuento = self.hechizoPreferido().precio() / 2

		self.hechizoPreferido(nuevoHechizo)

		if (descuento + self.monedas() >= nuevoHechizo.precio() ){
			self.hechizoPreferido(nuevoHechizo)

			var acumulador = self.monedas() - (nuevoHechizo.precio() - descuento).max(0)

			self.monedas(acumulador)

			return self.monedas()

		} else {
			return self.monedas()
		}
	}
}
	
	


object mundo{
	var property fuerzaOscura = 5
	method eclipse(){fuerzaOscura *= 2}
}


class NoTenesMonedas inherits Exception{}

