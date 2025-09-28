# Capos

Este ejercicio busca ser una primer aproximación al mundo de las colecciones.


## Rolando

Se trata de un juego en el cual nuestro personaje, Rolando, va recolectando distintos artefactos por el mundo.
Para la primera versión, existen 4 artefactos:

- Espada del destino
- Libro de hechizos 
- Collar divino
- Armadura de acero valyrio

Al principio Rolando solo puede llevar hasta 2 artefactos a la vez, 
pero se espera que a medida que se desarrolla el juego pueda incrementar 
su capacidad.

Cada vez que rolando se encuentra con un artefacto, y tiene capacidad para llevarlo, lo levanta. 

### Ejemplo:
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando encuentra el collar divino (no lo agarra, ya que tiene la espada y el libro encima y su capacidad es de 2)

## Castillo de piedra

El castillo de piedra es donde Rolando vive. Es tan grande que allí no hay límite 
para almacenar artefactos.
Cuando rolando llega al castillo de piedra guarda en él todos los artefactos que lleva encima, 
liberando espacio para poder levantar nuevos. 

### Ejemplo:
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 4. rolando encuentra el collar divino (ahora si lo puede agarrar, ya que liberó espacio)
 3. rolando llega al castillo de piedra de nuevo(deja el collar, con lo cual ahora el castillo tiene el collar, la espada y el libro)
 

## Saber los artefactos de Rolando
 Hay dos preguntas interesantes que debe poder contestar Rolando, por un lado cuales son los artefactos que tiene encima 
 (ya resuelto en el punto anterior), pero tambien debe saber cuales son todos los artefactos que él posee 
 sin importar si lo tiene encima o en su castillo.
 
 También se quiere preguntar si posee un artefacto en especial.
 
### Ejemplo: 
 Si el castillo tiene el collar, la espada. Rolando tiene la armadura. 
 Entonces rolando posee el collar, la espada y la armadura.
 El libro no lo posee.
 
## Saber la historia de los encuentros con los artefactos.
 
 Se desea saber el orden en que rolando fue encontrandose los artefactos, independientemente de si los agarró o no.
 
### Ejemplo:
 
 1. rolando encuentra la espada del destino (la agarra)
 2. rolando encuentra el libro de hechizos (la agarra)
 3. rolando encuentra el collar divino (no lo agarra, ya que tiene la espada y el libro encima y su capacidad es de 2)
 4. rolando llega al castillo de piedra (deja en el castillo la espada y el libro de hechizos)
 5. rolando encuentra la armadura de acero valyrio (la agarra)
 6. rolando encuentra el collar divino (ahora si lo puede agarrar, ya que liberó espacio)
 
Si consultamos la historia de encuentro con los artefactos debería ser:
 1. espada del destino 
 2. libro de hechicos
 3. collar divino
 4. armadura de acero valyrio
 5. collar divino (de nuevo!)


## Parte 2 (mensajes con bloques) 

### 2.1 Comportamiento de los artefactos

Los artefactos son elementos que aportan al personaje cierto poder que puede usar en una batalla. Pero cuidado que cada vez que se combate en una batalla se sufren efectos. El poder de pelea de Rolando, dependerá de un valor base (inicialmente configurable) y de sus artefactos. **Tener en cuenta** al momento de programar los artefactos que éstos podrían ser usados por otros personajes que aún se han introducido.
  
- Espada del destino: La primera vez que se utiliza aporta la misma cantidad que el poder base del personaje, luego sólo el 50%. 
- Collar divino: aporta 3 puntos, pero si el personaje tiene un poder base mayor a 6, le suma también un punto por cada batalla en la que se haya usado el collar.
- Armadura de acero valyrio: Aporta 6 de poder de pelea siempre, el acero valyrio no se gasta con las batallas.

_Nota_ La regla del libro de hechizos se define más adelante.

El poder de pelea de Rolando es el resultado de sumar su poder base (que inicialmente es 5) a la sumatoria de los poderes de pelea que le aportan los artefactos que tiene consigo. Cuando ocurre una batalla, se utilizan todos los artefactos que rolando lleva consigo, y además se incrementa en 1 el número base del poder de pelea de rolando. 

#### Requerimientos

- Configurar el poder base de Rolando
- Conocer el poder de pelea de Rolando
- Hacer que Rolando luche una batalla
 
#### Ejemplo de batalla: 

