Class {
	#name : #AlgoChatTestUnit,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
AlgoChatTestUnit >> test00CreoAlgoChatYNoTieneUsuariosNiCanales [
	"Arrange"
	| algoChat |
	"Act"
	algoChat := AlgoChat new.
	"Assert"
	self assert: algoChat getCantidadUsuarios equals: 0.
	self assert: algoChat getCantidadCanales equals: 0.

]

{ #category : #tests }
AlgoChatTestUnit >> test01CreoAlgoChatAgrego2UsuariosYTieneUsuarios2 [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	"Act"
	algoChat agregarUsuarioConNombre: 'Carlos'.
	algoChat agregarUsuarioConNombre: 'Juan'.
	"Assert"
	self assert: algoChat getCantidadUsuarios equals: 2.

]

{ #category : #tests }
AlgoChatTestUnit >> test02CreoAlgoChatAgrego2CanalesYTieneCanales2 [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	"Act"
	algoChat agregarCanalConNombre: 'General'.
	algoChat agregarCanalConNombre: 'Anuncios'.
	"Assert"
	self assert: algoChat getCantidadCanales equals: 2.

]

{ #category : #tests }
AlgoChatTestUnit >> test03MandoMensajeAUnUsuarioYLoMuestracomoNotificacion [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	"Act"
	algoChat enviarMensaje: 'Hola che' aUsuario: 'Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Carlos') equals: 'Hola che'.

]

{ #category : #tests }
AlgoChatTestUnit >> test04MandoDosMensajeAUnUsuarioYLosMuestracomoNotificaciones [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	"Act"
	algoChat enviarMensaje: 'Hola che' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Todo bien?' aUsuario: 'Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Carlos') equals: 'Hola che | Todo bien?'.

]

{ #category : #tests }
AlgoChatTestUnit >> test05MandoTresMensajesAUnUsuarioYLosMuestracomoNotificacionesResumidasAUnaLongitud [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	"Act"
	algoChat enviarMensaje: 'Hola che' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Todo bien?' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Bue' aUsuario: 'Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Carlos' resumidasALongitud: 4) equals: 'Hola... | Todo... | Bue'.

]

{ #category : #tests }
AlgoChatTestUnit >> test06MandoDosMensajeAUnUsuarioConElNombreIncorrectoYNoLosGuarda [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	algoChat agregarUsuarioConNombre: 'Juan'.
	"Act"
	algoChat enviarMensaje: 'Hola che' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Todo bien?' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Bue' aUsuario: 'Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Juan' ) equals: ''.

]

{ #category : #tests }
AlgoChatTestUnit >> test07MandoUnMensajeAUnUsuarioQueNoExisteYSaleUnaExcepcion [
	"Arrange"
	| algoChat salida|
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	"Act"
	algoChat enviarMensaje: 'Hola che' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Todo bien?' aUsuario: 'Carlos'.
	[algoChat getNotificacionesDeUsuario: 'Juan'] on: KeyNotFound do: [ salida := true].
	"Assert"
	self assert: salida.

]

{ #category : #tests }
AlgoChatTestUnit >> test08MandoUnMensajeAUnCanalYQuedaGuardado [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarCanalConNombre: 'anuncios'.
	"Act"
	algoChat publicarMensaje: 'Hola todo el mundo' enCanal: 'anuncios'.
	"Assert"	
	self assert: (algoChat mensajesDelCanal: 'anuncios') equals: 'Hola todo el mundo'.
	
]

{ #category : #tests }
AlgoChatTestUnit >> test09MandoDosMensajesAUnCanalYLosMuestraResumidosAUnaLongitud [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarCanalConNombre: 'anuncios'.
	"Act"
	algoChat publicarMensaje: 'Hola todo el mundo' enCanal: 'anuncios'.
	algoChat publicarMensaje: 'Hola doctor Nick' enCanal: 'anuncios'.
	"Assert"	
	self assert: (algoChat mensajesDelCanal: 'anuncios' resumidosALongitud: 17) equals: 'Hola todo el mund... | Hola doctor Nick'.
	
]

{ #category : #tests }
AlgoChatTestUnit >> test10MandoUnMensajeAUnCanalQueNoExisteYLevantaExcepcion [
	"Arrange"
	| algoChat salida|
	algoChat := AlgoChat new.
	algoChat agregarCanalConNombre: 'anuncios'.
	"Act"
	[algoChat mensajesDelCanal: 'general'] on: KeyNotFound do: [ salida := true].
	"Assert"
	self assert: salida.

]

{ #category : #tests }
AlgoChatTestUnit >> test11AgregoUsuariosAlCanalYEstan [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Juan'.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	algoChat agregarCanalConNombre: 'anuncios'.
	"Act"
	algoChat agregarUsuario: 'Juan' alCanal: 'anuncios'.
	algoChat agregarUsuario: 'Carlos' alCanal: 'anuncios'.
	"Assert"
	self assert: (algoChat usuariosEnCanal: 'anuncios') equals: 'Juan,Carlos'.


]

{ #category : #tests }
AlgoChatTestUnit >> test12CreoConversacionConUsuariosYEstan [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Juan'.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	"Act"
	algoChat crearConversacionConUsuarios: 'Juan,Carlos'.
	"Assert"
	self assert: (algoChat usuariosEnConversacion: 'Juan,Carlos') equals: 'Juan,Carlos'.
	
	

]

{ #category : #tests }
AlgoChatTestUnit >> test13CreoConversacionConUsuariosMandoMensajeYLoRecibenComoNotificacion [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Juan'.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	algoChat agregarUsuarioConNombre: 'Maria'.
	"Act"
	algoChat crearConversacionConUsuarios: 'Juan,Carlos'.
	algoChat publicarMensaje: 'hola' enConversacion: 'Juan,Carlos'.
	algoChat publicarMensaje: 'todo bien?' enConversacion: 'Juan,Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Juan') equals: 'hola | todo bien?'.
	self assert: (algoChat getNotificacionesDeUsuario: 'Carlos') equals: 'hola | todo bien?'.	
]

{ #category : #tests }
AlgoChatTestUnit >> test14CreoConversacionConUsuariosMandoMensajeYElUsuarioQueNoEstaNoLoRecibe [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Juan'.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	algoChat agregarUsuarioConNombre: 'Maria'.
	"Act"
	algoChat crearConversacionConUsuarios: 'Juan,Carlos'.
	algoChat publicarMensaje: 'hola' enConversacion: 'Juan,Carlos'.
	algoChat publicarMensaje: 'todo bien?' enConversacion: 'Juan,Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Maria') equals: ''.

]
