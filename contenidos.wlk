class Contenido{
  const tags = []
  const titulo
  const property visitas
  var property esOfensivo  
  var property monetizacion

  method esPopular()
  method totalRecaudado() = monetizacion.totalRecaudado(self)
}

class Video inherits Contenido{

  override method esPopular() = visitas > 10000
  override method totalRecaudado() = super().min(10000)
}

class Imagen inherits Contenido{
  const tagsDeModa = []

  override method esPopular() = self.tieneTagsDeModa()
  method tieneTagsDeModa() = tagsDeModa.all({tag => tags.contains(tag)})
  override method totalRecaudado() = super().min(4000)
}