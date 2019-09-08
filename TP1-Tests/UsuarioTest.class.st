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
UsuarioTest >> test04MandoMensajeAUsuarioQueEraParaOtroYNoLoRecibeComoNotificacion [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensaje: 'Hola Juan' para: 'Juan'.
	
	"Assert"
	self assert: usuario notificaciones equals: ''.
	
]

{ #category : #tests }
UsuarioTest >> test05MandoMensajeParaUsuarioYLoRecibeComoNotificacion [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensaje: 'Hola Carlos' para: 'Carlos'.
	
	"Assert"
	self assert: usuario notificaciones equals: 'Hola Carlos'.
]

{ #category : #tests }
UsuarioTest >> test06Mando2MensajesAlUsuarioYLosGuardaYMuestraBien [
	"Arrange"
	| usuario |
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	usuario recibeMensaje: 'Hola che' para: 'Carlos'.
	usuario recibeMensaje: 'Como va?' para: 'Carlos'.
	
	"Assert"
	self assert: usuario notificaciones equals: 'Hola che | Como va?'.
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
