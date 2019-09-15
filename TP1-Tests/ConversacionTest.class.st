Class {
	#name : #ConversacionTest,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
ConversacionTest >> test00CreoConversacionAgrego3UsuariosYSuNombreSonEsos3Usuarios [
	"Arrange"
	| conversacion carlos juan maria nombre|
	conversacion := Conversacion new.
	carlos := Usuario conNombre: 'Carlos'.
	juan := Usuario conNombre: 'Juan'.
	maria := Usuario conNombre: 'Maria'.
	
	"Act"
	conversacion agregarUsuario: carlos. 
	conversacion agregarUsuario: juan. 
	conversacion agregarUsuario: maria. 
	nombre := conversacion nombre.
	
	"Assert"
	self assert: nombre equals: 'Carlos,Juan,Maria'. 
]
