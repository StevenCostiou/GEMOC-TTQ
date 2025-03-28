Class {
	#name : 'GemocReceiver',
	#superclass : 'GemocRuntimeEntity',
	#instVars : [
		'receiver',
		'receiverClass'
	],
	#category : 'PyBridge-MiniJava-TTQAdapter-model',
	#package : 'PyBridge-MiniJava-TTQAdapter',
	#tag : 'model'
}

{ #category : 'testing' }
GemocReceiver >> isVariable [
	self flag: '[GEMOC] How do I know if the message is sent to a variable or to the result of an expression?'.
	^true
]

{ #category : 'accessing' }
GemocReceiver >> receiver [

	^ receiver
]

{ #category : 'accessing' }
GemocReceiver >> receiver: anObject [

	receiver := anObject.
	receiverClass := anObject typeClass
]

{ #category : 'accessing' }
GemocReceiver >> receiverClass [
	^ receiverClass
]

{ #category : 'accessing' }
GemocReceiver >> variable [
	^GemocVariable new variableName: receiver printString
]
