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
MyLinkedList >> head [ 
	^ head 
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
MyLinkedList >> tail [ 
	^ tail
]
