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
	visual := Visual newVisual:controlador.
	modelo := Modelo newModelo:controlador.
	controlador incializarVisual:visual modelo:modelo.
	
]

{ #category : #'as yet unclassified' }
Controlador >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	modelo alternarModalidad:dni contraseña:contraseña.
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
Controlador >> incializarVisual:visualIn modelo:modeloIn [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual := visualIn.
	modelo := modeloIn.
]

{ #category : #'as yet unclassified' }
Controlador >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ modelo nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros.
]

{ #category : #'as yet unclassified' }
Controlador >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [

	|registro|
	
	registro := modelo registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
	^registro
]
