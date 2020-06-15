import wollok.game.*
import persona.*
import Manzana.*

object barrio {
	
	const property manzanas = []
	var property dia = 0
	
	method inicializarTablero(){
		(0.. game.width() - 1).forEach{ x => 
			(0.. game.height() - 1).forEach{ y =>
				const manzanaNueva = new Manzana(position = game.at(x,y))
				manzanaNueva.generarPersonas()
				manzanas.add(manzanaNueva) 
				game.addVisual(manzanaNueva)
				
			}
		}
	}
	
	method pasarUnDia(){
		
		if(self.cantidadDeInfectadosNoAislados() != 0){
			(1.. self.cantidadDeInfectadosNoAislados()).forEach({ x => 
				manzanas.forEach({ manzana => manzana.pasarUnDia(dia)})			
			})
		}
		
		dia ++
		
	}
	
	method cantidadDeInfectadosNoAislados(){
		return manzanas.sum({ manzana => manzana.infectadosQueNoEstanAislados()})
	}
	
	method cantidadDePersonasTotales(){
		return manzanas.sum({ manzana => manzana.cuantosViven() })
	}
	
	method cantidadDePersonasInfectadas(){
		return manzanas.sum({ manzana => manzana.cuantosEstanInfectados() })
	}
	
	method cantidadDePersonasConSintomas(){
		return manzanas.sum({ manzana => manzana.genteInfectadaConSintomas().size() })
	}
	
	method agregarExtranjero(){
			const manzanaAlAzar = manzanas.anyOne()
			
			manzanaAlAzar.agregarPersona(new Persona(estoyInfectado = true, diaQueMeInfecte = dia))
	}
	
	method aislarATodosLosQueTienenSintomas(){
		manzanas.forEach({ manzana => manzana.aislarATodosLosQueTienenSintomas() })
	}
	
	
	method cuantosRespetanLaCuarentena(){
		return manzanas.sum({ manzana => manzana.cuantosRespetanLaCuarentena() })
	}
	
}
