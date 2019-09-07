Class {
	#name : #CanalTest,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
CanalTest >> test00CreoCanalYTiene0Usuarios [
	"Arrange"
	| canal cantidadUsuarios|
	canal := Canal new.
	
	"Act"
	cantidadUsuarios := canal cantidadUsuarios.
	
	"Assert"
	self assert: cantidadUsuarios equals: 0.
]

{ #category : #tests }
CanalTest >> test01CreoCanalAgregoUsuarioYLoTiene [
	"Arrange"
	| canal usuario nombres|
	canal := Canal new.
	usuario := Usuario conNombre: 'Carlos'.
	
	"Act"
	canal agregarUsuario: usuario. 
	nombres := canal nombresUsuarios.
	
	"Assert"
	self assert: nombres equals: 'Carlos'. 
]
