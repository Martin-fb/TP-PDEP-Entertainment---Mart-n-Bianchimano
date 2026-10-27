class Entrada{
    var property banda
    var property fecha

    const precioBase = 1000

    method PrecioFinal(productora) = precioBase + productora.impuesto()
}
class Asistente{
    const property tipoDeAbono
    var property historialDeEntradas = []
    var property dineroDisponible

    method comprarEntrada(banda, fecha, productora) {
        if(dineroDisponible <= 0){
            self.error("Saldo Insuficiente")
        }
        const entrada = new Entrada (banda = banda, fecha = fecha)
        const montoAPagar = tipoDeAbono.montoAPagar(entrada,productora)
        dineroDisponible -= montoAPagar
        historialDeEntradas.add(entrada)
    }
    method entradasAnioAnterior(anioActual){
        const anioAnterior = anioActual - 1
        return historialDeEntradas.filter({e => e.fecha() == anioAnterior})
    }
}
class Abono{
    method montoAPagar(entrada, productora)
    method bonificar() {}
}

class Fan inherits Abono{
    override method montoAPagar(entrada, productora) = entrada.PrecioFinal(productora)
}
class Vip inherits Abono{
    var property porcentajeDescuento 
    override method montoAPagar(entrada, productora) = entrada.PrecioFinal(productora) - entrada.PrecioFinal(productora) * porcentajeDescuento
    override method bonificar(){
        porcentajeDescuento += 0.01
    }
}

class Banda{
    var property nombre
    var property estilo

    method popularidad() = estilo.popularidad(self)
    method canonBase() = 1000000
    method presupuesto() = estilo.presupuesto(self)
    method gastoExtra() = estilo.gastoExtra(self) 
}

class Rockera {
    var property solosDeGuitarra
    method gastoExtra(banda) = 10000
    method popularidad(banda) = 100 * solosDeGuitarra
    method presupuesto(banda) = banda.canonBase() + self.gastoExtra(banda)
}
class Trapera{
    var property hielo
    method popularidad(banda) = if (hielo) 1000 else 0
    method presupuesto(banda) = self.popularidad(banda) * 1000000
    method gastoExtra(banda) = 0
}

class Indie{
    var property cantidadDeInstrumentos
    method popularidad(banda) = 3.14 * banda.nombre().length()
    method presupuesto(banda) = banda.canonBase() + self.gastoExtra(banda)
    method gastoExtra(banda) = 500 * cantidadDeInstrumentos
}

object productora{
    const property asistentes = []
    const property bandas = []

    method agregarAsistentes(unAsistente){
        asistentes.add(unAsistente)
    }
    method agregarBandas(unaBanda){
        bandas.add(unaBanda)
    }
    method todasLasEntradas() = asistentes.flatMap({a => a.historialDeEntradas()})
    method entradasVendidas() = self.todasLasEntradas().size()
    method calcularGananciaTotal(){
        const recaudacion = self.todasLasEntradas().sum({e => e.PrecioFinal(self)})
        const presupuestoTotal = bandas.sum({b => b.presupuesto()})
        return recaudacion - presupuestoTotal
        }

    method entradasDeBanda(banda) = self.todasLasEntradas().count({e => e.banda() == banda})

    method bandaMasPopular() = bandas.max({b => self.entradasDeBanda(b)})
    method bonificarVips() {
        asistentes.forEach({a => a.tipoDeAbono().bonificar()})
    }

}
