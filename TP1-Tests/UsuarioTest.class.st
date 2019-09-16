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

{ #category : #'as yet unclassified' }
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
UsuarioTest >> test08UsuarioRecibeMensajeConSuNombreArrobadSinMayusculaYNoApareceComoNotificacion [
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
