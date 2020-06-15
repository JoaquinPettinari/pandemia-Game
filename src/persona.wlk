class Persona {
	var property estoyInfectado = false
	var property diaQueMeInfecte = 0
	var property presentoSintomas = false
	var property estoyAislado = false
	var property respetoLaCuarentena = false
	var property estuveInfectado = false
	
	
	method cicloDeInfeccion(dia){
		
		if(self.mePuedoInfectar() && not estuveInfectado){
			estoyInfectado = true
			diaQueMeInfecte = dia
			estuveInfectado = true
			self.puedoPresentarSintomas()
		}
				
		else if(self.mePuedoCurar(dia) ){
			estoyInfectado = false
			presentoSintomas = false
		}
		
	}
	
	method mePuedoCurar(dia){
		return dia - diaQueMeInfecte >= 14 && estoyInfectado	
	}
	
	method mePuedoInfectar(){
		
		const probabilidadesDeContagio = 0.randomUpTo(100).truncate(0)
		
		return not estoyAislado && not estoyInfectado && (respetoLaCuarentena && probabilidadesDeContagio <= 2) || (not respetoLaCuarentena && probabilidadesDeContagio <= 30)
	}
	
	method puedoPresentarSintomas(){
		const probabilidadesDePresentarSintomas = 0.randomUpTo(100).truncate(0)
		
		if(probabilidadesDePresentarSintomas <= 20){
			presentoSintomas = true
		}
	}
	
	method voyARespetarLaCuarentena(){
		respetoLaCuarentena = true
	}
	
	method aislarse(){
		estoyAislado = true
	}
	
	
}
