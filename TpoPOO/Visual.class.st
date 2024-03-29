Class {
	#name : #Visual,
	#superclass : #Object,
	#instVars : [
		'controlador',
		'ventana'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'instance creation' }
Visual class >> newVisual:controladorIn [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	|temp|
	temp := self new.
	temp incializar:controladorIn.
	^temp.
]

{ #category : #'as yet unclassified' }
Visual >> agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador agregarBibliotecaDeInteres:idBiblioteca usuario:dniUsuario.
]

{ #category : #'as yet unclassified' }
Visual >> agregarDependencias [

	|informacionBibloteca informacionUsuario colVisuales|
	informacionBibloteca := ventana getInterfaz:4.
	informacionUsuario := ventana getInterfaz:5.
	colVisuales := OrderedCollection new.
	colVisuales add: informacionBibloteca;add:informacionUsuario.
	controlador agregarDependencias: colVisuales.
	

	
]

{ #category : #'as yet unclassified' }
Visual >> agregarLibrosABiblioteca:colLibros idBiblioteca:idBiblioteca [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^controlador  agregarLibrosABiblioteca: colLibros idBiblioteca: idBiblioteca.
]

{ #category : #'as yet unclassified' }
Visual >> alternarModalidad:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador alternarModalidad:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Visual >> buscarLibro:nombreLibro biblotecaId:id [
^ controlador buscarLibro:nombreLibro biblotecaId:id.
]

{ #category : #'as yet unclassified' }
Visual >> buscarUsuario:dni contraseña:contraseña [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ controlador buscarUsuario:dni contraseña:contraseña.
]

{ #category : #'as yet unclassified' }
Visual >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := controlador crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn.
	^libro.
]

{ #category : #'as yet unclassified' }
Visual >> crearLibro:nombreIn editorial:editorialIn anioEdicion:anioEdicion  autores:autoresIn tipo:tipo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	|libro|
	libro := controlador crearLibro:nombreIn  editorial: editorialIn anioEdicion: anioEdicion autores: autoresIn tipo:tipo.
	^libro.
]

{ #category : #'as yet unclassified' }
Visual >> devolverBiblotecasInfo [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ controlador devolverBiblotecasInfo.
]

{ #category : #'as yet unclassified' }
Visual >> devolverPrestamo:idBiblioteca dniUsuario:dniUsuario [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador devolverPrestamo:idBiblioteca dniUsuario:dniUsuario.
]

{ #category : #'as yet unclassified' }
Visual >> incializar:controladorIn [.
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	controlador := controladorIn.
	ventana := Ventana crear:self.
	self agregarDependencias.
	ventana openInWorld.
	
]

{ #category : #'as yet unclassified' }
Visual >> infoBibloteca:id [

	^(controlador infoBibloteca:id).
]

{ #category : #'as yet unclassified' }
Visual >> nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ controlador nombre: unNombre direccion: unaDireccion  telefono: unTelefono representante: unRepresentante libros:colLibros.
]

{ #category : #'as yet unclassified' }
Visual >> registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca [
	^controlador registrarPrestamo:dniUsuario colLibros: colLibros idBibloteca: idBibloteca.
]

{ #category : #'as yet unclassified' }
Visual >> registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus [

	|registro|
	
	registro := controlador  registrarUsuario: unNombre apellido: unApellido dni: unDni contrasena: unaContrasena plus:unPlus.
	^registro
]

{ #category : #'as yet unclassified' }
Visual >> sacarLibro:idBiblioteca nombreLibro:nomLibro [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	^ controlador sacarLibro:idBiblioteca nombreLibro:nomLibro.
]
