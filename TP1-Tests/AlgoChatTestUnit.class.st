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
	| algoChat |
	algoChat := AlgoChat new.
	algoChat agregarUsuarioConNombre: 'Carlos'.
	"Act"
	algoChat enviarMensaje: 'Hola che' aUsuario: 'Carlos'.
	algoChat enviarMensaje: 'Todo bien?' aUsuario: 'Carlos'.
	"Assert"
	self assert: (algoChat getNotificacionesDeUsuario: 'Juan' ) equals: ''.

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
	self assert: (algoChat mensajesDelCanal: 'anuncios' resumidosALongitud: 17) equals: 'Hola todo el mun... | Hola doctor Nick'.
	
]
