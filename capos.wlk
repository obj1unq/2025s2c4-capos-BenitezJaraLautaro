import wollok.vm.*

object rolando {
  var property artefactosObtenidos = []
  var property ordenDeEncuentro    = []
  var capacidad          = 3
  var property poderBase = 5
  var property poderDePelea        = poderBase
  var property vecesQueUsoEspada   = 0
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
    artefactosObtenidos.forEach( {artefacto => poderDePelea = poderDePelea + artefacto.poderQueAportaAlUsuario(self)})
    return poderDePelea
  }

  method pelearBatalla() {

    poderDePelea = poderDePelea + 1

  }
}

object espadaDelDestino {
    method poderQueAportaAlUsuario(portador) {
      if (portador.vecesQueUsoEspada() == 0) {
        return portador.poderBase()
      } else {
        return portador.poderBase() / 2 
        }
      
      
    }

    method validarUso(usuario) {
      if()
      
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