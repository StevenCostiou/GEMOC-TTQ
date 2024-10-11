Class {
	#name : 'GemocVariableDeclaration',
	#superclass : 'GemocSymbol',
	#traits : 'TGemocAssignee',
	#classTraits : 'TGemocAssignee classTrait',
	#instVars : [
		'type',
		'name'
	],
	#category : 'PyBridge-MiniJava-TTQAdapter-generated',
	#package : 'PyBridge-MiniJava-TTQAdapter',
	#tag : 'generated'
}

{ #category : 'visiting' }
GemocVariableDeclaration >> acceptVisitor: aGemocProgramStateGenerator [ 
	aGemocProgramStateGenerator visitGemocVariableDeclaration: self
]

{ #category : 'accessing' }
GemocVariableDeclaration >> name: aString [ 
	name := aString
]

{ #category : 'printing' }
GemocVariableDeclaration >> printOn: aStream [

	type printOn: aStream.
	aStream space.
	self printName: name on: aStream

]

{ #category : 'accessing - structure variables' }
GemocVariableDeclaration >> type: aGemocClassRef [ 
	type := aGemocClassRef
]