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
