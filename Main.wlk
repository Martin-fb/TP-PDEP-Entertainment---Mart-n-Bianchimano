class Entrada{
    var banda
    var fecha
    method banda() = banda
    method fecha() = fecha

    const precioBase = 1000
    method PrecioFinal(productora) {
        //precioBase = PrecioBase + precioBase* productora.extraPrecio()
    }
}
class Asistente{
    const tipoDeAbono
    var historialDeEntradas = {}
    var dineroDisponible

// Me falta si no le alcanza el dineroDisponible y lo que ve el asistente de sus entradas pasadas
    method comprarEntrada(entrada) {
        if(dineroDisponible >= entrada.PrecioFinal(productora)){
            historialDeEntradas = historialDeEntradas + entrada
            dineroDisponible = dineroDisponible - entrada.PrecioFinal(productora)
        }

    }
// Al instanciarlo se ve el tipoDeAbono

}

class Banda{
    var nombre
    method nombre() = nombre
    var popularidad
    var canon = 1000000
    method cambiarPopularidad(cantidad) {
      popularidad = cantidad
    }
}
// No se si tendria que hacer las Bandas con composicion
class Rockera inherits Banda{
    var solosDeGuitarra
    const gastosExtra = 10000
    method darPopularidad() = 100 * solosDeGuitarra
    var presupuesto = canon + gastosExtra
}
class Trapera inherits Banda{
    const gastosExtra = 0
    var presupuesto = canon
    var hielo
method darPopularidad()
{    if (hielo){
        popularidad = 1000
    }else
    popularidad = 0
}
method cambiarCanon() {
      canon = popularidad * popularidad
    }
}

class Indie inherits Banda{
    var cantidadDeInstrumentos
    method gastoExtra() = 500 * cantidadDeInstrumentos
}

object productora{
    const listaDeAsistentes = {}
    method agregarAsistentes(unAsistente){
        listaDeAsistentes.add(unAsistente)
    } //Chequear funcionamiento
    const coleccionDeEntradas = {}
    method entradasTotales() {
      coleccionDeEntradas.add(listaDeAsistentes.forEach(historialDeEntradas.PrecioFinal(productora)))
    } //Chequear el foreach
    method gananciaTotal() = coleccionDeEntradas.sum() //Falta entrar en la parte del valor de la entrada

    method entradasVendidas() = coleccionDeEntradas.length()

//    method bandaMasPopular() =

//    method bonificarVips() =
}
