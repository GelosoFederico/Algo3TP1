Class {
	#name : #ConjuntoDeUsuariosTest,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
ConjuntoDeUsuariosTest >> test00CreoUnConjuntoYNoTieneANadie [
	"Arrange"
	| conjunto |
	conjunto := ConjuntoDeUsuarios new.
	
	"Act"
	
	"Assert"
	self assert: conjunto cantidadUsuarios equals: 0.	
	self assert: conjunto nombresUsuarios equals: ''.
	
]

{ #category : #tests }
ConjuntoDeUsuariosTest >> test01CreoUnConjuntoAgregoUsuarioYLoTiene [
	"Arrange"
	| conjunto juan |
	conjunto := ConjuntoDeUsuarios new.
	juan := Usuario conNombre: 'Juan'.	
	"Act"
	conjunto agregarUsuario: juan.
	"Assert"
	self assert: conjunto nombresUsuarios equals: 'Juan'
	
]

{ #category : #tests }
ConjuntoDeUsuariosTest >> test02CreoUnConjuntoAgregoUsuarioConNombreLoCreaYLoTiene [
	"Arrange"
	| conjunto |
	conjunto := ConjuntoDeUsuarios new.
	"Act"
	conjunto agregarUsuarioConNombre: 'Juan'.
	"Assert"
	self assert: conjunto nombresUsuarios equals: 'Juan'
	
]

{ #category : #tests }
ConjuntoDeUsuariosTest >> test03CreoUnConjuntoAgregoUsuariosYRecibenMensajesDirectos [
	"Arrange"
	| conjunto |
	conjunto := ConjuntoDeUsuarios new.
	conjunto agregarUsuarioConNombre: 'Juan'.
	conjunto agregarUsuarioConNombre: 'Carlos'.
	"Act"
	conjunto recibenMensajeDirecto: 'Hola'.
	conjunto recibenMensajeDirecto: 'Todo bien?'.
	"Assert"
	self assert: (conjunto notificacionesDeUsuario: 'Juan') equals: 'Hola | Todo bien?'
	
]
