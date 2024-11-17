object publicidad{
    const extra = 2000

    method cotizar(contenido) = if(contenido.esPopular()) self.dineroPorVisitas(contenido) + extra else self.dineroPorVisitas(contenido)
    method dineroPorVisitas(contenido) = contenido.visitas() * 0.05
    method puedeAplicarse(contenido) = !contenido.esOfensivo()
}

class Donacion{
    var property donaciones = 0

    method cotizar(contenido) = self.donaciones()
    method donar(cantidad){ donaciones += cantidad }
    method puedeAplicarse(contenido) = true
}

class VentaDeDescarga{

    method cotizar(contenido) = contenido.visitas() * self.precioFijo(contenido.precio())
    method precioFijo(precio) = precio.max(5)
    method puedeAplicarse(contenido) = contenido.esPopular()
}

class Alquiler inherits VentaDeDescarga{
    override method precioFijo(precio) = precio.max(1)
    override method puedeAplicarse(contenido) = super(contenido) && contenido.puedeAlquilarse()
}