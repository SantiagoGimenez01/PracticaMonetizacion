object publicidad{
    const extra = 2000

    method totalRecaudado(contenido) = if(!contenido.esOfensivo()) self.cotizar(contenido) else 0
    method cotizar(contenido) = if(contenido.esPopular()) self.dineroPorVisitas(contenido) + extra else self.dineroPorVisitas(contenido)
    method dineroPorVisitas(contenido) = contenido.visitas() * 0.05
}

class Donacion{
    var property donaciones = 0

    method totalRecaudado(contenido) = self.donaciones()
    method donar(cantidad){ donaciones += cantidad }
}

class VentaDeDescarga{
    const precioFijo

    method totalReaudado(contenido) = if(contenido.esPopular()) contenido.cotizar() else 0
    method cotizar(contenido) = contenido.visitas() * precioFijo
}