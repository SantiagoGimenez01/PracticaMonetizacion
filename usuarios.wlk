object sistema{
    const usuarios = []

    method saldoTotalDe(usuario) = usuario.saldoTotal()
    method emailDeUsuariosOrdenados() = self.filtrarUsuariosVerificados(usuarios).ordenarPorSaldo(usuarios).obtenerEmailDeUsuarios(usuarios).take(100)
    method filtrarUsuariosVerificados(users) = users.filter({usuario => usuario.verificado()})
    method ordenarPorSaldo(users) = users.sortedBy({uno, otro => uno.saldoTotal() > otro.saldoTotal()})
    method obtenerEmailDeUsuarios(users) = users.map({usuario => usuario.email()})
    method cantidadDeSuperUsuarios() = usuarios.count({usuario => usuario.esSuperUsuario()})
}

class Usuario{
    const contenidos = []
    var property verificado = false

    method saldoTotal() = contenidos.sum({contenido => contenido.totalReaudado()})
    method esSuperUsuario() = contenidos.count({contenido => contenido.esPopular()}) >= 10
    method subirContenido(contenido){ contenidos.add(contenido) }
}