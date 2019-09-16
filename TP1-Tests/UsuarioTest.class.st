Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'listaUsuarios'
	],
	#category : #'TP1-Tests'
}

{ #category : #tests }
UsuarioTest >> test00CreoUsuarioSinNombreYNoTieneNombre [
	"Arrange"
	| usuario nombre|
	usuario := Usuario new.
	
	"Act"
	nombre := usuario nombre.
	
	"Assert"
	self assert: nombre isEmpty.
]

{ #category : #tests }
UsuarioTest >> test01CreoUsuarioConNombreYTieneEseNombre [
	"Arrange"
	| usuario nombre|
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	nombre := usuario nombre.
	
	"Assert"
	self assert: nombre equals: 'Carlos'.
]

{ #category : #tests }
UsuarioTest >> test02CreoUsuarioYNoTieneNotificaciones [
	"Arrange"
	| usuario |
	
	"Act"
	usuario := Usuario new.
	
	"Assert"
	self assert: usuario notificaciones equals: ''.
]

{ #category : #tests }
UsuarioTest >> test03MandoMensajeAUsuarioYNoLoRecibeComoNotificacion [
	"Arrange"
	| usuario |
	usuario := Usuario new.
	
	"Act"
	usuario recibeMensaje: 'hola'.
	
	"Assert"
	self assert: usuario notificaciones equals: ''.
]

{ #category : #tests }
UsuarioTest >> test06Mando2MensajesAlUsuarioYLosGuardaYMuestraBien [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensajeComoNotificacion: 'Hola che'.
	usuario recibeMensajeComoNotificacion: 'Como va?'.
	
	"Assert"
	self assert: (usuario notificaciones) equals: 'Hola che | Como va?'.
]

{ #category : #tests }
UsuarioTest >> test07UsuarioRecibeMensajeConSuNombreArrobadoYLoRecibeComoNotificacion [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensaje: 'Hola @Carlos'.
	
	"Assert"
	self assert: usuario notificaciones equals: 'Hola @Carlos'.
]

{ #category : #tests }
UsuarioTest >> test08UsuarioRecibeMensajeConSuNombreArrobadoSinMayusculaYNoApareceComoNotificacion [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensaje: 'Hola @carlos'.
	
	"Assert"
	self assert: usuario notificaciones equals: ''.

]

{ #category : #tests }
UsuarioTest >> test11UsuarioRecibeMensajeDeMasDe4CaracteresYLoMuestraAcortadoA4 [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensajeComoNotificacion: 'Hola como va?'.
	
	"Assert"
	self assert: (usuario notificacionesResumidasALongitud: 4) equals: 'Hola...'.
]

{ #category : #tests }
UsuarioTest >> test12UsuarioRecibeMensajeDeMasDe4CaracteresImprimeAcortadoA4YDespuesLoImprimeNormal [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensajeComoNotificacion: 'Hola como va?'.
	
	"Assert"
	self assert: (usuario notificacionesResumidasALongitud: 4) equals: 'Hola...'.
	self assert: (usuario notificaciones ) equals: 'Hola como va?'.
]

{ #category : #tests }
UsuarioTest >> test13UsuarioAgregaPalabrasClavesYRecibeMensajeConYSinEsasPalabras [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Homero'.
	usuario agregarPalabraClave: 'Homeros'.
	"Act"
	usuario recibeMensaje: 'No se admiten Homeros'.
	usuario recibeMensaje: 'Solo se permite uno'.	
	"Assert"
	self assert: (usuario notificaciones ) equals: 'No se admiten Homeros'.
]

{ #category : #tests }
UsuarioTest >> test14UsuarioPausaUnCanalYNoRecibeMensajesDeAhiQuNoLoNombren [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Nelson'.
	usuario agregarPalabraClave: 'Bart'.
	usuario pausarCanal: 'general'.
	"Act"
	usuario recibeMensaje: 'Dile a Bart que venga aqui' delCanal: 'general'.
	usuario recibeMensaje: 'Quien es @Nelson' delCanal: 'general'.
	"Assert"
	self assert: (usuario notificaciones ) equals: 'Quien es @Nelson'.
]

{ #category : #tests }
UsuarioTest >> test15UsuarioPausaUnCanalYNoRecibeMensajesDeAhiQuNoLoNombrenDespuesLoReanudaYRecibeLosQueMandenAhi [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Nelson'.
	usuario agregarPalabraClave: 'Bart'.
	"Act"
	usuario pausarCanal: 'general'.
	usuario recibeMensaje: 'Dile a Bart que venga aqui' delCanal: 'general'.
	usuario recibeMensaje: 'Quien es @Nelson' delCanal: 'general'.
	usuario reanudarCanal: 'general'.
	usuario recibeMensaje: 'Nelson? Le habia prohibido a Bart jugar con ese pequeno monstruo'.
	"Assert"
	self assert: (usuario notificaciones ) equals: 'Quien es @Nelson | Nelson? Le habia prohibido a Bart jugar con ese pequeno monstruo'.
]

{ #category : #tests }
UsuarioTest >> test16UsuarioRecibeMasDeUnMensajeYLosAcortaLosQueSonNecesarios [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Ronnie'.	
	"Act"
	usuario recibeMensajeComoNotificacion: 'Im a wheel'.
	usuario recibeMensajeComoNotificacion: 'Im a wheel'.
	usuario recibeMensajeComoNotificacion: 'I can roll'.
	usuario recibeMensajeComoNotificacion: 'I can feel'.
	usuario recibeMensajeComoNotificacion: 'And you cant stop me turning'.
	usuario recibeMensajeComoNotificacion: 'Cause Im the sun'.
	usuario recibeMensajeComoNotificacion: 'Im the sun'.
	usuario recibeMensajeComoNotificacion: 'I can move'.
	usuario recibeMensajeComoNotificacion: 'I can roll'.
	usuario recibeMensajeComoNotificacion: 'But you ll never stop me burning'.
	
	"Assert"
	self assert: (usuario notificacionesResumidasALongitud: 10 ) equals: 'Im a wheel | Im a wheel | I can roll | I can feel | And you ca... | Cause Im t... | Im the sun | I can move | I can roll | But you ll...'.
]
