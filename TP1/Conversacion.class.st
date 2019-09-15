Class {
	#name : #Conversacion,
	#superclass : #Canal,
	#category : #TP1
}

{ #category : #accessing }
Conversacion >> nombre [ 
	^ (ManejadorDeMensajes conUsuarios: usuarios) comoCadenaConcatenadaCon: ',' .
]

{ #category : #'as yet unclassified' }
Conversacion >> recibeMensaje: mensaje [
	mensajes agregar: mensaje.
	usuarios do: [ :usuario|
		usuario recibeMensajeDirecto: mensaje ].
]
