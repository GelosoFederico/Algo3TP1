Class {
	#name : #Notificador,
	#superclass : #Object,
	#instVars : [
		'palabrasClave',
		'nombreUsuario',
		'canalesPausados'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
Notificador class >> deUsuario: usuarioDelNotificador [
	| notificador |
	notificador := Notificador new.
	notificador nombreUsuario: usuarioDelNotificador.
	^ notificador.
]

{ #category : #'as yet unclassified' }
Notificador >> agregarPalabraClave: palabra [
	palabrasClave add: palabra.
]

{ #category : #'as yet unclassified' }
Notificador >> analizaMensaje: mensaje [
	( (self usuarioFueNombradoEn: mensaje) or: (self aparecePalabraClaveEn: mensaje) )
		ifTrue: [ ^ mensaje ]
		ifFalse: [ ^ '' ].
]

{ #category : #'as yet unclassified' }
Notificador >> analizaMensaje: mensaje delCanal: canal [
	" Esto pareciera poder resolverse con polimorfismo pero no puedo detectar como. Un analizador de canal pausado y de canal no pausado?"
	( self canalEstaPausado: canal )
		ifTrue: [ ^ self analizaMensajeDeCanalPausado: mensaje ]
		ifFalse: [ ^ self analizaMensaje: mensaje ].	
]

{ #category : #'private ' }
Notificador >> analizaMensajeDeCanalPausado: mensaje [
	( (self usuarioFueNombradoEn: mensaje) )
		ifTrue: [ ^ mensaje ]
		ifFalse: [ ^ '' ].	
]

{ #category : #'as yet unclassified' }
Notificador >> aparecePalabraClaveEn: mensaje [
	^ (mensaje findAnySubstring: palabrasClave startingAt: 1) < (mensaje size).
]

{ #category : #'private ' }
Notificador >> canalEstaPausado: canalNombre [
	^ canalesPausados includes: canalNombre.
]

{ #category : #initialization }
Notificador >> initialize [ 
	palabrasClave := OrderedCollection new.
	canalesPausados := OrderedCollection new.
	nombreUsuario := String new.
]

{ #category : #accessing }
Notificador >> nombreUsuario: nombre [
	nombreUsuario := nombre.
]

{ #category : #'as yet unclassified' }
Notificador >> pausarCanal: nombreCanal [
	canalesPausados add: nombreCanal.
]

{ #category : #'as yet unclassified' }
Notificador >> reanudarCanal: canalNombre [
	canalesPausados remove: canalNombre.
]

{ #category : #'private ' }
Notificador >> usuarioFueNombradoEn: mensaje [
	^ ((mensaje findString: ('@',nombreUsuario )) > 0).
]
