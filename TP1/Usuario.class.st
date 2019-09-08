Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'notificaciones'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
Usuario class >> conNombre: nombre [
	| usuario |
	usuario := Usuario new.
	usuario nombre: nombre.
	^ usuario.
]

{ #category : #initialization }
Usuario >> initialize [
	nombre := String new.
	notificaciones := OrderedCollection new.
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre.

]

{ #category : #accessing }
Usuario >> nombre: unNombre [
	nombre := unNombre.
]

{ #category : #'as yet unclassified' }
Usuario >> notificaciones [
	^ notificaciones joinUsing: ' | '.
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensaje: mensaje [
	( (mensaje findString: ('@',self nombre)) > 0) ifTrue: [ 
		self recibeMensajeComoNotificacion: mensaje ].
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensaje: mensaje para: nombreUsuario [
	(nombre sameAs: nombreUsuario) ifTrue: [ 
		self recibeMensajeComoNotificacion: mensaje 
	]. 
]

{ #category : #private }
Usuario >> recibeMensajeComoNotificacion: mensaje [
	notificaciones add: mensaje.
]
