import rolandParte3.*

describe "(Parte 3)"{

	const espadaDelDestino = new Arma()
	const mascaraOscura = new MascaraOscura(indiceOscuridad = 1)
	const espectroMalefico = new Logos(nombre = "Espectro Malefico",multiplicador = 1)
	const collarDivino = new CollarDivino(perlas = 5)

	const rolando = new Personaje(hechizoPreferido = espectroMalefico)


	const armaduraSinRefuerzo = new Armadura(refuerzo = ningunRefuerzo,valorBase = 2)

	fixture{

		rolando.agregaLosArtefactos([espadaDelDestino,collarDivino,mascaraOscura,armaduraSinRefuerzo,espejoFantastico])
	}

	test "Rolando esta CARGADO si usa sus artefactos por defecto"{

		assert.that(rolando.estasCargado())

	}

	test "Rolando se saca la armadura, y deja de estar cargado"{

		rolando.removeArtefacto(armaduraSinRefuerzo)

		assert.notThat(rolando.estasCargado())

	}

	test"La Habilidad de lucha de rolando es de 20"{

		assert.equals(rolando.valorDeLucha(),20)

	}

	test "Si la armadura de Rolando tiene Bendicion, la habilidad para la lucha de la armadura es de 56"{

		armaduraSinRefuerzo.refuerzo(bendicion)

		assert.equals(armaduraSinRefuerzo.unidadesDeLucha(rolando),58)
	}

	test"Si la armadura de Rolando tiene Cota De Mallas, la habilidad para la lucha de la armadura es de 3"{

		const cotaDeMallas = new CotaDeMalla()

		armaduraSinRefuerzo.refuerzo(cotaDeMallas)

		assert.equals(armaduraSinRefuerzo.unidadesDeLucha(rolando),3)

	}

	test"Si la armadura de Rolando tiene Hechizo Basico, la habilidad para la lucha de la armadura es de 12"{

		armaduraSinRefuerzo.refuerzo(hechizoBasico)

		assert.equals(armaduraSinRefuerzo.unidadesDeLucha(rolando),12)
	}

	test"Si la armadura de Rolando tiene Espectro Malefico, la habilidad para la lucha de la armadura es de 19"{


		armaduraSinRefuerzo.refuerzo(espectroMalefico)

		assert.equals(armaduraSinRefuerzo.unidadesDeLucha(rolando),19)
	}

	test"Rolando deja de tener artefactos y se equipa un espejo, su habilidad de lucha es 1"{

		rolando.removeTodosLosArtefactos()
		rolando.agregaArtefacto(espejoFantastico)

		assert.equals(rolando.valorDeLucha(),1)
	}
	test"Si el hechizo preferido de rolando es un Libro de Hechizos, su nivel de hechizeria es de 56"{

		const libroDeHechizos = new LibroDeHechizos()

		libroDeHechizos.hechizos([espectroMalefico,hechizoBasico])

		rolando.hechizoPreferido(libroDeHechizos)

		assert.equals(rolando.nivelDeHechiceria(),56)
	}
  test "Le agrego a rolando una ArmaduraExtra, con valor base 5 y un refuerzo cota de Malla con valor de lucha = 6, entonces Rolando tiene 37 de habilidad de Lucha"{

		const armaduraExtra = new Armadura(
			valorBase = 5,
			refuerzo = new CotaDeMalla(cantidadUnidadDeLucha = 6
			)
		)

		rolando.agregaArtefacto(armaduraExtra)

		assert.equals(rolando.valorDeLucha(),37)

	}
}
