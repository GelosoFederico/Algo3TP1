Class {
	#name : #AlgoChatTestUnit,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
AlgoChatTestUnit >> test00CreoAlgoChatYNoTieneUsuariosNiCanales [
	"Arrange"
	| algoChat |
	"Act"
	algoChat := AlgoChat new.
	"Assert"
	self assert: algoChat getCantidadUsuarios equals: 0.
	self assert: algoChat getCantidadCanales equals: 0.

]

{ #category : #tests }
AlgoChatTestUnit >> test01CreoAlgoChatAgrego2UsuariosYTieneUsuarios2 [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	"Act"
	algoChat agregarUsuarioConNombre: 'Carlos'.
	algoChat agregarUsuarioConNombre: 'Juan'.
	"Assert"
	self assert: algoChat getCantidadUsuarios equals: 2.

]

{ #category : #tests }
AlgoChatTestUnit >> test02CreoAlgoChatAgrego2CanalesYTieneCanales2 [
	"Arrange"
	| algoChat |
	algoChat := AlgoChat new.
	"Act"
	algoChat agregarCanalConNombre: 'General'.
	algoChat agregarCanalConNombre: 'Anuncios'.
	"Assert"
	self assert: algoChat getCantidadCanales equals: 2.

]

{ #category : #tests }
AlgoChatTestUnit >> test03MandoMensajeAUnUsuarioYLoMuestracomoNotificacion [

]

{ #category : #tests }
AlgoChatTestUnit >> test04MandoDosMensajeAUnUsuarioYLosMuestracomoNotificaciones [

]

{ #category : #tests }
AlgoChatTestUnit >> test05MandoDosMensajeAUnUsuarioYLosMuestracomoNotificacionesResumidasAUnaLongitud [

]

{ #category : #tests }
AlgoChatTestUnit >> test06MandoDosMensajeAUnUsuarioConElNombreIncorrectoYNoLosGuarda [

]

{ #category : #tests }
AlgoChatTestUnit >> test07MandoUnMensajeAUnUsuarioQueNoExisteYSaleUnaExcepcion [

]

{ #category : #tests }
AlgoChatTestUnit >> test08MandoUnMensajeAUnCanalYQuedaGuardado [

]