- Hacer que Rolando tenga 5 de base y capacidad de 3 artefactos. Entre sus artefactos se encuentran la *espada* (que le aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3).
- Luego de la primer batalla Rolando tiene 6 de base, la espada (aporta 6/2 = 3), la armadura (aporta 6) y el collar (aporta 3)  
- Luego de la segunda batalla Rolando tiene 7 de base, la espada (aporta 7/2 = 3.5), la armadura 6 y el collar (3+2=5)
- Luego de la tercera batalla Rolando tiene 8 de base, la espada (aporta 8/2=4), la armadura 6 y el collar (3+3=6)
   
#### Ejemplo de poder de pelea: 

- Si Rolando tiene 5 de base y capacidad de 3 artefactos. Entre sus artefactos se encuentran la *espada* (aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3). Entonces el poder de pelea de Rolando es 5 + 5 + 6 + 3 = 19


### 2.2 Libro de hechizos

El libro de hechizos contiene varios hechizos, pero solo se pueden usar de uno a la vez. Los hechizos están ordenados y se utilizan en ese orden. Luego de utilizar  un hechizo éste se descarta. Existen estos 3 hechizos (pero podría haber más):

- Bendición: aporta 4 unidades de poder de pelea
- Invisibilidad: aporta la misma cantidad de poder de pelea que el personaje
- Invocación: Aporta el valor del artefacto más poderoso para el héroe que posee en su morada (y el artefacto del castillo no sufre ningún efecto por la batalla)

Si el libro de hechizos no tiene ningún hechizo, entonces su aporte es nulo.

#### Requerimiento

- Programar el libro de hechizo para que sea polimórfico con el resto de los artefactos

#### Ejemplo

Suponer que Rolando (con 5 de poder de pelea) solo tiene consigo el libro de hechizos, mientras que en su castillo tiene 
la espada, la armadura y el collar (todo sin haber sido usado antes). Además, suponer que el libro de hechizos contiene estos tres hechizos en este orden: bendición, invisibilidad e invocación.

- Antes de la primera batalla, el libro de hechizos aporta 4 de la bendición.
- Luego de la primera batalla el libro de hechizos aporta 6 por la invisibilidad.
- Luego de la segunda batalla, el libro aporta 7, ya que la invocación otorga los 7 puntos de la espada.
- Luego de la tercera batalla, ya no quedan más hechizos, por lo que el aporte del libro es 0


### 2.3 Enemigos

En la tierra de Erethia existen 3 poderosos enemigos y de cada uno interesa saber su poder de pelea y su morada.

- Caterina tiene 28 de poder de pelea y vive en la fortaleza de acero
- Archibaldo tiene 16 de poder de pelea y vive en el palacio de mármol. 
- Astra tiene 14 de poder pelea y vive en la torre de marfil

Los enemigos en Erethia que Rolando puede vencer son aquellos que tienen un poder de batalla menor al suyo. A su vez, las moradas que Rolando podría conquistar son las moradas de los enemigos a los cuales puede vencer.

#### Requerimientos
- Saber cuales son los enemigos que Rolando puede vencer
- Conocer las moradas conquistables por Rolando

#### Ejemplo
 
Suponiendo que Rolando tiene 5 de base y capacidad de 3 artefactos. Entre sus artefactos se encuentran la *espada* (que le aporta 5), la *armadura* (aporta 6) y el *collar* (aporta 3). Su poder de batalla es 19, por lo tanto, puede vencer a Archibaldo y a Astra. 
Las moradas conquistables son el palacio de mármol y la torre de marfil.

### 2.4 Poderoso

Se considera que Rolando es poderoso en la tierra de Erethia si está en condiciones de vencer a todos los enemigos.

#### Requerimiento

- Poder determinar si Rolando es poderoso

#### Ejemplo

En el caso anterior no es poderoso. Pero si se establece en 10 el poder base de Rolando, entonces sí lo es.

### 2.5 Artefacto fatal

Un artefacto fatal es aquel que le da a Rolando un poder de pelea superior al poder de batalla de su enemigo. Es decir, un artefacto no es fatal por sí solo si no se calcula para un enemigo en particular.

#### Requerimiento

- Requerimiento: Saber si Rolando posee consigo un artefacto fatal para enfrentar un enemigo
- Obtener de entre los artefactos que lleva consigo rolando, un artefacto fatal para enfrentar a un enemigo
 
 


  
 






 

