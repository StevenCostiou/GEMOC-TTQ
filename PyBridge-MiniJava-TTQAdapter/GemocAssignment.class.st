Class {
	#name : #GemocAssignment,
	#superclass : #GemocProgramState,
	#category : #'PyBridge-MiniJava-TTQAdapter'
}

{ #category : #building }
GemocAssignment >> build [ 	self flag: 'todo'
]

{ #category : #'as yet unclassified' }
GemocAssignment >> nodeIsAssignment [
	^true
]
