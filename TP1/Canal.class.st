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
	^ 0.
]

{ #category : #initialization }
Canal >> initialize [ 
	usuarios := OrderedCollection new.
	mensajes := OrderedCollection new.	
	nombre := String new.
]

{ #category : #accessing }
Canal >> mensajes [
	"TODO como los nombres de usuarios, hacer esto mas OO, y el collect deberia ser lo que meto en stringeados."
	| mensajesStringeados |
	mensajesStringeados := mensajes asCommaString.
	mensajesStringeados := mensajesStringeados copyReplaceAll: ',' with: ' |'.
	^ mensajesStringeados. 
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
	"TODO hacer esto mas OO, y el collect deberia ser lo que meto en stringeados."
	| usuariosStringeados |
	usuariosStringeados := OrderedCollection new.
	usuarios do: [ :usuario | 
		usuariosStringeados add: (usuario nombre). 
	].
	usuariosStringeados := usuariosStringeados asCommaString.
	usuariosStringeados := usuariosStringeados copyReplaceAll: ',' with: ' |'.
	^ usuariosStringeados. 
]

{ #category : #'as yet unclassified' }
Canal >> recibeMensaje: mensaje [
	mensajes add: mensaje.
]
