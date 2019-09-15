Class {
	#name : #AlgoChat,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'canales'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
AlgoChat >> agregarCanalConNombre: nombreCanal [
	canales at: nombreCanal put: (Canal conNombre: nombreCanal).
]

{ #category : #'as yet unclassified' }
AlgoChat >> agregarUsuario: nombreUsuario alCanal: nombreCanal [
	(canales at: nombreCanal) agregarUsuario: (usuarios at: nombreUsuario).
]

{ #category : #'as yet unclassified' }
AlgoChat >> agregarUsuarioConNombre: nombre [
	usuarios at: nombre put: (Usuario conNombre: nombre).
]

{ #category : #'as yet unclassified' }
AlgoChat >> enviarMensaje: mensaje aUsuario: usuarioDestino [
	(usuarios at: usuarioDestino) recibeMensajeDirecto: mensaje.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getCantidadCanales [ 
	^ canales size.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getCantidadUsuarios [
	^ usuarios size.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getNotificacionesDeUsuario: nombreUsuario [
	^ (usuarios at: nombreUsuario) notificaciones.

]

{ #category : #'as yet unclassified' }
AlgoChat >> getNotificacionesDeUsuario: nombreUsuario resumidasALongitud: long [
	^ (usuarios at: nombreUsuario) notificacionesResumidasALongitud: long.

]

{ #category : #initialization }
AlgoChat >> initialize [
	usuarios := Dictionary new.
	canales := Dictionary new.
]

{ #category : #'as yet unclassified' }
AlgoChat >> mensajesDelCanal: canalNombre [
	^ (canales at: canalNombre) mensajes.
]

{ #category : #'as yet unclassified' }
AlgoChat >> mensajesDelCanal: canalNombre resumidosALongitud: longitud [
	^ (canales at: canalNombre) mensajesResumidosALongitud: longitud.
]

{ #category : #'as yet unclassified' }
AlgoChat >> publicarMensaje: mensaje enCanal: canalDestino [
	(canales at: canalDestino) recibeMensaje: mensaje.
]

{ #category : #'as yet unclassified' }
AlgoChat >> usuariosEnCanal: nombreCanal [
	^ (canales at: nombreCanal) nombresUsuarios.
]
