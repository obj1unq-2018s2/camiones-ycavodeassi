object camion {
/*
 	cargar(cosa).

	descargar(cosa).

	pesoTotal(): Es la suma del peso del camión vacío (tara) y su carga. la tara del
	camión es de 1 tonelada.

	excedidoDePeso(): Si el peso total es superior al peso máximo. El cual es de 2.5
	toneladas.
	
	objetosPeligrosos(n): Todos los objetos cargados que superan el nivel de peligrosidad
	n.
	
	objetosMasPeligrososQue(cosa): Todos los objetos cargados que son más peligrosos
	que la cosa.

	puedeCircularEnRuta(nivelMaximoPeligrosidad) Puede circular si ningúna cosa
	que transporta supera el nivelMaximoPeligrosidad.
 */
 	const tara = 1000
 	var carga = []
 		
	method cargar(unaCosa) { carga.add(unaCosa) }
	
	method descargar(unaCosa) { carga.remove(unaCosa) }
	
	method pesoTotal() = tara + carga.sum{ elemento => elemento.peso() }
	
	method excedidoDePeso() {
		const pesoMax = 2500
		return self.pesoTotal()>pesoMax
	}
	
	method objetosPeligrosos(n) = carga.filter{ elemento => elemento.peligrosidad() > n }
	
	method objetosMasPeligrososQue(unaCosa) {}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return carga.all{ elemento => elemento.peligrosidad() <= nivelMaximoPeligrosidad }
	}
	
	method tieneAlgoQuePasaEntre(min, max) {
		return carga.any{ elemento => elemento.pes().between(min,max) }
	}
	
	method cosaMasPesada() = carga.max{ elemento => elemento.peso() }
}
