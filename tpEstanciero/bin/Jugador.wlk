import Casillero.*
import Propiedad.*
import EstadoCarcelario.*
import prision.*
import estrategia.*

/*Obtener la colección de dueños que 
 * tiene una provincia sin repetidos. 
 * O sea, los dueños de sus campos 
 * (en la colección puede haber jugadores y el banco)
 */
 
 class Jugador {
 	var property dinero = 0
 	var property propiedades = []
 	var property casilleroActual = salida
 	var property estado = libre
 	var property estrategia = standar
 	
 	method cobrar(monto){
 		dinero =+ monto
 	}
 	method pagar(monto){
 		dinero =- monto
 	}
 	method pagarA(unJugador, monto) {
 		if (dinero < monto){
 			self.error( "no tiene dinero para pagar") }
 		else {
 			unJugador.cobrar(monto)
 			self.pagar(monto)
 		}
 		
 	}
	
	method cambiarEstado(unEstado){
		self.estado(unEstado)
	}
 	method cantidadEmpresas(){
 		return propiedades.count({propiedad => propiedad.sosEmpresa()})
 			
 	}
 	
 	method tirarDados(){
 		return estado.tirarDados(self)
 	}
 	
 	method irALaCarcel(){
 		casilleroActual = prision
 	}
 
 	
 	method jugadorEnPropiedad(unJugador, unaPropiedad) {
 		unJugador.pagarA(self, unaPropiedad.valorDeRenta())
 	}
 	
 	method comprarPropiedad(unaPropiedad){
		estrategia.comprarPropiedad(unaPropiedad, self)
 	}
 	method transferirPropiedad(unaPropiedad){
 		self.pagarA(banco, unaPropiedad.valorDeVenta())
 		self.agregarPropiedad(unaPropiedad)
 	}
 	method agregarPropiedad(unaPropiedad){
 		propiedades.add(unaPropiedad)
 		unaPropiedad.duenio(self)
 	}
 	method moverseDeCasillero(unosCasilleros){
 		unosCasilleros.forEach{casillero => casillero.paso(self)}
 		casilleroActual = unosCasilleros.last()
 		casilleroActual.cayo(self)
 		
 	}
 	
	
 }
 
 object banco inherits Jugador {
	
	override method pagarA(unJugador,monto){
		
	}
 	override method tirarDados(){
 		return 0
 	}
 	 override method jugadorEnPropiedad(unJugador, unaPropiedad) {
 		unJugador.comprarPropiedad(unaPropiedad)
 	}
 		
 }