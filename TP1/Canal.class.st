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

{ #category : #'as yet unclassified' }
Canal >> agregarUsuario: nuevoUsuario [
	usuarios add: nuevoUsuario.
]

{ #category : #'as yet unclassified' }
Canal >> cantidadUsuarios [
	^ usuarios size.
]

{ #category : #initialization }
Canal >> initialize [ 
	usuarios := OrderedCollection new.
	mensajes := ManejadorDeMensajes new.	
	nombre := String new.
]

{ #category : #accessing }
Canal >> mensajes [
	^ mensajes comoCadenaConcatenada.

]

{ #category : #'as yet unclassified' }
Canal >> mensajesResumidosALongitud: cantidadCaracteres [
	^ mensajes comoCadenaConcatenadaResumidaALongitud: cantidadCaracteres.
]

{ #category : #accessing }
Canal >> nombre [
	^ nombre.

]

{ #category : #accessing }
Canal >> nombre: nuevoNombre [
	nombre := nuevoNombre.
]

{ #category : #'as yet unclassified' }
Canal >> nombresUsuarios [
	^ (ManejadorDeMensajes conUsuarios: usuarios) comoCadenaConcatenadaCon: ',' .
]

{ #category : #'as yet unclassified' }
Canal >> recibeMensaje: mensaje [
	mensajes agregar: mensaje.
	usuarios do: [ :usuario|
		usuario recibeMensaje: mensaje ].
]
