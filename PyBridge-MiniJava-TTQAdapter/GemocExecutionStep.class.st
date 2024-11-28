Class {
	#name : 'GemocExecutionStep',
	#superclass : 'Object',
	#instVars : [
		'children',
		'parent',
		'id',
		'gemocStep'
	],
	#category : 'PyBridge-MiniJava-TTQAdapter-model',
	#package : 'PyBridge-MiniJava-TTQAdapter',
	#tag : 'model'
}

{ #category : 'adding' }
GemocExecutionStep >> addChild: aGemocExecutionStep [

	self children add: aGemocExecutionStep
]

{ #category : 'accessing' }
GemocExecutionStep >> children [

	^ children ifNil: [
		  children := SortedCollection sortBlock: [ :a :b | a pc < b pc ] ]
]

{ #category : 'accessing' }
GemocExecutionStep >> children: anObject [

	children := anObject
]

{ #category : 'accessing' }
GemocExecutionStep >> gemocStep [

	^ gemocStep
]

{ #category : 'accessing' }
GemocExecutionStep >> gemocStep: anObject [

	gemocStep := anObject
]

{ #category : 'accessing' }
GemocExecutionStep >> id [

	^ id
]

{ #category : 'accessing' }
GemocExecutionStep >> id: anObject [

	id := anObject
]

{ #category : 'accessing' }
GemocExecutionStep >> parent [

	^ parent
]

{ #category : 'accessing' }
GemocExecutionStep >> parent: anObject [

	parent := anObject
]

{ #category : 'api - accessing' }
GemocExecutionStep >> pc [

	^ gemocStep ifNil: [ 0 ] ifNotNil: [ gemocStep pc ]
]