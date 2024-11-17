class Contenido{
  const tags = []
  const titulo
  var property visitas = 0
  var property esOfensivo = false
  var monetizacion
  const property precio

  method esPopular()
  method totalRecaudado() = monetizacion.totalRecaudado(self)
  method cambiarMonetizacion(otra){ monetizacion = otra }
}

class Video inherits Contenido{
  const property esVideo = true 
  override method esPopular() = visitas > 10000
  override method totalRecaudado() = super().min(10000)
}

class Imagen inherits Contenido{
  const tagsDeModa = []

  override method esPopular() = self.tieneTagsDeModa()
  method tieneTagsDeModa() = tagsDeModa.all({tag => tags.contains(tag)})
  override method totalRecaudado() = super().min(4000)
}

