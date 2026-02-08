Class {
	#name : 'JavaDocGenerator',
	#superclass : 'Object',
	#category : 'JavaDocGenerator',
	#package : 'JavaDocGenerator'
}

{ #category : 'instance creation' }
JavaDocGenerator >> for: aClass [
	| file |
	file := (aClass name,'.html') asFileReference.
	
	file writeStreamDo: [ :stream |
								self writeHTMLHeaderOn: stream for: aClass. 
								self writeHTMLDescriptionOn: stream for: aClass
							 ].
	"open the file directly in the web browser"
	WebBrowser openOn: file asUrl.
	
	^file

"JavaDocGenerator new for: MyLinkedList in the playground to see the result"
"FileLocator workingDirectory to see the working directory"
"use JavaDocGenerator new for: Array to the playground to test"
]

{ #category : 'writing' }
JavaDocGenerator >> writeHTMLDescriptionOn: aStream for: aClass [
	"used to write the description of the class"
	aStream 
		nextPutAll: '<h2> Description for the ';
		nextPutAll: aClass name;
		nextPutAll: ' Class: </h2>';
		nextPutAll: '<div>';
		nextPutAll:  aClass comment;
		nextPutAll: '</div>'.
]

{ #category : 'writing' }
JavaDocGenerator >> writeHTMLHeaderOn: aStream for: aClass [
	"Écrit le commentaire de la classe."
	aStream 
		nextPutAll: '<h2>Description</h2>';
		nextPutAll: '<p>';
		nextPutAll: (aClass comment ifNil: [ 'No description available.' ]);
		nextPutAll: '</p>'.
]
