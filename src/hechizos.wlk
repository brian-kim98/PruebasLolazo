class Hechizo{
	
	method poder()
	
	method unidadesDeLucha() = self.poder()
	
	method precioRefuerzo(armadura) = armadura.valorbase() + self.precio()
	
	method precio()
	
	method sosPoderoso()
	
	method pesoQueAgrega() {
	 if(self.poder().even()){
	 	return 2
	 }
	 else {
	 	return 1 
	 }
	 }

}

object hechizoBasico inherits Hechizo{
	override method poder() = 10
	override method sosPoderoso() = false
	override method precio() = 10
}

class Logos inherits Hechizo{
	var property nombre
	var property multiplicador
	override method poder() = self.nombre().size() * self.multiplicador()
	override method sosPoderoso() = self.poder() > 15
	override method precio() = self.poder()
	
}

class LibroDeHechizos{
	const property hechizos = []
	var property precioPorCadaHechizo = 10
	
	method poder() = self.hechizosPoderosos().sum({hechizo => hechizo.poder()})
	
	method hechizos(nuevosHechizos){
		self.hechizos().clear()
		self.hechizos().addAll(nuevosHechizos)
	}
	
	method agregarHechizo(unHechizo){
		self.hechizos().add(unHechizo)
	}
	
	method hechizosPoderosos() = self.hechizosSin(self).filter({hechizo => hechizo.sosPoderoso()})
	
	method unidadesDeLucha(portador) = self.hechizosPoderosos().sum({hechizo => hechizo.unidadesDeLucha(portador)})
	
	method hechizosSin(unHechizo) = self.hechizos().filter({hechizo => hechizo != unHechizo})
	
	method precio() = self.precioTotalPorHechizos() + self.precioTotalDelHechizo()
	
	method precioTotalDelHechizo() = self.hechizosPoderosos().sum({hechizo => hechizo.poder()})
	
	method precioTotalPorHechizos() = self.hechizosSin(self).size() * self.precioPorCadaHechizo()
	
}