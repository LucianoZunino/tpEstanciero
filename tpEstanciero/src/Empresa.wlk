import Propiedad.*
import Jugador.*
class Empresa inherits Propiedad{
	
	override method sosEmpresa() = return true
	
	method valorDeRenta(unJugador){
		const valorDeDados = unJugador.tirarDados()
		const cantidadDeEmpresas = unJugador.cantidadEmpresas()
		return valorDeDados * 30000 * cantidadDeEmpresas
	}
	override method rentaPara(unJugador){
		unJugador.pagarA(self.duenio(), self.valorDeRenta(unJugador))
		
	}
	override method cayo(unJugador){
		duenio.jugadorEnPropiedad(unJugador, self.valorDeRenta(unJugador))
	}
	method esPropiedadParaGarca(unJugador){
		return ((!unJugador.cantidadEmpresas() == 2) and (banco.cantidadEmpresas() < 3))
	}
	method esPropiedadParaImperialista(unJugador){
		return banco.cantidadEmpresas() == 3
	}		
}