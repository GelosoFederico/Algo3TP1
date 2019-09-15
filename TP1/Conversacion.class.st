Class {
	#name : #Conversacion,
	#superclass : #Canal,
	#category : #TP1
}

{ #category : #'as yet unclassified' }
Conversacion class >> conConjuntoDeUsuarios: conjuntoDeUsuarios [
	^ (Conversacion new) usuarios: conjuntoDeUsuarios.
]

{ #category : #accessing }
Conversacion >> nombre [
	^ usuarios nombresUsuarios.
]

{ #category : #'as yet unclassified' }
Conversacion >> recibeMensaje: mensaje [
	mensajes agregar: mensaje.
	usuarios recibenMensajeDirecto: mensaje.
]
