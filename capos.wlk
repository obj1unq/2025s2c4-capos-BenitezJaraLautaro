import wollok.vm.*

object rolando {
  var property artefactosObtenidos = []
  var property ordenDeEncuentro    = []
  var capacidad          = 3
  var property poderBase = 5

  var property useLaEspada   = false
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
    var  poderDePelea  = poderBase
    artefactosObtenidos.forEach( {artefacto => poderDePelea = poderDePelea + artefacto.poderQueAportaAlUsuario(self)})
    return poderDePelea
  }

  method pelearBatalla() {
    artefactosObtenidos.forEach({ artefacto => artefacto.usarArtefacto(self) })
    poderBase = poderBase + 1

  }

  method usoLaEspada() {
    useLaEspada = true 
  }
}

object espadaDelDestino {
    method poderQueAportaAlUsuario(portador) {
      if (!portador.useLaEspada()) {
        return portador.poderBase()
      } else {
        return portador.poderBase() / 2 
        }
      
      
    }

    method usarArtefacto(portador) {
      portador.usoLaEspada()
      
    }
}



object libroDeEchizos {
    method poderQueAportaAlUsuario(portador) {
      
    }
  
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
      portador.vecesQueUsoCollar() + 1
      
    }
  
}

object armaduraDeAceroValyrio {
    method poderQueAportaAlUsuario(portador) {
      return 6
      
    }

    method usarArtefacto(portador) {
      self.error("acero valyrio no se gasta con las batallas")
      
    }
  
}

object castilloDePiedra {
  var property almacen = []
  
  method guardarObjetos(objetos) {
    almacen.addAll(objetos)
  }
}