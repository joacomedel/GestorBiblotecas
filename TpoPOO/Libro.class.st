Class {
	#name : #Libro,
	#superclass : #Object,
	#instVars : [
		'titulo',
		'editorial',
		'anioAutores',
		'autores'
	],
	#category : #'TpoPOO-Modelo'
}

{ #category : #'as yet unclassified' }
Libro class >> nuevoTitulo: unTitulo editorial: unaEditorial anio: unAnio [
    ^ self new inicializarTitulo: unTitulo editorial: unaEditorial anio: unAnio
]

{ #category : #'as yet unclassified' }
Libro >> inicializarTitulo: unTitulo editorial: unaEditorial anio: unAnio [
    titulo := unTitulo.
    editorial := unaEditorial.
    anioAutores := unAnio.
    autores := OrderedCollection new.
]
