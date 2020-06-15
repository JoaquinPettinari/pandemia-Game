import persona.*

class Manzana {
	
	const property personasQueViven = []
	var property position
	
	method image(){
		return if(self.cuantosEstanInfectados() == 0){
			"blanco.png"
		} 
		else if(self.cuantosEstanInfectados().between(1,3)){
			"amarillo.png"
		}
		else if(self.cuantosEstanInfectados().between(4,7)){
			"naranja.png"
		}
		else if(self.cuantosEstanInfectados().between(8, self.cuantosViven() - 1)){
			"naranjaOscuro.png"
		}
		else {
			"rojo.png"
		}
	}
	
	method agregarPersona(persona){
		personasQueViven.add(persona)
	}
	
	method pasarUnDia(dia){
		personasQueViven.forEach({ persona => persona.cicloDeInfeccion(dia) })
	}
	
	method cuantosViven(){
		return personasQueViven.size()
	} 
	
	method cuantosEstanInfectados(){
		return personasQueViven.count({ persona => persona.estoyInfectado() })
	}
	
	method genteInfectada(){
		return personasQueViven.filter({ persona => persona.estoyInfectado() })
	}
	
	method genteInfectadaConSintomas(){
		return self.genteInfectada().filter({ persona => persona.presentoSintomas() })
	}
	
	method infectadosQueNoEstanAislados(){
		return self.genteInfectada().count({ persona => not persona.estoyAislado() })
	} 
	
	method generarPersonas(){
		(0..9).forEach({ x => 
			personasQueViven.add(new Persona())
		})
	}
	
	method respetenLaCuarentena(){
		personasQueViven.forEach({ persona => persona.voyARespetarLaCuarentena() })
	}
	
	
	method aislarATodosLosQueTienenSintomas(){
		self.genteInfectadaConSintomas().forEach({ persona => persona.aislarse() })
	}
	
	method cuantosRespetanLaCuarentena(){
		return personasQueViven.count({ persona => persona.respetoLaCuarentena() })
	}
	
}
