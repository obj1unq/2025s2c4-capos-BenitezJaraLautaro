import wollok.vm.*

object rolando {
  var property artefactosObtenidos = []
  var property ordenDeEncuentro    = []
  var capacidad          = 3
  var property poderBase = 5

  var property vecesQueUsoLibro    = 0
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

  method poderPeleaArtefactoMasPoderosoEnMorada() {
    return hogar.poderPelaArtefactoMasPoderoso(self)
    
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
      if (!echizosAlmacenados.isEmpty()) {
        return echizosAlmacenados.get(0).poderDePelea(portador)
      }
      return 0
      
    }

    method agregarEchizo(echizo) {
      echizosAlmacenados.add(echizo)
    }

    method usarArtefacto(portador) {
      if (!echizosAlmacenados.isEmpty()) {
        echizosAlmacenados.remove(echizosAlmacenados.get(0))
      }
      
    }
  
}

object bendicion {
  method poderDePelea(portador) {
    return 4
    
  }
  
}

object invisibilidad {
  method poderDePelea(portador) {
    return portador.poderBase()

  }
  
}

object invocacion {
  method poderDePelea(portador) {
    return portador.poderPeleaArtefactoMasPoderosoEnMorada()
    
  }
  
}

object collarDivino {
    var property vecesUsado = 0
    method poderQueAportaAlUsuario(portador) {
      if (vecesUsado > 6 ) {
        return 3 + vecesUsado
      } else {
        return 3
      }
      
    }

    method usarArtefacto(portador) {
      vecesUsado = vecesUsado + 1 
      
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

  method poderPelaArtefactoMasPoderoso(propietario) {
    var mayorPoderAportado = 0
    almacen.forEach({ artefacto => mayorPoderAportado = self.mayorPoderAportadoEntre_A_(mayorPoderAportado, artefacto, propietario) })
    return mayorPoderAportado

    
  }

  method mayorPoderAportadoEntre_A_(artefacto, artefacto_, propietario) {
    return artefacto.max(artefacto_.poderQueAportaAlUsuario(propietario))
    
  }

  method validarArtefactosDisponibles() {
    if (almacen.isEmpty()) {
      self.error("no hay artefactos guardados en el castillo")
    }
    
  }
}