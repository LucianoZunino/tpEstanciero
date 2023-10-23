import wollok.game.*
import Ataque.*
class Peleador{
	var imagenDerecha
	var imagenIzquierda
	var imagenCarga = imagenDerecha
	var imagen = imagenDerecha
	var imagenDeAtaque
	var property position = new Position (x = 0, y = 0) 
	var direccion = 0
	var energia = 100
	var vida = 100
	method image() = imagen
	
	method derecha(){
		position = position.right(1)
		direccion = 1
		if(vida > 0){
			imagen = imagenDerecha
		}
	}
	
	method izquierda(){
		position = position.left(1)
		direccion = 0
		if(vida > 0){
			imagen = imagenIzquierda
		}
	}
	
	method arriba(){
		position = position.up(1)
	}
	
	method abajo(){
		position = position.down(1)
	}
	 
	method atacar(){
		if(energia >= 10 && vida > 0){
			game.addVisual(new Ataque(position = self.posicionAtaque(), direccion = direccion, imagen = imagenDeAtaque, duenio = self))
			energia = energia - 10
		}
	}
	
	method cargarEnergia(){
		energia += 5
		imagen = imagenCarga
	}
	
	method esAtaque() = false
	
	method posicionAtaque(){
		if(direccion === 1){
			return position.right(1)
		}else{
			return position.left(1)
		}
	}
	
	method choco(elemento){
		if(elemento.esAtaque()){
			self.recibirDanio(elemento)
		}else{
			game.say(self, "CORRETE!!")
		}
	}
	
	method recibirDanio(ataque){
		if(ataque.duenio() !== self){
			vida -= 30
			if(vida <= 0){
				self.morir()
			}else{
				game.say(self, "Ouch, me queda" + vida.toString() + "de vida")
			}
			game.removeVisual(ataque)
		}
	}
	
	method morir(){
		imagen = "fantasma.png"
		game.say(self, "Me mori :(")
	}
}