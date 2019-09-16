Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'notificador',
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

{ #category : #'as yet unclassified' }
Usuario >> agregarPalabraClave: palabra [
	notificador agregarPalabraClave: palabra.
]

{ #category : #initialization }
Usuario >> initialize [
	nombre := String new.
	notificador := Notificador new.
	notificaciones := ManejadorDeMensajes new.

]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre.

]

{ #category : #accessing }
Usuario >> nombre: unNombre [
	notificador nombreUsuario: unNombre.
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
	notificador pausarCanal: canalNombre.
]

{ #category : #'as yet unclassified' }
Usuario >> reanudarCanal: canalNombre [
	notificador reanudarCanal: canalNombre.
]

{ #category : #'input/output' }
Usuario >> recibeMensaje: mensaje [
	notificaciones agregar: (notificador analizaMensaje: mensaje).

]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensaje: mensaje delCanal: canalNombre [
	notificaciones agregar: (notificador analizaMensaje: mensaje delCanal: canalNombre).
	
]

{ #category : #private }
Usuario >> recibeMensajeComoNotificacion: mensaje [
	notificaciones agregar: mensaje.
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensajeDirecto: mensaje [
	self recibeMensajeComoNotificacion: mensaje.

]
