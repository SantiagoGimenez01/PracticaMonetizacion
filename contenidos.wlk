class Contenido{
  const tags = []
  const property titulo
  var property visitas = 0
  var property esOfensivo = false
  var monetizacion
  const property precio

  method esPopular()
  method totalRecaudado() = monetizacion.cotizar(self)
  method cambiarMonetizacion(otra){
    if(!otra.puedeAplicarse(self))
      self.error("La monetizacion no es aplicable al contenido") 
    monetizacion = otra
  }
  method initialize(){
    if(!monetizacion.puedeAplicarse(self))
      self.error("La monetizacion no es aplicable al contenido")
  }
  method puedeAlquilarse()
}

class Video inherits Contenido{

  override method esPopular() = visitas > 10000
  override method totalRecaudado() = super().min(10000)
  override method puedeAlquilarse() = true
}

  const tagsDeModa = []
class Imagen inherits Contenido{

  override method esPopular() = self.tieneTagsDeModa()
  method tieneTagsDeModa() = tagsDeModa.all({tag => tags.contains(tag)})
  override method puedeAlquilarse() = false
  override method totalRecaudado() = super().min(4000)
}

