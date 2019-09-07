Class {
	#name : #AlgoChatTest,
	#superclass : #TestCase,
	#category : #'AlgoChat-Tests'
}

{ #category : #tests }
AlgoChatTest >> test00AlgoChatVacioNoTieneUsuariosNiCanales [
	| algoChat |
	algoChat := AlgoChat new.
	self assert: algoChat getCantidadUsuarios equals: 0.
	self assert: algoChat getCantidadCanales equals: 0.

]

{ #category : #tests }
AlgoChatTest >> test01UsuarioNuevoRecibeMensajesComoNotificaciones [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.
	algoChat agregarUsuarioConNombre: 'pedro'.
	
	algoChat enviarMensaje: 'hola juan' aUsuario: 'juan'.
	algoChat enviarMensaje: 'como va' aUsuario: 'juan'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: 'hola juan | como va'.
	self assert: (algoChat getNotificacionesDeUsuario: 'juan' resumidasALongitud: 4) equals: 'hola... | como...'.
	self assert: (algoChat getNotificacionesDeUsuario: 'pedro') equals: ''.

]

{ #category : #tests }
AlgoChatTest >> test02EnviarMensajesACanalGuardaLosMensajes [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarCanalConNombre: 'anuncios'.
	algoChat agregarCanalConNombre: 'consultas'.

	algoChat publicarMensaje: 'tp0 publicado' enCanal: 'anuncios'.
	algoChat publicarMensaje: 'fecha limite 30/8' enCanal: 'anuncios'.
	algoChat publicarMensaje: 'se entrega por campus' enCanal: 'anuncios'.
	
	self assert: (algoChat mensajesDelCanal: 'anuncios') equals: 'tp0 publicado | fecha limite 30/8 | se entrega por campus'.
	self assert: (algoChat mensajesDelCanal: 'anuncios' resumidosALongitud: 3) equals: 'tp0... | fec... | se ...'.
	self assert: (algoChat mensajesDelCanal: 'anuncios' resumidosALongitud: 2) equals: 'tp... | fe... | se...'.
	self assert: (algoChat mensajesDelCanal: 'consultas') equals: ''.
	
]

{ #category : #tests }
AlgoChatTest >> test03UsuarioAgregadoACanalNoRecibeNotificaciones [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.
	algoChat agregarCanalConNombre: 'anuncios'.
	
	algoChat agregarUsuario: 'juan' alCanal: 'anuncios'.

	algoChat publicarMensaje: 'clase de hoy suspendida' enCanal: 'anuncios'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: ''.

]

{ #category : #tests }
AlgoChatTest >> test04UsuarioAgregadoAConversacionRecibeNotificaciones [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.
	algoChat agregarUsuarioConNombre: 'maria'.
	algoChat agregarUsuarioConNombre: 'jose'.

	algoChat crearConversacionConUsuarios: 'juan,maria,jose'.
	
	algoChat publicarMensaje: 'hola' enConversacion: 'juan,maria,jose'.
	algoChat publicarMensaje: 'como va' enConversacion: 'juan,maria,jose'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: 'hola | como va'.
	self assert: (algoChat getNotificacionesDeUsuario: 'maria') equals: 'hola | como va'.
	self assert: (algoChat getNotificacionesDeUsuario: 'jose') equals: 'hola | como va'.

	self assert: (algoChat getMensajesDeConversacion: 'juan,maria,jose') equals: 'hola | como va'.

]

{ #category : #tests }
AlgoChatTest >> test05UsuarioEnCanalRecibeNotificacionesCuandoMencionanSuNombre [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.
	algoChat agregarUsuarioConNombre: 'maria'.
	algoChat agregarUsuarioConNombre: 'jose'.

	algoChat agregarCanalConNombre: 'anuncios'.
	algoChat agregarCanalConNombre: 'consultas'.
	
	algoChat agregarUsuario: 'juan' alCanal: 'anuncios'.
	algoChat agregarUsuario: 'maria' alCanal: 'anuncios'.
	algoChat agregarUsuario: 'jose' alCanal: 'anuncios'.

	algoChat publicarMensaje: 'por favor @maria y @juan venir a clase hoy' enCanal: 'anuncios'.
	algoChat publicarMensaje: 'hoy no hace falta que venga @pedro a clase' enCanal: 'anuncios'.
	algoChat publicarMensaje: '@juan traer la libreta' enCanal: 'anuncios'.
	algoChat publicarMensaje: '@juan como estas?' enCanal: 'consultas'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: 'por favor @maria y @juan venir a clase hoy | @juan traer la libreta'.
	self assert: (algoChat getNotificacionesDeUsuario: 'maria') equals: 'por favor @maria y @juan venir a clase hoy'.
	self assert: (algoChat getNotificacionesDeUsuario: 'jose') equals: ''.

]

{ #category : #tests }
AlgoChatTest >> test06UsuarioPuedeElegirPalabrasParaSerNotificado [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.
	algoChat agregarUsuarioConNombre: 'maria'.

	algoChat agregarCanalConNombre: 'anuncios'.
	algoChat agregarCanalConNombre: 'consultas'.
	
	algoChat agregarUsuario: 'juan' alCanal: 'anuncios'.
	algoChat agregarUsuario: 'juan' alCanal: 'consultas'.
	algoChat agregarUsuario: 'maria' alCanal: 'anuncios'.
	
	algoChat agregarPalabraClave: 'clase' alUsuario: 'juan'.
	algoChat agregarPalabraClave: 'parcial' alUsuario: 'juan'.
	algoChat agregarPalabraClave: 'libreta' alUsuario: 'maria'.

	algoChat publicarMensaje: '@maria y @juan venir a clase hoy' enCanal: 'anuncios'.
	algoChat publicarMensaje: '@pedro aprobo el parcial' enCanal: 'anuncios'.
	algoChat publicarMensaje: '@pedro traer libreta' enCanal: 'anuncios'.
	algoChat publicarMensaje: 'cartuchera olvidada en la clase' enCanal: 'consultas'.
	algoChat publicarMensaje: 'libreta perdida' enCanal: 'consultas'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: '@maria y @juan venir a clase hoy | @pedro aprobo el parcial | cartuchera olvidada en la clase'.
	self assert: (algoChat getNotificacionesDeUsuario: 'maria') equals: '@maria y @juan venir a clase hoy | @pedro traer libreta'.

]

{ #category : #tests }
AlgoChatTest >> test07UsuarioPuedePausarNotificacionesDePalabrasDeUnCanal [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.
	algoChat agregarUsuarioConNombre: 'maria'.

	algoChat agregarCanalConNombre: 'anuncios'.
	
	algoChat agregarUsuario: 'juan' alCanal: 'anuncios'.
	algoChat agregarUsuario: 'maria' alCanal: 'anuncios'.
	
	algoChat agregarPalabraClave: 'clase' alUsuario: 'juan'.
	algoChat agregarPalabraClave: 'clase' alUsuario: 'maria'.

	algoChat publicarMensaje: '@maria y @juan venir a clase hoy' enCanal: 'anuncios'.
	
	algoChat pausarPalabrasDeCanal: 'anuncios' paraUsuario: 'juan'.
	
	algoChat publicarMensaje: 'cartuchera olvidada en la clase' enCanal: 'anuncios'.
	algoChat publicarMensaje: '@juan traer libreta' enCanal: 'anuncios'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: '@maria y @juan venir a clase hoy | @juan traer libreta'.
	self assert: (algoChat getNotificacionesDeUsuario: 'maria') equals: '@maria y @juan venir a clase hoy | cartuchera olvidada en la clase'.

]

{ #category : #tests }
AlgoChatTest >> test08UsuarioPuedeReanudarNotificacionesDePalabrasDeUnCanal [
	| algoChat |
	algoChat := AlgoChat new.

	algoChat agregarUsuarioConNombre: 'juan'.

	algoChat agregarCanalConNombre: 'anuncios'.
	
	algoChat agregarUsuario: 'juan' alCanal: 'anuncios'.
	
	algoChat agregarPalabraClave: 'clase' alUsuario: 'juan'.

	algoChat publicarMensaje: '@maria y @juan venir a clase hoy' enCanal: 'anuncios'.
	
	algoChat pausarPalabrasDeCanal: 'anuncios' paraUsuario: 'juan'.
	
	algoChat publicarMensaje: 'cartuchera olvidada en la clase' enCanal: 'anuncios'.

	algoChat reanudarPalabrasDeCanal: 'anuncios' paraUsuario: 'juan'.

	algoChat publicarMensaje: 'libreta olvidada en la clase' enCanal: 'anuncios'.
	
	self assert: (algoChat getNotificacionesDeUsuario: 'juan') equals: '@maria y @juan venir a clase hoy | libreta olvidada en la clase'.

]
