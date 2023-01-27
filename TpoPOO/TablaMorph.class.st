Class {
	#name : #TablaMorph,
	#superclass : #Object,
	#instVars : [
		'plugMorph',
		'colMorph'
	],
	#category : #'TpoPOO-Visual'
}

{ #category : #'as yet unclassified' }
TablaMorph class >> crear:datos [
	"comment stating purpose of class-side method"
	"scope: class-variables  &  class-instance-variables"	
			
	 ^self new inciar:datos
]

{ #category : #'as yet unclassified' }
TablaMorph >> inciar:datosIn [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	plugMorph := PluggableListMorph new.
	plugMorph extent:100@100.
	colMorph  := OrderedCollection new.
	datosIn do:[:dato | colMorph add: dato asTextMorph].
	plugMorph addAll:colMorph.
	plugMorph list:datosIn.
	
	
]
