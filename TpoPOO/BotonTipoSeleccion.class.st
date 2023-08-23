Class {
	#name : #BotonTipoSeleccion,
	#superclass : #CheckboxMorph,
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
BotonTipoSeleccion class >> crear:string [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^ self new iniciar:string.
]

{ #category : #'as yet unclassified' }
BotonTipoSeleccion >> estaSeleccionado [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
		|retornar|
	buttonMorph selected ifTrue:[
		retornar := true.
		];ifFalse:[
		retornar := false.
		].
	^ retornar .
]

{ #category : #'as yet unclassified' }
BotonTipoSeleccion >> iniciar:string [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	self label:  'plus' ; extent:100@20; borderWidth:3;borderColor: Color black; color: Color black .
]
