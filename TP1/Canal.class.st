Class {
	#name : #Canal,
	#superclass : #Object,
	#instVars : [
		'usuarios'
	],
	#category : #TP1
}

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
