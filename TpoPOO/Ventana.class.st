Class {
	#name : #Ventana,
	#superclass : #SystemWindow,
	#instVars : [
		'interfaz',
		'colInterfaces',
		'visual'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
Ventana class >> crear:visualIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	^self new iniciar:visualIn.
]

{ #category : #'as yet unclassified' }
Ventana >> agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario.
]

{ #category : #'as yet unclassified' }
Ventana >> agregarLibrosABiblioteca:colLibros idBiblioteca:idBiblioteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^visual agregarLibrosABiblioteca: colLibros idBiblioteca: idBiblioteca.
]

{ #category : #'as yet unclassified' }
Ventana >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual alternarModalidad:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Ventana >> buscarLibro:nombreLibro biblotecaId:id [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^visual buscarLibro:nombreLibro biblotecaId:id.
]

{ #category : #'as yet unclassified' }
Ventana >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ visual buscarUsuario:dni contraseña:contraseña.
	
]

{ #category : #'as yet unclassified' }
Ventana >> cambiarInterfaz:nombre [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	interfaz delete.
	self ponerInterfaz: nombre.
]

{ #category : #'as yet unclassified' }
Ventana >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := visual crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn.
	^libro.
]

{ #category : #'as yet unclassified' }
Ventana >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn tipo:tipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := visual crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn tipo:tipo.
	^libro.
]

{ #category : #'as yet unclassified' }
Ventana >> devolverBiblotecasInfo [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ visual devolverBiblotecasInfo.
]

{ #category : #'as yet unclassified' }
Ventana >> devolverPrestamo:idBiblioteca dniUsuario:dniUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual devolverPrestamo:idBiblioteca dniUsuario:dniUsuario.
]

{ #category : #'as yet unclassified' }
Ventana >> getInterfaz:ind [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^(colInterfaces at:ind)
]

{ #category : #'as yet unclassified' }
Ventana >> infoBibloteca:id [
	^(visual infoBibloteca:id).
]

{ #category : #'as yet unclassified' }
Ventana >> iniciar:visualIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	visual := visualIn.
	colInterfaces := OrderedCollection new.
	self iniciarInterfaces.
	self setLabel:'TPoPOO'.
	self extent: 480@854.
	self ponerInterfaz:'Menu'.
]

{ #category : #'as yet unclassified' }
Ventana >> iniciarInterfaces [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	colInterfaces add: (Menu crear:self). "1"
	colInterfaces add: (AgregarBibloteca crear:self)."2"
	colInterfaces add: (CambiarModalidad  crear:self)."3"
	colInterfaces add: (ActualizarBibloteca crear:self)."4"
	colInterfaces add: (InformacionBibloteca  crear:self)."5"
	colInterfaces add: (InformacionUsuario  crear:self)."6"
	colInterfaces add: (RegistrarUsuario  crear:self)."7"
	colInterfaces add: (SolicitarPrestamo crear:self)."8"
]

{ #category : #'window management' }
Ventana >> maximize [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^nil
]

{ #category : #'as yet unclassified' }
Ventana >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	"crea bibloteca"		
	^ visual nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros.
]

{ #category : #'as yet unclassified' }
Ventana >> ponerInterfaz:nombre [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	interfaz := colInterfaces detect:[:i |i comprobarNombre: nombre] .
	self addMorphCentered:interfaz.
	
]

{ #category : #'as yet unclassified' }
Ventana >> registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca [
	^visual registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca.
]

{ #category : #'as yet unclassified' }
Ventana >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [

	|registro|
	
	registro := visual registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
	^registro
]

{ #category : #'as yet unclassified' }
Ventana >> sacarLibro:idBiblioteca nombreLibro:nomLibro [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ visual sacarLibro:idBiblioteca nombreLibro:nomLibro.
]
