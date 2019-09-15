Class {
	#name : #ManejadorDeMensajesTest,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
ManejadorDeMensajesTest >> test00CreoManejadorYNoTieneNada [
	"Arrange"
	| manejador |
	manejador := ManejadorDeMensajes new. 
	"Act"
	"Assert"
	self assert: (manejador comoCadenaConcatenada) equals: ''. 
]

{ #category : #tests }
ManejadorDeMensajesTest >> test01CreoManejadorGuarda2MensajesYLosMuestraBien [
	"Arrange"
	| manejador |
	manejador := ManejadorDeMensajes new. 
	"Act"
	manejador agregar: 'In the misty morning'.
	manejador agregar: 'At the edge of time'.
	"Assert"
	self assert: (manejador comoCadenaConcatenada) equals: 'In the misty morning | At the edge of time'. 
]

{ #category : #tests }
ManejadorDeMensajesTest >> test02CreoManejadorGuarda2MensajesYLosMuestraAcortadosBien [
	"Arrange"
	| manejador |
	manejador := ManejadorDeMensajes new. 
	"Act"
	manejador agregar: 'In the misty morning'.
	manejador agregar: 'At the edge of time'.
	"Assert"
	self assert: (manejador comoCadenaConcatenadaResumidaALongitud: 5 ) equals: 'In th... | At th...'. 
]
