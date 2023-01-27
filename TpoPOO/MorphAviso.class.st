Class {
	#name : #MorphAviso,
	#superclass : #Morph,
	#instVars : [
		'botonCerrar'
	],
	#classInstVars : [
		'botonCerrar',
		'textoError'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
MorphAviso class >> crear:texto [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^ self new iniciar:texto.
]

{ #category : #'as yet unclassified' }
MorphAviso >> iniciar:texto [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	botonCerrar := BotonTipo2 crear:'X'.
	self addMorph: botonCerrar.
	botonCerrar mouseAction: [self delete].
	self extent: 400@70.
	botonCerrar position: 364@1.
	self color: Color black.
	self borderColor: Color white.
	self borderWidth: 3.
	self addMorphCentered: texto asStringMorph.
	
]
