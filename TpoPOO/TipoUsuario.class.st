Class {
	#name : #TipoUsuario,
	#superclass : #Object,
	#instVars : [
		'usuario'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
TipoUsuario class >> crear:usuario [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	| temp |
	temp := self new.
	temp iniciar:usuario.
	^ temp.
]

{ #category : #'as yet unclassified' }
TipoUsuario >> iniciar:usuarioIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	usuario := usuarioIn.
]

{ #category : #'as yet unclassified' }
TipoUsuario >> registarPrestamo:colLibros  idBibloteca: idBibloteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^0
]
