Class {
	#name : 'MyLinkedList',
	#superclass : 'Object',
	#instVars : [
		'head',
		'tail'
	],
	#category : 'MyLinkedList',
	#package : 'MyLinkedList'
}

{ #category : 'accessing' }
MyLinkedList >> delete: anInteger [
	| current previous |
	
	"empty list"
	head ifNil: [^ self].
	
	"we delete the first element"
	head value = anInteger ifTrue: [
						 						head := head next.
												"case for 1 element list"
												head ifNil: [ tail := nil ].
												^ self
											 ].
	"we delete a element in the list"
	previous := head.
	current := head next.
	
	"if not empty"
	[ current isNotNil ] whileTrue: [ 
		"in pharo, the java == is = "
		current value = anInteger ifTrue: [ 
			"deleting node"
			previous next: current next.
			"fix here, we have to take care if the element is the last"
			current == tail ifTrue: [ tail := previous ].
			^ self
		].
		"move forward"
		previous := current.
		current := current next.
	].
	
	
]

{ #category : 'accessing' }
MyLinkedList >> head [ 
	^ head 
]

{ #category : 'accessing' }
MyLinkedList >> head: aHead [
	head := aHead 
]

{ #category : 'accessing' }
MyLinkedList >> initialize [
    super initialize.
    head := nil.
    tail := nil.
]

{ #category : 'accessing' }
MyLinkedList >> insert: anInteger [
	| newNode |
	newNode := MyNode new value: anInteger.

	tail
		"case where tail is nil -> node is the head and the tail "
		ifNil: [
					head := newNode.
					tail := newNode.
			 	] 
		"if linked list have more than 1 element, we add the node at tail"
		ifNotNil: [ 
						tail next: newNode.
						tail := newNode 
			 		]
]

{ #category : 'accessing' }
MyLinkedList >> search: anInteger [
	| current |
	current := head.
	
	"[ current isNil ] ifTrue: [^ nil]."
	
	[ current isNotNil ] whileTrue: [ 
												"found"
												current value = anInteger ifTrue: [ ^ current ].
												current := current next
											 ].
	"not found"
	^nil.
]

{ #category : 'accessing' }
MyLinkedList >> tail [ 
	^ tail
]
