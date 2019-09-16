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

{ #category : #tests }
ConversacionTest >> test01CreoConversacionAgrego3UsuariosMandoMensajesYLesLleganComoNotificaciones [
	"Arrange"
	| conversacion carlos juan maria|
	conversacion := Conversacion new.
	carlos := Usuario conNombre: 'Carlos'.
	juan := Usuario conNombre: 'Juan'.
	maria := Usuario conNombre: 'Maria'.
	conversacion agregarUsuario: carlos. 
	conversacion agregarUsuario: juan. 
	conversacion agregarUsuario: maria. 	
	"Act"
	conversacion recibeMensaje: 'Hola todo el mundo'.
	conversacion recibeMensaje: 'Hola doctor Nick'.	
	"Assert"
	self assert: (carlos notificaciones) equals: 'Hola todo el mundo | Hola doctor Nick'.
	self assert: (juan notificaciones) equals: 'Hola todo el mundo | Hola doctor Nick'.
	self assert: (maria notificaciones) equals: 'Hola todo el mundo | Hola doctor Nick'.
]
