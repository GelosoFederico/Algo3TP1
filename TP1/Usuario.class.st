Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombre'
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
]

{ #category : #accessing }
Usuario >> nombre [
	^ nombre.

]

{ #category : #accessing }
Usuario >> nombre: unNombre [
	nombre := unNombre.
]
