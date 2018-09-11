// peso en kg


object knightRider { 
	method peso() = 500
	method nivelDePeligrosidad() = 10
}

object bumblebee {
	var property esRobot = true
	
	method peso() = 800
	method nivelDePeligrosidad() { 
		if (esRobot) {
			return 30
		}
		else {
			return 15
		}
	}
}

object ladrillo {
	method peso() = 2
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 0
	
	method peso() = cantidadDeLadrillos*ladrillo.peso()
	method nivelDePeligrosidad() = 2
}

object arenaAGranel {
	var property peso = null
	  
	method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea {
	var property estaCargada = true
	
	method peso() {
		if (estaCargada) {
			return 300
		}
		else {
			return 200
		}
	}
	method nivelDePeligrosidad() {
		if (estaCargada) {
			return 100
		}
		else {
			return 0
		}
	}
}
	
object contenedorPortuario {
	const property cosasCargadas = []
	
	method peso() = 100 + cosasCargadas.sum({ unaCosa => unaCosa.peso() })
	method nivelDePeligrosidad() {
		if (self.cosasCargadas().isEmpty()) {
			return 0
		}
		else {
			return self.cosasCargadas().max({ unaCosa => unaCosa.nivelDePeligrosidad() }).nivelDePeligrosidad()
		}
	}
}

object residuosRadioactivos {
	var property peso = null
	
	method nivelDePeligrosidad() = 200
}

object embalajeDeSeguridad {
	var property cosaAEmbalar = null
	method peso() = cosaAEmbalar.peso()
	method nivelDePeligrosidad() = cosaAEmbalar.nivelDePeligrosidad()/2
}



