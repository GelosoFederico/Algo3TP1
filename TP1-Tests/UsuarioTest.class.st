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
UsuarioTest >> test03MandoMensajeAUsuarioYLoRecibeComoNotificacion [
	"Arrange"
	| usuario |
	usuario := Usuario new.
	
	"Act"
	usuario recibeMensaje: 'hola'.
	
	"Assert"
	self assert: usuario notificaciones equals: 'hola'.
]
