Class {
	#name : #Mensaje,
	#superclass : #Object,
	#instVars : [
		'mensaje',
		'canal'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
Mensaje class >> con: mensajeAGuardar [
	^ (Mensaje new) mensaje: mensajeAGuardar.
]

{ #category : #'as yet unclassified' }
Mensaje class >> con: mensajeAGuardar delCanal: canalProveedor [
	| elMensaje |
	elMensaje := Mensaje new.
	elMensaje mensaje: mensajeAGuardar.
	elMensaje canal: canalProveedor.
	^ elMensaje.
]

{ #category : #accessing }
Mensaje >> canal [
	^ canal.
]

{ #category : #accessing }
Mensaje >> canal: elCanal [
	canal := elCanal.
]

{ #category : #accessing }
Mensaje >> mensaje [
	^ mensaje.
]

{ #category : #accessing }
Mensaje >> mensaje: elMensaje [
	mensaje := elMensaje.
]
