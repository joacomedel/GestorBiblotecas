Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'editorial',
		'anioEdicion',
		'autores'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro class >> crear: unTitulo editorial: unaEditorial anio: unAnio colAutores:colAutores [ 
    ^ self new inicializarTitulo: unTitulo editorial: unaEditorial anio: unAnio colAutores:colAutores.
]

{ #category : #'as yet unclassified' }
Libro >> getInfo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			|autoresString|
	autoresString := ''.
	autores do: [:autor | autoresString := autoresString , ' , ' , (autor getNombre)].
	^  'titulo:' , titulo asString ,' año:' , (anioEdicion) asString ,' editorial:' , editorial asString,' autores' , autoresString.
]

{ #category : #'as yet unclassified' }
Libro >> getNombre [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^titulo clone.
]

{ #category : #'as yet unclassified' }
Libro >> getTipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| temporary variable names |
	^'libro'
]

{ #category : #'as yet unclassified' }
Libro >> getTitulo [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^titulo clone
]

{ #category : #'as yet unclassified' }
Libro >> inicializarTitulo: unTitulo editorial: unaEditorial anio: unAnio colAutores:colAutores [.
    titulo := unTitulo.
    editorial := unaEditorial.
    anioEdicion := unAnio.
    autores := OrderedCollection new.
	colAutores do: [:nombreAutor |autores add: (Autor crear: nombreAutor)]
]

{ #category : #'as yet unclassified' }
Libro >> verificarNombre:libroNombre [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	Transcript show: libroNombre.
	Transcript show: ' ;entro libro; '.
	Transcript show: titulo.
	^ libroNombre = titulo.
]
