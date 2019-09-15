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
	notificaciones := ManejadorDeMensajes new.
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
	^ notificaciones comoCadenaConcatenada.
]

{ #category : #'as yet unclassified' }
Usuario >> notificacionesResumidasALongitud: cantidadCaracteres [
	^ notificaciones comoCadenaConcatenadaResumidaALongitud: cantidadCaracteres.
]

{ #category : #'input/output' }
Usuario >> recibeMensaje: mensaje [
	( (mensaje findString: ('@',self nombre)) > 0) ifTrue: [ 
		self recibeMensajeComoNotificacion: mensaje ].
]

{ #category : #private }
Usuario >> recibeMensajeComoNotificacion: mensaje [
	notificaciones agregar: mensaje.
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensajeDirecto: mensaje [
	self recibeMensajeComoNotificacion: mensaje.

]
