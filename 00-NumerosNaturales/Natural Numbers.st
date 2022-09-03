!classDefinition: #I category: 'NaturalNumbers'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'NaturalNumbers'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'ARM 8/25/2022 20:43:03'!
next
	^II! !


!I class methodsFor: 'operations' stamp: 'JL 8/29/2022 11:51:25'!
* aProduct

	^aProduct! !

!I class methodsFor: 'operations' stamp: 'ARM 8/25/2022 21:12:30'!
+ anAdder

	^anAdder next! !

!I class methodsFor: 'operations' stamp: 'JL 9/3/2022 16:36:18'!
- subtrahend

	self error: self negativeNumbersNotSupportedErrorDescription! !

!I class methodsFor: 'operations' stamp: 'JL 9/3/2022 16:42:49'!
/ aDivider
	aDivider = self ifTrue:[^I].
	self error: II canNotDivideByBiggerNumberErrorDescription.! !

!I class methodsFor: 'operations' stamp: 'JL 9/3/2022 16:45:56'!
< aNumber
	aNumber = self ifTrue: [^false].
	^true

	! !

!I class methodsFor: 'operations' stamp: 'jl 8/29/2022 20:54:34'!
substractFrom: aMinuend
	^aMinuend previous! !


!I class methodsFor: 'errors' stamp: 'JL 9/2/2022 18:51:57'!
negativeNumbersNotSupportedErrorDescription
	^'In natural numbers, can not substract a number minus a bigger or equal number'! !


!classDefinition: #II category: 'NaturalNumbers'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'NaturalNumbers'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'next & previous' stamp: 'JL 9/1/2022 14:12:48'!
nameOfNext

	(self name endsWith: 'CMXCIX') ifTrue: [^ (self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue: [^ (self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue: [^ (self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue: [^ (self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue: [^ (self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue: [^ (self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue: [^ (self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue: [^ (self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'VIII') ifTrue: [^ (self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'III') ifTrue: [^ (self name withoutSuffix: 'III'), 'IV'].
	(self name endsWith: 'IV') ifTrue: [^ (self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'IX') ifTrue: [^ (self name withoutSuffix: 'IX'), 'X'].
	^ self name , 'I'! !

!II class methodsFor: 'next & previous' stamp: 'jl 8/29/2022 21:17:20'!
next
	next ifNil:[
		next _ II createChildNamed: self nameOfNext.
		next previous: self.
		].
	^next! !

!II class methodsFor: 'next & previous' stamp: 'ARM 8/25/2022 21:21:12'!
previous

	^previous! !

!II class methodsFor: 'next & previous' stamp: 'ARM 8/25/2022 21:25:57'!
previous: aNumber 

	previous := aNumber! !


!II class methodsFor: 'remove all next' stamp: 'ARM 8/25/2022 21:37:56'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!II class methodsFor: 'operations' stamp: 'JL 8/29/2022 11:54:16'!
* aProduct
	^(self previous * aProduct) + aProduct! !

!II class methodsFor: 'operations' stamp: 'ARM 8/25/2022 21:19:09'!
+ anAdder 

	^self previous + anAdder next! !

!II class methodsFor: 'operations' stamp: 'jl 8/29/2022 21:06:37'!
- subtrahend 
	^subtrahend substractFrom: self.! !

!II class methodsFor: 'operations' stamp: 'JL 9/3/2022 16:51:24'!
/ aDivider
	self < aDivider ifTrue: [^self error: II canNotDivideByBiggerNumberErrorDescription ].
	aDivider = self ifTrue: [^I].
	^((self - aDivider)/ aDivider) + I! !

!II class methodsFor: 'operations' stamp: 'JL 9/3/2022 16:49:27'!
< aNumber
	aNumber = self ifTrue: [^false].
	aNumber = I ifTrue: [^false].
	self = I ifTrue: [^true].
	^ self previous < aNumber previous! !

!II class methodsFor: 'operations' stamp: 'jl 8/29/2022 21:05:51'!
substractFrom: aMinuend
	^ aMinuend previous - self previous
	! !


!II class methodsFor: 'errors' stamp: 'JL 9/3/2022 16:40:47'!
canNotDivideByBiggerNumberErrorDescription
	^'No se puede dividir por un numero mayor'! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 16:52:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #III category: 'NaturalNumbers'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'NaturalNumbers'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 16:52:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: 'NaturalNumbers'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'NaturalNumbers'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 16:52:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := V.
	previous := III.! !


!classDefinition: #V category: 'NaturalNumbers'!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: 'NaturalNumbers'!
V class
	instanceVariableNames: ''!

!V class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 16:52:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VI.
	previous := IV.! !


!classDefinition: #VI category: 'NaturalNumbers'!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: 'NaturalNumbers'!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 16:52:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := V.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!