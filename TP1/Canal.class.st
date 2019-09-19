Class {
	#name : #Canal,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'nombre',
		'mensajes'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
Canal class >> conNombre: nombre [
	| canal |
	canal := self new.
	canal nombre: nombre.
	^ canal.
	
]

{ #category : #setter }
Canal >> agregarUsuario: nuevoUsuario [
	usuarios agregarUsuario: nuevoUsuario.
]

{ #category : #'accessing - properties' }
Canal >> cantidadUsuarios [
	^ usuarios cantidadUsuarios.
]

{ #category : #initialization }
Canal >> initialize [ 
	usuarios := ConjuntoDeUsuarios new.
	mensajes := ManejadorDeMensajes new.	
	nombre := String new.
]

{ #category : #accessing }
Canal >> mensajes [
	^ mensajes comoCadenaConcatenada.

]

{ #category : #'accessing - properties' }
Canal >> mensajesResumidosALongitud: cantidadCaracteres [
	^ mensajes comoCadenaConcatenadaResumidaALongitud: cantidadCaracteres.
]

{ #category : #accessing }
Canal >> nombre [
	^ nombre.

]

{ #category : #setter }
Canal >> nombre: nuevoNombre [
	nombre := nuevoNombre.
]

{ #category : #'accessing - properties' }
Canal >> nombresUsuarios [
	^ usuarios nombresUsuarios.
]

{ #category : #'as yet unclassified' }
Canal >> recibeMensaje: mensaje [
	mensajes agregar: mensaje.
	usuarios recibenMensaje: mensaje delCanal: self nombre. 
]

{ #category : #private }
Canal >> usuarios: conjuntoDeUsuarios [
	usuarios := conjuntoDeUsuarios.
]
