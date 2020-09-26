class VagonPasajeros {
	var largo
	var ancho
	var tieneBanios
	var estaOrdenado = false
	
	method setLargo(m) {largo = m}
	method setAncho(m) {ancho = m}
	method setTieneBanio(respuesta) { tieneBanios = respuesta }
	
	method hacerMantenimiento() { estaOrdenado = true }
	
	method tienenBanios() = tieneBanios
	
	method capacidadInicial() = if (ancho <= 3) 8 * largo else 10 * largo
	method capacidad() = if (not estaOrdenado) self.capacidadInicial() - 15 else self.capacidadInicial()
	
	method cargaMax() = if (tieneBanios) 300 else 800
	method pesoMax() = 2000 + (80 * self.capacidad()) + self.cargaMax()	
}


class VagonCarga {
	var cargaMaximaIdeal
	var maderasSueltas
	
	method setMaderasSueltas(cantidad) { maderasSueltas = cantidad }
	method setCargaMaximaIdeal(kg) { cargaMaximaIdeal = kg }
	method hacerMantenimiento() { maderasSueltas = 0.max(maderasSueltas - 2) }
	
	method tienenBanios() = false
	method capacidad() = 0 
	method cargaMax() = cargaMaximaIdeal - maderasSueltas * 400
	method pesoMax() = self.cargaMax() + 1500
}

class VagonDormitorio {
	var compartimientos 
	var camasPorComp
	
	method setCompartimientos(cantidad) { compartimientos = cantidad }
	method setCamas(cantidad) { camasPorComp = cantidad }
	method hacerMantenimiento() {}
	
	method tienenBanios() = true
	method capacidad() = compartimientos * camasPorComp
	method cargaMax() = 1200
	method pesoMax() = 4000 + 80 * self.capacidad() + self.cargaMax()
}