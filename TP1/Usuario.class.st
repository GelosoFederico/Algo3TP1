Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'notificaciones',
		'palabrasClave',
		'canalesPausados'
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

{ #category : #'as yet unclassified' }
Usuario >> agregarPalabraClave: palabra [
	palabrasClave add: palabra.
]

{ #category : #initialization }
Usuario >> initialize [
	nombre := String new.
	notificaciones := ManejadorDeMensajes new.
	palabrasClave := OrderedCollection new.
	canalesPausados := OrderedCollection new.
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre.

]

{ #category : #accessing }
Usuario >> nombre: unNombre [
	palabrasClave add: ('@',unNombre).
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

{ #category : #'as yet unclassified' }
Usuario >> pausarCanal: canalNombre [
	canalesPausados add: canalNombre.
]

{ #category : #'input/output' }
Usuario >> recibeMensaje: mensaje [
	( (mensaje findAnySubstring: palabrasClave startingAt: 1) < (mensaje size)) ifTrue: [ 
		self recibeMensajeComoNotificacion: mensaje ].
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensaje: mensaje delCanal: canalNombre [
	( (mensaje findAnySubstring: palabrasClave startingAt: 1) < (mensaje size)) ifTrue: [ 
		(canalNombre findAnySubstring: canalesPausados startingAt: 1) >= (canalNombre size) ifTrue: [ 
			self recibeMensajeComoNotificacion: mensaje 	 ]
		].
]

{ #category : #private }
Usuario >> recibeMensajeComoNotificacion: mensaje [
	notificaciones agregar: mensaje.
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensajeDirecto: mensaje [
	self recibeMensajeComoNotificacion: mensaje.

]
