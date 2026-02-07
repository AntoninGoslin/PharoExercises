Class {
	#name : 'MyNode',
	#superclass : 'Object',
	#instVars : [
		'value',
		'next'
	],
	#category : 'MyLinkedList',
	#package : 'MyLinkedList'
}

{ #category : 'evaluating' }
MyNode >> next [
	^ next 
]

{ #category : 'evaluating' }
MyNode >> next: aNode [
	next := aNode
]

{ #category : 'evaluating' }
MyNode >> value [
	^ value 
]

{ #category : 'evaluating' }
MyNode >> value: aValue [
	value := aValue 
]
