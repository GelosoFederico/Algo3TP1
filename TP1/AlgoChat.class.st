Class {
	#name : #AlgoChat,
	#superclass : #Object,
	#instVars : [
		'usuarios'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
AlgoChat >> agregarUsuarioConNombre: nombre [
	usuarios add: (Usuario conNombre: nombre).
]

{ #category : #'as yet unclassified' }
AlgoChat >> enviarMensaje: mensaje aUsuario: usuarioDestino [
	usuarios do: [ :usuario|
		usuario recibeMensaje: mensaje para: usuarioDestino ].
]

{ #category : #'as yet unclassified' }
AlgoChat >> getCantidadCanales [ 
	^ 0.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getCantidadUsuarios [
	^ 0.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getNotificacionesDeUsuario: nombreUsuario [
	|salida|
	salida := usuarios collect: [ :usuario|
		usuario notificacionesDeUsuario: nombreUsuario  ].
	^ salida joinUsing: ' | '.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getNotificacionesDeUsuario: nombreUsuario resumidasALongitud: long [
	|salida|
	salida := usuarios collect: [ :usuario|
		usuario notificacionesDeUsuario: nombreUsuario  ].
	^ salida joinUsing: ' | '.
]

{ #category : #initialization }
AlgoChat >> initialize [
	usuarios := OrderedCollection new.
]
