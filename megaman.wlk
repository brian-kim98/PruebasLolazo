object falconArmor {

	var potencia = 25
	var resistencia = 10

	method bonificacionDeDanio() = potencia / resistencia

	method entrenamiento(minutos) {
		resistencia = 0.max(resistencia - minutos)
		potencia += 10
	}

	method potencia(unaPotencia) {
		potencia = unaPotencia
	}

	method potencia() = potencia

	method resistencia(unaResistencia) {
		resistencia = unaResistencia
	}

	method resistencia() = resistencia

}

object x {

	var armadura = falconArmor
	var danioBase = 10

	method fuerza() {
		return danioBase + armadura.bonificacionDeDanio()
	}

	method entrenar(tiempo) {
		danioBase += 2 * tiempo
		armadura.entrenamiento(tiempo)
	}

	method armadura(armor) {
		armadura = armor
	}
	
	method danioBase() = danioBase

}

object shadowArmor {

	var desgaste = 1

	method entrenamiento(minutos, danio) {
		desgaste += danio
	}

	method bonificacionDeDanio() = 80 / desgaste

}
