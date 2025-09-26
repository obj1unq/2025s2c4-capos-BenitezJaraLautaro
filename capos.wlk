import wollok.vm.*

object rolando {
  var property artefactosObtenidos = []
  var property ordenDeEncuentro = []
  const capacidad = 2
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
}

object espadaDelDestino {
  
}

object libroDeEchizos {
  
}

object collarDivino {
  
}

object armaduraDeAceroValyrio {
  
}

object castilloDePiedra {
  var property almacen = []
  
  method guardarObjetos(objetos) {
    almacen.addAll(objetos)
  }
}