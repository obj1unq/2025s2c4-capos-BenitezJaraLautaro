import wollok.vm.*

object rolando {
  var property artefactosObtenidos = []
  var property ordenDeEncuentro    = []
  var capacidad          = 3
  var property poderBase = 5

  var property vecesQueUsoLibro    = 0
  var property vecesQueUsoCollar   = 0
  var property vecesQueUsoArmadura = 0
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
    var  poderDePelea_  = poderBase
    artefactosObtenidos.forEach( {artefacto => poderDePelea_ = poderDePelea_ + artefacto.poderQueAportaAlUsuario(self)})
    return poderDePelea_
  }

  method pelearBatalla() {
    artefactosObtenidos.forEach({ artefacto => artefacto.usarArtefacto(self) })
    poderBase = poderBase + 1

  }


  method aumentarUsoCollar() {
    vecesQueUsoCollar = vecesQueUsoCollar + 1
    
  }
}



object espadaDelDestino {
    var fueUsada = false 
    method poderQueAportaAlUsuario(portador) {
      if (!fueUsada) {
        return portador.poderBase()
      } else {
        return portador.poderBase() / 2 
        }
      
      
    }

    method usarArtefacto(portador) {
      fueUsada = true 
      
    }
}



object libroDeEchizos {
    var property echizosAlmacenados = [] 
    method poderQueAportaAlUsuario(portador) {
      return echizosAlmacenados.get(0).poderDePelea()
      
    }

    method agregarEchizo(echizo) {
      echizosAlmacenados.add(echizo)
    }
  
}

object bendicion {
  method poderDePelea() {
    return 4
    
  }
  
}

object invisibilidad {
  
}

object invocacion {
  
}

object collarDivino {
    method poderQueAportaAlUsuario(portador) {
      if (portador.poderBase() > 6 ) {
        return 3 + portador.vecesQueUsoCollar()
      } else {
        return 3
      }
      
    }

    method usarArtefacto(portador) {
      portador.aumentarUsoCollar() 
      
    }
  
}

object armaduraDeAceroValyrio {
    method poderQueAportaAlUsuario(portador) {
      return 6
      
    }

    method usarArtefacto(portador) {
      null
    }
  
}

object castilloDePiedra {
  var property almacen = []
  
  method guardarObjetos(objetos) {
    almacen.addAll(objetos)
  }
}