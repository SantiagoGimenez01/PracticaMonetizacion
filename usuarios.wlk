object sistema{
    const usuarios = []

    method saldoTotalDe(usuario) = usuario.saldoTotal()
    method emailDeUsuariosOrdenados() = usuarios
                                        .filter({usuario => usuario.verificado()})
                                        .sortedBy({uno, otro => uno.saldoTotal() > otro.saldoTotal()})
                                        .take(100)
                                        .map({usuario => usuario.email()})
                                        

    method cantidadDeSuperUsuarios() = usuarios.count({usuario => usuario.esSuperUsuario()})
}

class Usuario{
    const contenidos = []
    var property verificado = false

    method saldoTotal() = contenidos.sum({contenido => contenido.totalReaudado()})
    method esSuperUsuario() = contenidos.count({contenido => contenido.esPopular()}) >= 10
    method subirContenido(contenido){ contenidos.add(contenido) }
}