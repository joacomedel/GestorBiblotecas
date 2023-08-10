Class {
	#name : #InformacionBibloteca,
	#superclass : #InterfazTipo1,
	#instVars : [
		'scrollBiblotecas',
		'infoBibloteca',
		'botonActualizar'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InformacionBibloteca >> actualizarBibloteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			|infoBiblotecas|
	scrollBiblotecas resetear.
	infoBiblotecas := ventana devolverBiblotecasInfo.
	infoBiblotecas isNotNil ifTrue: [
		Transcript show: 'Entro en iftrue'. 
		infoBiblotecas do: [:infoBibl | scrollBiblotecas agregarTexto: infoBibl]. 
		].
	
	
]

{ #category : #'as yet unclassified' }
InformacionBibloteca >> iniciarInterfaz [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	nombre := 'Informacion Bibloteca'.
	botonActualizar := BotonTipo1 crear: 'Actualizar'.
	
	self addMorph: botonActualizar.
	botonActualizar position:40@700.
	scrollBiblotecas  := ScrollMorph crear: 60 y:100. 
	self addMorphCentered: scrollBiblotecas.
	botonActualizar mouseAction:[self actualizarBibloteca ].
	self iniciarBotonMenu.
]
