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
								self writeHTMLHeaderOn: stream for: aClass 
							 ].
	"open the file directly in the web browser"
	WebBrowser openOn: file asUrl.
	
	^file

"JavaDocGenerator new for: MyLinkedList in the playground to see the result"
"FileLocator workingDirectory to see the working directory"
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
