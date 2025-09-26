import wollok.vm.*

object rolando {
  var property artefactosObtenidos = []
  var property ordenDeEncuentro = []
  var capacidad          = 3
  var poderBase          = 5
  var property poderDePelea = poderBase
  var batallasPeleadas   = 0
  const hogar = castilloDePiedra
  
  method encuentra(artefacto) {
    ordenDeEncuentro.add(artefacto)
    self.validadCarga()
    artefactosObtenidos.add(artefacto)
  }
  
  method validadCarga() {
    if (not (artefactosObtenidos.size() < capacidad)) {
     self.error("capacidad alzanzada")
     }
  }
  
  method llegaCastillo() {
    hogar.guardarObjetos(artefactosObtenidos)
  }

  method poderDePelea() {
    artefactosObtenidos.forEach( {artefacto => poderDePelea = poderDePelea + artefacto.poderQueAportaAlUsuario(self)})
    return poderDePelea
  }

  method pelearBatalla() {

    
  }
}

object espadaDelDestino {
    method poderQueAportaAlUsuario(portador) {
      
    }


  
}

object libroDeEchizos {
    method poderQueAportaAlUsuario(portador) {
      
    }
  
}

object collarDivino {
    method poderQueAportaAlUsuario(portador) {
      
    }
  
}

object armaduraDeAceroValyrio {
    method poderQueAportaAlUsuario(portador) {
      
    }
  
}

object castilloDePiedra {
  var property almacen = []
  
  method guardarObjetos(objetos) {
    almacen.addAll(objetos)
  }
}