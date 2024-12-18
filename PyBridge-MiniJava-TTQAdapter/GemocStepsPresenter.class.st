Class {
	#name : 'GemocStepsPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'steps',
		'stepsTable',
		'trace',
		'code',
		'tree'
	],
	#category : 'PyBridge-MiniJava-TTQAdapter-presenters',
	#package : 'PyBridge-MiniJava-TTQAdapter',
	#tag : 'presenters'
}

{ #category : 'layout' }
GemocStepsPresenter >> defaultLayout [

	| newLayout |
	newLayout := SpBoxLayout newTopToBottom.
	newLayout add: (SpBoxLayout newLeftToRight
			 add: (SpBoxLayout newTopToBottom
					  add: 'Execution steps'
					  expand: false
					  fill: false
					  padding: 5;
					  add: stepsTable;
					  yourself);
			 	add: (SpBoxLayout newTopToBottom
					  add: 'Execution tree'
					  expand: false
					  fill: false
					  padding: 5;
					  add: tree;
					  yourself);
				add: (SpBoxLayout newTopToBottom
					  add: 'Source code'
					  expand: false
					  fill: false
					  padding: 5;
					  add: code;
					  yourself);
			 yourself).
	^ newLayout
]

{ #category : 'initialization' }
GemocStepsPresenter >> initializePresenters [

	stepsTable := self newTable.
	stepsTable addColumn: ((SpStringTableColumn
			  title: 'PC'
			  evaluated: [ :aGemocStep | self printPCFor: aGemocStep ])
			 width: 50;
			 yourself).
	stepsTable addColumn:
		(SpStringTableColumn title: 'Step' evaluated: [ :aGemocStep |
			 String streamContents: [ :str | aGemocStep printOn: str ] ])
			yourself.
	stepsTable items: steps.
	stepsTable transmitDo: [ :step |
		step ifNotNil: [ self selectStepInTree: step ] ].
	stepsTable activateOnDoubleClick whenActivatedDo: [ :step |
		step selectedItem inspect ].

	code := self newText.
	tree := self newTree.	
	tree	roots: {  };
		children: [ :step | step children ifNil:[{}]  ];
"		displayIcon: [ :aClass | self iconNamed: aClass systemIconName ];"
		display: [ :step | step gemocStep printString ]
		"expandPath: #(1 1 3); ""Object/Exception/Notification""".
	tree transmitDo: [ :step |
		step ifNotNil: [ self showStep: step ] ].
	tree roots: { (trace executionTree
		               at: steps second uuid )}.
	tree	activateOnDoubleClick whenActivatedDo: [ :step |
		step selectedItem inspect ].

	tree expandAll.
	



]

{ #category : 'printing' }
GemocStepsPresenter >> printPCFor: aGemocStep [
	^aGemocStep pc printString
]

{ #category : 'private - presenters' }
GemocStepsPresenter >> selectStepInTree: step [

	| treeElement |
	treeElement := trace executionTree
		               at: step uuid
		               ifAbsent: [ self halt ].
		
	tree selectItem: treeElement atIndex: (steps indexOf: step) - 3
]

{ #category : 'accessing - model' }
GemocStepsPresenter >> setModelBeforeInitialization: aGemocTrace [
	trace := aGemocTrace.
	steps := SortedCollection sortBlock: [ :a :b| a pc < b pc ].
	steps addAll:( aGemocTrace gemocSteps reject:[:step| step pc < 0])
]

{ #category : 'private - presenters' }
GemocStepsPresenter >> showStep: step [

	code text:
		(String streamContents: [ :str | step gemocStep nicePrintOn: str nbTabs: 0 ])
]
