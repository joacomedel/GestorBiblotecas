Class {
	#name : #InfoMorph,
	#superclass : #Morph,
	#instVars : [
		'colFilas',
		'colDatos',
		'colSMorph'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
InfoMorph class >> crear:datos filas:filas [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	 ^self new inciar:datos filas:filas.
]

{ #category : #'as yet unclassified' }
InfoMorph >> alternarModalidad [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	| texto bool morph |
	morph := colSMorph at:4.
	texto := morph contents.
	bool := 'plus:desactivado' = texto.
	bool ifTrue:[ morph contents:'plus:activado']ifFalse:[morph contents:'plus:desactivado'].
	
]

{ #category : #'as yet unclassified' }
InfoMorph >> inciar:datosIn filas:filas [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	|i y  morph|
	self extent: 300@200;borderColor: Color white; color: Color black ; borderWidth:3.
	colFilas := filas.
	colDatos := datosIn.
	colSMorph := OrderedCollection new.
	i:=1.
	y:=50. 
	(colFilas size )  timesRepeat: [|string|  string := ((colFilas at:i) , ':' , (colDatos at:i)).morph := string asStringMorph. self addMorphCentered: morph .morph position:10@y.colSMorph add:morph.i := i + 1. y := y + 25.].
	
]
