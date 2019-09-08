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

{ #category : #tests }
CanalTest >> test02CreoCanalLePongoNombreYTieneEseNombre [
	"Arrange"
	| canal |
	canal := Canal new. 

	"Act"
	canal nombre: 'anuncios'.
	
	"Assert"
	self assert: canal nombre equals: 'anuncios'.

]

{ #category : #tests }
CanalTest >> test03CreoCanalConNombreYTieneEseNombre [
	"Arrange"
	| canal |
	
	"Act"
	canal := Canal conNombre: 'anuncios'.
	
	"Assert"
	self assert: canal nombre equals: 'anuncios'.
]

{ #category : #tests }
CanalTest >> test04CanalRecibeMensajeYLoGuarda [
	"arrange"
	| canal |
	canal := Canal new.
	
	"Act"
	canal recibeMensaje: 'Hola canal'.
	
	"Assert"
	self assert: canal mensajes equals: 'Hola canal'.
]

{ #category : #tests }
CanalTest >> test05CreoCanalSinUsuariosYNombresUsuariosEstaVacio [
	"Arrange "
	| canal |
	
	"Act"
	canal := Canal new.
	
	"Assert"
	self assert: canal nombresUsuarios equals: ''.
]

{ #category : #tests }
CanalTest >> test06Agrego2UsuariosYLaCantidadEs2 [
	"Arrange"
	| canal |
	canal := Canal new.
	
	"Act"
	canal agregarUsuario:  (Usuario conNombre: 'Carlos').
	canal agregarUsuario: (Usuario conNombre: 'Juan').
	
	"Assert"
	self assert: canal cantidadUsuarios equals: 2.  
	
]

{ #category : #tests }
CanalTest >> test07RecibeMensajeEnCanalYElUsuarioNombradoLoTieneDeNotificacion [
	"Arrange"
	| canal juan|
	canal := Canal conNombre: 'anuncios'.
	juan := Usuario conNombre: 'Juan'.
	canal agregarUsuario: juan.
	
	"Act"
	canal recibeMensaje: 'Hola @Juan'.
	
	"Assert"
	self assert: juan notificaciones equals: 'Hola @Juan'.

]

{ #category : #tests }
CanalTest >> test08RecibeMensajeEnCanalYElUsuarioNoNombradoNoLoTieneDeNotificacion [
	"Arrange"
	| canal juan|
	canal := Canal conNombre: 'anuncios'.
	juan := Usuario conNombre: 'Juan'.
	canal agregarUsuario: juan.
	
	"Act"
	canal recibeMensaje: 'Hola @Carlos'.
	
	"Assert"
	self assert: juan notificaciones equals: ''.

]

{ #category : #tests }
CanalTest >> test09VariosUsuariosNombradosRecibenElMensajeRecibeMensajeEnCanalYElUsuarioNoNombradoNo [
	"Arrange"
	| canal juan carlos maria|
	canal := Canal conNombre: 'anuncios'.
	juan := Usuario conNombre: 'Juan'.
	carlos := Usuario conNombre: 'Carlos'.
	maria := Usuario conNombre: 'Maria'.
	canal agregarUsuario: juan.
	canal agregarUsuario: carlos.
	canal agregarUsuario: maria.
	
	"Act"
	canal recibeMensaje: 'Hola @Juan y @Maria'.
	
	"Assert"
	self assert: juan notificaciones equals: 'Hola @Juan y @Maria'.
	self assert: carlos notificaciones equals: ''.
	self assert: maria notificaciones equals: 'Hola @Juan y @Maria'.

]
