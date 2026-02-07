Class {
	#name : 'MyLinkedListTest',
	#superclass : 'TestCase',
	#category : 'MyLinkedList',
	#package : 'MyLinkedList'
}

{ #category : 'running' }
MyLinkedListTest >> testDeleteHead [
	| list |
	list := MyLinkedList new.
	list insert: 1. 
	list insert: 2.
	
	list delete: 1.
	
	self assert: list head value equals: 2.
	self assert: list head equals: list tail.
]

{ #category : 'running' }
MyLinkedListTest >> testDeleteTail [
	| list |
	list := MyLinkedList new.
	list insert: 1. 
	list insert: 2.
	
	list delete: 2.
	
	self assert: list head value equals: 1.
	self assert: list head equals: list tail.
]

{ #category : 'running' }
MyLinkedListTest >> testInsert2Elements [
	| list |
	list := MyLinkedList new.
	
	list insert: 5.
	list insert: 6.
	self assert: list head value equals: 5.
	self assert: list tail value equals: 6.
	self assert: list head next equals: list tail.
]

{ #category : 'running' }
MyLinkedListTest >> testInsertHeadIsEqualToTailWith1Element [
	| list |
	list := MyLinkedList new.
	self assert: list head isNil.
	
	list insert: 5.
	self assert: list head equals: list tail.
]

{ #category : 'running' }
MyLinkedListTest >> testInsertHeadWith1Element [
	| list |
	list := MyLinkedList new.
	self assert: list head isNil.
	
	list insert: 5.
	self assert: list head value equals: 5.
]

{ #category : 'running' }
MyLinkedListTest >> testInsertTailWith1Element [
	| list |
	list := MyLinkedList new.
	self assert: list head isNil.
	
	list insert: 5.
	self assert: list tail value equals: 5.
]

{ #category : 'running' }
MyLinkedListTest >> testListInitIsCorrect [
	| list |
	list := MyLinkedList new.
	
	self assert: list head isNil.
	self assert: list tail isNil.
]

{ #category : 'running' }
MyLinkedListTest >> testSeachIsNilWhenElementIsNotInList [
	| list |
	list := MyLinkedList new.
	
	list insert: 5.
	list insert: 6.
	
	self assert: (list search: 7) isNil.
]

{ #category : 'running' }
MyLinkedListTest >> testSeachIsOKWhenElementIsInList [
	| list |
	list := MyLinkedList new.
	
	list insert: 5.
	list insert: 6.
	
	self assert: (list search: 5) isNotNil.
	self assert: (list search: 6) isNotNil.
	self assert: (list search: 6) value equals: 6.
]
