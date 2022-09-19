!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JL 9/19/2022 12:55:31'!
test01TestWinter
	| stack rta|
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of winter'.
	stack push: 'Winter is here'.
	rta:=SentenceFinderByPrefix new findSentencesByPrefix: 'Wint' inStack: stack.
	self assert: rta size = 1.
	self assert: rta includes: 'Winter is here'.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JL 9/19/2022 12:44:49'!
test02CaseSensitive
	| stack rta|
	stack := OOStack new.
	stack push: 'Winter'.
	stack push: 'winter'.
	rta := SentenceFinderByPrefix new findSentencesByPrefix: 'Wint' inStack: stack.
	self assert: rta size = 1.
	self assert: rta includes: 'Winter'.
	self deny: (rta includes: 'winter').! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JL 9/19/2022 12:47:04'!
test03StackDoesntChange
	|stack|
	stack := OOStack new.
	
	stack push: 'Winter'.
	stack push: 'winter'.
	
	SentenceFinderByPrefix new findSentencesByPrefix: 'Wint' inStack: stack.
	
	self assert: stack size = 2.
	self assert: stack pop = 'winter'.
	self assert: stack pop = 'Winter'! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'JL 9/19/2022 12:53:15'!
test04EmptyStack
	|stack rta |
	stack := OOStack new.
	
	rta := SentenceFinderByPrefix new findSentencesByPrefix: 'Wint' inStack: stack.
	
	self assert: rta size = 0.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'MMM 9/18/2022 22:39:24'!
initialize
	top:= OOStackNullElement new.
	size:=0.! !


!OOStack methodsFor: 'testing' stamp: 'MMM 9/18/2022 22:40:32'!
isEmpty
	^ size=0.! !


!OOStack methodsFor: 'stack management' stamp: 'MMM 9/18/2022 22:39:48'!
pop
	|topValue|
	topValue := top value.
	top:=(top previous).
	size:=size-1.
	^topValue.! !

!OOStack methodsFor: 'stack management' stamp: 'MMM 9/18/2022 22:40:01'!
push: aNewValue
	top:=OOStackValidElement initializeWithValue: aNewValue andPreviousElement: top.
	size:=size+1.! !


!OOStack methodsFor: 'accessing' stamp: 'JL 9/19/2022 12:58:14'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'MMM 9/18/2022 22:29:12'!
top
	^top value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackElement category: 'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'accessing' stamp: 'MMM 9/18/2022 22:27:48'!
previous
	self subclassResponsibility .! !

!OOStackElement methodsFor: 'accessing' stamp: 'MMM 9/18/2022 21:58:07'!
value
	self subclassResponsibility .! !


!classDefinition: #OOStackNullElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackNullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNullElement methodsFor: 'accessing' stamp: 'MMM 9/18/2022 22:44:03'!
previous
	self error: OOStack stackEmptyErrorDescription! !

!OOStackNullElement methodsFor: 'accessing' stamp: 'MMM 9/18/2022 22:44:10'!
value
	self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #OOStackValidElement category: 'Stack-Exercise'!
OOStackElement subclass: #OOStackValidElement
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackValidElement methodsFor: 'initialization' stamp: 'JL 9/19/2022 13:00:16'!
initializeWithValue: aValue andPreviousElement: previousElement
	value := aValue.
	previous := previousElement.! !


!OOStackValidElement methodsFor: 'accessing' stamp: 'MMM 9/18/2022 22:28:10'!
previous
	^previous.! !

!OOStackValidElement methodsFor: 'accessing' stamp: 'MMM 9/18/2022 22:28:21'!
value
	^value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackValidElement class' category: 'Stack-Exercise'!
OOStackValidElement class
	instanceVariableNames: ''!

!OOStackValidElement class methodsFor: 'intialization' stamp: 'MMM 9/18/2022 22:42:42'!
initializeWithValue: aNewValue andPreviousElement: previousElement
	^self new initializeWithValue: aNewValue andPreviousElement: previousElement.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'JL 9/19/2022 13:24:03'!
pushAll: auxStack into: aStack

	^ [auxStack isEmpty] whileFalse: [aStack push: auxStack pop]! !

!SentenceFinderByPrefix methodsFor: 'finder - private' stamp: 'JL 9/19/2022 13:23:41'!
select: aBlock fromStack: aStack
	|newCollection auxStack|
	auxStack := OOStack new.
	newCollection := OrderedCollection new.
	
	[aStack isEmpty] whileFalse: [
		|each|
		each := aStack pop .
		(aBlock value: each) ifTrue: [newCollection add: each].
		auxStack push: each.
		].
	
	
	self pushAll: auxStack into: aStack.
	
	^newCollection! !


!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'JL 9/19/2022 13:24:49'!
findSentencesByPrefix: prefix inStack: aStackOfSentences
	
	^self select: [:sentence | sentence beginsWith: prefix] fromStack: aStackOfSentences .! !
