Class {
	#name : #BotonTipo1,
	#superclass : #Boton,
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
BotonTipo1 class >> crear:string x:x y:y [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
	^ self new iniciar:string x:x y:y.	
	
	
]

{ #category : #'as yet unclassified' }
BotonTipo1 >> iniciar:string [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	nombre := string.
	self label:nombre.
	self extent: 400@50.
	self color: Color gray.
	self borderWidth: 1.
	self borderColor: Color white.
	self roundedCorners: 10.
	
	
	
]

{ #category : #'as yet unclassified' }
BotonTipo1 >> iniciar:string x:x y:y [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	
	nombre := string.
	self label:nombre.
	self extent: x@y.
	self color: Color gray.
	self borderWidth: 1.
	self borderColor: Color white.
	self roundedCorners: 10.
	
	
	
]
