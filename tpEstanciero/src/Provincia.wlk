class Provincia {
	var campos = []
	
	method unicoDuenio(){
		const primerDuenio = campos.first().duenio()
		return campos.all({campo => campo.duenio() == primerDuenio})
		
	}
	
	method dueniosDeLaProvincia(){
		return campos.map({campo => campo.duenio()}).asSet()
	}
	method esConstruccionPareja(unCampo){
		return campos.all({campo => campo.cantidadDeEstancias() <= unCampo.cantidadDeEstancias()})
	}
	
	method cumpleParaConstruir(unCampo){
		return self.unicoDuenio() and self.esConstruccionPareja(unCampo)
	}
	method yaTieneCampo(unJugador){
		return self.dueniosDeLaProvincia().any(unJugador)
	}

}

//obtener algo == coleccion. NO USAR OBTENER