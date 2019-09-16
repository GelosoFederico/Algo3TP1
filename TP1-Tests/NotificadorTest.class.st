Class {
	#name : #NotificadorTest,
	#superclass : #TestCase,
	#category : #'TP1-Tests'
}

{ #category : #tests }
NotificadorTest >> test00CreoNotificadorConNombreDeUsuarioYLosMensajesQueLoArrobanAlUsuarioLosDejaPasar [
	"Arrange"
	| notificador |
	notificador := Notificador deUsuario: 'rainbow'.
	"Act"
	"Assert"
	self assert: (notificador analizaMensaje: 'Take some @venom and @accept') equals: ''.
	self assert: (notificador analizaMensaje: 'That you wont see @Nazareth') equals: ''.
	self assert: (notificador analizaMensaje: 'The @rainbow leads you home') equals: 'The @rainbow leads you home'.
	
]

{ #category : #tests }
NotificadorTest >> test01CreoNotificadorConNombreDeUsuarioYPalabrasClaveYLosMensajesConPalabrasClaveLosDejaPasar [
	"Son varios para ver si recorre todos"
	"Arrange"
	| notificador |
	notificador := Notificador deUsuario: 'thrash'.
	"Act"
	notificador agregarPalabraClave: 'destruction'.
	notificador agregarPalabraClave: 'metal church'.
	notificador agregarPalabraClave: 'slayer'.
	"Assert"
	self assert: (notificador analizaMensaje: 'Warrior sent to milky way') equals: ''.
	self assert: (notificador analizaMensaje: 'UFO shooting gamma ray') equals: ''.
	self assert: (notificador analizaMensaje: 'A riot of destruction') equals: 'A riot of destruction'.
	self assert: (notificador analizaMensaje: 'Watch the rockbitch go down, vixen spread') equals: ''.
	self assert: (notificador analizaMensaje: 'When the priest killed a maiden in the metal church') equals: 'When the priest killed a maiden in the metal church'.
	self assert: (notificador analizaMensaje: 'Armored saints and warlocks watched the slaughter') equals: ''.
	self assert: (notificador analizaMensaje: 'Rage of the slayer forced the pretty maids') equals: 'Rage of the slayer forced the pretty maids'.
	self assert: (notificador analizaMensaje: 'To kiss the Queen in crimson glory') equals: ''.
	
]

{ #category : #tests }
NotificadorTest >> test02CreoNotificadorConNombreDeUsuarioYPalabrasClaveYCanalPausadoYLosMensajesConPalabrasClaveNoLosDejaPasarDeLosPausados [
	"Son varios para ver si recorre todos"
	"Arrange"
	| notificador |
	notificador := Notificador deUsuario: 'Megalomania'.
	"Act"
	notificador agregarPalabraClave: 'How'.
	notificador agregarPalabraClave: 'now'.
	notificador agregarPalabraClave: 'Sting'.
	notificador pausarCanal: 'Siguiente estrofa'.
	"Assert"
	self assert: (notificador analizaMensaje: 'How I lied, went to hide' delCanal: 'estrofa anterior') equals: 'How I lied, went to hide'.
	self assert: (notificador analizaMensaje: 'Am I right if I fight?' delCanal: 'estrofa anterior') equals: ''.
	self assert: (notificador analizaMensaje: 'That I might just get away from you now' delCanal: 'estrofa anterior') equals: 'That I might just get away from you now'.
	self assert: (notificador analizaMensaje: 'Sting me!' delCanal: 'Siguiente estrofa') equals: ''.
	self assert: (notificador analizaMensaje: '@Megalomania' delCanal: 'Siguiente estrofa') equals: '@Megalomania'.
	
]
