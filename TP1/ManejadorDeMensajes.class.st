Class {
	#name : #ManejadorDeMensajes,
	#superclass : #Object,
	#instVars : [
		'mensajes'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
ManejadorDeMensajes class >> con: coleccionDeMensajes [
	^ (ManejadorDeMensajes new) coleccionDeMensajes: coleccionDeMensajes.
	
]

{ #category : #'as yet unclassified' }
ManejadorDeMensajes class >> conUsuarios: conjuntoUsuarios [
	^ (ManejadorDeMensajes new) coleccionDeMensajes:  ( conjuntoUsuarios collect: [ :usuario | 
		usuario nombre. 
	])
]

{ #category : #adding }
ManejadorDeMensajes >> agregar: mensaje [
	mensajes add: mensaje.
]

{ #category : #'private ' }
ManejadorDeMensajes >> coleccionDeMensajes: coleccionDeMensajes [
	mensajes := coleccionDeMensajes.
]

{ #category : #'as yet unclassified' }
ManejadorDeMensajes >> comoCadenaConcatenada [
	^ mensajes joinUsing: ' | '.
]

{ #category : #'as yet unclassified' }
ManejadorDeMensajes >> comoCadenaConcatenadaCon: separador [
	^ mensajes joinUsing: separador.
]

{ #category : #'as yet unclassified' }
ManejadorDeMensajes >> comoCadenaConcatenadaResumidaALongitud: longitud [
	| mensajesCopia |
	mensajesCopia := mensajes collect: [  :mensaje|
		(mensaje size > longitud) 
		ifTrue: [ 
			(mensaje truncateTo: longitud) , '...'.
			 ]
		ifFalse: [ 
			mensaje.
			 ].
	].
	^ (ManejadorDeMensajes con: mensajesCopia) comoCadenaConcatenada.
	
]

{ #category : #initialization }
ManejadorDeMensajes >> initialize [ 
	mensajes := OrderedCollection new.
]
