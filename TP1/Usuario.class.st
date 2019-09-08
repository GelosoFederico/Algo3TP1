Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'notificaciones'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
Usuario class >> conNombre: nombre [
	| usuario |
	usuario := Usuario new.
	usuario nombre: nombre.
	^ usuario.
]

{ #category : #initialization }
Usuario >> initialize [
	nombre := String new.
	notificaciones := OrderedCollection new.
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre.

]

{ #category : #accessing }
Usuario >> nombre: unNombre [
	nombre := unNombre.
]

{ #category : #'as yet unclassified' }
Usuario >> notificaciones [
		"TODO como los nombres de usuarios, hacer esto mas OO, y el collect deberia ser lo que meto en stringeados."
	| mensajesStringeados |
	notificaciones isEmpty ifTrue: [ ^ '' ].
	mensajesStringeados := notificaciones asCommaString.
	mensajesStringeados := mensajesStringeados copyReplaceAll: ',' with: ' |'.
	^ mensajesStringeados. 
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensaje: mensaje [
	notificaciones add:mensaje.
]

{ #category : #'as yet unclassified' }
Usuario >> recibeMensaje: mensaje para: nombreUsuario [
	(nombre sameAs: nombreUsuario) ifTrue: [ 
		self recibeMensaje: mensaje 
	]. 
]
