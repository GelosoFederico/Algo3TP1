Class {
	#name : #AlgoChat,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'canales',
		'conversaciones'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
AlgoChat >> agregarCanalConNombre: nombreCanal [
	canales at: nombreCanal put: (Canal conNombre: nombreCanal).
]

{ #category : #'as yet unclassified' }
AlgoChat >> agregarPalabraClave: palabraClave alUsuario: usuarioNombre [
	(usuarios conNombre: usuarioNombre) agregarPalabraClave: palabraClave. 
]

{ #category : #'as yet unclassified' }
AlgoChat >> agregarUsuario: nombreUsuario alCanal: nombreCanal [
	(canales at: nombreCanal) agregarUsuario: (usuarios conNombre: nombreUsuario).
]

{ #category : #'as yet unclassified' }
AlgoChat >> agregarUsuarioConNombre: nombre [
	usuarios agregarUsuarioConNombre: nombre.

]

{ #category : #'as yet unclassified' }
AlgoChat >> crearConversacionConUsuarios: cadenaConUsuarios [
	| conversacion subconjuntoUsuarios|
	subconjuntoUsuarios := usuarios obtenerSubconjuntoDeUsuarios: cadenaConUsuarios.
	conversacion := Conversacion conConjuntoDeUsuarios: subconjuntoUsuarios .
	conversaciones at: cadenaConUsuarios put: conversacion.
	
]

{ #category : #'as yet unclassified' }
AlgoChat >> enviarMensaje: mensaje aUsuario: usuarioDestino [
	(usuarios conNombre: usuarioDestino) recibeMensajeDirecto: mensaje.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getCantidadCanales [ 
	^ canales size.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getCantidadUsuarios [
	^ usuarios cantidadUsuarios.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getMensajesDeConversacion: conversacionNombre [
	^ (conversaciones  at: conversacionNombre) mensajes.
]

{ #category : #'as yet unclassified' }
AlgoChat >> getNotificacionesDeUsuario: nombreUsuario [
	^ usuarios notificacionesDeUsuario: nombreUsuario.

]

{ #category : #'as yet unclassified' }
AlgoChat >> getNotificacionesDeUsuario: nombreUsuario resumidasALongitud: long [
	^ usuarios notificacionesDeUsuario: nombreUsuario resumidasALongitud: long.

]

{ #category : #initialization }
AlgoChat >> initialize [
	usuarios := ConjuntoDeUsuarios new.
	canales := Dictionary new.
	conversaciones := Dictionary new.
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
AlgoChat >> pausarPalabrasDeCanal: nombreCanal paraUsuario: nombreUsuario [
	(usuarios conNombre: nombreUsuario) pausarCanal: nombreCanal.
]

{ #category : #'as yet unclassified' }
AlgoChat >> publicarMensaje: mensaje enCanal: canalDestino [
	(canales at: canalDestino) recibeMensaje: mensaje.
]

{ #category : #'as yet unclassified' }
AlgoChat >> publicarMensaje: mensaje enConversacion: conversacionDestino [
	(conversaciones at: conversacionDestino) recibeMensaje: mensaje.
]

{ #category : #'as yet unclassified' }
AlgoChat >> reanudarPalabrasDeCanal: nombreCanal paraUsuario: nombreUsuario. [
	(usuarios conNombre: nombreUsuario) reanudarCanal: nombreCanal.	
]

{ #category : #'as yet unclassified' }
AlgoChat >> usuariosEnCanal: nombreCanal [
	^ (canales at: nombreCanal) nombresUsuarios.
]

{ #category : #'as yet unclassified' }
AlgoChat >> usuariosEnConversacion: nombreConversacion [
	^ (conversaciones at: nombreConversacion) nombresUsuarios.
]
