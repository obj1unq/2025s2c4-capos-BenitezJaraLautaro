import wollok.vm.*
object rolando {
    var property artefactosObtenidos  = []
    const capacidad = 2
    const hogar     = castilloDePiedra

    method encuentra(artefacto) {

        if (artefactosObtenidos.size()<capacidad) 
            {artefactosObtenidos.add(artefacto)}

    }

    method llegaCastillo() {
        hogar.guardarObjetos(artefactosObtenidos)
        artefactosObtenidos.forEach { arte => artefactosObtenidos.remove(arte) }
      
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
        objetos.forEach({ artefacto => almacen.add(artefacto) })
      
    }
  
}