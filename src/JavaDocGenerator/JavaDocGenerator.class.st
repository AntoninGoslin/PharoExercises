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
	"delete the previous version of the file"
	file ensureDelete.
	
	file writeStreamDo: [ :stream |
								self writeHTMLHeaderOn: stream for: aClass. 
								self writeHTMLDescriptionOn: stream for: aClass.
								self writeHTMLMethodsOn: stream for: aClass.
							 ].
	"open the file directly in the web browser"
	"WebBrowser openOn: file asUrl."
	
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
	"using cascade to solve the warning"
	"we are only using aStream one time"
	aStream 
		nextPutAll: '<!DOCTYPE html>';
		nextPutAll: '<html>';
		nextPutAll: '<head>';
		nextPutAll: '<title> Javadoc of ';
		nextPutAll: aClass name;
		nextPutAll: '</title>';
		nextPutAll: '</head>';
		nextPutAll: '<body>';
		nextPutAll: '<h1> Javadoc for class ';
		nextPutAll: aClass name;
		nextPutAll: '</h1>'. 
]

{ #category : 'writing' }
JavaDocGenerator >> writeHTMLMethod: aMethod on: aStream [
	"used to write the method of the class"
	aStream 
		nextPutAll: '<li>';
		nextPutAll: aMethod selector;
		nextPutAll: '</li>'.
]

{ #category : 'writing' }
JavaDocGenerator >> writeHTMLMethodsOn: aStream for: aClass [
	"used to write the list of method of the class"
	aStream
		nextPutAll: '<h2> Methods list for the ';
		nextPutAll: aClass name;
		nextPutAll: ' Class: </h2>';
		nextPutAll: '<ul>'.
	
	aClass methods do: [ :currentMethod | 
		self writeHTMLMethod: currentMethod on: aStream 
	].

	aStream nextPutAll: '</ul>'.
]
