Class {
	#name : #ScrollMorph,
	#superclass : #ScrollPane,
	#instVars : [
		'colTextMorph',
		'x',
		'y',
		'ultimoY',
		'cabecera',
		'fondoCabecera'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
ScrollMorph class >> crear:xIn y:yIn [ 
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	
	^ self new iniciar:xIn y:yIn.
]

{ #category : #'as yet unclassified' }
ScrollMorph class >> crear:xIn y:yIn cabecera:cabecera [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	
	^ self new iniciar:xIn y:yIn cabecera:cabecera.
]

{ #category : #'as yet unclassified' }
ScrollMorph >> agregarTexto:texto [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| label |
    label := texto asStringMorph.
    label position: 5@ultimoY.
    ultimoY := ultimoY + 40.
	 colTextMorph add: label.
    self scroller addMorph: label behind: fondoCabecera.
]

{ #category : #'as yet unclassified' }
ScrollMorph >> iniciar:xIn y:yIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	x := xIn.
	y := yIn.
	ultimoY := 40.
	self extent: x@y.
	self color: Color black.
	colTextMorph := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ScrollMorph >> iniciar:xIn y:yIn cabecera:cabeceraIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		
	x := xIn.
	y := yIn.
	ultimoY := 40.
	self extent: x@y.
	self color: Color black.
	colTextMorph := OrderedCollection new.
	cabecera := cabeceraIn asStringMorph.
	fondoCabecera := Morph new.
	fondoCabecera extent: x@30.
	fondoCabecera color: Color black.
	cabecera position:5@10.
	self addMorph: fondoCabecera .
	self addMorphFront: cabecera. 
	
]

{ #category : #'as yet unclassified' }
ScrollMorph >> limpiar [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	colTextMorph do: [:textMorph | textMorph delete. ]
]
