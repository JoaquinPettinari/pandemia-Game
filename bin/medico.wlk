import wollok.game.*
import prepararTablero.*

object medico {
	var property position = game.center()
	var property image = "hospital.png"
	
	method subir() {
		if (self.position().y() == game.height() - 1) {
			self.position(new Position(x = self.position().x(),y = 0))
		} else {
			self.position(self.position().up(1))
		}
	}

	method bajar() {
		if (self.position().y() == 0) {
			self.position(new Position(x = self.position().x(),y = game.height() - 1))
		} else {
			self.position(self.position().down(1))
		}
	}

	method derecha() {
		if (self.position().x() == game.width() - 1) {
			self.position(new Position(x = 0,y = self.position().y()))
		} else {
			self.position(self.position().right(1))
		}
	}

	method izquierda() {
		if (self.position().x() == 0) {
			self.position(new Position(x = game.width() - 1,y = self.position().y()))
		} else {
			self.position(self.position().left(1))
		}
	}
	
	method aislarATodosLosQueTienenSintomas(){
		barrio.aislarATodosLosQueTienenSintomas()
	}
	
	method hacerRespetarLaCuarentena(){
		self.objetoSobreMi().respetenLaCuarentena()
		
	}
	
	method objetoSobreMi() {
		return game.colliders(self).first()
	}
}
