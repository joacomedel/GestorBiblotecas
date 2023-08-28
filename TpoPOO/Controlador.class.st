Class {
	#name : #Controlador,
	#superclass : #Object,
	#instVars : [
		'visual',
		'modelo'
	],
	#category : #'TpoPOO-Controlador'
}

{ #category : #'instance creation' }
Controlador class >> newControlador [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	|controlador visual modelo|
	controlador := self new.
	modelo := Modelo newModelo:controlador.
	controlador inicializarModelo:modelo.
	visual := Visual newVisual:controlador.
	controlador inicializarVisual:visual.
	
]

{ #category : #'as yet unclassified' }
Controlador >> agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	modelo agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario.
]

{ #category : #'as yet unclassified' }
Controlador >> agregarDependencias:colVisuales [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	modelo agregarDependencias:colVisuales.
]

{ #category : #'as yet unclassified' }
Controlador >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	modelo alternarModalidad:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Controlador >> buscarLibro:nombreLibro biblotecaId:id [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ modelo buscarLibro:nombreLibro biblotecaId:id.
]

{ #category : #'as yet unclassified' }
Controlador >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ modelo buscarUsuario:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Controlador >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := modelo crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn.
	^libro.
]

{ #category : #'as yet unclassified' }
Controlador >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn tipo:tipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := modelo crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn tipo:tipo.
	^libro.
]

{ #category : #'as yet unclassified' }
Controlador >> devolverBiblotecasInfo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ modelo devolverBiblotecasInfo.
]

{ #category : #'as yet unclassified' }
Controlador >> infoBibloteca:id [

	^(modelo infoBibloteca:id).
]

{ #category : #'as yet unclassified' }
Controlador >> inicializarModelo:modeloIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	modelo := modeloIn.
]

{ #category : #'as yet unclassified' }
Controlador >> inicializarVisual:visualIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual := visualIn.
]

{ #category : #'as yet unclassified' }
Controlador >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ modelo nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros.
]

{ #category : #'as yet unclassified' }
Controlador >> registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca [
	^modelo registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca.
]

{ #category : #'as yet unclassified' }
Controlador >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [

	|registro|
	
	registro := modelo registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
	^registro
]
