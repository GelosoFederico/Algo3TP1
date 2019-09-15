Class {
	#name : #ConjuntoDeUsuarios,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'nombres'
	],
	#category : #TP1
}

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> agregarUsuario: usuario [
	nombres add: usuario nombre.
	usuarios at: (usuario nombre) put: usuario.
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> agregarUsuarioConNombre: nombreUsuario [
	nombres add: nombreUsuario.
	usuarios at: nombreUsuario put: (Usuario conNombre: nombreUsuario).
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> cantidadUsuarios [ 
	^ usuarios size.
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> conNombre: nombreUsuario [
	^ usuarios at: nombreUsuario.
	
]

{ #category : #initialization }
ConjuntoDeUsuarios >> initialize [ 	
	usuarios := Dictionary new.
	nombres := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> nombresUsuarios [
	^ (ManejadorDeMensajes con: nombres) comoCadenaConcatenadaCon: ',' .

]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> notificacionesDeUsuario: usuarioNombre [
	^ (usuarios at: usuarioNombre) notificaciones.
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> notificacionesDeUsuario: nombreUsuario resumidasALongitud: long [
	^ (usuarios at: nombreUsuario) notificacionesResumidasALongitud: long.
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> obtenerSubconjuntoDeUsuarios: stringUsuarios [
	| usuariosNombres subconjunto|
	subconjunto := ConjuntoDeUsuarios new.
	usuariosNombres := stringUsuarios splitOn: ','.
	usuariosNombres do: [ :nombreUsuario|
		subconjunto agregarUsuario: (self conNombre: nombreUsuario).
		 ].
	^ subconjunto.

]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> recibenMensaje: mensaje [
	usuarios do: [ :usuario|
		usuario recibeMensaje: mensaje ].
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> recibenMensaje: mensaje delCanal: canal [
	usuarios do: [ :usuario|
		usuario recibeMensaje: mensaje delCanal: canal ].
]

{ #category : #'as yet unclassified' }
ConjuntoDeUsuarios >> recibenMensajeDirecto: mensaje [
	usuarios do: [ :usuario|
		usuario recibeMensajeDirecto: mensaje ].
]
