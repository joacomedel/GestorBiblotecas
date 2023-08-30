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
UsuarioNormal >> registarPrestamo: colLibros idBibloteca: bibloteca [

	"comment stating purpose of instance-side method"

	"scope: class-variables  &  instance-variables"

	|librosTipoAudio retornar |
	librosTipoAudio := OrderedCollection new.
	colLibros do:[:lib ||bool| bool := lib getTipo = 'audioLibro'.bool ifTrue:[librosTipoAudio add:lib.colLibros remove:lib]].
			librosTipoAudio isEmpty
				ifFalse: [ retornar := -2 ];
				ifTrue: [ 
					(bibloteca usuarioTienePrestamo: usuario) ifFalse: [ 
							retornar := 1.
							bibloteca agregarPrestamo:
									(Prestamo crearPrestamo: colLibros usuario: usuario) ]].
			
	^ retornar
]
