Class {
	#name : #UsuarioPlus,
	#superclass : #TipoUsuario,
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioPlus >> esPlus [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^true
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> registarPrestamo: colLibros idBibloteca: idBibloteca [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| bibloteca indxLibros cantLibros librosTipoAudio retornar |
	librosTipoAudio := OrderedCollection new.
	bibloteca := usuario buscarBiblotecaInteres: idBibloteca.
	bibloteca isNotNil
		ifFalse: [ retornar := -1 ];
		ifTrue: [ 
			indxLibros := 1.
			cantLibros := colLibros size.
			indxLibros to: cantLibros do: [ :i | "Recolecto los libros tipo audio"
					| libro |
					libro := colLibros at: i.
					libro getTipo = 'audio' ifTrue: [ 
							librosTipoAudio add: libro.
							colLibros removeAt: i ] ].
			(bibloteca usuarioPrestamosMaximos: usuario)
				ifTrue: [ retornar := -2 ];
				ifFalse: [ 
					(((bibloteca usuarioTienePrestamoAudio: usuario) and:
							  librosTipoAudio isNotEmpty) or:
							 ((bibloteca usuarioTienePrestamo: usuario) and:
									  colLibros isNotEmpty))
						ifTrue: [ "Si no tiene espacio para prestamos" ];
						ifFalse: [ 
							colLibros isNotEmpty ifTrue: [ 
									bibloteca agregarPrestamo:
											(Prestamo crearPrestamo: colLibros usuario: usuario) ].
							librosTipoAudio isNotEmpty ifTrue: [ 
									bibloteca agregarPrestamo:
											(Prestamo crearPrestamo: colLibros usuario: usuario) ] ] ] ].
							^retornar
]
