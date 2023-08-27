Class {
	#name : #UsuarioNormal,
	#superclass : #TipoUsuario,
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
UsuarioNormal >> esPlus [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^false
]

{ #category : #'as yet unclassified' }
UsuarioNormal >> registarPrestamo: colLibros idBibloteca: idBibloteca [

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
			librosTipoAudio isEmpty
				ifTrue: [ retornar := -2 ];
				ifFalse: [ (bibloteca usuarioTienePrestamo:usuario) ifFalse:[bibloteca agregarPrestamo: (Prestamo crearPrestamo: colLibros  usuario:usuario)]]].
]
