Class {
	#name : #BotonTipo1,
	#superclass : #Boton,
	#category : #'TpoPOO-Visual'
}

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
