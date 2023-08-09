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
Libro class >> crear: unTitulo editorial: unaEditorial anio: unAnio colAutores:colAutores [.
    ^ self new inicializarTitulo: unTitulo editorial: unaEditorial anio: unAnio colAutores:colAutores.
]

{ #category : #'as yet unclassified' }
Libro >> inicializarTitulo: unTitulo editorial: unaEditorial anio: unAnio colAutores:colAutores [.
    titulo := unTitulo.
    editorial := unaEditorial.
    anioEdicion := unAnio.
    autores := OrderedCollection new.
	colAutores do: [:nombreAutor |autores add: (Autor crear: nombreAutor)]
]
