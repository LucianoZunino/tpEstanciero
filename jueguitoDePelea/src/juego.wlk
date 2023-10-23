import wollok.game.*
import Peleador.*


object juego {
	method inicializar(){
		game.width(32)
		game.height(18)
		
		const goku = new Peleador (imagenDerecha = "goku.png", imagenIzquierda = "gokuIzquierda.png", imagenCarga = "vegetaCarga.png", imagenDeAtaque = "ataque.png")
		const vegeta = new Peleador (imagenDerecha = "vegetaDerecha.png", imagenIzquierda = "vegeta.png", position = new Position(x = 31, y = 0), imagenDeAtaque = "ataqueMalo.png")
		game.addVisual(goku)
		game.addVisual(vegeta)
		
		keyboard.a().onPressDo{ goku.izquierda()}
		keyboard.s().onPressDo{ goku.abajo()}
		keyboard.d().onPressDo{ goku.derecha()}
		keyboard.w().onPressDo{ goku.arriba()}
		keyboard.r().onPressDo{ goku.atacar()}
		keyboard.e().onPressDo{ goku.cargarEnergia()}
		
		
		keyboard.left().onPressDo{ vegeta.izquierda()}
		keyboard.down().onPressDo{ vegeta.abajo()}
		keyboard.right().onPressDo{ vegeta.derecha()}
		keyboard.up().onPressDo{ vegeta.arriba()}
		keyboard.m().onPressDo{ vegeta.atacar()}
		keyboard.k().onPressDo{ vegeta.cargarEnergia()}
		
		game.onTick(20, "Movimiento Ataques", {self.moverTodosLosAtaques()})
		
		const peleadores = game.allVisuals().filter{visual => !visual.esAtaque()}
		peleadores.forEach{peleador => game.onCollideDo(peleador, {elemento => peleador.choco(elemento)})}
	}
	
	method moverTodosLosAtaques(){
		const ataques = game.allVisuals().filter{visual => visual.esAtaque()}
		ataques.forEach{ataque => ataque.moverse()}
	}
}