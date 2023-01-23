Class {
	#name : #BotonTipo2,
	#superclass : #Boton,
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
BotonTipo2 >> iniciar:string [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	nombre := string.
	self label:nombre.
	self extent: 35@35.
	self color: Color black.
	self borderWidth: 1.
	self borderColor: Color gray.
	self roundedCorners: 10.
]
