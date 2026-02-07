Class {
	#name : 'MyNodeTest',
	#superclass : 'TestCase',
	#instVars : [
		'value'
	],
	#category : 'MyLinkedList',
	#package : 'MyLinkedList'
}

{ #category : 'tests' }
MyNodeTest >> testNextWithLinkedNodes [
	| node1 node2 node3|
	node1 := MyNode new.
	node1 value: 5.
	
	node2 := MyNode new.
	node2 value: 10.
	
	node3 := MyNode new.
	node3 value: 20.
	
	node1 next: node2.
	node2 next: node3.
	
	self assert: node1 next equals: node2.
	self assert: node2 next equals: node3.
]

{ #category : 'tests' }
MyNodeTest >> testNextWithTwoLinkedNode [
	| node1 node2 |
	node1 := MyNode new.
	node1 value: 5.
	
	node2 := MyNode new.
	node2 value: 10.
	
	node1 next: node2.
	
	self assert: node1 next equals: node2.
]

{ #category : 'tests' }
MyNodeTest >> testNodeInitIsCorrect [
	| node |
	node := MyNode new.
	
	self assert: node value isNil.
	self assert: node next isNil.
]

{ #category : 'tests' }
MyNodeTest >> testNodeNextValue [
	| node |
	node := MyNode new.
	node value: 5.
	node next: 10.
	
	self assert: node value equals: 5.
	self assert: node next equals: 10.
	
	node next: 15.
	self assert: node next equals: 15.
]

{ #category : 'tests' }
MyNodeTest >> testNodeValue [
	| node |
	node := MyNode new.
	node value: 5.
	
	self assert: node value equals: 5.
	
	node value: 10.
	self assert: node value equals: 10.
]
