Class {
	#name : 'MyLink',
	#superclass : 'Object',
	#instVars : [
		'value',
		'next'
	],
	#category : 'MyLinkedList',
	#package : 'MyLinkedList'
}

{ #category : 'evaluating' }
MyLink >> next [
	^ next 
]

{ #category : 'evaluating' }
MyLink >> next: aLink [
	next := aLink
]

{ #category : 'evaluating' }
MyLink >> value [
	^ value 
]

{ #category : 'evaluating' }
MyLink >> value: aValue [
	value := aValue 
]
