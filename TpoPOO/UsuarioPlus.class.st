Class {
	#name : #UsuarioPlus,
	#superclass : #TipoUsuario,
	#instVars : [
		'alDia'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioPlus >> esPlus [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^true
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> estaAlDia [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^alDia clone.
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> iniciar:usuarioIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	super iniciar:usuarioIn.
	alDia := true.
]

{ #category : #'as yet unclassified' }
UsuarioPlus >> registarPrestamo: colLibros idBibloteca: idBibloteca [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	| bibloteca indxLibros cantLibros librosTipoAudio retornar |
	librosTipoAudio := OrderedCollection new.
	bibloteca := usuario buscarBiblotecaInteres: idBibloteca.
	(bibloteca isNotNil and: self estaAlDia)
		ifFalse: [ retornar := -1 ];
		ifTrue: [ "indxLibros := 1.
			cantLibros := colLibros size.
			indxLibros to: cantLibros do: [ :i | 
					| libro |
					libro := colLibros at: i.
					libro getTipo = 'audioLibro' ifTrue: [ 
							librosTipoAudio add: libro.
							colLibros removeAt: i ] ]."
			colLibros do: [ :lib | 
					| bool |
					bool := lib getTipo = 'audioLibro'.
					bool ifTrue: [ 
							librosTipoAudio add: lib.
							colLibros remove: lib ] ].
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
									retornar := 1.
									bibloteca agregarPrestamo:
											(Prestamo crearPrestamo: colLibros usuario: usuario) ].
							librosTipoAudio isNotEmpty ifTrue: [ 
									retornar := 1.
									bibloteca agregarPrestamo:
											(Prestamo crearPrestamo: librosTipoAudio usuario: usuario) ] ] ] ].
	^ retornar
]
