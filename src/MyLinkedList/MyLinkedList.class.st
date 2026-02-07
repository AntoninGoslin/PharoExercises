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
MyLinkedList >> tail [ 
	^ tail
]
