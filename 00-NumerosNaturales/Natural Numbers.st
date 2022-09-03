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

!II class methodsFor: 'next & previous' stamp: 'JL 9/3/2022 16:55:02'!
nameOfNext

	(self name endsWith: 'CMXCIX') ifTrue: [^ (self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue: [^ (self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue: [^ (self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue: [^ (self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue: [^ (self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue: [^ (self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue: [^ (self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue: [^ (self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX') ifTrue: [^ (self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'VIII') ifTrue: [^ (self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue: [^ (self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III') ifTrue: [^ (self name withoutSuffix: 'III'), 'IV'].
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


!II class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !


!classDefinition: #C category: 'NaturalNumbers'!
II subclass: #C
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'C class' category: 'NaturalNumbers'!
C class
	instanceVariableNames: ''!

!C class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CI.
	previous := XCIX.! !


!classDefinition: #CC category: 'NaturalNumbers'!
II subclass: #CC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CC class' category: 'NaturalNumbers'!
CC class
	instanceVariableNames: ''!

!CC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCI.
	previous := CXCIX.! !


!classDefinition: #CCC category: 'NaturalNumbers'!
II subclass: #CCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCC class' category: 'NaturalNumbers'!
CCC class
	instanceVariableNames: ''!

!CCC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCI.
	previous := CCXCIX.! !


!classDefinition: #CCCI category: 'NaturalNumbers'!
II subclass: #CCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCI class' category: 'NaturalNumbers'!
CCCI class
	instanceVariableNames: ''!

!CCCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCII.
	previous := CCC.! !


!classDefinition: #CCCII category: 'NaturalNumbers'!
II subclass: #CCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCII class' category: 'NaturalNumbers'!
CCCII class
	instanceVariableNames: ''!

!CCCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIII.
	previous := CCCI.! !


!classDefinition: #CCCIII category: 'NaturalNumbers'!
II subclass: #CCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIII class' category: 'NaturalNumbers'!
CCCIII class
	instanceVariableNames: ''!

!CCCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIV.
	previous := CCCII.! !


!classDefinition: #CCCIV category: 'NaturalNumbers'!
II subclass: #CCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIV class' category: 'NaturalNumbers'!
CCCIV class
	instanceVariableNames: ''!

!CCCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCV.
	previous := CCCIII.! !


!classDefinition: #CCCIX category: 'NaturalNumbers'!
II subclass: #CCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIX class' category: 'NaturalNumbers'!
CCCIX class
	instanceVariableNames: ''!

!CCCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCX.
	previous := CCCVIII.! !


!classDefinition: #CCCL category: 'NaturalNumbers'!
II subclass: #CCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCL class' category: 'NaturalNumbers'!
CCCL class
	instanceVariableNames: ''!

!CCCL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLI.
	previous := CCCXLIX.! !


!classDefinition: #CCCLI category: 'NaturalNumbers'!
II subclass: #CCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLI class' category: 'NaturalNumbers'!
CCCLI class
	instanceVariableNames: ''!

!CCCLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLII.
	previous := CCCL.! !


!classDefinition: #CCCLII category: 'NaturalNumbers'!
II subclass: #CCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLII class' category: 'NaturalNumbers'!
CCCLII class
	instanceVariableNames: ''!

!CCCLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIII.
	previous := CCCLI.! !


!classDefinition: #CCCLIII category: 'NaturalNumbers'!
II subclass: #CCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIII class' category: 'NaturalNumbers'!
CCCLIII class
	instanceVariableNames: ''!

!CCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIV.
	previous := CCCLII.! !


!classDefinition: #CCCLIV category: 'NaturalNumbers'!
II subclass: #CCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIV class' category: 'NaturalNumbers'!
CCCLIV class
	instanceVariableNames: ''!

!CCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLV.
	previous := CCCLIII.! !


!classDefinition: #CCCLIX category: 'NaturalNumbers'!
II subclass: #CCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIX class' category: 'NaturalNumbers'!
CCCLIX class
	instanceVariableNames: ''!

!CCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLX.
	previous := CCCLVIII.! !


!classDefinition: #CCCLV category: 'NaturalNumbers'!
II subclass: #CCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLV class' category: 'NaturalNumbers'!
CCCLV class
	instanceVariableNames: ''!

!CCCLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVI.
	previous := CCCLIV.! !


!classDefinition: #CCCLVI category: 'NaturalNumbers'!
II subclass: #CCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVI class' category: 'NaturalNumbers'!
CCCLVI class
	instanceVariableNames: ''!

!CCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVII.
	previous := CCCLV.! !


!classDefinition: #CCCLVII category: 'NaturalNumbers'!
II subclass: #CCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVII class' category: 'NaturalNumbers'!
CCCLVII class
	instanceVariableNames: ''!

!CCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVIII.
	previous := CCCLVI.! !


!classDefinition: #CCCLVIII category: 'NaturalNumbers'!
II subclass: #CCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVIII class' category: 'NaturalNumbers'!
CCCLVIII class
	instanceVariableNames: ''!

!CCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIX.
	previous := CCCLVII.! !


!classDefinition: #CCCLX category: 'NaturalNumbers'!
II subclass: #CCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLX class' category: 'NaturalNumbers'!
CCCLX class
	instanceVariableNames: ''!

!CCCLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXI.
	previous := CCCLIX.! !


!classDefinition: #CCCLXI category: 'NaturalNumbers'!
II subclass: #CCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXI class' category: 'NaturalNumbers'!
CCCLXI class
	instanceVariableNames: ''!

!CCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXII.
	previous := CCCLX.! !


!classDefinition: #CCCLXII category: 'NaturalNumbers'!
II subclass: #CCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXII class' category: 'NaturalNumbers'!
CCCLXII class
	instanceVariableNames: ''!

!CCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIII.
	previous := CCCLXI.! !


!classDefinition: #CCCLXIII category: 'NaturalNumbers'!
II subclass: #CCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIII class' category: 'NaturalNumbers'!
CCCLXIII class
	instanceVariableNames: ''!

!CCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIV.
	previous := CCCLXII.! !


!classDefinition: #CCCLXIV category: 'NaturalNumbers'!
II subclass: #CCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIV class' category: 'NaturalNumbers'!
CCCLXIV class
	instanceVariableNames: ''!

!CCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXV.
	previous := CCCLXIII.! !


!classDefinition: #CCCLXIX category: 'NaturalNumbers'!
II subclass: #CCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIX class' category: 'NaturalNumbers'!
CCCLXIX class
	instanceVariableNames: ''!

!CCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXX.
	previous := CCCLXVIII.! !


!classDefinition: #CCCLXV category: 'NaturalNumbers'!
II subclass: #CCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXV class' category: 'NaturalNumbers'!
CCCLXV class
	instanceVariableNames: ''!

!CCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVI.
	previous := CCCLXIV.! !


!classDefinition: #CCCLXVI category: 'NaturalNumbers'!
II subclass: #CCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVI class' category: 'NaturalNumbers'!
CCCLXVI class
	instanceVariableNames: ''!

!CCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVII.
	previous := CCCLXV.! !


!classDefinition: #CCCLXVII category: 'NaturalNumbers'!
II subclass: #CCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVII class' category: 'NaturalNumbers'!
CCCLXVII class
	instanceVariableNames: ''!

!CCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVIII.
	previous := CCCLXVI.! !


!classDefinition: #CCCLXVIII category: 'NaturalNumbers'!
II subclass: #CCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVIII class' category: 'NaturalNumbers'!
CCCLXVIII class
	instanceVariableNames: ''!

!CCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIX.
	previous := CCCLXVII.! !


!classDefinition: #CCCLXX category: 'NaturalNumbers'!
II subclass: #CCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXX class' category: 'NaturalNumbers'!
CCCLXX class
	instanceVariableNames: ''!

!CCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXI.
	previous := CCCLXIX.! !


!classDefinition: #CCCLXXI category: 'NaturalNumbers'!
II subclass: #CCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXI class' category: 'NaturalNumbers'!
CCCLXXI class
	instanceVariableNames: ''!

!CCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXII.
	previous := CCCLXX.! !


!classDefinition: #CCCLXXII category: 'NaturalNumbers'!
II subclass: #CCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXII class' category: 'NaturalNumbers'!
CCCLXXII class
	instanceVariableNames: ''!

!CCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIII.
	previous := CCCLXXI.! !


!classDefinition: #CCCLXXIII category: 'NaturalNumbers'!
II subclass: #CCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIII class' category: 'NaturalNumbers'!
CCCLXXIII class
	instanceVariableNames: ''!

!CCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIV.
	previous := CCCLXXII.! !


!classDefinition: #CCCLXXIV category: 'NaturalNumbers'!
II subclass: #CCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIV class' category: 'NaturalNumbers'!
CCCLXXIV class
	instanceVariableNames: ''!

!CCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXV.
	previous := CCCLXXIII.! !


!classDefinition: #CCCLXXIX category: 'NaturalNumbers'!
II subclass: #CCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIX class' category: 'NaturalNumbers'!
CCCLXXIX class
	instanceVariableNames: ''!

!CCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXX.
	previous := CCCLXXVIII.! !


!classDefinition: #CCCLXXV category: 'NaturalNumbers'!
II subclass: #CCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXV class' category: 'NaturalNumbers'!
CCCLXXV class
	instanceVariableNames: ''!

!CCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVI.
	previous := CCCLXXIV.! !


!classDefinition: #CCCLXXVI category: 'NaturalNumbers'!
II subclass: #CCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVI class' category: 'NaturalNumbers'!
CCCLXXVI class
	instanceVariableNames: ''!

!CCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVII.
	previous := CCCLXXV.! !


!classDefinition: #CCCLXXVII category: 'NaturalNumbers'!
II subclass: #CCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVII class' category: 'NaturalNumbers'!
CCCLXXVII class
	instanceVariableNames: ''!

!CCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVIII.
	previous := CCCLXXVI.! !


!classDefinition: #CCCLXXVIII category: 'NaturalNumbers'!
II subclass: #CCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVIII class' category: 'NaturalNumbers'!
CCCLXXVIII class
	instanceVariableNames: ''!

!CCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIX.
	previous := CCCLXXVII.! !


!classDefinition: #CCCLXXX category: 'NaturalNumbers'!
II subclass: #CCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXX class' category: 'NaturalNumbers'!
CCCLXXX class
	instanceVariableNames: ''!

!CCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXI.
	previous := CCCLXXIX.! !


!classDefinition: #CCCLXXXI category: 'NaturalNumbers'!
II subclass: #CCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXI class' category: 'NaturalNumbers'!
CCCLXXXI class
	instanceVariableNames: ''!

!CCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXII.
	previous := CCCLXXX.! !


!classDefinition: #CCCLXXXII category: 'NaturalNumbers'!
II subclass: #CCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXII class' category: 'NaturalNumbers'!
CCCLXXXII class
	instanceVariableNames: ''!

!CCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIII.
	previous := CCCLXXXI.! !


!classDefinition: #CCCLXXXIII category: 'NaturalNumbers'!
II subclass: #CCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIII class' category: 'NaturalNumbers'!
CCCLXXXIII class
	instanceVariableNames: ''!

!CCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIV.
	previous := CCCLXXXII.! !


!classDefinition: #CCCLXXXIV category: 'NaturalNumbers'!
II subclass: #CCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIV class' category: 'NaturalNumbers'!
CCCLXXXIV class
	instanceVariableNames: ''!

!CCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXV.
	previous := CCCLXXXIII.! !


!classDefinition: #CCCLXXXIX category: 'NaturalNumbers'!
II subclass: #CCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIX class' category: 'NaturalNumbers'!
CCCLXXXIX class
	instanceVariableNames: ''!

!CCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXC.
	previous := CCCLXXXVIII.! !


!classDefinition: #CCCLXXXV category: 'NaturalNumbers'!
II subclass: #CCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXV class' category: 'NaturalNumbers'!
CCCLXXXV class
	instanceVariableNames: ''!

!CCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVI.
	previous := CCCLXXXIV.! !


!classDefinition: #CCCLXXXVI category: 'NaturalNumbers'!
II subclass: #CCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVI class' category: 'NaturalNumbers'!
CCCLXXXVI class
	instanceVariableNames: ''!

!CCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVII.
	previous := CCCLXXXV.! !


!classDefinition: #CCCLXXXVII category: 'NaturalNumbers'!
II subclass: #CCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVII class' category: 'NaturalNumbers'!
CCCLXXXVII class
	instanceVariableNames: ''!

!CCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVIII.
	previous := CCCLXXXVI.! !


!classDefinition: #CCCLXXXVIII category: 'NaturalNumbers'!
II subclass: #CCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVIII class' category: 'NaturalNumbers'!
CCCLXXXVIII class
	instanceVariableNames: ''!

!CCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIX.
	previous := CCCLXXXVII.! !


!classDefinition: #CCCV category: 'NaturalNumbers'!
II subclass: #CCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCV class' category: 'NaturalNumbers'!
CCCV class
	instanceVariableNames: ''!

!CCCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVI.
	previous := CCCIV.! !


!classDefinition: #CCCVI category: 'NaturalNumbers'!
II subclass: #CCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVI class' category: 'NaturalNumbers'!
CCCVI class
	instanceVariableNames: ''!

!CCCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVII.
	previous := CCCV.! !


!classDefinition: #CCCVII category: 'NaturalNumbers'!
II subclass: #CCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVII class' category: 'NaturalNumbers'!
CCCVII class
	instanceVariableNames: ''!

!CCCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVIII.
	previous := CCCVI.! !


!classDefinition: #CCCVIII category: 'NaturalNumbers'!
II subclass: #CCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVIII class' category: 'NaturalNumbers'!
CCCVIII class
	instanceVariableNames: ''!

!CCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIX.
	previous := CCCVII.! !


!classDefinition: #CCCX category: 'NaturalNumbers'!
II subclass: #CCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCX class' category: 'NaturalNumbers'!
CCCX class
	instanceVariableNames: ''!

!CCCX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXI.
	previous := CCCIX.! !


!classDefinition: #CCCXC category: 'NaturalNumbers'!
II subclass: #CCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXC class' category: 'NaturalNumbers'!
CCCXC class
	instanceVariableNames: ''!

!CCCXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCI.
	previous := CCCLXXXIX.! !


!classDefinition: #CCCXCI category: 'NaturalNumbers'!
II subclass: #CCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCI class' category: 'NaturalNumbers'!
CCCXCI class
	instanceVariableNames: ''!

!CCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCII.
	previous := CCCXC.! !


!classDefinition: #CCCXCII category: 'NaturalNumbers'!
II subclass: #CCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCII class' category: 'NaturalNumbers'!
CCCXCII class
	instanceVariableNames: ''!

!CCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIII.
	previous := CCCXCI.! !


!classDefinition: #CCCXCIII category: 'NaturalNumbers'!
II subclass: #CCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIII class' category: 'NaturalNumbers'!
CCCXCIII class
	instanceVariableNames: ''!

!CCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIV.
	previous := CCCXCII.! !


!classDefinition: #CCCXCIV category: 'NaturalNumbers'!
II subclass: #CCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIV class' category: 'NaturalNumbers'!
CCCXCIV class
	instanceVariableNames: ''!

!CCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCV.
	previous := CCCXCIII.! !


!classDefinition: #CCCXCIX category: 'NaturalNumbers'!
II subclass: #CCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIX class' category: 'NaturalNumbers'!
CCCXCIX class
	instanceVariableNames: ''!

!CCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CD.
	previous := CCCXCVIII.! !


!classDefinition: #CCCXCV category: 'NaturalNumbers'!
II subclass: #CCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCV class' category: 'NaturalNumbers'!
CCCXCV class
	instanceVariableNames: ''!

!CCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVI.
	previous := CCCXCIV.! !


!classDefinition: #CCCXCVI category: 'NaturalNumbers'!
II subclass: #CCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVI class' category: 'NaturalNumbers'!
CCCXCVI class
	instanceVariableNames: ''!

!CCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVII.
	previous := CCCXCV.! !


!classDefinition: #CCCXCVII category: 'NaturalNumbers'!
II subclass: #CCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVII class' category: 'NaturalNumbers'!
CCCXCVII class
	instanceVariableNames: ''!

!CCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVIII.
	previous := CCCXCVI.! !


!classDefinition: #CCCXCVIII category: 'NaturalNumbers'!
II subclass: #CCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVIII class' category: 'NaturalNumbers'!
CCCXCVIII class
	instanceVariableNames: ''!

!CCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIX.
	previous := CCCXCVII.! !


!classDefinition: #CCCXI category: 'NaturalNumbers'!
II subclass: #CCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXI class' category: 'NaturalNumbers'!
CCCXI class
	instanceVariableNames: ''!

!CCCXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXII.
	previous := CCCX.! !


!classDefinition: #CCCXII category: 'NaturalNumbers'!
II subclass: #CCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXII class' category: 'NaturalNumbers'!
CCCXII class
	instanceVariableNames: ''!

!CCCXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIII.
	previous := CCCXI.! !


!classDefinition: #CCCXIII category: 'NaturalNumbers'!
II subclass: #CCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIII class' category: 'NaturalNumbers'!
CCCXIII class
	instanceVariableNames: ''!

!CCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIV.
	previous := CCCXII.! !


!classDefinition: #CCCXIV category: 'NaturalNumbers'!
II subclass: #CCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIV class' category: 'NaturalNumbers'!
CCCXIV class
	instanceVariableNames: ''!

!CCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXV.
	previous := CCCXIII.! !


!classDefinition: #CCCXIX category: 'NaturalNumbers'!
II subclass: #CCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIX class' category: 'NaturalNumbers'!
CCCXIX class
	instanceVariableNames: ''!

!CCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXX.
	previous := CCCXVIII.! !


!classDefinition: #CCCXL category: 'NaturalNumbers'!
II subclass: #CCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXL class' category: 'NaturalNumbers'!
CCCXL class
	instanceVariableNames: ''!

!CCCXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLI.
	previous := CCCXXXIX.! !


!classDefinition: #CCCXLI category: 'NaturalNumbers'!
II subclass: #CCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLI class' category: 'NaturalNumbers'!
CCCXLI class
	instanceVariableNames: ''!

!CCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLII.
	previous := CCCXL.! !


!classDefinition: #CCCXLII category: 'NaturalNumbers'!
II subclass: #CCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLII class' category: 'NaturalNumbers'!
CCCXLII class
	instanceVariableNames: ''!

!CCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIII.
	previous := CCCXLI.! !


!classDefinition: #CCCXLIII category: 'NaturalNumbers'!
II subclass: #CCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIII class' category: 'NaturalNumbers'!
CCCXLIII class
	instanceVariableNames: ''!

!CCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIV.
	previous := CCCXLII.! !


!classDefinition: #CCCXLIV category: 'NaturalNumbers'!
II subclass: #CCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIV class' category: 'NaturalNumbers'!
CCCXLIV class
	instanceVariableNames: ''!

!CCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLV.
	previous := CCCXLIII.! !


!classDefinition: #CCCXLIX category: 'NaturalNumbers'!
II subclass: #CCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIX class' category: 'NaturalNumbers'!
CCCXLIX class
	instanceVariableNames: ''!

!CCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCL.
	previous := CCCXLVIII.! !


!classDefinition: #CCCXLV category: 'NaturalNumbers'!
II subclass: #CCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLV class' category: 'NaturalNumbers'!
CCCXLV class
	instanceVariableNames: ''!

!CCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVI.
	previous := CCCXLIV.! !


!classDefinition: #CCCXLVI category: 'NaturalNumbers'!
II subclass: #CCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVI class' category: 'NaturalNumbers'!
CCCXLVI class
	instanceVariableNames: ''!

!CCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVII.
	previous := CCCXLV.! !


!classDefinition: #CCCXLVII category: 'NaturalNumbers'!
II subclass: #CCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVII class' category: 'NaturalNumbers'!
CCCXLVII class
	instanceVariableNames: ''!

!CCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVIII.
	previous := CCCXLVI.! !


!classDefinition: #CCCXLVIII category: 'NaturalNumbers'!
II subclass: #CCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVIII class' category: 'NaturalNumbers'!
CCCXLVIII class
	instanceVariableNames: ''!

!CCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIX.
	previous := CCCXLVII.! !


!classDefinition: #CCCXV category: 'NaturalNumbers'!
II subclass: #CCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXV class' category: 'NaturalNumbers'!
CCCXV class
	instanceVariableNames: ''!

!CCCXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVI.
	previous := CCCXIV.! !


!classDefinition: #CCCXVI category: 'NaturalNumbers'!
II subclass: #CCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVI class' category: 'NaturalNumbers'!
CCCXVI class
	instanceVariableNames: ''!

!CCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVII.
	previous := CCCXV.! !


!classDefinition: #CCCXVII category: 'NaturalNumbers'!
II subclass: #CCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVII class' category: 'NaturalNumbers'!
CCCXVII class
	instanceVariableNames: ''!

!CCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVIII.
	previous := CCCXVI.! !


!classDefinition: #CCCXVIII category: 'NaturalNumbers'!
II subclass: #CCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVIII class' category: 'NaturalNumbers'!
CCCXVIII class
	instanceVariableNames: ''!

!CCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIX.
	previous := CCCXVII.! !


!classDefinition: #CCCXX category: 'NaturalNumbers'!
II subclass: #CCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXX class' category: 'NaturalNumbers'!
CCCXX class
	instanceVariableNames: ''!

!CCCXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXI.
	previous := CCCXIX.! !


!classDefinition: #CCCXXI category: 'NaturalNumbers'!
II subclass: #CCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXI class' category: 'NaturalNumbers'!
CCCXXI class
	instanceVariableNames: ''!

!CCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXII.
	previous := CCCXX.! !


!classDefinition: #CCCXXII category: 'NaturalNumbers'!
II subclass: #CCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXII class' category: 'NaturalNumbers'!
CCCXXII class
	instanceVariableNames: ''!

!CCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIII.
	previous := CCCXXI.! !


!classDefinition: #CCCXXIII category: 'NaturalNumbers'!
II subclass: #CCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIII class' category: 'NaturalNumbers'!
CCCXXIII class
	instanceVariableNames: ''!

!CCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIV.
	previous := CCCXXII.! !


!classDefinition: #CCCXXIV category: 'NaturalNumbers'!
II subclass: #CCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIV class' category: 'NaturalNumbers'!
CCCXXIV class
	instanceVariableNames: ''!

!CCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXV.
	previous := CCCXXIII.! !


!classDefinition: #CCCXXIX category: 'NaturalNumbers'!
II subclass: #CCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIX class' category: 'NaturalNumbers'!
CCCXXIX class
	instanceVariableNames: ''!

!CCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXX.
	previous := CCCXXVIII.! !


!classDefinition: #CCCXXV category: 'NaturalNumbers'!
II subclass: #CCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXV class' category: 'NaturalNumbers'!
CCCXXV class
	instanceVariableNames: ''!

!CCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVI.
	previous := CCCXXIV.! !


!classDefinition: #CCCXXVI category: 'NaturalNumbers'!
II subclass: #CCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVI class' category: 'NaturalNumbers'!
CCCXXVI class
	instanceVariableNames: ''!

!CCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVII.
	previous := CCCXXV.! !


!classDefinition: #CCCXXVII category: 'NaturalNumbers'!
II subclass: #CCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVII class' category: 'NaturalNumbers'!
CCCXXVII class
	instanceVariableNames: ''!

!CCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVIII.
	previous := CCCXXVI.! !


!classDefinition: #CCCXXVIII category: 'NaturalNumbers'!
II subclass: #CCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVIII class' category: 'NaturalNumbers'!
CCCXXVIII class
	instanceVariableNames: ''!

!CCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIX.
	previous := CCCXXVII.! !


!classDefinition: #CCCXXX category: 'NaturalNumbers'!
II subclass: #CCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXX class' category: 'NaturalNumbers'!
CCCXXX class
	instanceVariableNames: ''!

!CCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXI.
	previous := CCCXXIX.! !


!classDefinition: #CCCXXXI category: 'NaturalNumbers'!
II subclass: #CCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXI class' category: 'NaturalNumbers'!
CCCXXXI class
	instanceVariableNames: ''!

!CCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXII.
	previous := CCCXXX.! !


!classDefinition: #CCCXXXII category: 'NaturalNumbers'!
II subclass: #CCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXII class' category: 'NaturalNumbers'!
CCCXXXII class
	instanceVariableNames: ''!

!CCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIII.
	previous := CCCXXXI.! !


!classDefinition: #CCCXXXIII category: 'NaturalNumbers'!
II subclass: #CCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIII class' category: 'NaturalNumbers'!
CCCXXXIII class
	instanceVariableNames: ''!

!CCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIV.
	previous := CCCXXXII.! !


!classDefinition: #CCCXXXIV category: 'NaturalNumbers'!
II subclass: #CCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIV class' category: 'NaturalNumbers'!
CCCXXXIV class
	instanceVariableNames: ''!

!CCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXV.
	previous := CCCXXXIII.! !


!classDefinition: #CCCXXXIX category: 'NaturalNumbers'!
II subclass: #CCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIX class' category: 'NaturalNumbers'!
CCCXXXIX class
	instanceVariableNames: ''!

!CCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXL.
	previous := CCCXXXVIII.! !


!classDefinition: #CCCXXXV category: 'NaturalNumbers'!
II subclass: #CCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXV class' category: 'NaturalNumbers'!
CCCXXXV class
	instanceVariableNames: ''!

!CCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVI.
	previous := CCCXXXIV.! !


!classDefinition: #CCCXXXVI category: 'NaturalNumbers'!
II subclass: #CCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVI class' category: 'NaturalNumbers'!
CCCXXXVI class
	instanceVariableNames: ''!

!CCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVII.
	previous := CCCXXXV.! !


!classDefinition: #CCCXXXVII category: 'NaturalNumbers'!
II subclass: #CCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVII class' category: 'NaturalNumbers'!
CCCXXXVII class
	instanceVariableNames: ''!

!CCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVIII.
	previous := CCCXXXVI.! !


!classDefinition: #CCCXXXVIII category: 'NaturalNumbers'!
II subclass: #CCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVIII class' category: 'NaturalNumbers'!
CCCXXXVIII class
	instanceVariableNames: ''!

!CCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIX.
	previous := CCCXXXVII.! !


!classDefinition: #CCI category: 'NaturalNumbers'!
II subclass: #CCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCI class' category: 'NaturalNumbers'!
CCI class
	instanceVariableNames: ''!

!CCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCII.
	previous := CC.! !


!classDefinition: #CCII category: 'NaturalNumbers'!
II subclass: #CCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCII class' category: 'NaturalNumbers'!
CCII class
	instanceVariableNames: ''!

!CCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIII.
	previous := CCI.! !


!classDefinition: #CCIII category: 'NaturalNumbers'!
II subclass: #CCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIII class' category: 'NaturalNumbers'!
CCIII class
	instanceVariableNames: ''!

!CCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIV.
	previous := CCII.! !


!classDefinition: #CCIV category: 'NaturalNumbers'!
II subclass: #CCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIV class' category: 'NaturalNumbers'!
CCIV class
	instanceVariableNames: ''!

!CCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCV.
	previous := CCIII.! !


!classDefinition: #CCIX category: 'NaturalNumbers'!
II subclass: #CCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIX class' category: 'NaturalNumbers'!
CCIX class
	instanceVariableNames: ''!

!CCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCX.
	previous := CCVIII.! !


!classDefinition: #CCL category: 'NaturalNumbers'!
II subclass: #CCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCL class' category: 'NaturalNumbers'!
CCL class
	instanceVariableNames: ''!

!CCL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLI.
	previous := CCXLIX.! !


!classDefinition: #CCLI category: 'NaturalNumbers'!
II subclass: #CCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLI class' category: 'NaturalNumbers'!
CCLI class
	instanceVariableNames: ''!

!CCLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLII.
	previous := CCL.! !


!classDefinition: #CCLII category: 'NaturalNumbers'!
II subclass: #CCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLII class' category: 'NaturalNumbers'!
CCLII class
	instanceVariableNames: ''!

!CCLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIII.
	previous := CCLI.! !


!classDefinition: #CCLIII category: 'NaturalNumbers'!
II subclass: #CCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIII class' category: 'NaturalNumbers'!
CCLIII class
	instanceVariableNames: ''!

!CCLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIV.
	previous := CCLII.! !


!classDefinition: #CCLIV category: 'NaturalNumbers'!
II subclass: #CCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIV class' category: 'NaturalNumbers'!
CCLIV class
	instanceVariableNames: ''!

!CCLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLV.
	previous := CCLIII.! !


!classDefinition: #CCLIX category: 'NaturalNumbers'!
II subclass: #CCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIX class' category: 'NaturalNumbers'!
CCLIX class
	instanceVariableNames: ''!

!CCLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLX.
	previous := CCLVIII.! !


!classDefinition: #CCLV category: 'NaturalNumbers'!
II subclass: #CCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLV class' category: 'NaturalNumbers'!
CCLV class
	instanceVariableNames: ''!

!CCLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVI.
	previous := CCLIV.! !


!classDefinition: #CCLVI category: 'NaturalNumbers'!
II subclass: #CCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVI class' category: 'NaturalNumbers'!
CCLVI class
	instanceVariableNames: ''!

!CCLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVII.
	previous := CCLV.! !


!classDefinition: #CCLVII category: 'NaturalNumbers'!
II subclass: #CCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVII class' category: 'NaturalNumbers'!
CCLVII class
	instanceVariableNames: ''!

!CCLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVIII.
	previous := CCLVI.! !


!classDefinition: #CCLVIII category: 'NaturalNumbers'!
II subclass: #CCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVIII class' category: 'NaturalNumbers'!
CCLVIII class
	instanceVariableNames: ''!

!CCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIX.
	previous := CCLVII.! !


!classDefinition: #CCLX category: 'NaturalNumbers'!
II subclass: #CCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLX class' category: 'NaturalNumbers'!
CCLX class
	instanceVariableNames: ''!

!CCLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXI.
	previous := CCLIX.! !


!classDefinition: #CCLXI category: 'NaturalNumbers'!
II subclass: #CCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXI class' category: 'NaturalNumbers'!
CCLXI class
	instanceVariableNames: ''!

!CCLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXII.
	previous := CCLX.! !


!classDefinition: #CCLXII category: 'NaturalNumbers'!
II subclass: #CCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXII class' category: 'NaturalNumbers'!
CCLXII class
	instanceVariableNames: ''!

!CCLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIII.
	previous := CCLXI.! !


!classDefinition: #CCLXIII category: 'NaturalNumbers'!
II subclass: #CCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIII class' category: 'NaturalNumbers'!
CCLXIII class
	instanceVariableNames: ''!

!CCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIV.
	previous := CCLXII.! !


!classDefinition: #CCLXIV category: 'NaturalNumbers'!
II subclass: #CCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIV class' category: 'NaturalNumbers'!
CCLXIV class
	instanceVariableNames: ''!

!CCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXV.
	previous := CCLXIII.! !


!classDefinition: #CCLXIX category: 'NaturalNumbers'!
II subclass: #CCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIX class' category: 'NaturalNumbers'!
CCLXIX class
	instanceVariableNames: ''!

!CCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXX.
	previous := CCLXVIII.! !


!classDefinition: #CCLXV category: 'NaturalNumbers'!
II subclass: #CCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXV class' category: 'NaturalNumbers'!
CCLXV class
	instanceVariableNames: ''!

!CCLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVI.
	previous := CCLXIV.! !


!classDefinition: #CCLXVI category: 'NaturalNumbers'!
II subclass: #CCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVI class' category: 'NaturalNumbers'!
CCLXVI class
	instanceVariableNames: ''!

!CCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVII.
	previous := CCLXV.! !


!classDefinition: #CCLXVII category: 'NaturalNumbers'!
II subclass: #CCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVII class' category: 'NaturalNumbers'!
CCLXVII class
	instanceVariableNames: ''!

!CCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVIII.
	previous := CCLXVI.! !


!classDefinition: #CCLXVIII category: 'NaturalNumbers'!
II subclass: #CCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVIII class' category: 'NaturalNumbers'!
CCLXVIII class
	instanceVariableNames: ''!

!CCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIX.
	previous := CCLXVII.! !


!classDefinition: #CCLXX category: 'NaturalNumbers'!
II subclass: #CCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXX class' category: 'NaturalNumbers'!
CCLXX class
	instanceVariableNames: ''!

!CCLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXI.
	previous := CCLXIX.! !


!classDefinition: #CCLXXI category: 'NaturalNumbers'!
II subclass: #CCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXI class' category: 'NaturalNumbers'!
CCLXXI class
	instanceVariableNames: ''!

!CCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXII.
	previous := CCLXX.! !


!classDefinition: #CCLXXII category: 'NaturalNumbers'!
II subclass: #CCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXII class' category: 'NaturalNumbers'!
CCLXXII class
	instanceVariableNames: ''!

!CCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIII.
	previous := CCLXXI.! !


!classDefinition: #CCLXXIII category: 'NaturalNumbers'!
II subclass: #CCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIII class' category: 'NaturalNumbers'!
CCLXXIII class
	instanceVariableNames: ''!

!CCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIV.
	previous := CCLXXII.! !


!classDefinition: #CCLXXIV category: 'NaturalNumbers'!
II subclass: #CCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIV class' category: 'NaturalNumbers'!
CCLXXIV class
	instanceVariableNames: ''!

!CCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXV.
	previous := CCLXXIII.! !


!classDefinition: #CCLXXIX category: 'NaturalNumbers'!
II subclass: #CCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIX class' category: 'NaturalNumbers'!
CCLXXIX class
	instanceVariableNames: ''!

!CCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXX.
	previous := CCLXXVIII.! !


!classDefinition: #CCLXXV category: 'NaturalNumbers'!
II subclass: #CCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXV class' category: 'NaturalNumbers'!
CCLXXV class
	instanceVariableNames: ''!

!CCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVI.
	previous := CCLXXIV.! !


!classDefinition: #CCLXXVI category: 'NaturalNumbers'!
II subclass: #CCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVI class' category: 'NaturalNumbers'!
CCLXXVI class
	instanceVariableNames: ''!

!CCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVII.
	previous := CCLXXV.! !


!classDefinition: #CCLXXVII category: 'NaturalNumbers'!
II subclass: #CCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVII class' category: 'NaturalNumbers'!
CCLXXVII class
	instanceVariableNames: ''!

!CCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVIII.
	previous := CCLXXVI.! !


!classDefinition: #CCLXXVIII category: 'NaturalNumbers'!
II subclass: #CCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVIII class' category: 'NaturalNumbers'!
CCLXXVIII class
	instanceVariableNames: ''!

!CCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIX.
	previous := CCLXXVII.! !


!classDefinition: #CCLXXX category: 'NaturalNumbers'!
II subclass: #CCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXX class' category: 'NaturalNumbers'!
CCLXXX class
	instanceVariableNames: ''!

!CCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXI.
	previous := CCLXXIX.! !


!classDefinition: #CCLXXXI category: 'NaturalNumbers'!
II subclass: #CCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXI class' category: 'NaturalNumbers'!
CCLXXXI class
	instanceVariableNames: ''!

!CCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXII.
	previous := CCLXXX.! !


!classDefinition: #CCLXXXII category: 'NaturalNumbers'!
II subclass: #CCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXII class' category: 'NaturalNumbers'!
CCLXXXII class
	instanceVariableNames: ''!

!CCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIII.
	previous := CCLXXXI.! !


!classDefinition: #CCLXXXIII category: 'NaturalNumbers'!
II subclass: #CCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIII class' category: 'NaturalNumbers'!
CCLXXXIII class
	instanceVariableNames: ''!

!CCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIV.
	previous := CCLXXXII.! !


!classDefinition: #CCLXXXIV category: 'NaturalNumbers'!
II subclass: #CCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIV class' category: 'NaturalNumbers'!
CCLXXXIV class
	instanceVariableNames: ''!

!CCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXV.
	previous := CCLXXXIII.! !


!classDefinition: #CCLXXXIX category: 'NaturalNumbers'!
II subclass: #CCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIX class' category: 'NaturalNumbers'!
CCLXXXIX class
	instanceVariableNames: ''!

!CCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXC.
	previous := CCLXXXVIII.! !


!classDefinition: #CCLXXXV category: 'NaturalNumbers'!
II subclass: #CCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXV class' category: 'NaturalNumbers'!
CCLXXXV class
	instanceVariableNames: ''!

!CCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVI.
	previous := CCLXXXIV.! !


!classDefinition: #CCLXXXVI category: 'NaturalNumbers'!
II subclass: #CCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVI class' category: 'NaturalNumbers'!
CCLXXXVI class
	instanceVariableNames: ''!

!CCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVII.
	previous := CCLXXXV.! !


!classDefinition: #CCLXXXVII category: 'NaturalNumbers'!
II subclass: #CCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVII class' category: 'NaturalNumbers'!
CCLXXXVII class
	instanceVariableNames: ''!

!CCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVIII.
	previous := CCLXXXVI.! !


!classDefinition: #CCLXXXVIII category: 'NaturalNumbers'!
II subclass: #CCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVIII class' category: 'NaturalNumbers'!
CCLXXXVIII class
	instanceVariableNames: ''!

!CCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIX.
	previous := CCLXXXVII.! !


!classDefinition: #CCV category: 'NaturalNumbers'!
II subclass: #CCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCV class' category: 'NaturalNumbers'!
CCV class
	instanceVariableNames: ''!

!CCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVI.
	previous := CCIV.! !


!classDefinition: #CCVI category: 'NaturalNumbers'!
II subclass: #CCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVI class' category: 'NaturalNumbers'!
CCVI class
	instanceVariableNames: ''!

!CCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVII.
	previous := CCV.! !


!classDefinition: #CCVII category: 'NaturalNumbers'!
II subclass: #CCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVII class' category: 'NaturalNumbers'!
CCVII class
	instanceVariableNames: ''!

!CCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVIII.
	previous := CCVI.! !


!classDefinition: #CCVIII category: 'NaturalNumbers'!
II subclass: #CCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVIII class' category: 'NaturalNumbers'!
CCVIII class
	instanceVariableNames: ''!

!CCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIX.
	previous := CCVII.! !


!classDefinition: #CCX category: 'NaturalNumbers'!
II subclass: #CCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCX class' category: 'NaturalNumbers'!
CCX class
	instanceVariableNames: ''!

!CCX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXI.
	previous := CCIX.! !


!classDefinition: #CCXC category: 'NaturalNumbers'!
II subclass: #CCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXC class' category: 'NaturalNumbers'!
CCXC class
	instanceVariableNames: ''!

!CCXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCI.
	previous := CCLXXXIX.! !


!classDefinition: #CCXCI category: 'NaturalNumbers'!
II subclass: #CCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCI class' category: 'NaturalNumbers'!
CCXCI class
	instanceVariableNames: ''!

!CCXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCII.
	previous := CCXC.! !


!classDefinition: #CCXCII category: 'NaturalNumbers'!
II subclass: #CCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCII class' category: 'NaturalNumbers'!
CCXCII class
	instanceVariableNames: ''!

!CCXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIII.
	previous := CCXCI.! !


!classDefinition: #CCXCIII category: 'NaturalNumbers'!
II subclass: #CCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIII class' category: 'NaturalNumbers'!
CCXCIII class
	instanceVariableNames: ''!

!CCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIV.
	previous := CCXCII.! !


!classDefinition: #CCXCIV category: 'NaturalNumbers'!
II subclass: #CCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIV class' category: 'NaturalNumbers'!
CCXCIV class
	instanceVariableNames: ''!

!CCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCV.
	previous := CCXCIII.! !


!classDefinition: #CCXCIX category: 'NaturalNumbers'!
II subclass: #CCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIX class' category: 'NaturalNumbers'!
CCXCIX class
	instanceVariableNames: ''!

!CCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCC.
	previous := CCXCVIII.! !


!classDefinition: #CCXCV category: 'NaturalNumbers'!
II subclass: #CCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCV class' category: 'NaturalNumbers'!
CCXCV class
	instanceVariableNames: ''!

!CCXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVI.
	previous := CCXCIV.! !


!classDefinition: #CCXCVI category: 'NaturalNumbers'!
II subclass: #CCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVI class' category: 'NaturalNumbers'!
CCXCVI class
	instanceVariableNames: ''!

!CCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVII.
	previous := CCXCV.! !


!classDefinition: #CCXCVII category: 'NaturalNumbers'!
II subclass: #CCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVII class' category: 'NaturalNumbers'!
CCXCVII class
	instanceVariableNames: ''!

!CCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVIII.
	previous := CCXCVI.! !


!classDefinition: #CCXCVIII category: 'NaturalNumbers'!
II subclass: #CCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVIII class' category: 'NaturalNumbers'!
CCXCVIII class
	instanceVariableNames: ''!

!CCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIX.
	previous := CCXCVII.! !


!classDefinition: #CCXI category: 'NaturalNumbers'!
II subclass: #CCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXI class' category: 'NaturalNumbers'!
CCXI class
	instanceVariableNames: ''!

!CCXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXII.
	previous := CCX.! !


!classDefinition: #CCXII category: 'NaturalNumbers'!
II subclass: #CCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXII class' category: 'NaturalNumbers'!
CCXII class
	instanceVariableNames: ''!

!CCXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIII.
	previous := CCXI.! !


!classDefinition: #CCXIII category: 'NaturalNumbers'!
II subclass: #CCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIII class' category: 'NaturalNumbers'!
CCXIII class
	instanceVariableNames: ''!

!CCXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIV.
	previous := CCXII.! !


!classDefinition: #CCXIV category: 'NaturalNumbers'!
II subclass: #CCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIV class' category: 'NaturalNumbers'!
CCXIV class
	instanceVariableNames: ''!

!CCXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXV.
	previous := CCXIII.! !


!classDefinition: #CCXIX category: 'NaturalNumbers'!
II subclass: #CCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIX class' category: 'NaturalNumbers'!
CCXIX class
	instanceVariableNames: ''!

!CCXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXX.
	previous := CCXVIII.! !


!classDefinition: #CCXL category: 'NaturalNumbers'!
II subclass: #CCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXL class' category: 'NaturalNumbers'!
CCXL class
	instanceVariableNames: ''!

!CCXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLI.
	previous := CCXXXIX.! !


!classDefinition: #CCXLI category: 'NaturalNumbers'!
II subclass: #CCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLI class' category: 'NaturalNumbers'!
CCXLI class
	instanceVariableNames: ''!

!CCXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLII.
	previous := CCXL.! !


!classDefinition: #CCXLII category: 'NaturalNumbers'!
II subclass: #CCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLII class' category: 'NaturalNumbers'!
CCXLII class
	instanceVariableNames: ''!

!CCXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIII.
	previous := CCXLI.! !


!classDefinition: #CCXLIII category: 'NaturalNumbers'!
II subclass: #CCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIII class' category: 'NaturalNumbers'!
CCXLIII class
	instanceVariableNames: ''!

!CCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIV.
	previous := CCXLII.! !


!classDefinition: #CCXLIV category: 'NaturalNumbers'!
II subclass: #CCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIV class' category: 'NaturalNumbers'!
CCXLIV class
	instanceVariableNames: ''!

!CCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLV.
	previous := CCXLIII.! !


!classDefinition: #CCXLIX category: 'NaturalNumbers'!
II subclass: #CCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIX class' category: 'NaturalNumbers'!
CCXLIX class
	instanceVariableNames: ''!

!CCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCL.
	previous := CCXLVIII.! !


!classDefinition: #CCXLV category: 'NaturalNumbers'!
II subclass: #CCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLV class' category: 'NaturalNumbers'!
CCXLV class
	instanceVariableNames: ''!

!CCXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVI.
	previous := CCXLIV.! !


!classDefinition: #CCXLVI category: 'NaturalNumbers'!
II subclass: #CCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVI class' category: 'NaturalNumbers'!
CCXLVI class
	instanceVariableNames: ''!

!CCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVII.
	previous := CCXLV.! !


!classDefinition: #CCXLVII category: 'NaturalNumbers'!
II subclass: #CCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVII class' category: 'NaturalNumbers'!
CCXLVII class
	instanceVariableNames: ''!

!CCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVIII.
	previous := CCXLVI.! !


!classDefinition: #CCXLVIII category: 'NaturalNumbers'!
II subclass: #CCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVIII class' category: 'NaturalNumbers'!
CCXLVIII class
	instanceVariableNames: ''!

!CCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIX.
	previous := CCXLVII.! !


!classDefinition: #CCXV category: 'NaturalNumbers'!
II subclass: #CCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXV class' category: 'NaturalNumbers'!
CCXV class
	instanceVariableNames: ''!

!CCXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVI.
	previous := CCXIV.! !


!classDefinition: #CCXVI category: 'NaturalNumbers'!
II subclass: #CCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVI class' category: 'NaturalNumbers'!
CCXVI class
	instanceVariableNames: ''!

!CCXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVII.
	previous := CCXV.! !


!classDefinition: #CCXVII category: 'NaturalNumbers'!
II subclass: #CCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVII class' category: 'NaturalNumbers'!
CCXVII class
	instanceVariableNames: ''!

!CCXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVIII.
	previous := CCXVI.! !


!classDefinition: #CCXVIII category: 'NaturalNumbers'!
II subclass: #CCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVIII class' category: 'NaturalNumbers'!
CCXVIII class
	instanceVariableNames: ''!

!CCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIX.
	previous := CCXVII.! !


!classDefinition: #CCXX category: 'NaturalNumbers'!
II subclass: #CCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXX class' category: 'NaturalNumbers'!
CCXX class
	instanceVariableNames: ''!

!CCXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXI.
	previous := CCXIX.! !


!classDefinition: #CCXXI category: 'NaturalNumbers'!
II subclass: #CCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXI class' category: 'NaturalNumbers'!
CCXXI class
	instanceVariableNames: ''!

!CCXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXII.
	previous := CCXX.! !


!classDefinition: #CCXXII category: 'NaturalNumbers'!
II subclass: #CCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXII class' category: 'NaturalNumbers'!
CCXXII class
	instanceVariableNames: ''!

!CCXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIII.
	previous := CCXXI.! !


!classDefinition: #CCXXIII category: 'NaturalNumbers'!
II subclass: #CCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIII class' category: 'NaturalNumbers'!
CCXXIII class
	instanceVariableNames: ''!

!CCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIV.
	previous := CCXXII.! !


!classDefinition: #CCXXIV category: 'NaturalNumbers'!
II subclass: #CCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIV class' category: 'NaturalNumbers'!
CCXXIV class
	instanceVariableNames: ''!

!CCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXV.
	previous := CCXXIII.! !


!classDefinition: #CCXXIX category: 'NaturalNumbers'!
II subclass: #CCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIX class' category: 'NaturalNumbers'!
CCXXIX class
	instanceVariableNames: ''!

!CCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXX.
	previous := CCXXVIII.! !


!classDefinition: #CCXXV category: 'NaturalNumbers'!
II subclass: #CCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXV class' category: 'NaturalNumbers'!
CCXXV class
	instanceVariableNames: ''!

!CCXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVI.
	previous := CCXXIV.! !


!classDefinition: #CCXXVI category: 'NaturalNumbers'!
II subclass: #CCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVI class' category: 'NaturalNumbers'!
CCXXVI class
	instanceVariableNames: ''!

!CCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVII.
	previous := CCXXV.! !


!classDefinition: #CCXXVII category: 'NaturalNumbers'!
II subclass: #CCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVII class' category: 'NaturalNumbers'!
CCXXVII class
	instanceVariableNames: ''!

!CCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVIII.
	previous := CCXXVI.! !


!classDefinition: #CCXXVIII category: 'NaturalNumbers'!
II subclass: #CCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVIII class' category: 'NaturalNumbers'!
CCXXVIII class
	instanceVariableNames: ''!

!CCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIX.
	previous := CCXXVII.! !


!classDefinition: #CCXXX category: 'NaturalNumbers'!
II subclass: #CCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXX class' category: 'NaturalNumbers'!
CCXXX class
	instanceVariableNames: ''!

!CCXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXI.
	previous := CCXXIX.! !


!classDefinition: #CCXXXI category: 'NaturalNumbers'!
II subclass: #CCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXI class' category: 'NaturalNumbers'!
CCXXXI class
	instanceVariableNames: ''!

!CCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXII.
	previous := CCXXX.! !


!classDefinition: #CCXXXII category: 'NaturalNumbers'!
II subclass: #CCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXII class' category: 'NaturalNumbers'!
CCXXXII class
	instanceVariableNames: ''!

!CCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIII.
	previous := CCXXXI.! !


!classDefinition: #CCXXXIII category: 'NaturalNumbers'!
II subclass: #CCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIII class' category: 'NaturalNumbers'!
CCXXXIII class
	instanceVariableNames: ''!

!CCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIV.
	previous := CCXXXII.! !


!classDefinition: #CCXXXIV category: 'NaturalNumbers'!
II subclass: #CCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIV class' category: 'NaturalNumbers'!
CCXXXIV class
	instanceVariableNames: ''!

!CCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXV.
	previous := CCXXXIII.! !


!classDefinition: #CCXXXIX category: 'NaturalNumbers'!
II subclass: #CCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIX class' category: 'NaturalNumbers'!
CCXXXIX class
	instanceVariableNames: ''!

!CCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXL.
	previous := CCXXXVIII.! !


!classDefinition: #CCXXXV category: 'NaturalNumbers'!
II subclass: #CCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXV class' category: 'NaturalNumbers'!
CCXXXV class
	instanceVariableNames: ''!

!CCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVI.
	previous := CCXXXIV.! !


!classDefinition: #CCXXXVI category: 'NaturalNumbers'!
II subclass: #CCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVI class' category: 'NaturalNumbers'!
CCXXXVI class
	instanceVariableNames: ''!

!CCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVII.
	previous := CCXXXV.! !


!classDefinition: #CCXXXVII category: 'NaturalNumbers'!
II subclass: #CCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVII class' category: 'NaturalNumbers'!
CCXXXVII class
	instanceVariableNames: ''!

!CCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVIII.
	previous := CCXXXVI.! !


!classDefinition: #CCXXXVIII category: 'NaturalNumbers'!
II subclass: #CCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVIII class' category: 'NaturalNumbers'!
CCXXXVIII class
	instanceVariableNames: ''!

!CCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIX.
	previous := CCXXXVII.! !


!classDefinition: #CD category: 'NaturalNumbers'!
II subclass: #CD
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CD class' category: 'NaturalNumbers'!
CD class
	instanceVariableNames: ''!

!CD class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDI.
	previous := CCCXCIX.! !


!classDefinition: #CDI category: 'NaturalNumbers'!
II subclass: #CDI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDI class' category: 'NaturalNumbers'!
CDI class
	instanceVariableNames: ''!

!CDI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDII.
	previous := CD.! !


!classDefinition: #CDII category: 'NaturalNumbers'!
II subclass: #CDII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDII class' category: 'NaturalNumbers'!
CDII class
	instanceVariableNames: ''!

!CDII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIII.
	previous := CDI.! !


!classDefinition: #CDIII category: 'NaturalNumbers'!
II subclass: #CDIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIII class' category: 'NaturalNumbers'!
CDIII class
	instanceVariableNames: ''!

!CDIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIV.
	previous := CDII.! !


!classDefinition: #CDIV category: 'NaturalNumbers'!
II subclass: #CDIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIV class' category: 'NaturalNumbers'!
CDIV class
	instanceVariableNames: ''!

!CDIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDV.
	previous := CDIII.! !


!classDefinition: #CDIX category: 'NaturalNumbers'!
II subclass: #CDIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIX class' category: 'NaturalNumbers'!
CDIX class
	instanceVariableNames: ''!

!CDIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDX.
	previous := CDVIII.! !


!classDefinition: #CDL category: 'NaturalNumbers'!
II subclass: #CDL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDL class' category: 'NaturalNumbers'!
CDL class
	instanceVariableNames: ''!

!CDL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLI.
	previous := CDXLIX.! !


!classDefinition: #CDLI category: 'NaturalNumbers'!
II subclass: #CDLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLI class' category: 'NaturalNumbers'!
CDLI class
	instanceVariableNames: ''!

!CDLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLII.
	previous := CDL.! !


!classDefinition: #CDLII category: 'NaturalNumbers'!
II subclass: #CDLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLII class' category: 'NaturalNumbers'!
CDLII class
	instanceVariableNames: ''!

!CDLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIII.
	previous := CDLI.! !


!classDefinition: #CDLIII category: 'NaturalNumbers'!
II subclass: #CDLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIII class' category: 'NaturalNumbers'!
CDLIII class
	instanceVariableNames: ''!

!CDLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIV.
	previous := CDLII.! !


!classDefinition: #CDLIV category: 'NaturalNumbers'!
II subclass: #CDLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIV class' category: 'NaturalNumbers'!
CDLIV class
	instanceVariableNames: ''!

!CDLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLV.
	previous := CDLIII.! !


!classDefinition: #CDLIX category: 'NaturalNumbers'!
II subclass: #CDLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIX class' category: 'NaturalNumbers'!
CDLIX class
	instanceVariableNames: ''!

!CDLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLX.
	previous := CDLVIII.! !


!classDefinition: #CDLV category: 'NaturalNumbers'!
II subclass: #CDLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLV class' category: 'NaturalNumbers'!
CDLV class
	instanceVariableNames: ''!

!CDLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVI.
	previous := CDLIV.! !


!classDefinition: #CDLVI category: 'NaturalNumbers'!
II subclass: #CDLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVI class' category: 'NaturalNumbers'!
CDLVI class
	instanceVariableNames: ''!

!CDLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVII.
	previous := CDLV.! !


!classDefinition: #CDLVII category: 'NaturalNumbers'!
II subclass: #CDLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVII class' category: 'NaturalNumbers'!
CDLVII class
	instanceVariableNames: ''!

!CDLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVIII.
	previous := CDLVI.! !


!classDefinition: #CDLVIII category: 'NaturalNumbers'!
II subclass: #CDLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVIII class' category: 'NaturalNumbers'!
CDLVIII class
	instanceVariableNames: ''!

!CDLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIX.
	previous := CDLVII.! !


!classDefinition: #CDLX category: 'NaturalNumbers'!
II subclass: #CDLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLX class' category: 'NaturalNumbers'!
CDLX class
	instanceVariableNames: ''!

!CDLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXI.
	previous := CDLIX.! !


!classDefinition: #CDLXI category: 'NaturalNumbers'!
II subclass: #CDLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXI class' category: 'NaturalNumbers'!
CDLXI class
	instanceVariableNames: ''!

!CDLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXII.
	previous := CDLX.! !


!classDefinition: #CDLXII category: 'NaturalNumbers'!
II subclass: #CDLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXII class' category: 'NaturalNumbers'!
CDLXII class
	instanceVariableNames: ''!

!CDLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIII.
	previous := CDLXI.! !


!classDefinition: #CDLXIII category: 'NaturalNumbers'!
II subclass: #CDLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIII class' category: 'NaturalNumbers'!
CDLXIII class
	instanceVariableNames: ''!

!CDLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIV.
	previous := CDLXII.! !


!classDefinition: #CDLXIV category: 'NaturalNumbers'!
II subclass: #CDLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIV class' category: 'NaturalNumbers'!
CDLXIV class
	instanceVariableNames: ''!

!CDLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXV.
	previous := CDLXIII.! !


!classDefinition: #CDLXIX category: 'NaturalNumbers'!
II subclass: #CDLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIX class' category: 'NaturalNumbers'!
CDLXIX class
	instanceVariableNames: ''!

!CDLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXX.
	previous := CDLXVIII.! !


!classDefinition: #CDLXV category: 'NaturalNumbers'!
II subclass: #CDLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXV class' category: 'NaturalNumbers'!
CDLXV class
	instanceVariableNames: ''!

!CDLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVI.
	previous := CDLXIV.! !


!classDefinition: #CDLXVI category: 'NaturalNumbers'!
II subclass: #CDLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVI class' category: 'NaturalNumbers'!
CDLXVI class
	instanceVariableNames: ''!

!CDLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVII.
	previous := CDLXV.! !


!classDefinition: #CDLXVII category: 'NaturalNumbers'!
II subclass: #CDLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVII class' category: 'NaturalNumbers'!
CDLXVII class
	instanceVariableNames: ''!

!CDLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVIII.
	previous := CDLXVI.! !


!classDefinition: #CDLXVIII category: 'NaturalNumbers'!
II subclass: #CDLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVIII class' category: 'NaturalNumbers'!
CDLXVIII class
	instanceVariableNames: ''!

!CDLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIX.
	previous := CDLXVII.! !


!classDefinition: #CDLXX category: 'NaturalNumbers'!
II subclass: #CDLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXX class' category: 'NaturalNumbers'!
CDLXX class
	instanceVariableNames: ''!

!CDLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXI.
	previous := CDLXIX.! !


!classDefinition: #CDLXXI category: 'NaturalNumbers'!
II subclass: #CDLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXI class' category: 'NaturalNumbers'!
CDLXXI class
	instanceVariableNames: ''!

!CDLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXII.
	previous := CDLXX.! !


!classDefinition: #CDLXXII category: 'NaturalNumbers'!
II subclass: #CDLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXII class' category: 'NaturalNumbers'!
CDLXXII class
	instanceVariableNames: ''!

!CDLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIII.
	previous := CDLXXI.! !


!classDefinition: #CDLXXIII category: 'NaturalNumbers'!
II subclass: #CDLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIII class' category: 'NaturalNumbers'!
CDLXXIII class
	instanceVariableNames: ''!

!CDLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIV.
	previous := CDLXXII.! !


!classDefinition: #CDLXXIV category: 'NaturalNumbers'!
II subclass: #CDLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIV class' category: 'NaturalNumbers'!
CDLXXIV class
	instanceVariableNames: ''!

!CDLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXV.
	previous := CDLXXIII.! !


!classDefinition: #CDLXXIX category: 'NaturalNumbers'!
II subclass: #CDLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIX class' category: 'NaturalNumbers'!
CDLXXIX class
	instanceVariableNames: ''!

!CDLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXX.
	previous := CDLXXVIII.! !


!classDefinition: #CDLXXV category: 'NaturalNumbers'!
II subclass: #CDLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXV class' category: 'NaturalNumbers'!
CDLXXV class
	instanceVariableNames: ''!

!CDLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVI.
	previous := CDLXXIV.! !


!classDefinition: #CDLXXVI category: 'NaturalNumbers'!
II subclass: #CDLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVI class' category: 'NaturalNumbers'!
CDLXXVI class
	instanceVariableNames: ''!

!CDLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVII.
	previous := CDLXXV.! !


!classDefinition: #CDLXXVII category: 'NaturalNumbers'!
II subclass: #CDLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVII class' category: 'NaturalNumbers'!
CDLXXVII class
	instanceVariableNames: ''!

!CDLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVIII.
	previous := CDLXXVI.! !


!classDefinition: #CDLXXVIII category: 'NaturalNumbers'!
II subclass: #CDLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVIII class' category: 'NaturalNumbers'!
CDLXXVIII class
	instanceVariableNames: ''!

!CDLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIX.
	previous := CDLXXVII.! !


!classDefinition: #CDLXXX category: 'NaturalNumbers'!
II subclass: #CDLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXX class' category: 'NaturalNumbers'!
CDLXXX class
	instanceVariableNames: ''!

!CDLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXI.
	previous := CDLXXIX.! !


!classDefinition: #CDLXXXI category: 'NaturalNumbers'!
II subclass: #CDLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXI class' category: 'NaturalNumbers'!
CDLXXXI class
	instanceVariableNames: ''!

!CDLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXII.
	previous := CDLXXX.! !


!classDefinition: #CDLXXXII category: 'NaturalNumbers'!
II subclass: #CDLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXII class' category: 'NaturalNumbers'!
CDLXXXII class
	instanceVariableNames: ''!

!CDLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIII.
	previous := CDLXXXI.! !


!classDefinition: #CDLXXXIII category: 'NaturalNumbers'!
II subclass: #CDLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIII class' category: 'NaturalNumbers'!
CDLXXXIII class
	instanceVariableNames: ''!

!CDLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIV.
	previous := CDLXXXII.! !


!classDefinition: #CDLXXXIV category: 'NaturalNumbers'!
II subclass: #CDLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIV class' category: 'NaturalNumbers'!
CDLXXXIV class
	instanceVariableNames: ''!

!CDLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXV.
	previous := CDLXXXIII.! !


!classDefinition: #CDLXXXIX category: 'NaturalNumbers'!
II subclass: #CDLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIX class' category: 'NaturalNumbers'!
CDLXXXIX class
	instanceVariableNames: ''!

!CDLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXC.
	previous := CDLXXXVIII.! !


!classDefinition: #CDLXXXV category: 'NaturalNumbers'!
II subclass: #CDLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXV class' category: 'NaturalNumbers'!
CDLXXXV class
	instanceVariableNames: ''!

!CDLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVI.
	previous := CDLXXXIV.! !


!classDefinition: #CDLXXXVI category: 'NaturalNumbers'!
II subclass: #CDLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVI class' category: 'NaturalNumbers'!
CDLXXXVI class
	instanceVariableNames: ''!

!CDLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVII.
	previous := CDLXXXV.! !


!classDefinition: #CDLXXXVII category: 'NaturalNumbers'!
II subclass: #CDLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVII class' category: 'NaturalNumbers'!
CDLXXXVII class
	instanceVariableNames: ''!

!CDLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVIII.
	previous := CDLXXXVI.! !


!classDefinition: #CDLXXXVIII category: 'NaturalNumbers'!
II subclass: #CDLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVIII class' category: 'NaturalNumbers'!
CDLXXXVIII class
	instanceVariableNames: ''!

!CDLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIX.
	previous := CDLXXXVII.! !


!classDefinition: #CDV category: 'NaturalNumbers'!
II subclass: #CDV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDV class' category: 'NaturalNumbers'!
CDV class
	instanceVariableNames: ''!

!CDV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVI.
	previous := CDIV.! !


!classDefinition: #CDVI category: 'NaturalNumbers'!
II subclass: #CDVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVI class' category: 'NaturalNumbers'!
CDVI class
	instanceVariableNames: ''!

!CDVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVII.
	previous := CDV.! !


!classDefinition: #CDVII category: 'NaturalNumbers'!
II subclass: #CDVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVII class' category: 'NaturalNumbers'!
CDVII class
	instanceVariableNames: ''!

!CDVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVIII.
	previous := CDVI.! !


!classDefinition: #CDVIII category: 'NaturalNumbers'!
II subclass: #CDVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVIII class' category: 'NaturalNumbers'!
CDVIII class
	instanceVariableNames: ''!

!CDVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIX.
	previous := CDVII.! !


!classDefinition: #CDX category: 'NaturalNumbers'!
II subclass: #CDX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDX class' category: 'NaturalNumbers'!
CDX class
	instanceVariableNames: ''!

!CDX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXI.
	previous := CDIX.! !


!classDefinition: #CDXC category: 'NaturalNumbers'!
II subclass: #CDXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXC class' category: 'NaturalNumbers'!
CDXC class
	instanceVariableNames: ''!

!CDXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCI.
	previous := CDLXXXIX.! !


!classDefinition: #CDXCI category: 'NaturalNumbers'!
II subclass: #CDXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCI class' category: 'NaturalNumbers'!
CDXCI class
	instanceVariableNames: ''!

!CDXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCII.
	previous := CDXC.! !


!classDefinition: #CDXCII category: 'NaturalNumbers'!
II subclass: #CDXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCII class' category: 'NaturalNumbers'!
CDXCII class
	instanceVariableNames: ''!

!CDXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIII.
	previous := CDXCI.! !


!classDefinition: #CDXCIII category: 'NaturalNumbers'!
II subclass: #CDXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIII class' category: 'NaturalNumbers'!
CDXCIII class
	instanceVariableNames: ''!

!CDXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIV.
	previous := CDXCII.! !


!classDefinition: #CDXCIV category: 'NaturalNumbers'!
II subclass: #CDXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIV class' category: 'NaturalNumbers'!
CDXCIV class
	instanceVariableNames: ''!

!CDXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCV.
	previous := CDXCIII.! !


!classDefinition: #CDXCIX category: 'NaturalNumbers'!
II subclass: #CDXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIX class' category: 'NaturalNumbers'!
CDXCIX class
	instanceVariableNames: ''!

!CDXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := D.
	previous := CDXCVIII.! !


!classDefinition: #CDXCV category: 'NaturalNumbers'!
II subclass: #CDXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCV class' category: 'NaturalNumbers'!
CDXCV class
	instanceVariableNames: ''!

!CDXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVI.
	previous := CDXCIV.! !


!classDefinition: #CDXCVI category: 'NaturalNumbers'!
II subclass: #CDXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVI class' category: 'NaturalNumbers'!
CDXCVI class
	instanceVariableNames: ''!

!CDXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVII.
	previous := CDXCV.! !


!classDefinition: #CDXCVII category: 'NaturalNumbers'!
II subclass: #CDXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVII class' category: 'NaturalNumbers'!
CDXCVII class
	instanceVariableNames: ''!

!CDXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVIII.
	previous := CDXCVI.! !


!classDefinition: #CDXCVIII category: 'NaturalNumbers'!
II subclass: #CDXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVIII class' category: 'NaturalNumbers'!
CDXCVIII class
	instanceVariableNames: ''!

!CDXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIX.
	previous := CDXCVII.! !


!classDefinition: #CDXI category: 'NaturalNumbers'!
II subclass: #CDXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXI class' category: 'NaturalNumbers'!
CDXI class
	instanceVariableNames: ''!

!CDXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXII.
	previous := CDX.! !


!classDefinition: #CDXII category: 'NaturalNumbers'!
II subclass: #CDXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXII class' category: 'NaturalNumbers'!
CDXII class
	instanceVariableNames: ''!

!CDXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIII.
	previous := CDXI.! !


!classDefinition: #CDXIII category: 'NaturalNumbers'!
II subclass: #CDXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIII class' category: 'NaturalNumbers'!
CDXIII class
	instanceVariableNames: ''!

!CDXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIV.
	previous := CDXII.! !


!classDefinition: #CDXIV category: 'NaturalNumbers'!
II subclass: #CDXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIV class' category: 'NaturalNumbers'!
CDXIV class
	instanceVariableNames: ''!

!CDXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXV.
	previous := CDXIII.! !


!classDefinition: #CDXIX category: 'NaturalNumbers'!
II subclass: #CDXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIX class' category: 'NaturalNumbers'!
CDXIX class
	instanceVariableNames: ''!

!CDXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXX.
	previous := CDXVIII.! !


!classDefinition: #CDXL category: 'NaturalNumbers'!
II subclass: #CDXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXL class' category: 'NaturalNumbers'!
CDXL class
	instanceVariableNames: ''!

!CDXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLI.
	previous := CDXXXIX.! !


!classDefinition: #CDXLI category: 'NaturalNumbers'!
II subclass: #CDXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLI class' category: 'NaturalNumbers'!
CDXLI class
	instanceVariableNames: ''!

!CDXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLII.
	previous := CDXL.! !


!classDefinition: #CDXLII category: 'NaturalNumbers'!
II subclass: #CDXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLII class' category: 'NaturalNumbers'!
CDXLII class
	instanceVariableNames: ''!

!CDXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIII.
	previous := CDXLI.! !


!classDefinition: #CDXLIII category: 'NaturalNumbers'!
II subclass: #CDXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIII class' category: 'NaturalNumbers'!
CDXLIII class
	instanceVariableNames: ''!

!CDXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIV.
	previous := CDXLII.! !


!classDefinition: #CDXLIV category: 'NaturalNumbers'!
II subclass: #CDXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIV class' category: 'NaturalNumbers'!
CDXLIV class
	instanceVariableNames: ''!

!CDXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLV.
	previous := CDXLIII.! !


!classDefinition: #CDXLIX category: 'NaturalNumbers'!
II subclass: #CDXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIX class' category: 'NaturalNumbers'!
CDXLIX class
	instanceVariableNames: ''!

!CDXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDL.
	previous := CDXLVIII.! !


!classDefinition: #CDXLV category: 'NaturalNumbers'!
II subclass: #CDXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLV class' category: 'NaturalNumbers'!
CDXLV class
	instanceVariableNames: ''!

!CDXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVI.
	previous := CDXLIV.! !


!classDefinition: #CDXLVI category: 'NaturalNumbers'!
II subclass: #CDXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVI class' category: 'NaturalNumbers'!
CDXLVI class
	instanceVariableNames: ''!

!CDXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVII.
	previous := CDXLV.! !


!classDefinition: #CDXLVII category: 'NaturalNumbers'!
II subclass: #CDXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVII class' category: 'NaturalNumbers'!
CDXLVII class
	instanceVariableNames: ''!

!CDXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVIII.
	previous := CDXLVI.! !


!classDefinition: #CDXLVIII category: 'NaturalNumbers'!
II subclass: #CDXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVIII class' category: 'NaturalNumbers'!
CDXLVIII class
	instanceVariableNames: ''!

!CDXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIX.
	previous := CDXLVII.! !


!classDefinition: #CDXV category: 'NaturalNumbers'!
II subclass: #CDXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXV class' category: 'NaturalNumbers'!
CDXV class
	instanceVariableNames: ''!

!CDXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVI.
	previous := CDXIV.! !


!classDefinition: #CDXVI category: 'NaturalNumbers'!
II subclass: #CDXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVI class' category: 'NaturalNumbers'!
CDXVI class
	instanceVariableNames: ''!

!CDXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVII.
	previous := CDXV.! !


!classDefinition: #CDXVII category: 'NaturalNumbers'!
II subclass: #CDXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVII class' category: 'NaturalNumbers'!
CDXVII class
	instanceVariableNames: ''!

!CDXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVIII.
	previous := CDXVI.! !


!classDefinition: #CDXVIII category: 'NaturalNumbers'!
II subclass: #CDXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVIII class' category: 'NaturalNumbers'!
CDXVIII class
	instanceVariableNames: ''!

!CDXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIX.
	previous := CDXVII.! !


!classDefinition: #CDXX category: 'NaturalNumbers'!
II subclass: #CDXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXX class' category: 'NaturalNumbers'!
CDXX class
	instanceVariableNames: ''!

!CDXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXI.
	previous := CDXIX.! !


!classDefinition: #CDXXI category: 'NaturalNumbers'!
II subclass: #CDXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXI class' category: 'NaturalNumbers'!
CDXXI class
	instanceVariableNames: ''!

!CDXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXII.
	previous := CDXX.! !


!classDefinition: #CDXXII category: 'NaturalNumbers'!
II subclass: #CDXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXII class' category: 'NaturalNumbers'!
CDXXII class
	instanceVariableNames: ''!

!CDXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIII.
	previous := CDXXI.! !


!classDefinition: #CDXXIII category: 'NaturalNumbers'!
II subclass: #CDXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIII class' category: 'NaturalNumbers'!
CDXXIII class
	instanceVariableNames: ''!

!CDXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIV.
	previous := CDXXII.! !


!classDefinition: #CDXXIV category: 'NaturalNumbers'!
II subclass: #CDXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIV class' category: 'NaturalNumbers'!
CDXXIV class
	instanceVariableNames: ''!

!CDXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXV.
	previous := CDXXIII.! !


!classDefinition: #CDXXIX category: 'NaturalNumbers'!
II subclass: #CDXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIX class' category: 'NaturalNumbers'!
CDXXIX class
	instanceVariableNames: ''!

!CDXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXX.
	previous := CDXXVIII.! !


!classDefinition: #CDXXV category: 'NaturalNumbers'!
II subclass: #CDXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXV class' category: 'NaturalNumbers'!
CDXXV class
	instanceVariableNames: ''!

!CDXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVI.
	previous := CDXXIV.! !


!classDefinition: #CDXXVI category: 'NaturalNumbers'!
II subclass: #CDXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVI class' category: 'NaturalNumbers'!
CDXXVI class
	instanceVariableNames: ''!

!CDXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVII.
	previous := CDXXV.! !


!classDefinition: #CDXXVII category: 'NaturalNumbers'!
II subclass: #CDXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVII class' category: 'NaturalNumbers'!
CDXXVII class
	instanceVariableNames: ''!

!CDXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVIII.
	previous := CDXXVI.! !


!classDefinition: #CDXXVIII category: 'NaturalNumbers'!
II subclass: #CDXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVIII class' category: 'NaturalNumbers'!
CDXXVIII class
	instanceVariableNames: ''!

!CDXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIX.
	previous := CDXXVII.! !


!classDefinition: #CDXXX category: 'NaturalNumbers'!
II subclass: #CDXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXX class' category: 'NaturalNumbers'!
CDXXX class
	instanceVariableNames: ''!

!CDXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXI.
	previous := CDXXIX.! !


!classDefinition: #CDXXXI category: 'NaturalNumbers'!
II subclass: #CDXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXI class' category: 'NaturalNumbers'!
CDXXXI class
	instanceVariableNames: ''!

!CDXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXII.
	previous := CDXXX.! !


!classDefinition: #CDXXXII category: 'NaturalNumbers'!
II subclass: #CDXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXII class' category: 'NaturalNumbers'!
CDXXXII class
	instanceVariableNames: ''!

!CDXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIII.
	previous := CDXXXI.! !


!classDefinition: #CDXXXIII category: 'NaturalNumbers'!
II subclass: #CDXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIII class' category: 'NaturalNumbers'!
CDXXXIII class
	instanceVariableNames: ''!

!CDXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIV.
	previous := CDXXXII.! !


!classDefinition: #CDXXXIV category: 'NaturalNumbers'!
II subclass: #CDXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIV class' category: 'NaturalNumbers'!
CDXXXIV class
	instanceVariableNames: ''!

!CDXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXV.
	previous := CDXXXIII.! !


!classDefinition: #CDXXXIX category: 'NaturalNumbers'!
II subclass: #CDXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIX class' category: 'NaturalNumbers'!
CDXXXIX class
	instanceVariableNames: ''!

!CDXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXL.
	previous := CDXXXVIII.! !


!classDefinition: #CDXXXV category: 'NaturalNumbers'!
II subclass: #CDXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXV class' category: 'NaturalNumbers'!
CDXXXV class
	instanceVariableNames: ''!

!CDXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVI.
	previous := CDXXXIV.! !


!classDefinition: #CDXXXVI category: 'NaturalNumbers'!
II subclass: #CDXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVI class' category: 'NaturalNumbers'!
CDXXXVI class
	instanceVariableNames: ''!

!CDXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVII.
	previous := CDXXXV.! !


!classDefinition: #CDXXXVII category: 'NaturalNumbers'!
II subclass: #CDXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVII class' category: 'NaturalNumbers'!
CDXXXVII class
	instanceVariableNames: ''!

!CDXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVIII.
	previous := CDXXXVI.! !


!classDefinition: #CDXXXVIII category: 'NaturalNumbers'!
II subclass: #CDXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVIII class' category: 'NaturalNumbers'!
CDXXXVIII class
	instanceVariableNames: ''!

!CDXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIX.
	previous := CDXXXVII.! !


!classDefinition: #CI category: 'NaturalNumbers'!
II subclass: #CI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CI class' category: 'NaturalNumbers'!
CI class
	instanceVariableNames: ''!

!CI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CII.
	previous := C.! !


!classDefinition: #CII category: 'NaturalNumbers'!
II subclass: #CII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CII class' category: 'NaturalNumbers'!
CII class
	instanceVariableNames: ''!

!CII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIII.
	previous := CI.! !


!classDefinition: #CIII category: 'NaturalNumbers'!
II subclass: #CIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIII class' category: 'NaturalNumbers'!
CIII class
	instanceVariableNames: ''!

!CIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIV.
	previous := CII.! !


!classDefinition: #CIV category: 'NaturalNumbers'!
II subclass: #CIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIV class' category: 'NaturalNumbers'!
CIV class
	instanceVariableNames: ''!

!CIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CV.
	previous := CIII.! !


!classDefinition: #CIX category: 'NaturalNumbers'!
II subclass: #CIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIX class' category: 'NaturalNumbers'!
CIX class
	instanceVariableNames: ''!

!CIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CX.
	previous := CVIII.! !


!classDefinition: #CL category: 'NaturalNumbers'!
II subclass: #CL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CL class' category: 'NaturalNumbers'!
CL class
	instanceVariableNames: ''!

!CL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLI.
	previous := CXLIX.! !


!classDefinition: #CLI category: 'NaturalNumbers'!
II subclass: #CLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLI class' category: 'NaturalNumbers'!
CLI class
	instanceVariableNames: ''!

!CLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLII.
	previous := CL.! !


!classDefinition: #CLII category: 'NaturalNumbers'!
II subclass: #CLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLII class' category: 'NaturalNumbers'!
CLII class
	instanceVariableNames: ''!

!CLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIII.
	previous := CLI.! !


!classDefinition: #CLIII category: 'NaturalNumbers'!
II subclass: #CLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIII class' category: 'NaturalNumbers'!
CLIII class
	instanceVariableNames: ''!

!CLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIV.
	previous := CLII.! !


!classDefinition: #CLIV category: 'NaturalNumbers'!
II subclass: #CLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIV class' category: 'NaturalNumbers'!
CLIV class
	instanceVariableNames: ''!

!CLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLV.
	previous := CLIII.! !


!classDefinition: #CLIX category: 'NaturalNumbers'!
II subclass: #CLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIX class' category: 'NaturalNumbers'!
CLIX class
	instanceVariableNames: ''!

!CLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLX.
	previous := CLVIII.! !


!classDefinition: #CLV category: 'NaturalNumbers'!
II subclass: #CLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLV class' category: 'NaturalNumbers'!
CLV class
	instanceVariableNames: ''!

!CLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVI.
	previous := CLIV.! !


!classDefinition: #CLVI category: 'NaturalNumbers'!
II subclass: #CLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVI class' category: 'NaturalNumbers'!
CLVI class
	instanceVariableNames: ''!

!CLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVII.
	previous := CLV.! !


!classDefinition: #CLVII category: 'NaturalNumbers'!
II subclass: #CLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVII class' category: 'NaturalNumbers'!
CLVII class
	instanceVariableNames: ''!

!CLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVIII.
	previous := CLVI.! !


!classDefinition: #CLVIII category: 'NaturalNumbers'!
II subclass: #CLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVIII class' category: 'NaturalNumbers'!
CLVIII class
	instanceVariableNames: ''!

!CLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIX.
	previous := CLVII.! !


!classDefinition: #CLX category: 'NaturalNumbers'!
II subclass: #CLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLX class' category: 'NaturalNumbers'!
CLX class
	instanceVariableNames: ''!

!CLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXI.
	previous := CLIX.! !


!classDefinition: #CLXI category: 'NaturalNumbers'!
II subclass: #CLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXI class' category: 'NaturalNumbers'!
CLXI class
	instanceVariableNames: ''!

!CLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXII.
	previous := CLX.! !


!classDefinition: #CLXII category: 'NaturalNumbers'!
II subclass: #CLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXII class' category: 'NaturalNumbers'!
CLXII class
	instanceVariableNames: ''!

!CLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIII.
	previous := CLXI.! !


!classDefinition: #CLXIII category: 'NaturalNumbers'!
II subclass: #CLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIII class' category: 'NaturalNumbers'!
CLXIII class
	instanceVariableNames: ''!

!CLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIV.
	previous := CLXII.! !


!classDefinition: #CLXIV category: 'NaturalNumbers'!
II subclass: #CLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIV class' category: 'NaturalNumbers'!
CLXIV class
	instanceVariableNames: ''!

!CLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXV.
	previous := CLXIII.! !


!classDefinition: #CLXIX category: 'NaturalNumbers'!
II subclass: #CLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIX class' category: 'NaturalNumbers'!
CLXIX class
	instanceVariableNames: ''!

!CLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXX.
	previous := CLXVIII.! !


!classDefinition: #CLXV category: 'NaturalNumbers'!
II subclass: #CLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXV class' category: 'NaturalNumbers'!
CLXV class
	instanceVariableNames: ''!

!CLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVI.
	previous := CLXIV.! !


!classDefinition: #CLXVI category: 'NaturalNumbers'!
II subclass: #CLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVI class' category: 'NaturalNumbers'!
CLXVI class
	instanceVariableNames: ''!

!CLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVII.
	previous := CLXV.! !


!classDefinition: #CLXVII category: 'NaturalNumbers'!
II subclass: #CLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVII class' category: 'NaturalNumbers'!
CLXVII class
	instanceVariableNames: ''!

!CLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVIII.
	previous := CLXVI.! !


!classDefinition: #CLXVIII category: 'NaturalNumbers'!
II subclass: #CLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVIII class' category: 'NaturalNumbers'!
CLXVIII class
	instanceVariableNames: ''!

!CLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIX.
	previous := CLXVII.! !


!classDefinition: #CLXX category: 'NaturalNumbers'!
II subclass: #CLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXX class' category: 'NaturalNumbers'!
CLXX class
	instanceVariableNames: ''!

!CLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXI.
	previous := CLXIX.! !


!classDefinition: #CLXXI category: 'NaturalNumbers'!
II subclass: #CLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXI class' category: 'NaturalNumbers'!
CLXXI class
	instanceVariableNames: ''!

!CLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXII.
	previous := CLXX.! !


!classDefinition: #CLXXII category: 'NaturalNumbers'!
II subclass: #CLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXII class' category: 'NaturalNumbers'!
CLXXII class
	instanceVariableNames: ''!

!CLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIII.
	previous := CLXXI.! !


!classDefinition: #CLXXIII category: 'NaturalNumbers'!
II subclass: #CLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIII class' category: 'NaturalNumbers'!
CLXXIII class
	instanceVariableNames: ''!

!CLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIV.
	previous := CLXXII.! !


!classDefinition: #CLXXIV category: 'NaturalNumbers'!
II subclass: #CLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIV class' category: 'NaturalNumbers'!
CLXXIV class
	instanceVariableNames: ''!

!CLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXV.
	previous := CLXXIII.! !


!classDefinition: #CLXXIX category: 'NaturalNumbers'!
II subclass: #CLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIX class' category: 'NaturalNumbers'!
CLXXIX class
	instanceVariableNames: ''!

!CLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXX.
	previous := CLXXVIII.! !


!classDefinition: #CLXXV category: 'NaturalNumbers'!
II subclass: #CLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXV class' category: 'NaturalNumbers'!
CLXXV class
	instanceVariableNames: ''!

!CLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVI.
	previous := CLXXIV.! !


!classDefinition: #CLXXVI category: 'NaturalNumbers'!
II subclass: #CLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVI class' category: 'NaturalNumbers'!
CLXXVI class
	instanceVariableNames: ''!

!CLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVII.
	previous := CLXXV.! !


!classDefinition: #CLXXVII category: 'NaturalNumbers'!
II subclass: #CLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVII class' category: 'NaturalNumbers'!
CLXXVII class
	instanceVariableNames: ''!

!CLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVIII.
	previous := CLXXVI.! !


!classDefinition: #CLXXVIII category: 'NaturalNumbers'!
II subclass: #CLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVIII class' category: 'NaturalNumbers'!
CLXXVIII class
	instanceVariableNames: ''!

!CLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIX.
	previous := CLXXVII.! !


!classDefinition: #CLXXX category: 'NaturalNumbers'!
II subclass: #CLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXX class' category: 'NaturalNumbers'!
CLXXX class
	instanceVariableNames: ''!

!CLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXI.
	previous := CLXXIX.! !


!classDefinition: #CLXXXI category: 'NaturalNumbers'!
II subclass: #CLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXI class' category: 'NaturalNumbers'!
CLXXXI class
	instanceVariableNames: ''!

!CLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXII.
	previous := CLXXX.! !


!classDefinition: #CLXXXII category: 'NaturalNumbers'!
II subclass: #CLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXII class' category: 'NaturalNumbers'!
CLXXXII class
	instanceVariableNames: ''!

!CLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIII.
	previous := CLXXXI.! !


!classDefinition: #CLXXXIII category: 'NaturalNumbers'!
II subclass: #CLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIII class' category: 'NaturalNumbers'!
CLXXXIII class
	instanceVariableNames: ''!

!CLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIV.
	previous := CLXXXII.! !


!classDefinition: #CLXXXIV category: 'NaturalNumbers'!
II subclass: #CLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIV class' category: 'NaturalNumbers'!
CLXXXIV class
	instanceVariableNames: ''!

!CLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXV.
	previous := CLXXXIII.! !


!classDefinition: #CLXXXIX category: 'NaturalNumbers'!
II subclass: #CLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIX class' category: 'NaturalNumbers'!
CLXXXIX class
	instanceVariableNames: ''!

!CLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXC.
	previous := CLXXXVIII.! !


!classDefinition: #CLXXXV category: 'NaturalNumbers'!
II subclass: #CLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXV class' category: 'NaturalNumbers'!
CLXXXV class
	instanceVariableNames: ''!

!CLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVI.
	previous := CLXXXIV.! !


!classDefinition: #CLXXXVI category: 'NaturalNumbers'!
II subclass: #CLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVI class' category: 'NaturalNumbers'!
CLXXXVI class
	instanceVariableNames: ''!

!CLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVII.
	previous := CLXXXV.! !


!classDefinition: #CLXXXVII category: 'NaturalNumbers'!
II subclass: #CLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVII class' category: 'NaturalNumbers'!
CLXXXVII class
	instanceVariableNames: ''!

!CLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVIII.
	previous := CLXXXVI.! !


!classDefinition: #CLXXXVIII category: 'NaturalNumbers'!
II subclass: #CLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVIII class' category: 'NaturalNumbers'!
CLXXXVIII class
	instanceVariableNames: ''!

!CLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIX.
	previous := CLXXXVII.! !


!classDefinition: #CM category: 'NaturalNumbers'!
II subclass: #CM
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CM class' category: 'NaturalNumbers'!
CM class
	instanceVariableNames: ''!

!CM class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMI.
	previous := DCCCXCIX.! !


!classDefinition: #CMI category: 'NaturalNumbers'!
II subclass: #CMI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMI class' category: 'NaturalNumbers'!
CMI class
	instanceVariableNames: ''!

!CMI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMII.
	previous := CM.! !


!classDefinition: #CMII category: 'NaturalNumbers'!
II subclass: #CMII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMII class' category: 'NaturalNumbers'!
CMII class
	instanceVariableNames: ''!

!CMII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMIII.
	previous := CMI.! !


!classDefinition: #CMIII category: 'NaturalNumbers'!
II subclass: #CMIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMIII class' category: 'NaturalNumbers'!
CMIII class
	instanceVariableNames: ''!

!CMIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMIV.
	previous := CMII.! !


!classDefinition: #CMIV category: 'NaturalNumbers'!
II subclass: #CMIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMIV class' category: 'NaturalNumbers'!
CMIV class
	instanceVariableNames: ''!

!CMIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMV.
	previous := CMIII.! !


!classDefinition: #CMIX category: 'NaturalNumbers'!
II subclass: #CMIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMIX class' category: 'NaturalNumbers'!
CMIX class
	instanceVariableNames: ''!

!CMIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMX.
	previous := CMVIII.! !


!classDefinition: #CML category: 'NaturalNumbers'!
II subclass: #CML
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CML class' category: 'NaturalNumbers'!
CML class
	instanceVariableNames: ''!

!CML class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLI.
	previous := CMXLIX.! !


!classDefinition: #CMLI category: 'NaturalNumbers'!
II subclass: #CMLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLI class' category: 'NaturalNumbers'!
CMLI class
	instanceVariableNames: ''!

!CMLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLII.
	previous := CML.! !


!classDefinition: #CMLII category: 'NaturalNumbers'!
II subclass: #CMLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLII class' category: 'NaturalNumbers'!
CMLII class
	instanceVariableNames: ''!

!CMLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLIII.
	previous := CMLI.! !


!classDefinition: #CMLIII category: 'NaturalNumbers'!
II subclass: #CMLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLIII class' category: 'NaturalNumbers'!
CMLIII class
	instanceVariableNames: ''!

!CMLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLIV.
	previous := CMLII.! !


!classDefinition: #CMLIV category: 'NaturalNumbers'!
II subclass: #CMLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLIV class' category: 'NaturalNumbers'!
CMLIV class
	instanceVariableNames: ''!

!CMLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLV.
	previous := CMLIII.! !


!classDefinition: #CMLIX category: 'NaturalNumbers'!
II subclass: #CMLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLIX class' category: 'NaturalNumbers'!
CMLIX class
	instanceVariableNames: ''!

!CMLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLX.
	previous := CMLVIII.! !


!classDefinition: #CMLV category: 'NaturalNumbers'!
II subclass: #CMLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLV class' category: 'NaturalNumbers'!
CMLV class
	instanceVariableNames: ''!

!CMLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLVI.
	previous := CMLIV.! !


!classDefinition: #CMLVI category: 'NaturalNumbers'!
II subclass: #CMLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLVI class' category: 'NaturalNumbers'!
CMLVI class
	instanceVariableNames: ''!

!CMLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLVII.
	previous := CMLV.! !


!classDefinition: #CMLVII category: 'NaturalNumbers'!
II subclass: #CMLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLVII class' category: 'NaturalNumbers'!
CMLVII class
	instanceVariableNames: ''!

!CMLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLVIII.
	previous := CMLVI.! !


!classDefinition: #CMLVIII category: 'NaturalNumbers'!
II subclass: #CMLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLVIII class' category: 'NaturalNumbers'!
CMLVIII class
	instanceVariableNames: ''!

!CMLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLIX.
	previous := CMLVII.! !


!classDefinition: #CMLX category: 'NaturalNumbers'!
II subclass: #CMLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLX class' category: 'NaturalNumbers'!
CMLX class
	instanceVariableNames: ''!

!CMLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXI.
	previous := CMLIX.! !


!classDefinition: #CMLXI category: 'NaturalNumbers'!
II subclass: #CMLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXI class' category: 'NaturalNumbers'!
CMLXI class
	instanceVariableNames: ''!

!CMLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXII.
	previous := CMLX.! !


!classDefinition: #CMLXII category: 'NaturalNumbers'!
II subclass: #CMLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXII class' category: 'NaturalNumbers'!
CMLXII class
	instanceVariableNames: ''!

!CMLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXIII.
	previous := CMLXI.! !


!classDefinition: #CMLXIII category: 'NaturalNumbers'!
II subclass: #CMLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXIII class' category: 'NaturalNumbers'!
CMLXIII class
	instanceVariableNames: ''!

!CMLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXIV.
	previous := CMLXII.! !


!classDefinition: #CMLXIV category: 'NaturalNumbers'!
II subclass: #CMLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXIV class' category: 'NaturalNumbers'!
CMLXIV class
	instanceVariableNames: ''!

!CMLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXV.
	previous := CMLXIII.! !


!classDefinition: #CMLXIX category: 'NaturalNumbers'!
II subclass: #CMLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXIX class' category: 'NaturalNumbers'!
CMLXIX class
	instanceVariableNames: ''!

!CMLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXX.
	previous := CMLXVIII.! !


!classDefinition: #CMLXV category: 'NaturalNumbers'!
II subclass: #CMLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXV class' category: 'NaturalNumbers'!
CMLXV class
	instanceVariableNames: ''!

!CMLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXVI.
	previous := CMLXIV.! !


!classDefinition: #CMLXVI category: 'NaturalNumbers'!
II subclass: #CMLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXVI class' category: 'NaturalNumbers'!
CMLXVI class
	instanceVariableNames: ''!

!CMLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXVII.
	previous := CMLXV.! !


!classDefinition: #CMLXVII category: 'NaturalNumbers'!
II subclass: #CMLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXVII class' category: 'NaturalNumbers'!
CMLXVII class
	instanceVariableNames: ''!

!CMLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXVIII.
	previous := CMLXVI.! !


!classDefinition: #CMLXVIII category: 'NaturalNumbers'!
II subclass: #CMLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXVIII class' category: 'NaturalNumbers'!
CMLXVIII class
	instanceVariableNames: ''!

!CMLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXIX.
	previous := CMLXVII.! !


!classDefinition: #CMLXX category: 'NaturalNumbers'!
II subclass: #CMLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXX class' category: 'NaturalNumbers'!
CMLXX class
	instanceVariableNames: ''!

!CMLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXI.
	previous := CMLXIX.! !


!classDefinition: #CMLXXI category: 'NaturalNumbers'!
II subclass: #CMLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXI class' category: 'NaturalNumbers'!
CMLXXI class
	instanceVariableNames: ''!

!CMLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXII.
	previous := CMLXX.! !


!classDefinition: #CMLXXII category: 'NaturalNumbers'!
II subclass: #CMLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXII class' category: 'NaturalNumbers'!
CMLXXII class
	instanceVariableNames: ''!

!CMLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXIII.
	previous := CMLXXI.! !


!classDefinition: #CMLXXIII category: 'NaturalNumbers'!
II subclass: #CMLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXIII class' category: 'NaturalNumbers'!
CMLXXIII class
	instanceVariableNames: ''!

!CMLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXIV.
	previous := CMLXXII.! !


!classDefinition: #CMLXXIV category: 'NaturalNumbers'!
II subclass: #CMLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXIV class' category: 'NaturalNumbers'!
CMLXXIV class
	instanceVariableNames: ''!

!CMLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXV.
	previous := CMLXXIII.! !


!classDefinition: #CMLXXIX category: 'NaturalNumbers'!
II subclass: #CMLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXIX class' category: 'NaturalNumbers'!
CMLXXIX class
	instanceVariableNames: ''!

!CMLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXX.
	previous := CMLXXVIII.! !


!classDefinition: #CMLXXV category: 'NaturalNumbers'!
II subclass: #CMLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXV class' category: 'NaturalNumbers'!
CMLXXV class
	instanceVariableNames: ''!

!CMLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXVI.
	previous := CMLXXIV.! !


!classDefinition: #CMLXXVI category: 'NaturalNumbers'!
II subclass: #CMLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXVI class' category: 'NaturalNumbers'!
CMLXXVI class
	instanceVariableNames: ''!

!CMLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXVII.
	previous := CMLXXV.! !


!classDefinition: #CMLXXVII category: 'NaturalNumbers'!
II subclass: #CMLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXVII class' category: 'NaturalNumbers'!
CMLXXVII class
	instanceVariableNames: ''!

!CMLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXVIII.
	previous := CMLXXVI.! !


!classDefinition: #CMLXXVIII category: 'NaturalNumbers'!
II subclass: #CMLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXVIII class' category: 'NaturalNumbers'!
CMLXXVIII class
	instanceVariableNames: ''!

!CMLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXIX.
	previous := CMLXXVII.! !


!classDefinition: #CMLXXX category: 'NaturalNumbers'!
II subclass: #CMLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXX class' category: 'NaturalNumbers'!
CMLXXX class
	instanceVariableNames: ''!

!CMLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXI.
	previous := CMLXXIX.! !


!classDefinition: #CMLXXXI category: 'NaturalNumbers'!
II subclass: #CMLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXI class' category: 'NaturalNumbers'!
CMLXXXI class
	instanceVariableNames: ''!

!CMLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXII.
	previous := CMLXXX.! !


!classDefinition: #CMLXXXII category: 'NaturalNumbers'!
II subclass: #CMLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXII class' category: 'NaturalNumbers'!
CMLXXXII class
	instanceVariableNames: ''!

!CMLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXIII.
	previous := CMLXXXI.! !


!classDefinition: #CMLXXXIII category: 'NaturalNumbers'!
II subclass: #CMLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXIII class' category: 'NaturalNumbers'!
CMLXXXIII class
	instanceVariableNames: ''!

!CMLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXIV.
	previous := CMLXXXII.! !


!classDefinition: #CMLXXXIV category: 'NaturalNumbers'!
II subclass: #CMLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXIV class' category: 'NaturalNumbers'!
CMLXXXIV class
	instanceVariableNames: ''!

!CMLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:49'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXV.
	previous := CMLXXXIII.! !


!classDefinition: #CMLXXXIX category: 'NaturalNumbers'!
II subclass: #CMLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXIX class' category: 'NaturalNumbers'!
CMLXXXIX class
	instanceVariableNames: ''!

!CMLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXC.
	previous := CMLXXXVIII.! !


!classDefinition: #CMLXXXV category: 'NaturalNumbers'!
II subclass: #CMLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXV class' category: 'NaturalNumbers'!
CMLXXXV class
	instanceVariableNames: ''!

!CMLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXVI.
	previous := CMLXXXIV.! !


!classDefinition: #CMLXXXVI category: 'NaturalNumbers'!
II subclass: #CMLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXVI class' category: 'NaturalNumbers'!
CMLXXXVI class
	instanceVariableNames: ''!

!CMLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXVII.
	previous := CMLXXXV.! !


!classDefinition: #CMLXXXVII category: 'NaturalNumbers'!
II subclass: #CMLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXVII class' category: 'NaturalNumbers'!
CMLXXXVII class
	instanceVariableNames: ''!

!CMLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXVIII.
	previous := CMLXXXVI.! !


!classDefinition: #CMLXXXVIII category: 'NaturalNumbers'!
II subclass: #CMLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMLXXXVIII class' category: 'NaturalNumbers'!
CMLXXXVIII class
	instanceVariableNames: ''!

!CMLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMLXXXIX.
	previous := CMLXXXVII.! !


!classDefinition: #CMV category: 'NaturalNumbers'!
II subclass: #CMV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMV class' category: 'NaturalNumbers'!
CMV class
	instanceVariableNames: ''!

!CMV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMVI.
	previous := CMIV.! !


!classDefinition: #CMVI category: 'NaturalNumbers'!
II subclass: #CMVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMVI class' category: 'NaturalNumbers'!
CMVI class
	instanceVariableNames: ''!

!CMVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMVII.
	previous := CMV.! !


!classDefinition: #CMVII category: 'NaturalNumbers'!
II subclass: #CMVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMVII class' category: 'NaturalNumbers'!
CMVII class
	instanceVariableNames: ''!

!CMVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMVIII.
	previous := CMVI.! !


!classDefinition: #CMVIII category: 'NaturalNumbers'!
II subclass: #CMVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMVIII class' category: 'NaturalNumbers'!
CMVIII class
	instanceVariableNames: ''!

!CMVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMIX.
	previous := CMVII.! !


!classDefinition: #CMX category: 'NaturalNumbers'!
II subclass: #CMX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMX class' category: 'NaturalNumbers'!
CMX class
	instanceVariableNames: ''!

!CMX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:50'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXI.
	previous := CMIX.! !


!classDefinition: #CMXC category: 'NaturalNumbers'!
II subclass: #CMXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXC class' category: 'NaturalNumbers'!
CMXC class
	instanceVariableNames: ''!

!CMXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCI.
	previous := CMLXXXIX.! !


!classDefinition: #CMXCI category: 'NaturalNumbers'!
II subclass: #CMXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCI class' category: 'NaturalNumbers'!
CMXCI class
	instanceVariableNames: ''!

!CMXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCII.
	previous := CMXC.! !


!classDefinition: #CMXCII category: 'NaturalNumbers'!
II subclass: #CMXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCII class' category: 'NaturalNumbers'!
CMXCII class
	instanceVariableNames: ''!

!CMXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCIII.
	previous := CMXCI.! !


!classDefinition: #CMXCIII category: 'NaturalNumbers'!
II subclass: #CMXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCIII class' category: 'NaturalNumbers'!
CMXCIII class
	instanceVariableNames: ''!

!CMXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCIV.
	previous := CMXCII.! !


!classDefinition: #CMXCIV category: 'NaturalNumbers'!
II subclass: #CMXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCIV class' category: 'NaturalNumbers'!
CMXCIV class
	instanceVariableNames: ''!

!CMXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCV.
	previous := CMXCIII.! !


!classDefinition: #CMXCIX category: 'NaturalNumbers'!
II subclass: #CMXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCIX class' category: 'NaturalNumbers'!
CMXCIX class
	instanceVariableNames: ''!

!CMXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := M.
	previous := CMXCVIII.! !


!classDefinition: #CMXCV category: 'NaturalNumbers'!
II subclass: #CMXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCV class' category: 'NaturalNumbers'!
CMXCV class
	instanceVariableNames: ''!

!CMXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCVI.
	previous := CMXCIV.! !


!classDefinition: #CMXCVI category: 'NaturalNumbers'!
II subclass: #CMXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCVI class' category: 'NaturalNumbers'!
CMXCVI class
	instanceVariableNames: ''!

!CMXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCVII.
	previous := CMXCV.! !


!classDefinition: #CMXCVII category: 'NaturalNumbers'!
II subclass: #CMXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCVII class' category: 'NaturalNumbers'!
CMXCVII class
	instanceVariableNames: ''!

!CMXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCVIII.
	previous := CMXCVI.! !


!classDefinition: #CMXCVIII category: 'NaturalNumbers'!
II subclass: #CMXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXCVIII class' category: 'NaturalNumbers'!
CMXCVIII class
	instanceVariableNames: ''!

!CMXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXCIX.
	previous := CMXCVII.! !


!classDefinition: #CMXI category: 'NaturalNumbers'!
II subclass: #CMXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXI class' category: 'NaturalNumbers'!
CMXI class
	instanceVariableNames: ''!

!CMXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:51'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXII.
	previous := CMX.! !


!classDefinition: #CMXII category: 'NaturalNumbers'!
II subclass: #CMXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXII class' category: 'NaturalNumbers'!
CMXII class
	instanceVariableNames: ''!

!CMXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXIII.
	previous := CMXI.! !


!classDefinition: #CMXIII category: 'NaturalNumbers'!
II subclass: #CMXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXIII class' category: 'NaturalNumbers'!
CMXIII class
	instanceVariableNames: ''!

!CMXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXIV.
	previous := CMXII.! !


!classDefinition: #CMXIV category: 'NaturalNumbers'!
II subclass: #CMXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXIV class' category: 'NaturalNumbers'!
CMXIV class
	instanceVariableNames: ''!

!CMXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXV.
	previous := CMXIII.! !


!classDefinition: #CMXIX category: 'NaturalNumbers'!
II subclass: #CMXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXIX class' category: 'NaturalNumbers'!
CMXIX class
	instanceVariableNames: ''!

!CMXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXX.
	previous := CMXVIII.! !


!classDefinition: #CMXL category: 'NaturalNumbers'!
II subclass: #CMXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXL class' category: 'NaturalNumbers'!
CMXL class
	instanceVariableNames: ''!

!CMXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLI.
	previous := CMXXXIX.! !


!classDefinition: #CMXLI category: 'NaturalNumbers'!
II subclass: #CMXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLI class' category: 'NaturalNumbers'!
CMXLI class
	instanceVariableNames: ''!

!CMXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLII.
	previous := CMXL.! !


!classDefinition: #CMXLII category: 'NaturalNumbers'!
II subclass: #CMXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLII class' category: 'NaturalNumbers'!
CMXLII class
	instanceVariableNames: ''!

!CMXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLIII.
	previous := CMXLI.! !


!classDefinition: #CMXLIII category: 'NaturalNumbers'!
II subclass: #CMXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLIII class' category: 'NaturalNumbers'!
CMXLIII class
	instanceVariableNames: ''!

!CMXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:52'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLIV.
	previous := CMXLII.! !


!classDefinition: #CMXLIV category: 'NaturalNumbers'!
II subclass: #CMXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLIV class' category: 'NaturalNumbers'!
CMXLIV class
	instanceVariableNames: ''!

!CMXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLV.
	previous := CMXLIII.! !


!classDefinition: #CMXLIX category: 'NaturalNumbers'!
II subclass: #CMXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLIX class' category: 'NaturalNumbers'!
CMXLIX class
	instanceVariableNames: ''!

!CMXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CML.
	previous := CMXLVIII.! !


!classDefinition: #CMXLV category: 'NaturalNumbers'!
II subclass: #CMXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLV class' category: 'NaturalNumbers'!
CMXLV class
	instanceVariableNames: ''!

!CMXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLVI.
	previous := CMXLIV.! !


!classDefinition: #CMXLVI category: 'NaturalNumbers'!
II subclass: #CMXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLVI class' category: 'NaturalNumbers'!
CMXLVI class
	instanceVariableNames: ''!

!CMXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLVII.
	previous := CMXLV.! !


!classDefinition: #CMXLVII category: 'NaturalNumbers'!
II subclass: #CMXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLVII class' category: 'NaturalNumbers'!
CMXLVII class
	instanceVariableNames: ''!

!CMXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLVIII.
	previous := CMXLVI.! !


!classDefinition: #CMXLVIII category: 'NaturalNumbers'!
II subclass: #CMXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXLVIII class' category: 'NaturalNumbers'!
CMXLVIII class
	instanceVariableNames: ''!

!CMXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXLIX.
	previous := CMXLVII.! !


!classDefinition: #CMXV category: 'NaturalNumbers'!
II subclass: #CMXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXV class' category: 'NaturalNumbers'!
CMXV class
	instanceVariableNames: ''!

!CMXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXVI.
	previous := CMXIV.! !


!classDefinition: #CMXVI category: 'NaturalNumbers'!
II subclass: #CMXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXVI class' category: 'NaturalNumbers'!
CMXVI class
	instanceVariableNames: ''!

!CMXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXVII.
	previous := CMXV.! !


!classDefinition: #CMXVII category: 'NaturalNumbers'!
II subclass: #CMXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXVII class' category: 'NaturalNumbers'!
CMXVII class
	instanceVariableNames: ''!

!CMXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXVIII.
	previous := CMXVI.! !


!classDefinition: #CMXVIII category: 'NaturalNumbers'!
II subclass: #CMXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXVIII class' category: 'NaturalNumbers'!
CMXVIII class
	instanceVariableNames: ''!

!CMXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXIX.
	previous := CMXVII.! !


!classDefinition: #CMXX category: 'NaturalNumbers'!
II subclass: #CMXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXX class' category: 'NaturalNumbers'!
CMXX class
	instanceVariableNames: ''!

!CMXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXI.
	previous := CMXIX.! !


!classDefinition: #CMXXI category: 'NaturalNumbers'!
II subclass: #CMXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXI class' category: 'NaturalNumbers'!
CMXXI class
	instanceVariableNames: ''!

!CMXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXII.
	previous := CMXX.! !


!classDefinition: #CMXXII category: 'NaturalNumbers'!
II subclass: #CMXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXII class' category: 'NaturalNumbers'!
CMXXII class
	instanceVariableNames: ''!

!CMXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXIII.
	previous := CMXXI.! !


!classDefinition: #CMXXIII category: 'NaturalNumbers'!
II subclass: #CMXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXIII class' category: 'NaturalNumbers'!
CMXXIII class
	instanceVariableNames: ''!

!CMXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXIV.
	previous := CMXXII.! !


!classDefinition: #CMXXIV category: 'NaturalNumbers'!
II subclass: #CMXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXIV class' category: 'NaturalNumbers'!
CMXXIV class
	instanceVariableNames: ''!

!CMXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXV.
	previous := CMXXIII.! !


!classDefinition: #CMXXIX category: 'NaturalNumbers'!
II subclass: #CMXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXIX class' category: 'NaturalNumbers'!
CMXXIX class
	instanceVariableNames: ''!

!CMXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXX.
	previous := CMXXVIII.! !


!classDefinition: #CMXXV category: 'NaturalNumbers'!
II subclass: #CMXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXV class' category: 'NaturalNumbers'!
CMXXV class
	instanceVariableNames: ''!

!CMXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXVI.
	previous := CMXXIV.! !


!classDefinition: #CMXXVI category: 'NaturalNumbers'!
II subclass: #CMXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXVI class' category: 'NaturalNumbers'!
CMXXVI class
	instanceVariableNames: ''!

!CMXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXVII.
	previous := CMXXV.! !


!classDefinition: #CMXXVII category: 'NaturalNumbers'!
II subclass: #CMXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXVII class' category: 'NaturalNumbers'!
CMXXVII class
	instanceVariableNames: ''!

!CMXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXVIII.
	previous := CMXXVI.! !


!classDefinition: #CMXXVIII category: 'NaturalNumbers'!
II subclass: #CMXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXVIII class' category: 'NaturalNumbers'!
CMXXVIII class
	instanceVariableNames: ''!

!CMXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXIX.
	previous := CMXXVII.! !


!classDefinition: #CMXXX category: 'NaturalNumbers'!
II subclass: #CMXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXX class' category: 'NaturalNumbers'!
CMXXX class
	instanceVariableNames: ''!

!CMXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXI.
	previous := CMXXIX.! !


!classDefinition: #CMXXXI category: 'NaturalNumbers'!
II subclass: #CMXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXI class' category: 'NaturalNumbers'!
CMXXXI class
	instanceVariableNames: ''!

!CMXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXII.
	previous := CMXXX.! !


!classDefinition: #CMXXXII category: 'NaturalNumbers'!
II subclass: #CMXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXII class' category: 'NaturalNumbers'!
CMXXXII class
	instanceVariableNames: ''!

!CMXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXIII.
	previous := CMXXXI.! !


!classDefinition: #CMXXXIII category: 'NaturalNumbers'!
II subclass: #CMXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXIII class' category: 'NaturalNumbers'!
CMXXXIII class
	instanceVariableNames: ''!

!CMXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXIV.
	previous := CMXXXII.! !


!classDefinition: #CMXXXIV category: 'NaturalNumbers'!
II subclass: #CMXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXIV class' category: 'NaturalNumbers'!
CMXXXIV class
	instanceVariableNames: ''!

!CMXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXV.
	previous := CMXXXIII.! !


!classDefinition: #CMXXXIX category: 'NaturalNumbers'!
II subclass: #CMXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXIX class' category: 'NaturalNumbers'!
CMXXXIX class
	instanceVariableNames: ''!

!CMXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXL.
	previous := CMXXXVIII.! !


!classDefinition: #CMXXXV category: 'NaturalNumbers'!
II subclass: #CMXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXV class' category: 'NaturalNumbers'!
CMXXXV class
	instanceVariableNames: ''!

!CMXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXVI.
	previous := CMXXXIV.! !


!classDefinition: #CMXXXVI category: 'NaturalNumbers'!
II subclass: #CMXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXVI class' category: 'NaturalNumbers'!
CMXXXVI class
	instanceVariableNames: ''!

!CMXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXVII.
	previous := CMXXXV.! !


!classDefinition: #CMXXXVII category: 'NaturalNumbers'!
II subclass: #CMXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXVII class' category: 'NaturalNumbers'!
CMXXXVII class
	instanceVariableNames: ''!

!CMXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXVIII.
	previous := CMXXXVI.! !


!classDefinition: #CMXXXVIII category: 'NaturalNumbers'!
II subclass: #CMXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CMXXXVIII class' category: 'NaturalNumbers'!
CMXXXVIII class
	instanceVariableNames: ''!

!CMXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CMXXXIX.
	previous := CMXXXVII.! !


!classDefinition: #CV category: 'NaturalNumbers'!
II subclass: #CV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CV class' category: 'NaturalNumbers'!
CV class
	instanceVariableNames: ''!

!CV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVI.
	previous := CIV.! !


!classDefinition: #CVI category: 'NaturalNumbers'!
II subclass: #CVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVI class' category: 'NaturalNumbers'!
CVI class
	instanceVariableNames: ''!

!CVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVII.
	previous := CV.! !


!classDefinition: #CVII category: 'NaturalNumbers'!
II subclass: #CVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVII class' category: 'NaturalNumbers'!
CVII class
	instanceVariableNames: ''!

!CVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVIII.
	previous := CVI.! !


!classDefinition: #CVIII category: 'NaturalNumbers'!
II subclass: #CVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVIII class' category: 'NaturalNumbers'!
CVIII class
	instanceVariableNames: ''!

!CVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIX.
	previous := CVII.! !


!classDefinition: #CX category: 'NaturalNumbers'!
II subclass: #CX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CX class' category: 'NaturalNumbers'!
CX class
	instanceVariableNames: ''!

!CX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXI.
	previous := CIX.! !


!classDefinition: #CXC category: 'NaturalNumbers'!
II subclass: #CXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXC class' category: 'NaturalNumbers'!
CXC class
	instanceVariableNames: ''!

!CXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCI.
	previous := CLXXXIX.! !


!classDefinition: #CXCI category: 'NaturalNumbers'!
II subclass: #CXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCI class' category: 'NaturalNumbers'!
CXCI class
	instanceVariableNames: ''!

!CXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCII.
	previous := CXC.! !


!classDefinition: #CXCII category: 'NaturalNumbers'!
II subclass: #CXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCII class' category: 'NaturalNumbers'!
CXCII class
	instanceVariableNames: ''!

!CXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIII.
	previous := CXCI.! !


!classDefinition: #CXCIII category: 'NaturalNumbers'!
II subclass: #CXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIII class' category: 'NaturalNumbers'!
CXCIII class
	instanceVariableNames: ''!

!CXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIV.
	previous := CXCII.! !


!classDefinition: #CXCIV category: 'NaturalNumbers'!
II subclass: #CXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIV class' category: 'NaturalNumbers'!
CXCIV class
	instanceVariableNames: ''!

!CXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCV.
	previous := CXCIII.! !


!classDefinition: #CXCIX category: 'NaturalNumbers'!
II subclass: #CXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIX class' category: 'NaturalNumbers'!
CXCIX class
	instanceVariableNames: ''!

!CXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CC.
	previous := CXCVIII.! !


!classDefinition: #CXCV category: 'NaturalNumbers'!
II subclass: #CXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCV class' category: 'NaturalNumbers'!
CXCV class
	instanceVariableNames: ''!

!CXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:56'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVI.
	previous := CXCIV.! !


!classDefinition: #CXCVI category: 'NaturalNumbers'!
II subclass: #CXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVI class' category: 'NaturalNumbers'!
CXCVI class
	instanceVariableNames: ''!

!CXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVII.
	previous := CXCV.! !


!classDefinition: #CXCVII category: 'NaturalNumbers'!
II subclass: #CXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVII class' category: 'NaturalNumbers'!
CXCVII class
	instanceVariableNames: ''!

!CXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVIII.
	previous := CXCVI.! !


!classDefinition: #CXCVIII category: 'NaturalNumbers'!
II subclass: #CXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVIII class' category: 'NaturalNumbers'!
CXCVIII class
	instanceVariableNames: ''!

!CXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIX.
	previous := CXCVII.! !


!classDefinition: #CXI category: 'NaturalNumbers'!
II subclass: #CXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXI class' category: 'NaturalNumbers'!
CXI class
	instanceVariableNames: ''!

!CXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXII.
	previous := CX.! !


!classDefinition: #CXII category: 'NaturalNumbers'!
II subclass: #CXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXII class' category: 'NaturalNumbers'!
CXII class
	instanceVariableNames: ''!

!CXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIII.
	previous := CXI.! !


!classDefinition: #CXIII category: 'NaturalNumbers'!
II subclass: #CXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIII class' category: 'NaturalNumbers'!
CXIII class
	instanceVariableNames: ''!

!CXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIV.
	previous := CXII.! !


!classDefinition: #CXIV category: 'NaturalNumbers'!
II subclass: #CXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIV class' category: 'NaturalNumbers'!
CXIV class
	instanceVariableNames: ''!

!CXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXV.
	previous := CXIII.! !


!classDefinition: #CXIX category: 'NaturalNumbers'!
II subclass: #CXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIX class' category: 'NaturalNumbers'!
CXIX class
	instanceVariableNames: ''!

!CXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXX.
	previous := CXVIII.! !


!classDefinition: #CXL category: 'NaturalNumbers'!
II subclass: #CXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXL class' category: 'NaturalNumbers'!
CXL class
	instanceVariableNames: ''!

!CXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLI.
	previous := CXXXIX.! !


!classDefinition: #CXLI category: 'NaturalNumbers'!
II subclass: #CXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLI class' category: 'NaturalNumbers'!
CXLI class
	instanceVariableNames: ''!

!CXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLII.
	previous := CXL.! !


!classDefinition: #CXLII category: 'NaturalNumbers'!
II subclass: #CXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLII class' category: 'NaturalNumbers'!
CXLII class
	instanceVariableNames: ''!

!CXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:57'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIII.
	previous := CXLI.! !


!classDefinition: #CXLIII category: 'NaturalNumbers'!
II subclass: #CXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIII class' category: 'NaturalNumbers'!
CXLIII class
	instanceVariableNames: ''!

!CXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIV.
	previous := CXLII.! !


!classDefinition: #CXLIV category: 'NaturalNumbers'!
II subclass: #CXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIV class' category: 'NaturalNumbers'!
CXLIV class
	instanceVariableNames: ''!

!CXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLV.
	previous := CXLIII.! !


!classDefinition: #CXLIX category: 'NaturalNumbers'!
II subclass: #CXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIX class' category: 'NaturalNumbers'!
CXLIX class
	instanceVariableNames: ''!

!CXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CL.
	previous := CXLVIII.! !


!classDefinition: #CXLV category: 'NaturalNumbers'!
II subclass: #CXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLV class' category: 'NaturalNumbers'!
CXLV class
	instanceVariableNames: ''!

!CXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVI.
	previous := CXLIV.! !


!classDefinition: #CXLVI category: 'NaturalNumbers'!
II subclass: #CXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVI class' category: 'NaturalNumbers'!
CXLVI class
	instanceVariableNames: ''!

!CXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVII.
	previous := CXLV.! !


!classDefinition: #CXLVII category: 'NaturalNumbers'!
II subclass: #CXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVII class' category: 'NaturalNumbers'!
CXLVII class
	instanceVariableNames: ''!

!CXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVIII.
	previous := CXLVI.! !


!classDefinition: #CXLVIII category: 'NaturalNumbers'!
II subclass: #CXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVIII class' category: 'NaturalNumbers'!
CXLVIII class
	instanceVariableNames: ''!

!CXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIX.
	previous := CXLVII.! !


!classDefinition: #CXV category: 'NaturalNumbers'!
II subclass: #CXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXV class' category: 'NaturalNumbers'!
CXV class
	instanceVariableNames: ''!

!CXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVI.
	previous := CXIV.! !


!classDefinition: #CXVI category: 'NaturalNumbers'!
II subclass: #CXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVI class' category: 'NaturalNumbers'!
CXVI class
	instanceVariableNames: ''!

!CXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVII.
	previous := CXV.! !


!classDefinition: #CXVII category: 'NaturalNumbers'!
II subclass: #CXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVII class' category: 'NaturalNumbers'!
CXVII class
	instanceVariableNames: ''!

!CXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVIII.
	previous := CXVI.! !


!classDefinition: #CXVIII category: 'NaturalNumbers'!
II subclass: #CXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVIII class' category: 'NaturalNumbers'!
CXVIII class
	instanceVariableNames: ''!

!CXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIX.
	previous := CXVII.! !


!classDefinition: #CXX category: 'NaturalNumbers'!
II subclass: #CXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXX class' category: 'NaturalNumbers'!
CXX class
	instanceVariableNames: ''!

!CXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXI.
	previous := CXIX.! !


!classDefinition: #CXXI category: 'NaturalNumbers'!
II subclass: #CXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXI class' category: 'NaturalNumbers'!
CXXI class
	instanceVariableNames: ''!

!CXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXII.
	previous := CXX.! !


!classDefinition: #CXXII category: 'NaturalNumbers'!
II subclass: #CXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXII class' category: 'NaturalNumbers'!
CXXII class
	instanceVariableNames: ''!

!CXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIII.
	previous := CXXI.! !


!classDefinition: #CXXIII category: 'NaturalNumbers'!
II subclass: #CXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIII class' category: 'NaturalNumbers'!
CXXIII class
	instanceVariableNames: ''!

!CXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIV.
	previous := CXXII.! !


!classDefinition: #CXXIV category: 'NaturalNumbers'!
II subclass: #CXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIV class' category: 'NaturalNumbers'!
CXXIV class
	instanceVariableNames: ''!

!CXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXV.
	previous := CXXIII.! !


!classDefinition: #CXXIX category: 'NaturalNumbers'!
II subclass: #CXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIX class' category: 'NaturalNumbers'!
CXXIX class
	instanceVariableNames: ''!

!CXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXX.
	previous := CXXVIII.! !


!classDefinition: #CXXV category: 'NaturalNumbers'!
II subclass: #CXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXV class' category: 'NaturalNumbers'!
CXXV class
	instanceVariableNames: ''!

!CXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVI.
	previous := CXXIV.! !


!classDefinition: #CXXVI category: 'NaturalNumbers'!
II subclass: #CXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVI class' category: 'NaturalNumbers'!
CXXVI class
	instanceVariableNames: ''!

!CXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVII.
	previous := CXXV.! !


!classDefinition: #CXXVII category: 'NaturalNumbers'!
II subclass: #CXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVII class' category: 'NaturalNumbers'!
CXXVII class
	instanceVariableNames: ''!

!CXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVIII.
	previous := CXXVI.! !


!classDefinition: #CXXVIII category: 'NaturalNumbers'!
II subclass: #CXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVIII class' category: 'NaturalNumbers'!
CXXVIII class
	instanceVariableNames: ''!

!CXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:03:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIX.
	previous := CXXVII.! !


!classDefinition: #CXXX category: 'NaturalNumbers'!
II subclass: #CXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXX class' category: 'NaturalNumbers'!
CXXX class
	instanceVariableNames: ''!

!CXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXI.
	previous := CXXIX.! !


!classDefinition: #CXXXI category: 'NaturalNumbers'!
II subclass: #CXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXI class' category: 'NaturalNumbers'!
CXXXI class
	instanceVariableNames: ''!

!CXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXII.
	previous := CXXX.! !


!classDefinition: #CXXXII category: 'NaturalNumbers'!
II subclass: #CXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXII class' category: 'NaturalNumbers'!
CXXXII class
	instanceVariableNames: ''!

!CXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIII.
	previous := CXXXI.! !


!classDefinition: #CXXXIII category: 'NaturalNumbers'!
II subclass: #CXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIII class' category: 'NaturalNumbers'!
CXXXIII class
	instanceVariableNames: ''!

!CXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIV.
	previous := CXXXII.! !


!classDefinition: #CXXXIV category: 'NaturalNumbers'!
II subclass: #CXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIV class' category: 'NaturalNumbers'!
CXXXIV class
	instanceVariableNames: ''!

!CXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXV.
	previous := CXXXIII.! !


!classDefinition: #CXXXIX category: 'NaturalNumbers'!
II subclass: #CXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIX class' category: 'NaturalNumbers'!
CXXXIX class
	instanceVariableNames: ''!

!CXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXL.
	previous := CXXXVIII.! !


!classDefinition: #CXXXV category: 'NaturalNumbers'!
II subclass: #CXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXV class' category: 'NaturalNumbers'!
CXXXV class
	instanceVariableNames: ''!

!CXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVI.
	previous := CXXXIV.! !


!classDefinition: #CXXXVI category: 'NaturalNumbers'!
II subclass: #CXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVI class' category: 'NaturalNumbers'!
CXXXVI class
	instanceVariableNames: ''!

!CXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVII.
	previous := CXXXV.! !


!classDefinition: #CXXXVII category: 'NaturalNumbers'!
II subclass: #CXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVII class' category: 'NaturalNumbers'!
CXXXVII class
	instanceVariableNames: ''!

!CXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVIII.
	previous := CXXXVI.! !


!classDefinition: #CXXXVIII category: 'NaturalNumbers'!
II subclass: #CXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVIII class' category: 'NaturalNumbers'!
CXXXVIII class
	instanceVariableNames: ''!

!CXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIX.
	previous := CXXXVII.! !


!classDefinition: #D category: 'NaturalNumbers'!
II subclass: #D
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'D class' category: 'NaturalNumbers'!
D class
	instanceVariableNames: ''!

!D class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:00'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DI.
	previous := CDXCIX.! !


!classDefinition: #DC category: 'NaturalNumbers'!
II subclass: #DC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DC class' category: 'NaturalNumbers'!
DC class
	instanceVariableNames: ''!

!DC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCI.
	previous := DXCIX.! !


!classDefinition: #DCC category: 'NaturalNumbers'!
II subclass: #DCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCC class' category: 'NaturalNumbers'!
DCC class
	instanceVariableNames: ''!

!DCC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCI.
	previous := DCXCIX.! !


!classDefinition: #DCCC category: 'NaturalNumbers'!
II subclass: #DCCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCC class' category: 'NaturalNumbers'!
DCCC class
	instanceVariableNames: ''!

!DCCC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCI.
	previous := DCCXCIX.! !


!classDefinition: #DCCCI category: 'NaturalNumbers'!
II subclass: #DCCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCI class' category: 'NaturalNumbers'!
DCCCI class
	instanceVariableNames: ''!

!DCCCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCII.
	previous := DCCC.! !


!classDefinition: #DCCCII category: 'NaturalNumbers'!
II subclass: #DCCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCII class' category: 'NaturalNumbers'!
DCCCII class
	instanceVariableNames: ''!

!DCCCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCIII.
	previous := DCCCI.! !


!classDefinition: #DCCCIII category: 'NaturalNumbers'!
II subclass: #DCCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIII class' category: 'NaturalNumbers'!
DCCCIII class
	instanceVariableNames: ''!

!DCCCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCIV.
	previous := DCCCII.! !


!classDefinition: #DCCCIV category: 'NaturalNumbers'!
II subclass: #DCCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIV class' category: 'NaturalNumbers'!
DCCCIV class
	instanceVariableNames: ''!

!DCCCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCV.
	previous := DCCCIII.! !


!classDefinition: #DCCCIX category: 'NaturalNumbers'!
II subclass: #DCCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCIX class' category: 'NaturalNumbers'!
DCCCIX class
	instanceVariableNames: ''!

!DCCCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCX.
	previous := DCCCVIII.! !


!classDefinition: #DCCCL category: 'NaturalNumbers'!
II subclass: #DCCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCL class' category: 'NaturalNumbers'!
DCCCL class
	instanceVariableNames: ''!

!DCCCL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLI.
	previous := DCCCXLIX.! !


!classDefinition: #DCCCLI category: 'NaturalNumbers'!
II subclass: #DCCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLI class' category: 'NaturalNumbers'!
DCCCLI class
	instanceVariableNames: ''!

!DCCCLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLII.
	previous := DCCCL.! !


!classDefinition: #DCCCLII category: 'NaturalNumbers'!
II subclass: #DCCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLII class' category: 'NaturalNumbers'!
DCCCLII class
	instanceVariableNames: ''!

!DCCCLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:01'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLIII.
	previous := DCCCLI.! !


!classDefinition: #DCCCLIII category: 'NaturalNumbers'!
II subclass: #DCCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLIII class' category: 'NaturalNumbers'!
DCCCLIII class
	instanceVariableNames: ''!

!DCCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLIV.
	previous := DCCCLII.! !


!classDefinition: #DCCCLIV category: 'NaturalNumbers'!
II subclass: #DCCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLIV class' category: 'NaturalNumbers'!
DCCCLIV class
	instanceVariableNames: ''!

!DCCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLV.
	previous := DCCCLIII.! !


!classDefinition: #DCCCLIX category: 'NaturalNumbers'!
II subclass: #DCCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLIX class' category: 'NaturalNumbers'!
DCCCLIX class
	instanceVariableNames: ''!

!DCCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLX.
	previous := DCCCLVIII.! !


!classDefinition: #DCCCLV category: 'NaturalNumbers'!
II subclass: #DCCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLV class' category: 'NaturalNumbers'!
DCCCLV class
	instanceVariableNames: ''!

!DCCCLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLVI.
	previous := DCCCLIV.! !


!classDefinition: #DCCCLVI category: 'NaturalNumbers'!
II subclass: #DCCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLVI class' category: 'NaturalNumbers'!
DCCCLVI class
	instanceVariableNames: ''!

!DCCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLVII.
	previous := DCCCLV.! !


!classDefinition: #DCCCLVII category: 'NaturalNumbers'!
II subclass: #DCCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLVII class' category: 'NaturalNumbers'!
DCCCLVII class
	instanceVariableNames: ''!

!DCCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLVIII.
	previous := DCCCLVI.! !


!classDefinition: #DCCCLVIII category: 'NaturalNumbers'!
II subclass: #DCCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLVIII class' category: 'NaturalNumbers'!
DCCCLVIII class
	instanceVariableNames: ''!

!DCCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLIX.
	previous := DCCCLVII.! !


!classDefinition: #DCCCLX category: 'NaturalNumbers'!
II subclass: #DCCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLX class' category: 'NaturalNumbers'!
DCCCLX class
	instanceVariableNames: ''!

!DCCCLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXI.
	previous := DCCCLIX.! !


!classDefinition: #DCCCLXI category: 'NaturalNumbers'!
II subclass: #DCCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXI class' category: 'NaturalNumbers'!
DCCCLXI class
	instanceVariableNames: ''!

!DCCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXII.
	previous := DCCCLX.! !


!classDefinition: #DCCCLXII category: 'NaturalNumbers'!
II subclass: #DCCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXII class' category: 'NaturalNumbers'!
DCCCLXII class
	instanceVariableNames: ''!

!DCCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:02'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXIII.
	previous := DCCCLXI.! !


!classDefinition: #DCCCLXIII category: 'NaturalNumbers'!
II subclass: #DCCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXIII class' category: 'NaturalNumbers'!
DCCCLXIII class
	instanceVariableNames: ''!

!DCCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXIV.
	previous := DCCCLXII.! !


!classDefinition: #DCCCLXIV category: 'NaturalNumbers'!
II subclass: #DCCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXIV class' category: 'NaturalNumbers'!
DCCCLXIV class
	instanceVariableNames: ''!

!DCCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXV.
	previous := DCCCLXIII.! !


!classDefinition: #DCCCLXIX category: 'NaturalNumbers'!
II subclass: #DCCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXIX class' category: 'NaturalNumbers'!
DCCCLXIX class
	instanceVariableNames: ''!

!DCCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXX.
	previous := DCCCLXVIII.! !


!classDefinition: #DCCCLXV category: 'NaturalNumbers'!
II subclass: #DCCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXV class' category: 'NaturalNumbers'!
DCCCLXV class
	instanceVariableNames: ''!

!DCCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXVI.
	previous := DCCCLXIV.! !


!classDefinition: #DCCCLXVI category: 'NaturalNumbers'!
II subclass: #DCCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXVI class' category: 'NaturalNumbers'!
DCCCLXVI class
	instanceVariableNames: ''!

!DCCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXVII.
	previous := DCCCLXV.! !


!classDefinition: #DCCCLXVII category: 'NaturalNumbers'!
II subclass: #DCCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXVII class' category: 'NaturalNumbers'!
DCCCLXVII class
	instanceVariableNames: ''!

!DCCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXVIII.
	previous := DCCCLXVI.! !


!classDefinition: #DCCCLXVIII category: 'NaturalNumbers'!
II subclass: #DCCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXVIII class' category: 'NaturalNumbers'!
DCCCLXVIII class
	instanceVariableNames: ''!

!DCCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXIX.
	previous := DCCCLXVII.! !


!classDefinition: #DCCCLXX category: 'NaturalNumbers'!
II subclass: #DCCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXX class' category: 'NaturalNumbers'!
DCCCLXX class
	instanceVariableNames: ''!

!DCCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXI.
	previous := DCCCLXIX.! !


!classDefinition: #DCCCLXXI category: 'NaturalNumbers'!
II subclass: #DCCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXI class' category: 'NaturalNumbers'!
DCCCLXXI class
	instanceVariableNames: ''!

!DCCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXII.
	previous := DCCCLXX.! !


!classDefinition: #DCCCLXXII category: 'NaturalNumbers'!
II subclass: #DCCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXII class' category: 'NaturalNumbers'!
DCCCLXXII class
	instanceVariableNames: ''!

!DCCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXIII.
	previous := DCCCLXXI.! !


!classDefinition: #DCCCLXXIII category: 'NaturalNumbers'!
II subclass: #DCCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXIII class' category: 'NaturalNumbers'!
DCCCLXXIII class
	instanceVariableNames: ''!

!DCCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:03'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXIV.
	previous := DCCCLXXII.! !


!classDefinition: #DCCCLXXIV category: 'NaturalNumbers'!
II subclass: #DCCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXIV class' category: 'NaturalNumbers'!
DCCCLXXIV class
	instanceVariableNames: ''!

!DCCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXV.
	previous := DCCCLXXIII.! !


!classDefinition: #DCCCLXXIX category: 'NaturalNumbers'!
II subclass: #DCCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXIX class' category: 'NaturalNumbers'!
DCCCLXXIX class
	instanceVariableNames: ''!

!DCCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXX.
	previous := DCCCLXXVIII.! !


!classDefinition: #DCCCLXXV category: 'NaturalNumbers'!
II subclass: #DCCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXV class' category: 'NaturalNumbers'!
DCCCLXXV class
	instanceVariableNames: ''!

!DCCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXVI.
	previous := DCCCLXXIV.! !


!classDefinition: #DCCCLXXVI category: 'NaturalNumbers'!
II subclass: #DCCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXVI class' category: 'NaturalNumbers'!
DCCCLXXVI class
	instanceVariableNames: ''!

!DCCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXVII.
	previous := DCCCLXXV.! !


!classDefinition: #DCCCLXXVII category: 'NaturalNumbers'!
II subclass: #DCCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXVII class' category: 'NaturalNumbers'!
DCCCLXXVII class
	instanceVariableNames: ''!

!DCCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXVIII.
	previous := DCCCLXXVI.! !


!classDefinition: #DCCCLXXVIII category: 'NaturalNumbers'!
II subclass: #DCCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXVIII class' category: 'NaturalNumbers'!
DCCCLXXVIII class
	instanceVariableNames: ''!

!DCCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXIX.
	previous := DCCCLXXVII.! !


!classDefinition: #DCCCLXXX category: 'NaturalNumbers'!
II subclass: #DCCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXX class' category: 'NaturalNumbers'!
DCCCLXXX class
	instanceVariableNames: ''!

!DCCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXI.
	previous := DCCCLXXIX.! !


!classDefinition: #DCCCLXXXI category: 'NaturalNumbers'!
II subclass: #DCCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXI class' category: 'NaturalNumbers'!
DCCCLXXXI class
	instanceVariableNames: ''!

!DCCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXII.
	previous := DCCCLXXX.! !


!classDefinition: #DCCCLXXXII category: 'NaturalNumbers'!
II subclass: #DCCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXII class' category: 'NaturalNumbers'!
DCCCLXXXII class
	instanceVariableNames: ''!

!DCCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXIII.
	previous := DCCCLXXXI.! !


!classDefinition: #DCCCLXXXIII category: 'NaturalNumbers'!
II subclass: #DCCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXIII class' category: 'NaturalNumbers'!
DCCCLXXXIII class
	instanceVariableNames: ''!

!DCCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:04'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXIV.
	previous := DCCCLXXXII.! !


!classDefinition: #DCCCLXXXIV category: 'NaturalNumbers'!
II subclass: #DCCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXIV class' category: 'NaturalNumbers'!
DCCCLXXXIV class
	instanceVariableNames: ''!

!DCCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXV.
	previous := DCCCLXXXIII.! !


!classDefinition: #DCCCLXXXIX category: 'NaturalNumbers'!
II subclass: #DCCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXIX class' category: 'NaturalNumbers'!
DCCCLXXXIX class
	instanceVariableNames: ''!

!DCCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXC.
	previous := DCCCLXXXVIII.! !


!classDefinition: #DCCCLXXXV category: 'NaturalNumbers'!
II subclass: #DCCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXV class' category: 'NaturalNumbers'!
DCCCLXXXV class
	instanceVariableNames: ''!

!DCCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXVI.
	previous := DCCCLXXXIV.! !


!classDefinition: #DCCCLXXXVI category: 'NaturalNumbers'!
II subclass: #DCCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXVI class' category: 'NaturalNumbers'!
DCCCLXXXVI class
	instanceVariableNames: ''!

!DCCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXVII.
	previous := DCCCLXXXV.! !


!classDefinition: #DCCCLXXXVII category: 'NaturalNumbers'!
II subclass: #DCCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXVII class' category: 'NaturalNumbers'!
DCCCLXXXVII class
	instanceVariableNames: ''!

!DCCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXVIII.
	previous := DCCCLXXXVI.! !


!classDefinition: #DCCCLXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCLXXXVIII class' category: 'NaturalNumbers'!
DCCCLXXXVIII class
	instanceVariableNames: ''!

!DCCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCLXXXIX.
	previous := DCCCLXXXVII.! !


!classDefinition: #DCCCV category: 'NaturalNumbers'!
II subclass: #DCCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCV class' category: 'NaturalNumbers'!
DCCCV class
	instanceVariableNames: ''!

!DCCCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCVI.
	previous := DCCCIV.! !


!classDefinition: #DCCCVI category: 'NaturalNumbers'!
II subclass: #DCCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVI class' category: 'NaturalNumbers'!
DCCCVI class
	instanceVariableNames: ''!

!DCCCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCVII.
	previous := DCCCV.! !


!classDefinition: #DCCCVII category: 'NaturalNumbers'!
II subclass: #DCCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVII class' category: 'NaturalNumbers'!
DCCCVII class
	instanceVariableNames: ''!

!DCCCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCVIII.
	previous := DCCCVI.! !


!classDefinition: #DCCCVIII category: 'NaturalNumbers'!
II subclass: #DCCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCVIII class' category: 'NaturalNumbers'!
DCCCVIII class
	instanceVariableNames: ''!

!DCCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCIX.
	previous := DCCCVII.! !


!classDefinition: #DCCCX category: 'NaturalNumbers'!
II subclass: #DCCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCX class' category: 'NaturalNumbers'!
DCCCX class
	instanceVariableNames: ''!

!DCCCX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:05'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXI.
	previous := DCCCIX.! !


!classDefinition: #DCCCXC category: 'NaturalNumbers'!
II subclass: #DCCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXC class' category: 'NaturalNumbers'!
DCCCXC class
	instanceVariableNames: ''!

!DCCCXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCI.
	previous := DCCCLXXXIX.! !


!classDefinition: #DCCCXCI category: 'NaturalNumbers'!
II subclass: #DCCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCI class' category: 'NaturalNumbers'!
DCCCXCI class
	instanceVariableNames: ''!

!DCCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCII.
	previous := DCCCXC.! !


!classDefinition: #DCCCXCII category: 'NaturalNumbers'!
II subclass: #DCCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCII class' category: 'NaturalNumbers'!
DCCCXCII class
	instanceVariableNames: ''!

!DCCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCIII.
	previous := DCCCXCI.! !


!classDefinition: #DCCCXCIII category: 'NaturalNumbers'!
II subclass: #DCCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCIII class' category: 'NaturalNumbers'!
DCCCXCIII class
	instanceVariableNames: ''!

!DCCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCIV.
	previous := DCCCXCII.! !


!classDefinition: #DCCCXCIV category: 'NaturalNumbers'!
II subclass: #DCCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCIV class' category: 'NaturalNumbers'!
DCCCXCIV class
	instanceVariableNames: ''!

!DCCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCV.
	previous := DCCCXCIII.! !


!classDefinition: #DCCCXCIX category: 'NaturalNumbers'!
II subclass: #DCCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCIX class' category: 'NaturalNumbers'!
DCCCXCIX class
	instanceVariableNames: ''!

!DCCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CM.
	previous := DCCCXCVIII.! !


!classDefinition: #DCCCXCV category: 'NaturalNumbers'!
II subclass: #DCCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCV class' category: 'NaturalNumbers'!
DCCCXCV class
	instanceVariableNames: ''!

!DCCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCVI.
	previous := DCCCXCIV.! !


!classDefinition: #DCCCXCVI category: 'NaturalNumbers'!
II subclass: #DCCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCVI class' category: 'NaturalNumbers'!
DCCCXCVI class
	instanceVariableNames: ''!

!DCCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCVII.
	previous := DCCCXCV.! !


!classDefinition: #DCCCXCVII category: 'NaturalNumbers'!
II subclass: #DCCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCVII class' category: 'NaturalNumbers'!
DCCCXCVII class
	instanceVariableNames: ''!

!DCCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCVIII.
	previous := DCCCXCVI.! !


!classDefinition: #DCCCXCVIII category: 'NaturalNumbers'!
II subclass: #DCCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXCVIII class' category: 'NaturalNumbers'!
DCCCXCVIII class
	instanceVariableNames: ''!

!DCCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:06'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXCIX.
	previous := DCCCXCVII.! !


!classDefinition: #DCCCXI category: 'NaturalNumbers'!
II subclass: #DCCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXI class' category: 'NaturalNumbers'!
DCCCXI class
	instanceVariableNames: ''!

!DCCCXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXII.
	previous := DCCCX.! !


!classDefinition: #DCCCXII category: 'NaturalNumbers'!
II subclass: #DCCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXII class' category: 'NaturalNumbers'!
DCCCXII class
	instanceVariableNames: ''!

!DCCCXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXIII.
	previous := DCCCXI.! !


!classDefinition: #DCCCXIII category: 'NaturalNumbers'!
II subclass: #DCCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIII class' category: 'NaturalNumbers'!
DCCCXIII class
	instanceVariableNames: ''!

!DCCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXIV.
	previous := DCCCXII.! !


!classDefinition: #DCCCXIV category: 'NaturalNumbers'!
II subclass: #DCCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIV class' category: 'NaturalNumbers'!
DCCCXIV class
	instanceVariableNames: ''!

!DCCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXV.
	previous := DCCCXIII.! !


!classDefinition: #DCCCXIX category: 'NaturalNumbers'!
II subclass: #DCCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXIX class' category: 'NaturalNumbers'!
DCCCXIX class
	instanceVariableNames: ''!

!DCCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXX.
	previous := DCCCXVIII.! !


!classDefinition: #DCCCXL category: 'NaturalNumbers'!
II subclass: #DCCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXL class' category: 'NaturalNumbers'!
DCCCXL class
	instanceVariableNames: ''!

!DCCCXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLI.
	previous := DCCCXXXIX.! !


!classDefinition: #DCCCXLI category: 'NaturalNumbers'!
II subclass: #DCCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLI class' category: 'NaturalNumbers'!
DCCCXLI class
	instanceVariableNames: ''!

!DCCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLII.
	previous := DCCCXL.! !


!classDefinition: #DCCCXLII category: 'NaturalNumbers'!
II subclass: #DCCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLII class' category: 'NaturalNumbers'!
DCCCXLII class
	instanceVariableNames: ''!

!DCCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLIII.
	previous := DCCCXLI.! !


!classDefinition: #DCCCXLIII category: 'NaturalNumbers'!
II subclass: #DCCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIII class' category: 'NaturalNumbers'!
DCCCXLIII class
	instanceVariableNames: ''!

!DCCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLIV.
	previous := DCCCXLII.! !


!classDefinition: #DCCCXLIV category: 'NaturalNumbers'!
II subclass: #DCCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIV class' category: 'NaturalNumbers'!
DCCCXLIV class
	instanceVariableNames: ''!

!DCCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLV.
	previous := DCCCXLIII.! !


!classDefinition: #DCCCXLIX category: 'NaturalNumbers'!
II subclass: #DCCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLIX class' category: 'NaturalNumbers'!
DCCCXLIX class
	instanceVariableNames: ''!

!DCCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:07'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCL.
	previous := DCCCXLVIII.! !


!classDefinition: #DCCCXLV category: 'NaturalNumbers'!
II subclass: #DCCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLV class' category: 'NaturalNumbers'!
DCCCXLV class
	instanceVariableNames: ''!

!DCCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLVI.
	previous := DCCCXLIV.! !


!classDefinition: #DCCCXLVI category: 'NaturalNumbers'!
II subclass: #DCCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVI class' category: 'NaturalNumbers'!
DCCCXLVI class
	instanceVariableNames: ''!

!DCCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLVII.
	previous := DCCCXLV.! !


!classDefinition: #DCCCXLVII category: 'NaturalNumbers'!
II subclass: #DCCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVII class' category: 'NaturalNumbers'!
DCCCXLVII class
	instanceVariableNames: ''!

!DCCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLVIII.
	previous := DCCCXLVI.! !


!classDefinition: #DCCCXLVIII category: 'NaturalNumbers'!
II subclass: #DCCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXLVIII class' category: 'NaturalNumbers'!
DCCCXLVIII class
	instanceVariableNames: ''!

!DCCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXLIX.
	previous := DCCCXLVII.! !


!classDefinition: #DCCCXV category: 'NaturalNumbers'!
II subclass: #DCCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXV class' category: 'NaturalNumbers'!
DCCCXV class
	instanceVariableNames: ''!

!DCCCXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXVI.
	previous := DCCCXIV.! !


!classDefinition: #DCCCXVI category: 'NaturalNumbers'!
II subclass: #DCCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVI class' category: 'NaturalNumbers'!
DCCCXVI class
	instanceVariableNames: ''!

!DCCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXVII.
	previous := DCCCXV.! !


!classDefinition: #DCCCXVII category: 'NaturalNumbers'!
II subclass: #DCCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVII class' category: 'NaturalNumbers'!
DCCCXVII class
	instanceVariableNames: ''!

!DCCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXVIII.
	previous := DCCCXVI.! !


!classDefinition: #DCCCXVIII category: 'NaturalNumbers'!
II subclass: #DCCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXVIII class' category: 'NaturalNumbers'!
DCCCXVIII class
	instanceVariableNames: ''!

!DCCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXIX.
	previous := DCCCXVII.! !


!classDefinition: #DCCCXX category: 'NaturalNumbers'!
II subclass: #DCCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXX class' category: 'NaturalNumbers'!
DCCCXX class
	instanceVariableNames: ''!

!DCCCXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXI.
	previous := DCCCXIX.! !


!classDefinition: #DCCCXXI category: 'NaturalNumbers'!
II subclass: #DCCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXI class' category: 'NaturalNumbers'!
DCCCXXI class
	instanceVariableNames: ''!

!DCCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXII.
	previous := DCCCXX.! !


!classDefinition: #DCCCXXII category: 'NaturalNumbers'!
II subclass: #DCCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXII class' category: 'NaturalNumbers'!
DCCCXXII class
	instanceVariableNames: ''!

!DCCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:08'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXIII.
	previous := DCCCXXI.! !


!classDefinition: #DCCCXXIII category: 'NaturalNumbers'!
II subclass: #DCCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIII class' category: 'NaturalNumbers'!
DCCCXXIII class
	instanceVariableNames: ''!

!DCCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXIV.
	previous := DCCCXXII.! !


!classDefinition: #DCCCXXIV category: 'NaturalNumbers'!
II subclass: #DCCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIV class' category: 'NaturalNumbers'!
DCCCXXIV class
	instanceVariableNames: ''!

!DCCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXV.
	previous := DCCCXXIII.! !


!classDefinition: #DCCCXXIX category: 'NaturalNumbers'!
II subclass: #DCCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXIX class' category: 'NaturalNumbers'!
DCCCXXIX class
	instanceVariableNames: ''!

!DCCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXX.
	previous := DCCCXXVIII.! !


!classDefinition: #DCCCXXV category: 'NaturalNumbers'!
II subclass: #DCCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXV class' category: 'NaturalNumbers'!
DCCCXXV class
	instanceVariableNames: ''!

!DCCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXVI.
	previous := DCCCXXIV.! !


!classDefinition: #DCCCXXVI category: 'NaturalNumbers'!
II subclass: #DCCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVI class' category: 'NaturalNumbers'!
DCCCXXVI class
	instanceVariableNames: ''!

!DCCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXVII.
	previous := DCCCXXV.! !


!classDefinition: #DCCCXXVII category: 'NaturalNumbers'!
II subclass: #DCCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVII class' category: 'NaturalNumbers'!
DCCCXXVII class
	instanceVariableNames: ''!

!DCCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXVIII.
	previous := DCCCXXVI.! !


!classDefinition: #DCCCXXVIII category: 'NaturalNumbers'!
II subclass: #DCCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXVIII class' category: 'NaturalNumbers'!
DCCCXXVIII class
	instanceVariableNames: ''!

!DCCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXIX.
	previous := DCCCXXVII.! !


!classDefinition: #DCCCXXX category: 'NaturalNumbers'!
II subclass: #DCCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXX class' category: 'NaturalNumbers'!
DCCCXXX class
	instanceVariableNames: ''!

!DCCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXI.
	previous := DCCCXXIX.! !


!classDefinition: #DCCCXXXI category: 'NaturalNumbers'!
II subclass: #DCCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXI class' category: 'NaturalNumbers'!
DCCCXXXI class
	instanceVariableNames: ''!

!DCCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXII.
	previous := DCCCXXX.! !


!classDefinition: #DCCCXXXII category: 'NaturalNumbers'!
II subclass: #DCCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXII class' category: 'NaturalNumbers'!
DCCCXXXII class
	instanceVariableNames: ''!

!DCCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:09'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXIII.
	previous := DCCCXXXI.! !


!classDefinition: #DCCCXXXIII category: 'NaturalNumbers'!
II subclass: #DCCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIII class' category: 'NaturalNumbers'!
DCCCXXXIII class
	instanceVariableNames: ''!

!DCCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXIV.
	previous := DCCCXXXII.! !


!classDefinition: #DCCCXXXIV category: 'NaturalNumbers'!
II subclass: #DCCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIV class' category: 'NaturalNumbers'!
DCCCXXXIV class
	instanceVariableNames: ''!

!DCCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXV.
	previous := DCCCXXXIII.! !


!classDefinition: #DCCCXXXIX category: 'NaturalNumbers'!
II subclass: #DCCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXIX class' category: 'NaturalNumbers'!
DCCCXXXIX class
	instanceVariableNames: ''!

!DCCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXL.
	previous := DCCCXXXVIII.! !


!classDefinition: #DCCCXXXV category: 'NaturalNumbers'!
II subclass: #DCCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXV class' category: 'NaturalNumbers'!
DCCCXXXV class
	instanceVariableNames: ''!

!DCCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXVI.
	previous := DCCCXXXIV.! !


!classDefinition: #DCCCXXXVI category: 'NaturalNumbers'!
II subclass: #DCCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVI class' category: 'NaturalNumbers'!
DCCCXXXVI class
	instanceVariableNames: ''!

!DCCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXVII.
	previous := DCCCXXXV.! !


!classDefinition: #DCCCXXXVII category: 'NaturalNumbers'!
II subclass: #DCCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVII class' category: 'NaturalNumbers'!
DCCCXXXVII class
	instanceVariableNames: ''!

!DCCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXVIII.
	previous := DCCCXXXVI.! !


!classDefinition: #DCCCXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCCXXXVIII class' category: 'NaturalNumbers'!
DCCCXXXVIII class
	instanceVariableNames: ''!

!DCCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCCXXXIX.
	previous := DCCCXXXVII.! !


!classDefinition: #DCCI category: 'NaturalNumbers'!
II subclass: #DCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCI class' category: 'NaturalNumbers'!
DCCI class
	instanceVariableNames: ''!

!DCCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCII.
	previous := DCC.! !


!classDefinition: #DCCII category: 'NaturalNumbers'!
II subclass: #DCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCII class' category: 'NaturalNumbers'!
DCCII class
	instanceVariableNames: ''!

!DCCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCIII.
	previous := DCCI.! !


!classDefinition: #DCCIII category: 'NaturalNumbers'!
II subclass: #DCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIII class' category: 'NaturalNumbers'!
DCCIII class
	instanceVariableNames: ''!

!DCCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCIV.
	previous := DCCII.! !


!classDefinition: #DCCIV category: 'NaturalNumbers'!
II subclass: #DCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIV class' category: 'NaturalNumbers'!
DCCIV class
	instanceVariableNames: ''!

!DCCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:10'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCV.
	previous := DCCIII.! !


!classDefinition: #DCCIX category: 'NaturalNumbers'!
II subclass: #DCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCIX class' category: 'NaturalNumbers'!
DCCIX class
	instanceVariableNames: ''!

!DCCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCX.
	previous := DCCVIII.! !


!classDefinition: #DCCL category: 'NaturalNumbers'!
II subclass: #DCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCL class' category: 'NaturalNumbers'!
DCCL class
	instanceVariableNames: ''!

!DCCL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLI.
	previous := DCCXLIX.! !


!classDefinition: #DCCLI category: 'NaturalNumbers'!
II subclass: #DCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLI class' category: 'NaturalNumbers'!
DCCLI class
	instanceVariableNames: ''!

!DCCLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLII.
	previous := DCCL.! !


!classDefinition: #DCCLII category: 'NaturalNumbers'!
II subclass: #DCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLII class' category: 'NaturalNumbers'!
DCCLII class
	instanceVariableNames: ''!

!DCCLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLIII.
	previous := DCCLI.! !


!classDefinition: #DCCLIII category: 'NaturalNumbers'!
II subclass: #DCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIII class' category: 'NaturalNumbers'!
DCCLIII class
	instanceVariableNames: ''!

!DCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLIV.
	previous := DCCLII.! !


!classDefinition: #DCCLIV category: 'NaturalNumbers'!
II subclass: #DCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIV class' category: 'NaturalNumbers'!
DCCLIV class
	instanceVariableNames: ''!

!DCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLV.
	previous := DCCLIII.! !


!classDefinition: #DCCLIX category: 'NaturalNumbers'!
II subclass: #DCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLIX class' category: 'NaturalNumbers'!
DCCLIX class
	instanceVariableNames: ''!

!DCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLX.
	previous := DCCLVIII.! !


!classDefinition: #DCCLV category: 'NaturalNumbers'!
II subclass: #DCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLV class' category: 'NaturalNumbers'!
DCCLV class
	instanceVariableNames: ''!

!DCCLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLVI.
	previous := DCCLIV.! !


!classDefinition: #DCCLVI category: 'NaturalNumbers'!
II subclass: #DCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVI class' category: 'NaturalNumbers'!
DCCLVI class
	instanceVariableNames: ''!

!DCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLVII.
	previous := DCCLV.! !


!classDefinition: #DCCLVII category: 'NaturalNumbers'!
II subclass: #DCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVII class' category: 'NaturalNumbers'!
DCCLVII class
	instanceVariableNames: ''!

!DCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLVIII.
	previous := DCCLVI.! !


!classDefinition: #DCCLVIII category: 'NaturalNumbers'!
II subclass: #DCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLVIII class' category: 'NaturalNumbers'!
DCCLVIII class
	instanceVariableNames: ''!

!DCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:11'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLIX.
	previous := DCCLVII.! !


!classDefinition: #DCCLX category: 'NaturalNumbers'!
II subclass: #DCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLX class' category: 'NaturalNumbers'!
DCCLX class
	instanceVariableNames: ''!

!DCCLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXI.
	previous := DCCLIX.! !


!classDefinition: #DCCLXI category: 'NaturalNumbers'!
II subclass: #DCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXI class' category: 'NaturalNumbers'!
DCCLXI class
	instanceVariableNames: ''!

!DCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXII.
	previous := DCCLX.! !


!classDefinition: #DCCLXII category: 'NaturalNumbers'!
II subclass: #DCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXII class' category: 'NaturalNumbers'!
DCCLXII class
	instanceVariableNames: ''!

!DCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXIII.
	previous := DCCLXI.! !


!classDefinition: #DCCLXIII category: 'NaturalNumbers'!
II subclass: #DCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIII class' category: 'NaturalNumbers'!
DCCLXIII class
	instanceVariableNames: ''!

!DCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXIV.
	previous := DCCLXII.! !


!classDefinition: #DCCLXIV category: 'NaturalNumbers'!
II subclass: #DCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIV class' category: 'NaturalNumbers'!
DCCLXIV class
	instanceVariableNames: ''!

!DCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXV.
	previous := DCCLXIII.! !


!classDefinition: #DCCLXIX category: 'NaturalNumbers'!
II subclass: #DCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXIX class' category: 'NaturalNumbers'!
DCCLXIX class
	instanceVariableNames: ''!

!DCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXX.
	previous := DCCLXVIII.! !


!classDefinition: #DCCLXV category: 'NaturalNumbers'!
II subclass: #DCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXV class' category: 'NaturalNumbers'!
DCCLXV class
	instanceVariableNames: ''!

!DCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXVI.
	previous := DCCLXIV.! !


!classDefinition: #DCCLXVI category: 'NaturalNumbers'!
II subclass: #DCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVI class' category: 'NaturalNumbers'!
DCCLXVI class
	instanceVariableNames: ''!

!DCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXVII.
	previous := DCCLXV.! !


!classDefinition: #DCCLXVII category: 'NaturalNumbers'!
II subclass: #DCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVII class' category: 'NaturalNumbers'!
DCCLXVII class
	instanceVariableNames: ''!

!DCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXVIII.
	previous := DCCLXVI.! !


!classDefinition: #DCCLXVIII category: 'NaturalNumbers'!
II subclass: #DCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXVIII class' category: 'NaturalNumbers'!
DCCLXVIII class
	instanceVariableNames: ''!

!DCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:12'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXIX.
	previous := DCCLXVII.! !


!classDefinition: #DCCLXX category: 'NaturalNumbers'!
II subclass: #DCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXX class' category: 'NaturalNumbers'!
DCCLXX class
	instanceVariableNames: ''!

!DCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXI.
	previous := DCCLXIX.! !


!classDefinition: #DCCLXXI category: 'NaturalNumbers'!
II subclass: #DCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXI class' category: 'NaturalNumbers'!
DCCLXXI class
	instanceVariableNames: ''!

!DCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXII.
	previous := DCCLXX.! !


!classDefinition: #DCCLXXII category: 'NaturalNumbers'!
II subclass: #DCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXII class' category: 'NaturalNumbers'!
DCCLXXII class
	instanceVariableNames: ''!

!DCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXIII.
	previous := DCCLXXI.! !


!classDefinition: #DCCLXXIII category: 'NaturalNumbers'!
II subclass: #DCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIII class' category: 'NaturalNumbers'!
DCCLXXIII class
	instanceVariableNames: ''!

!DCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXIV.
	previous := DCCLXXII.! !


!classDefinition: #DCCLXXIV category: 'NaturalNumbers'!
II subclass: #DCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIV class' category: 'NaturalNumbers'!
DCCLXXIV class
	instanceVariableNames: ''!

!DCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXV.
	previous := DCCLXXIII.! !


!classDefinition: #DCCLXXIX category: 'NaturalNumbers'!
II subclass: #DCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXIX class' category: 'NaturalNumbers'!
DCCLXXIX class
	instanceVariableNames: ''!

!DCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXX.
	previous := DCCLXXVIII.! !


!classDefinition: #DCCLXXV category: 'NaturalNumbers'!
II subclass: #DCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXV class' category: 'NaturalNumbers'!
DCCLXXV class
	instanceVariableNames: ''!

!DCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXVI.
	previous := DCCLXXIV.! !


!classDefinition: #DCCLXXVI category: 'NaturalNumbers'!
II subclass: #DCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVI class' category: 'NaturalNumbers'!
DCCLXXVI class
	instanceVariableNames: ''!

!DCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXVII.
	previous := DCCLXXV.! !


!classDefinition: #DCCLXXVII category: 'NaturalNumbers'!
II subclass: #DCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVII class' category: 'NaturalNumbers'!
DCCLXXVII class
	instanceVariableNames: ''!

!DCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXVIII.
	previous := DCCLXXVI.! !


!classDefinition: #DCCLXXVIII category: 'NaturalNumbers'!
II subclass: #DCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXVIII class' category: 'NaturalNumbers'!
DCCLXXVIII class
	instanceVariableNames: ''!

!DCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXIX.
	previous := DCCLXXVII.! !


!classDefinition: #DCCLXXX category: 'NaturalNumbers'!
II subclass: #DCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXX class' category: 'NaturalNumbers'!
DCCLXXX class
	instanceVariableNames: ''!

!DCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:13'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXI.
	previous := DCCLXXIX.! !


!classDefinition: #DCCLXXXI category: 'NaturalNumbers'!
II subclass: #DCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXI class' category: 'NaturalNumbers'!
DCCLXXXI class
	instanceVariableNames: ''!

!DCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXII.
	previous := DCCLXXX.! !


!classDefinition: #DCCLXXXII category: 'NaturalNumbers'!
II subclass: #DCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXII class' category: 'NaturalNumbers'!
DCCLXXXII class
	instanceVariableNames: ''!

!DCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXIII.
	previous := DCCLXXXI.! !


!classDefinition: #DCCLXXXIII category: 'NaturalNumbers'!
II subclass: #DCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIII class' category: 'NaturalNumbers'!
DCCLXXXIII class
	instanceVariableNames: ''!

!DCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXIV.
	previous := DCCLXXXII.! !


!classDefinition: #DCCLXXXIV category: 'NaturalNumbers'!
II subclass: #DCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIV class' category: 'NaturalNumbers'!
DCCLXXXIV class
	instanceVariableNames: ''!

!DCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXV.
	previous := DCCLXXXIII.! !


!classDefinition: #DCCLXXXIX category: 'NaturalNumbers'!
II subclass: #DCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXIX class' category: 'NaturalNumbers'!
DCCLXXXIX class
	instanceVariableNames: ''!

!DCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXC.
	previous := DCCLXXXVIII.! !


!classDefinition: #DCCLXXXV category: 'NaturalNumbers'!
II subclass: #DCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXV class' category: 'NaturalNumbers'!
DCCLXXXV class
	instanceVariableNames: ''!

!DCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXVI.
	previous := DCCLXXXIV.! !


!classDefinition: #DCCLXXXVI category: 'NaturalNumbers'!
II subclass: #DCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVI class' category: 'NaturalNumbers'!
DCCLXXXVI class
	instanceVariableNames: ''!

!DCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXVII.
	previous := DCCLXXXV.! !


!classDefinition: #DCCLXXXVII category: 'NaturalNumbers'!
II subclass: #DCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVII class' category: 'NaturalNumbers'!
DCCLXXXVII class
	instanceVariableNames: ''!

!DCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXVIII.
	previous := DCCLXXXVI.! !


!classDefinition: #DCCLXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCLXXXVIII class' category: 'NaturalNumbers'!
DCCLXXXVIII class
	instanceVariableNames: ''!

!DCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCLXXXIX.
	previous := DCCLXXXVII.! !


!classDefinition: #DCCV category: 'NaturalNumbers'!
II subclass: #DCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCV class' category: 'NaturalNumbers'!
DCCV class
	instanceVariableNames: ''!

!DCCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCVI.
	previous := DCCIV.! !


!classDefinition: #DCCVI category: 'NaturalNumbers'!
II subclass: #DCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVI class' category: 'NaturalNumbers'!
DCCVI class
	instanceVariableNames: ''!

!DCCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCVII.
	previous := DCCV.! !


!classDefinition: #DCCVII category: 'NaturalNumbers'!
II subclass: #DCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVII class' category: 'NaturalNumbers'!
DCCVII class
	instanceVariableNames: ''!

!DCCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCVIII.
	previous := DCCVI.! !


!classDefinition: #DCCVIII category: 'NaturalNumbers'!
II subclass: #DCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCVIII class' category: 'NaturalNumbers'!
DCCVIII class
	instanceVariableNames: ''!

!DCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCIX.
	previous := DCCVII.! !


!classDefinition: #DCCX category: 'NaturalNumbers'!
II subclass: #DCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCX class' category: 'NaturalNumbers'!
DCCX class
	instanceVariableNames: ''!

!DCCX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXI.
	previous := DCCIX.! !


!classDefinition: #DCCXC category: 'NaturalNumbers'!
II subclass: #DCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXC class' category: 'NaturalNumbers'!
DCCXC class
	instanceVariableNames: ''!

!DCCXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCI.
	previous := DCCLXXXIX.! !


!classDefinition: #DCCXCI category: 'NaturalNumbers'!
II subclass: #DCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCI class' category: 'NaturalNumbers'!
DCCXCI class
	instanceVariableNames: ''!

!DCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCII.
	previous := DCCXC.! !


!classDefinition: #DCCXCII category: 'NaturalNumbers'!
II subclass: #DCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCII class' category: 'NaturalNumbers'!
DCCXCII class
	instanceVariableNames: ''!

!DCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCIII.
	previous := DCCXCI.! !


!classDefinition: #DCCXCIII category: 'NaturalNumbers'!
II subclass: #DCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIII class' category: 'NaturalNumbers'!
DCCXCIII class
	instanceVariableNames: ''!

!DCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCIV.
	previous := DCCXCII.! !


!classDefinition: #DCCXCIV category: 'NaturalNumbers'!
II subclass: #DCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIV class' category: 'NaturalNumbers'!
DCCXCIV class
	instanceVariableNames: ''!

!DCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCV.
	previous := DCCXCIII.! !


!classDefinition: #DCCXCIX category: 'NaturalNumbers'!
II subclass: #DCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCIX class' category: 'NaturalNumbers'!
DCCXCIX class
	instanceVariableNames: ''!

!DCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCC.
	previous := DCCXCVIII.! !


!classDefinition: #DCCXCV category: 'NaturalNumbers'!
II subclass: #DCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCV class' category: 'NaturalNumbers'!
DCCXCV class
	instanceVariableNames: ''!

!DCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCVI.
	previous := DCCXCIV.! !


!classDefinition: #DCCXCVI category: 'NaturalNumbers'!
II subclass: #DCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVI class' category: 'NaturalNumbers'!
DCCXCVI class
	instanceVariableNames: ''!

!DCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCVII.
	previous := DCCXCV.! !


!classDefinition: #DCCXCVII category: 'NaturalNumbers'!
II subclass: #DCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVII class' category: 'NaturalNumbers'!
DCCXCVII class
	instanceVariableNames: ''!

!DCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCVIII.
	previous := DCCXCVI.! !


!classDefinition: #DCCXCVIII category: 'NaturalNumbers'!
II subclass: #DCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXCVIII class' category: 'NaturalNumbers'!
DCCXCVIII class
	instanceVariableNames: ''!

!DCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXCIX.
	previous := DCCXCVII.! !


!classDefinition: #DCCXI category: 'NaturalNumbers'!
II subclass: #DCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXI class' category: 'NaturalNumbers'!
DCCXI class
	instanceVariableNames: ''!

!DCCXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXII.
	previous := DCCX.! !


!classDefinition: #DCCXII category: 'NaturalNumbers'!
II subclass: #DCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXII class' category: 'NaturalNumbers'!
DCCXII class
	instanceVariableNames: ''!

!DCCXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXIII.
	previous := DCCXI.! !


!classDefinition: #DCCXIII category: 'NaturalNumbers'!
II subclass: #DCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIII class' category: 'NaturalNumbers'!
DCCXIII class
	instanceVariableNames: ''!

!DCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXIV.
	previous := DCCXII.! !


!classDefinition: #DCCXIV category: 'NaturalNumbers'!
II subclass: #DCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIV class' category: 'NaturalNumbers'!
DCCXIV class
	instanceVariableNames: ''!

!DCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXV.
	previous := DCCXIII.! !


!classDefinition: #DCCXIX category: 'NaturalNumbers'!
II subclass: #DCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXIX class' category: 'NaturalNumbers'!
DCCXIX class
	instanceVariableNames: ''!

!DCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXX.
	previous := DCCXVIII.! !


!classDefinition: #DCCXL category: 'NaturalNumbers'!
II subclass: #DCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXL class' category: 'NaturalNumbers'!
DCCXL class
	instanceVariableNames: ''!

!DCCXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLI.
	previous := DCCXXXIX.! !


!classDefinition: #DCCXLI category: 'NaturalNumbers'!
II subclass: #DCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLI class' category: 'NaturalNumbers'!
DCCXLI class
	instanceVariableNames: ''!

!DCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLII.
	previous := DCCXL.! !


!classDefinition: #DCCXLII category: 'NaturalNumbers'!
II subclass: #DCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLII class' category: 'NaturalNumbers'!
DCCXLII class
	instanceVariableNames: ''!

!DCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:16'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLIII.
	previous := DCCXLI.! !


!classDefinition: #DCCXLIII category: 'NaturalNumbers'!
II subclass: #DCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIII class' category: 'NaturalNumbers'!
DCCXLIII class
	instanceVariableNames: ''!

!DCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLIV.
	previous := DCCXLII.! !


!classDefinition: #DCCXLIV category: 'NaturalNumbers'!
II subclass: #DCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIV class' category: 'NaturalNumbers'!
DCCXLIV class
	instanceVariableNames: ''!

!DCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLV.
	previous := DCCXLIII.! !


!classDefinition: #DCCXLIX category: 'NaturalNumbers'!
II subclass: #DCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLIX class' category: 'NaturalNumbers'!
DCCXLIX class
	instanceVariableNames: ''!

!DCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCL.
	previous := DCCXLVIII.! !


!classDefinition: #DCCXLV category: 'NaturalNumbers'!
II subclass: #DCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLV class' category: 'NaturalNumbers'!
DCCXLV class
	instanceVariableNames: ''!

!DCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLVI.
	previous := DCCXLIV.! !


!classDefinition: #DCCXLVI category: 'NaturalNumbers'!
II subclass: #DCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVI class' category: 'NaturalNumbers'!
DCCXLVI class
	instanceVariableNames: ''!

!DCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLVII.
	previous := DCCXLV.! !


!classDefinition: #DCCXLVII category: 'NaturalNumbers'!
II subclass: #DCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVII class' category: 'NaturalNumbers'!
DCCXLVII class
	instanceVariableNames: ''!

!DCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLVIII.
	previous := DCCXLVI.! !


!classDefinition: #DCCXLVIII category: 'NaturalNumbers'!
II subclass: #DCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXLVIII class' category: 'NaturalNumbers'!
DCCXLVIII class
	instanceVariableNames: ''!

!DCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXLIX.
	previous := DCCXLVII.! !


!classDefinition: #DCCXV category: 'NaturalNumbers'!
II subclass: #DCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXV class' category: 'NaturalNumbers'!
DCCXV class
	instanceVariableNames: ''!

!DCCXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXVI.
	previous := DCCXIV.! !


!classDefinition: #DCCXVI category: 'NaturalNumbers'!
II subclass: #DCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVI class' category: 'NaturalNumbers'!
DCCXVI class
	instanceVariableNames: ''!

!DCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXVII.
	previous := DCCXV.! !


!classDefinition: #DCCXVII category: 'NaturalNumbers'!
II subclass: #DCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVII class' category: 'NaturalNumbers'!
DCCXVII class
	instanceVariableNames: ''!

!DCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:17'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXVIII.
	previous := DCCXVI.! !


!classDefinition: #DCCXVIII category: 'NaturalNumbers'!
II subclass: #DCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXVIII class' category: 'NaturalNumbers'!
DCCXVIII class
	instanceVariableNames: ''!

!DCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXIX.
	previous := DCCXVII.! !


!classDefinition: #DCCXX category: 'NaturalNumbers'!
II subclass: #DCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXX class' category: 'NaturalNumbers'!
DCCXX class
	instanceVariableNames: ''!

!DCCXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXI.
	previous := DCCXIX.! !


!classDefinition: #DCCXXI category: 'NaturalNumbers'!
II subclass: #DCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXI class' category: 'NaturalNumbers'!
DCCXXI class
	instanceVariableNames: ''!

!DCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXII.
	previous := DCCXX.! !


!classDefinition: #DCCXXII category: 'NaturalNumbers'!
II subclass: #DCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXII class' category: 'NaturalNumbers'!
DCCXXII class
	instanceVariableNames: ''!

!DCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXIII.
	previous := DCCXXI.! !


!classDefinition: #DCCXXIII category: 'NaturalNumbers'!
II subclass: #DCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIII class' category: 'NaturalNumbers'!
DCCXXIII class
	instanceVariableNames: ''!

!DCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXIV.
	previous := DCCXXII.! !


!classDefinition: #DCCXXIV category: 'NaturalNumbers'!
II subclass: #DCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIV class' category: 'NaturalNumbers'!
DCCXXIV class
	instanceVariableNames: ''!

!DCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXV.
	previous := DCCXXIII.! !


!classDefinition: #DCCXXIX category: 'NaturalNumbers'!
II subclass: #DCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXIX class' category: 'NaturalNumbers'!
DCCXXIX class
	instanceVariableNames: ''!

!DCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXX.
	previous := DCCXXVIII.! !


!classDefinition: #DCCXXV category: 'NaturalNumbers'!
II subclass: #DCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXV class' category: 'NaturalNumbers'!
DCCXXV class
	instanceVariableNames: ''!

!DCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXVI.
	previous := DCCXXIV.! !


!classDefinition: #DCCXXVI category: 'NaturalNumbers'!
II subclass: #DCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVI class' category: 'NaturalNumbers'!
DCCXXVI class
	instanceVariableNames: ''!

!DCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXVII.
	previous := DCCXXV.! !


!classDefinition: #DCCXXVII category: 'NaturalNumbers'!
II subclass: #DCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVII class' category: 'NaturalNumbers'!
DCCXXVII class
	instanceVariableNames: ''!

!DCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:18'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXVIII.
	previous := DCCXXVI.! !


!classDefinition: #DCCXXVIII category: 'NaturalNumbers'!
II subclass: #DCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXVIII class' category: 'NaturalNumbers'!
DCCXXVIII class
	instanceVariableNames: ''!

!DCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXIX.
	previous := DCCXXVII.! !


!classDefinition: #DCCXXX category: 'NaturalNumbers'!
II subclass: #DCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXX class' category: 'NaturalNumbers'!
DCCXXX class
	instanceVariableNames: ''!

!DCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXI.
	previous := DCCXXIX.! !


!classDefinition: #DCCXXXI category: 'NaturalNumbers'!
II subclass: #DCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXI class' category: 'NaturalNumbers'!
DCCXXXI class
	instanceVariableNames: ''!

!DCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXII.
	previous := DCCXXX.! !


!classDefinition: #DCCXXXII category: 'NaturalNumbers'!
II subclass: #DCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXII class' category: 'NaturalNumbers'!
DCCXXXII class
	instanceVariableNames: ''!

!DCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXIII.
	previous := DCCXXXI.! !


!classDefinition: #DCCXXXIII category: 'NaturalNumbers'!
II subclass: #DCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIII class' category: 'NaturalNumbers'!
DCCXXXIII class
	instanceVariableNames: ''!

!DCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXIV.
	previous := DCCXXXII.! !


!classDefinition: #DCCXXXIV category: 'NaturalNumbers'!
II subclass: #DCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIV class' category: 'NaturalNumbers'!
DCCXXXIV class
	instanceVariableNames: ''!

!DCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXV.
	previous := DCCXXXIII.! !


!classDefinition: #DCCXXXIX category: 'NaturalNumbers'!
II subclass: #DCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXIX class' category: 'NaturalNumbers'!
DCCXXXIX class
	instanceVariableNames: ''!

!DCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXL.
	previous := DCCXXXVIII.! !


!classDefinition: #DCCXXXV category: 'NaturalNumbers'!
II subclass: #DCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXV class' category: 'NaturalNumbers'!
DCCXXXV class
	instanceVariableNames: ''!

!DCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXVI.
	previous := DCCXXXIV.! !


!classDefinition: #DCCXXXVI category: 'NaturalNumbers'!
II subclass: #DCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVI class' category: 'NaturalNumbers'!
DCCXXXVI class
	instanceVariableNames: ''!

!DCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXVII.
	previous := DCCXXXV.! !


!classDefinition: #DCCXXXVII category: 'NaturalNumbers'!
II subclass: #DCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVII class' category: 'NaturalNumbers'!
DCCXXXVII class
	instanceVariableNames: ''!

!DCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXVIII.
	previous := DCCXXXVI.! !


!classDefinition: #DCCXXXVIII category: 'NaturalNumbers'!
II subclass: #DCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCCXXXVIII class' category: 'NaturalNumbers'!
DCCXXXVIII class
	instanceVariableNames: ''!

!DCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:19'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCCXXXIX.
	previous := DCCXXXVII.! !


!classDefinition: #DCI category: 'NaturalNumbers'!
II subclass: #DCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCI class' category: 'NaturalNumbers'!
DCI class
	instanceVariableNames: ''!

!DCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCII.
	previous := DC.! !


!classDefinition: #DCII category: 'NaturalNumbers'!
II subclass: #DCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCII class' category: 'NaturalNumbers'!
DCII class
	instanceVariableNames: ''!

!DCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCIII.
	previous := DCI.! !


!classDefinition: #DCIII category: 'NaturalNumbers'!
II subclass: #DCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIII class' category: 'NaturalNumbers'!
DCIII class
	instanceVariableNames: ''!

!DCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCIV.
	previous := DCII.! !


!classDefinition: #DCIV category: 'NaturalNumbers'!
II subclass: #DCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIV class' category: 'NaturalNumbers'!
DCIV class
	instanceVariableNames: ''!

!DCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCV.
	previous := DCIII.! !


!classDefinition: #DCIX category: 'NaturalNumbers'!
II subclass: #DCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCIX class' category: 'NaturalNumbers'!
DCIX class
	instanceVariableNames: ''!

!DCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCX.
	previous := DCVIII.! !


!classDefinition: #DCL category: 'NaturalNumbers'!
II subclass: #DCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCL class' category: 'NaturalNumbers'!
DCL class
	instanceVariableNames: ''!

!DCL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLI.
	previous := DCXLIX.! !


!classDefinition: #DCLI category: 'NaturalNumbers'!
II subclass: #DCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLI class' category: 'NaturalNumbers'!
DCLI class
	instanceVariableNames: ''!

!DCLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLII.
	previous := DCL.! !


!classDefinition: #DCLII category: 'NaturalNumbers'!
II subclass: #DCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLII class' category: 'NaturalNumbers'!
DCLII class
	instanceVariableNames: ''!

!DCLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLIII.
	previous := DCLI.! !


!classDefinition: #DCLIII category: 'NaturalNumbers'!
II subclass: #DCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIII class' category: 'NaturalNumbers'!
DCLIII class
	instanceVariableNames: ''!

!DCLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLIV.
	previous := DCLII.! !


!classDefinition: #DCLIV category: 'NaturalNumbers'!
II subclass: #DCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIV class' category: 'NaturalNumbers'!
DCLIV class
	instanceVariableNames: ''!

!DCLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:20'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLV.
	previous := DCLIII.! !


!classDefinition: #DCLIX category: 'NaturalNumbers'!
II subclass: #DCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLIX class' category: 'NaturalNumbers'!
DCLIX class
	instanceVariableNames: ''!

!DCLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLX.
	previous := DCLVIII.! !


!classDefinition: #DCLV category: 'NaturalNumbers'!
II subclass: #DCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLV class' category: 'NaturalNumbers'!
DCLV class
	instanceVariableNames: ''!

!DCLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLVI.
	previous := DCLIV.! !


!classDefinition: #DCLVI category: 'NaturalNumbers'!
II subclass: #DCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVI class' category: 'NaturalNumbers'!
DCLVI class
	instanceVariableNames: ''!

!DCLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLVII.
	previous := DCLV.! !


!classDefinition: #DCLVII category: 'NaturalNumbers'!
II subclass: #DCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVII class' category: 'NaturalNumbers'!
DCLVII class
	instanceVariableNames: ''!

!DCLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLVIII.
	previous := DCLVI.! !


!classDefinition: #DCLVIII category: 'NaturalNumbers'!
II subclass: #DCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLVIII class' category: 'NaturalNumbers'!
DCLVIII class
	instanceVariableNames: ''!

!DCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLIX.
	previous := DCLVII.! !


!classDefinition: #DCLX category: 'NaturalNumbers'!
II subclass: #DCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLX class' category: 'NaturalNumbers'!
DCLX class
	instanceVariableNames: ''!

!DCLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXI.
	previous := DCLIX.! !


!classDefinition: #DCLXI category: 'NaturalNumbers'!
II subclass: #DCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXI class' category: 'NaturalNumbers'!
DCLXI class
	instanceVariableNames: ''!

!DCLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXII.
	previous := DCLX.! !


!classDefinition: #DCLXII category: 'NaturalNumbers'!
II subclass: #DCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXII class' category: 'NaturalNumbers'!
DCLXII class
	instanceVariableNames: ''!

!DCLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXIII.
	previous := DCLXI.! !


!classDefinition: #DCLXIII category: 'NaturalNumbers'!
II subclass: #DCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIII class' category: 'NaturalNumbers'!
DCLXIII class
	instanceVariableNames: ''!

!DCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXIV.
	previous := DCLXII.! !


!classDefinition: #DCLXIV category: 'NaturalNumbers'!
II subclass: #DCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIV class' category: 'NaturalNumbers'!
DCLXIV class
	instanceVariableNames: ''!

!DCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXV.
	previous := DCLXIII.! !


!classDefinition: #DCLXIX category: 'NaturalNumbers'!
II subclass: #DCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXIX class' category: 'NaturalNumbers'!
DCLXIX class
	instanceVariableNames: ''!

!DCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXX.
	previous := DCLXVIII.! !


!classDefinition: #DCLXV category: 'NaturalNumbers'!
II subclass: #DCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXV class' category: 'NaturalNumbers'!
DCLXV class
	instanceVariableNames: ''!

!DCLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXVI.
	previous := DCLXIV.! !


!classDefinition: #DCLXVI category: 'NaturalNumbers'!
II subclass: #DCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVI class' category: 'NaturalNumbers'!
DCLXVI class
	instanceVariableNames: ''!

!DCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXVII.
	previous := DCLXV.! !


!classDefinition: #DCLXVII category: 'NaturalNumbers'!
II subclass: #DCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVII class' category: 'NaturalNumbers'!
DCLXVII class
	instanceVariableNames: ''!

!DCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXVIII.
	previous := DCLXVI.! !


!classDefinition: #DCLXVIII category: 'NaturalNumbers'!
II subclass: #DCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXVIII class' category: 'NaturalNumbers'!
DCLXVIII class
	instanceVariableNames: ''!

!DCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXIX.
	previous := DCLXVII.! !


!classDefinition: #DCLXX category: 'NaturalNumbers'!
II subclass: #DCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXX class' category: 'NaturalNumbers'!
DCLXX class
	instanceVariableNames: ''!

!DCLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXI.
	previous := DCLXIX.! !


!classDefinition: #DCLXXI category: 'NaturalNumbers'!
II subclass: #DCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXI class' category: 'NaturalNumbers'!
DCLXXI class
	instanceVariableNames: ''!

!DCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXII.
	previous := DCLXX.! !


!classDefinition: #DCLXXII category: 'NaturalNumbers'!
II subclass: #DCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXII class' category: 'NaturalNumbers'!
DCLXXII class
	instanceVariableNames: ''!

!DCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXIII.
	previous := DCLXXI.! !


!classDefinition: #DCLXXIII category: 'NaturalNumbers'!
II subclass: #DCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIII class' category: 'NaturalNumbers'!
DCLXXIII class
	instanceVariableNames: ''!

!DCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXIV.
	previous := DCLXXII.! !


!classDefinition: #DCLXXIV category: 'NaturalNumbers'!
II subclass: #DCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIV class' category: 'NaturalNumbers'!
DCLXXIV class
	instanceVariableNames: ''!

!DCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXV.
	previous := DCLXXIII.! !


!classDefinition: #DCLXXIX category: 'NaturalNumbers'!
II subclass: #DCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXIX class' category: 'NaturalNumbers'!
DCLXXIX class
	instanceVariableNames: ''!

!DCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXX.
	previous := DCLXXVIII.! !


!classDefinition: #DCLXXV category: 'NaturalNumbers'!
II subclass: #DCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXV class' category: 'NaturalNumbers'!
DCLXXV class
	instanceVariableNames: ''!

!DCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXVI.
	previous := DCLXXIV.! !


!classDefinition: #DCLXXVI category: 'NaturalNumbers'!
II subclass: #DCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVI class' category: 'NaturalNumbers'!
DCLXXVI class
	instanceVariableNames: ''!

!DCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXVII.
	previous := DCLXXV.! !


!classDefinition: #DCLXXVII category: 'NaturalNumbers'!
II subclass: #DCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVII class' category: 'NaturalNumbers'!
DCLXXVII class
	instanceVariableNames: ''!

!DCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXVIII.
	previous := DCLXXVI.! !


!classDefinition: #DCLXXVIII category: 'NaturalNumbers'!
II subclass: #DCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXVIII class' category: 'NaturalNumbers'!
DCLXXVIII class
	instanceVariableNames: ''!

!DCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXIX.
	previous := DCLXXVII.! !


!classDefinition: #DCLXXX category: 'NaturalNumbers'!
II subclass: #DCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXX class' category: 'NaturalNumbers'!
DCLXXX class
	instanceVariableNames: ''!

!DCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXI.
	previous := DCLXXIX.! !


!classDefinition: #DCLXXXI category: 'NaturalNumbers'!
II subclass: #DCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXI class' category: 'NaturalNumbers'!
DCLXXXI class
	instanceVariableNames: ''!

!DCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXII.
	previous := DCLXXX.! !


!classDefinition: #DCLXXXII category: 'NaturalNumbers'!
II subclass: #DCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXII class' category: 'NaturalNumbers'!
DCLXXXII class
	instanceVariableNames: ''!

!DCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXIII.
	previous := DCLXXXI.! !


!classDefinition: #DCLXXXIII category: 'NaturalNumbers'!
II subclass: #DCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIII class' category: 'NaturalNumbers'!
DCLXXXIII class
	instanceVariableNames: ''!

!DCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXIV.
	previous := DCLXXXII.! !


!classDefinition: #DCLXXXIV category: 'NaturalNumbers'!
II subclass: #DCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIV class' category: 'NaturalNumbers'!
DCLXXXIV class
	instanceVariableNames: ''!

!DCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXV.
	previous := DCLXXXIII.! !


!classDefinition: #DCLXXXIX category: 'NaturalNumbers'!
II subclass: #DCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXIX class' category: 'NaturalNumbers'!
DCLXXXIX class
	instanceVariableNames: ''!

!DCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXC.
	previous := DCLXXXVIII.! !


!classDefinition: #DCLXXXV category: 'NaturalNumbers'!
II subclass: #DCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXV class' category: 'NaturalNumbers'!
DCLXXXV class
	instanceVariableNames: ''!

!DCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:23'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXVI.
	previous := DCLXXXIV.! !


!classDefinition: #DCLXXXVI category: 'NaturalNumbers'!
II subclass: #DCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVI class' category: 'NaturalNumbers'!
DCLXXXVI class
	instanceVariableNames: ''!

!DCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXVII.
	previous := DCLXXXV.! !


!classDefinition: #DCLXXXVII category: 'NaturalNumbers'!
II subclass: #DCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVII class' category: 'NaturalNumbers'!
DCLXXXVII class
	instanceVariableNames: ''!

!DCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXVIII.
	previous := DCLXXXVI.! !


!classDefinition: #DCLXXXVIII category: 'NaturalNumbers'!
II subclass: #DCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCLXXXVIII class' category: 'NaturalNumbers'!
DCLXXXVIII class
	instanceVariableNames: ''!

!DCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCLXXXIX.
	previous := DCLXXXVII.! !


!classDefinition: #DCV category: 'NaturalNumbers'!
II subclass: #DCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCV class' category: 'NaturalNumbers'!
DCV class
	instanceVariableNames: ''!

!DCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCVI.
	previous := DCIV.! !


!classDefinition: #DCVI category: 'NaturalNumbers'!
II subclass: #DCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVI class' category: 'NaturalNumbers'!
DCVI class
	instanceVariableNames: ''!

!DCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCVII.
	previous := DCV.! !


!classDefinition: #DCVII category: 'NaturalNumbers'!
II subclass: #DCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVII class' category: 'NaturalNumbers'!
DCVII class
	instanceVariableNames: ''!

!DCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCVIII.
	previous := DCVI.! !


!classDefinition: #DCVIII category: 'NaturalNumbers'!
II subclass: #DCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCVIII class' category: 'NaturalNumbers'!
DCVIII class
	instanceVariableNames: ''!

!DCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCIX.
	previous := DCVII.! !


!classDefinition: #DCX category: 'NaturalNumbers'!
II subclass: #DCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCX class' category: 'NaturalNumbers'!
DCX class
	instanceVariableNames: ''!

!DCX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXI.
	previous := DCIX.! !


!classDefinition: #DCXC category: 'NaturalNumbers'!
II subclass: #DCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXC class' category: 'NaturalNumbers'!
DCXC class
	instanceVariableNames: ''!

!DCXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCI.
	previous := DCLXXXIX.! !


!classDefinition: #DCXCI category: 'NaturalNumbers'!
II subclass: #DCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCI class' category: 'NaturalNumbers'!
DCXCI class
	instanceVariableNames: ''!

!DCXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:24'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCII.
	previous := DCXC.! !


!classDefinition: #DCXCII category: 'NaturalNumbers'!
II subclass: #DCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCII class' category: 'NaturalNumbers'!
DCXCII class
	instanceVariableNames: ''!

!DCXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCIII.
	previous := DCXCI.! !


!classDefinition: #DCXCIII category: 'NaturalNumbers'!
II subclass: #DCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIII class' category: 'NaturalNumbers'!
DCXCIII class
	instanceVariableNames: ''!

!DCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCIV.
	previous := DCXCII.! !


!classDefinition: #DCXCIV category: 'NaturalNumbers'!
II subclass: #DCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIV class' category: 'NaturalNumbers'!
DCXCIV class
	instanceVariableNames: ''!

!DCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCV.
	previous := DCXCIII.! !


!classDefinition: #DCXCIX category: 'NaturalNumbers'!
II subclass: #DCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCIX class' category: 'NaturalNumbers'!
DCXCIX class
	instanceVariableNames: ''!

!DCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCC.
	previous := DCXCVIII.! !


!classDefinition: #DCXCV category: 'NaturalNumbers'!
II subclass: #DCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCV class' category: 'NaturalNumbers'!
DCXCV class
	instanceVariableNames: ''!

!DCXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCVI.
	previous := DCXCIV.! !


!classDefinition: #DCXCVI category: 'NaturalNumbers'!
II subclass: #DCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVI class' category: 'NaturalNumbers'!
DCXCVI class
	instanceVariableNames: ''!

!DCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCVII.
	previous := DCXCV.! !


!classDefinition: #DCXCVII category: 'NaturalNumbers'!
II subclass: #DCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVII class' category: 'NaturalNumbers'!
DCXCVII class
	instanceVariableNames: ''!

!DCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCVIII.
	previous := DCXCVI.! !


!classDefinition: #DCXCVIII category: 'NaturalNumbers'!
II subclass: #DCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXCVIII class' category: 'NaturalNumbers'!
DCXCVIII class
	instanceVariableNames: ''!

!DCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXCIX.
	previous := DCXCVII.! !


!classDefinition: #DCXI category: 'NaturalNumbers'!
II subclass: #DCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXI class' category: 'NaturalNumbers'!
DCXI class
	instanceVariableNames: ''!

!DCXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXII.
	previous := DCX.! !


!classDefinition: #DCXII category: 'NaturalNumbers'!
II subclass: #DCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXII class' category: 'NaturalNumbers'!
DCXII class
	instanceVariableNames: ''!

!DCXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXIII.
	previous := DCXI.! !


!classDefinition: #DCXIII category: 'NaturalNumbers'!
II subclass: #DCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIII class' category: 'NaturalNumbers'!
DCXIII class
	instanceVariableNames: ''!

!DCXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:25'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXIV.
	previous := DCXII.! !


!classDefinition: #DCXIV category: 'NaturalNumbers'!
II subclass: #DCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIV class' category: 'NaturalNumbers'!
DCXIV class
	instanceVariableNames: ''!

!DCXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXV.
	previous := DCXIII.! !


!classDefinition: #DCXIX category: 'NaturalNumbers'!
II subclass: #DCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXIX class' category: 'NaturalNumbers'!
DCXIX class
	instanceVariableNames: ''!

!DCXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXX.
	previous := DCXVIII.! !


!classDefinition: #DCXL category: 'NaturalNumbers'!
II subclass: #DCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXL class' category: 'NaturalNumbers'!
DCXL class
	instanceVariableNames: ''!

!DCXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLI.
	previous := DCXXXIX.! !


!classDefinition: #DCXLI category: 'NaturalNumbers'!
II subclass: #DCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLI class' category: 'NaturalNumbers'!
DCXLI class
	instanceVariableNames: ''!

!DCXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLII.
	previous := DCXL.! !


!classDefinition: #DCXLII category: 'NaturalNumbers'!
II subclass: #DCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLII class' category: 'NaturalNumbers'!
DCXLII class
	instanceVariableNames: ''!

!DCXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLIII.
	previous := DCXLI.! !


!classDefinition: #DCXLIII category: 'NaturalNumbers'!
II subclass: #DCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIII class' category: 'NaturalNumbers'!
DCXLIII class
	instanceVariableNames: ''!

!DCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLIV.
	previous := DCXLII.! !


!classDefinition: #DCXLIV category: 'NaturalNumbers'!
II subclass: #DCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIV class' category: 'NaturalNumbers'!
DCXLIV class
	instanceVariableNames: ''!

!DCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLV.
	previous := DCXLIII.! !


!classDefinition: #DCXLIX category: 'NaturalNumbers'!
II subclass: #DCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLIX class' category: 'NaturalNumbers'!
DCXLIX class
	instanceVariableNames: ''!

!DCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCL.
	previous := DCXLVIII.! !


!classDefinition: #DCXLV category: 'NaturalNumbers'!
II subclass: #DCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLV class' category: 'NaturalNumbers'!
DCXLV class
	instanceVariableNames: ''!

!DCXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLVI.
	previous := DCXLIV.! !


!classDefinition: #DCXLVI category: 'NaturalNumbers'!
II subclass: #DCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVI class' category: 'NaturalNumbers'!
DCXLVI class
	instanceVariableNames: ''!

!DCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLVII.
	previous := DCXLV.! !


!classDefinition: #DCXLVII category: 'NaturalNumbers'!
II subclass: #DCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVII class' category: 'NaturalNumbers'!
DCXLVII class
	instanceVariableNames: ''!

!DCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLVIII.
	previous := DCXLVI.! !


!classDefinition: #DCXLVIII category: 'NaturalNumbers'!
II subclass: #DCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXLVIII class' category: 'NaturalNumbers'!
DCXLVIII class
	instanceVariableNames: ''!

!DCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXLIX.
	previous := DCXLVII.! !


!classDefinition: #DCXV category: 'NaturalNumbers'!
II subclass: #DCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXV class' category: 'NaturalNumbers'!
DCXV class
	instanceVariableNames: ''!

!DCXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXVI.
	previous := DCXIV.! !


!classDefinition: #DCXVI category: 'NaturalNumbers'!
II subclass: #DCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVI class' category: 'NaturalNumbers'!
DCXVI class
	instanceVariableNames: ''!

!DCXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXVII.
	previous := DCXV.! !


!classDefinition: #DCXVII category: 'NaturalNumbers'!
II subclass: #DCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVII class' category: 'NaturalNumbers'!
DCXVII class
	instanceVariableNames: ''!

!DCXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXVIII.
	previous := DCXVI.! !


!classDefinition: #DCXVIII category: 'NaturalNumbers'!
II subclass: #DCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXVIII class' category: 'NaturalNumbers'!
DCXVIII class
	instanceVariableNames: ''!

!DCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXIX.
	previous := DCXVII.! !


!classDefinition: #DCXX category: 'NaturalNumbers'!
II subclass: #DCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXX class' category: 'NaturalNumbers'!
DCXX class
	instanceVariableNames: ''!

!DCXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXI.
	previous := DCXIX.! !


!classDefinition: #DCXXI category: 'NaturalNumbers'!
II subclass: #DCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXI class' category: 'NaturalNumbers'!
DCXXI class
	instanceVariableNames: ''!

!DCXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXII.
	previous := DCXX.! !


!classDefinition: #DCXXII category: 'NaturalNumbers'!
II subclass: #DCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXII class' category: 'NaturalNumbers'!
DCXXII class
	instanceVariableNames: ''!

!DCXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXIII.
	previous := DCXXI.! !


!classDefinition: #DCXXIII category: 'NaturalNumbers'!
II subclass: #DCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIII class' category: 'NaturalNumbers'!
DCXXIII class
	instanceVariableNames: ''!

!DCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXIV.
	previous := DCXXII.! !


!classDefinition: #DCXXIV category: 'NaturalNumbers'!
II subclass: #DCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIV class' category: 'NaturalNumbers'!
DCXXIV class
	instanceVariableNames: ''!

!DCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXV.
	previous := DCXXIII.! !


!classDefinition: #DCXXIX category: 'NaturalNumbers'!
II subclass: #DCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXIX class' category: 'NaturalNumbers'!
DCXXIX class
	instanceVariableNames: ''!

!DCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXX.
	previous := DCXXVIII.! !


!classDefinition: #DCXXV category: 'NaturalNumbers'!
II subclass: #DCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXV class' category: 'NaturalNumbers'!
DCXXV class
	instanceVariableNames: ''!

!DCXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXVI.
	previous := DCXXIV.! !


!classDefinition: #DCXXVI category: 'NaturalNumbers'!
II subclass: #DCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVI class' category: 'NaturalNumbers'!
DCXXVI class
	instanceVariableNames: ''!

!DCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXVII.
	previous := DCXXV.! !


!classDefinition: #DCXXVII category: 'NaturalNumbers'!
II subclass: #DCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVII class' category: 'NaturalNumbers'!
DCXXVII class
	instanceVariableNames: ''!

!DCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXVIII.
	previous := DCXXVI.! !


!classDefinition: #DCXXVIII category: 'NaturalNumbers'!
II subclass: #DCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXVIII class' category: 'NaturalNumbers'!
DCXXVIII class
	instanceVariableNames: ''!

!DCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXIX.
	previous := DCXXVII.! !


!classDefinition: #DCXXX category: 'NaturalNumbers'!
II subclass: #DCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXX class' category: 'NaturalNumbers'!
DCXXX class
	instanceVariableNames: ''!

!DCXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXI.
	previous := DCXXIX.! !


!classDefinition: #DCXXXI category: 'NaturalNumbers'!
II subclass: #DCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXI class' category: 'NaturalNumbers'!
DCXXXI class
	instanceVariableNames: ''!

!DCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXII.
	previous := DCXXX.! !


!classDefinition: #DCXXXII category: 'NaturalNumbers'!
II subclass: #DCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXII class' category: 'NaturalNumbers'!
DCXXXII class
	instanceVariableNames: ''!

!DCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXIII.
	previous := DCXXXI.! !


!classDefinition: #DCXXXIII category: 'NaturalNumbers'!
II subclass: #DCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIII class' category: 'NaturalNumbers'!
DCXXXIII class
	instanceVariableNames: ''!

!DCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXIV.
	previous := DCXXXII.! !


!classDefinition: #DCXXXIV category: 'NaturalNumbers'!
II subclass: #DCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIV class' category: 'NaturalNumbers'!
DCXXXIV class
	instanceVariableNames: ''!

!DCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXV.
	previous := DCXXXIII.! !


!classDefinition: #DCXXXIX category: 'NaturalNumbers'!
II subclass: #DCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXIX class' category: 'NaturalNumbers'!
DCXXXIX class
	instanceVariableNames: ''!

!DCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXL.
	previous := DCXXXVIII.! !


!classDefinition: #DCXXXV category: 'NaturalNumbers'!
II subclass: #DCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXV class' category: 'NaturalNumbers'!
DCXXXV class
	instanceVariableNames: ''!

!DCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXVI.
	previous := DCXXXIV.! !


!classDefinition: #DCXXXVI category: 'NaturalNumbers'!
II subclass: #DCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVI class' category: 'NaturalNumbers'!
DCXXXVI class
	instanceVariableNames: ''!

!DCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXVII.
	previous := DCXXXV.! !


!classDefinition: #DCXXXVII category: 'NaturalNumbers'!
II subclass: #DCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVII class' category: 'NaturalNumbers'!
DCXXXVII class
	instanceVariableNames: ''!

!DCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXVIII.
	previous := DCXXXVI.! !


!classDefinition: #DCXXXVIII category: 'NaturalNumbers'!
II subclass: #DCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DCXXXVIII class' category: 'NaturalNumbers'!
DCXXXVIII class
	instanceVariableNames: ''!

!DCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DCXXXIX.
	previous := DCXXXVII.! !


!classDefinition: #DI category: 'NaturalNumbers'!
II subclass: #DI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DI class' category: 'NaturalNumbers'!
DI class
	instanceVariableNames: ''!

!DI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DII.
	previous := D.! !


!classDefinition: #DII category: 'NaturalNumbers'!
II subclass: #DII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DII class' category: 'NaturalNumbers'!
DII class
	instanceVariableNames: ''!

!DII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DIII.
	previous := DI.! !


!classDefinition: #DIII category: 'NaturalNumbers'!
II subclass: #DIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIII class' category: 'NaturalNumbers'!
DIII class
	instanceVariableNames: ''!

!DIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DIV.
	previous := DII.! !


!classDefinition: #DIV category: 'NaturalNumbers'!
II subclass: #DIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIV class' category: 'NaturalNumbers'!
DIV class
	instanceVariableNames: ''!

!DIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DV.
	previous := DIII.! !


!classDefinition: #DIX category: 'NaturalNumbers'!
II subclass: #DIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DIX class' category: 'NaturalNumbers'!
DIX class
	instanceVariableNames: ''!

!DIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DX.
	previous := DVIII.! !


!classDefinition: #DL category: 'NaturalNumbers'!
II subclass: #DL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DL class' category: 'NaturalNumbers'!
DL class
	instanceVariableNames: ''!

!DL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLI.
	previous := DXLIX.! !


!classDefinition: #DLI category: 'NaturalNumbers'!
II subclass: #DLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLI class' category: 'NaturalNumbers'!
DLI class
	instanceVariableNames: ''!

!DLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLII.
	previous := DL.! !


!classDefinition: #DLII category: 'NaturalNumbers'!
II subclass: #DLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLII class' category: 'NaturalNumbers'!
DLII class
	instanceVariableNames: ''!

!DLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLIII.
	previous := DLI.! !


!classDefinition: #DLIII category: 'NaturalNumbers'!
II subclass: #DLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIII class' category: 'NaturalNumbers'!
DLIII class
	instanceVariableNames: ''!

!DLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLIV.
	previous := DLII.! !


!classDefinition: #DLIV category: 'NaturalNumbers'!
II subclass: #DLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIV class' category: 'NaturalNumbers'!
DLIV class
	instanceVariableNames: ''!

!DLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLV.
	previous := DLIII.! !


!classDefinition: #DLIX category: 'NaturalNumbers'!
II subclass: #DLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLIX class' category: 'NaturalNumbers'!
DLIX class
	instanceVariableNames: ''!

!DLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLX.
	previous := DLVIII.! !


!classDefinition: #DLV category: 'NaturalNumbers'!
II subclass: #DLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLV class' category: 'NaturalNumbers'!
DLV class
	instanceVariableNames: ''!

!DLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLVI.
	previous := DLIV.! !


!classDefinition: #DLVI category: 'NaturalNumbers'!
II subclass: #DLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVI class' category: 'NaturalNumbers'!
DLVI class
	instanceVariableNames: ''!

!DLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLVII.
	previous := DLV.! !


!classDefinition: #DLVII category: 'NaturalNumbers'!
II subclass: #DLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVII class' category: 'NaturalNumbers'!
DLVII class
	instanceVariableNames: ''!

!DLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLVIII.
	previous := DLVI.! !


!classDefinition: #DLVIII category: 'NaturalNumbers'!
II subclass: #DLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLVIII class' category: 'NaturalNumbers'!
DLVIII class
	instanceVariableNames: ''!

!DLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLIX.
	previous := DLVII.! !


!classDefinition: #DLX category: 'NaturalNumbers'!
II subclass: #DLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLX class' category: 'NaturalNumbers'!
DLX class
	instanceVariableNames: ''!

!DLX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXI.
	previous := DLIX.! !


!classDefinition: #DLXI category: 'NaturalNumbers'!
II subclass: #DLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXI class' category: 'NaturalNumbers'!
DLXI class
	instanceVariableNames: ''!

!DLXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXII.
	previous := DLX.! !


!classDefinition: #DLXII category: 'NaturalNumbers'!
II subclass: #DLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXII class' category: 'NaturalNumbers'!
DLXII class
	instanceVariableNames: ''!

!DLXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXIII.
	previous := DLXI.! !


!classDefinition: #DLXIII category: 'NaturalNumbers'!
II subclass: #DLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIII class' category: 'NaturalNumbers'!
DLXIII class
	instanceVariableNames: ''!

!DLXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXIV.
	previous := DLXII.! !


!classDefinition: #DLXIV category: 'NaturalNumbers'!
II subclass: #DLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIV class' category: 'NaturalNumbers'!
DLXIV class
	instanceVariableNames: ''!

!DLXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXV.
	previous := DLXIII.! !


!classDefinition: #DLXIX category: 'NaturalNumbers'!
II subclass: #DLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXIX class' category: 'NaturalNumbers'!
DLXIX class
	instanceVariableNames: ''!

!DLXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXX.
	previous := DLXVIII.! !


!classDefinition: #DLXV category: 'NaturalNumbers'!
II subclass: #DLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXV class' category: 'NaturalNumbers'!
DLXV class
	instanceVariableNames: ''!

!DLXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXVI.
	previous := DLXIV.! !


!classDefinition: #DLXVI category: 'NaturalNumbers'!
II subclass: #DLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVI class' category: 'NaturalNumbers'!
DLXVI class
	instanceVariableNames: ''!

!DLXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXVII.
	previous := DLXV.! !


!classDefinition: #DLXVII category: 'NaturalNumbers'!
II subclass: #DLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVII class' category: 'NaturalNumbers'!
DLXVII class
	instanceVariableNames: ''!

!DLXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXVIII.
	previous := DLXVI.! !


!classDefinition: #DLXVIII category: 'NaturalNumbers'!
II subclass: #DLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXVIII class' category: 'NaturalNumbers'!
DLXVIII class
	instanceVariableNames: ''!

!DLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXIX.
	previous := DLXVII.! !


!classDefinition: #DLXX category: 'NaturalNumbers'!
II subclass: #DLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXX class' category: 'NaturalNumbers'!
DLXX class
	instanceVariableNames: ''!

!DLXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXI.
	previous := DLXIX.! !


!classDefinition: #DLXXI category: 'NaturalNumbers'!
II subclass: #DLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXI class' category: 'NaturalNumbers'!
DLXXI class
	instanceVariableNames: ''!

!DLXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXII.
	previous := DLXX.! !


!classDefinition: #DLXXII category: 'NaturalNumbers'!
II subclass: #DLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXII class' category: 'NaturalNumbers'!
DLXXII class
	instanceVariableNames: ''!

!DLXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXIII.
	previous := DLXXI.! !


!classDefinition: #DLXXIII category: 'NaturalNumbers'!
II subclass: #DLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIII class' category: 'NaturalNumbers'!
DLXXIII class
	instanceVariableNames: ''!

!DLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXIV.
	previous := DLXXII.! !


!classDefinition: #DLXXIV category: 'NaturalNumbers'!
II subclass: #DLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIV class' category: 'NaturalNumbers'!
DLXXIV class
	instanceVariableNames: ''!

!DLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXV.
	previous := DLXXIII.! !


!classDefinition: #DLXXIX category: 'NaturalNumbers'!
II subclass: #DLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXIX class' category: 'NaturalNumbers'!
DLXXIX class
	instanceVariableNames: ''!

!DLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXX.
	previous := DLXXVIII.! !


!classDefinition: #DLXXV category: 'NaturalNumbers'!
II subclass: #DLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXV class' category: 'NaturalNumbers'!
DLXXV class
	instanceVariableNames: ''!

!DLXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXVI.
	previous := DLXXIV.! !


!classDefinition: #DLXXVI category: 'NaturalNumbers'!
II subclass: #DLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVI class' category: 'NaturalNumbers'!
DLXXVI class
	instanceVariableNames: ''!

!DLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXVII.
	previous := DLXXV.! !


!classDefinition: #DLXXVII category: 'NaturalNumbers'!
II subclass: #DLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVII class' category: 'NaturalNumbers'!
DLXXVII class
	instanceVariableNames: ''!

!DLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXVIII.
	previous := DLXXVI.! !


!classDefinition: #DLXXVIII category: 'NaturalNumbers'!
II subclass: #DLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXVIII class' category: 'NaturalNumbers'!
DLXXVIII class
	instanceVariableNames: ''!

!DLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXIX.
	previous := DLXXVII.! !


!classDefinition: #DLXXX category: 'NaturalNumbers'!
II subclass: #DLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXX class' category: 'NaturalNumbers'!
DLXXX class
	instanceVariableNames: ''!

!DLXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXI.
	previous := DLXXIX.! !


!classDefinition: #DLXXXI category: 'NaturalNumbers'!
II subclass: #DLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXI class' category: 'NaturalNumbers'!
DLXXXI class
	instanceVariableNames: ''!

!DLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXII.
	previous := DLXXX.! !


!classDefinition: #DLXXXII category: 'NaturalNumbers'!
II subclass: #DLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXII class' category: 'NaturalNumbers'!
DLXXXII class
	instanceVariableNames: ''!

!DLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXIII.
	previous := DLXXXI.! !


!classDefinition: #DLXXXIII category: 'NaturalNumbers'!
II subclass: #DLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIII class' category: 'NaturalNumbers'!
DLXXXIII class
	instanceVariableNames: ''!

!DLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXIV.
	previous := DLXXXII.! !


!classDefinition: #DLXXXIV category: 'NaturalNumbers'!
II subclass: #DLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIV class' category: 'NaturalNumbers'!
DLXXXIV class
	instanceVariableNames: ''!

!DLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXV.
	previous := DLXXXIII.! !


!classDefinition: #DLXXXIX category: 'NaturalNumbers'!
II subclass: #DLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXIX class' category: 'NaturalNumbers'!
DLXXXIX class
	instanceVariableNames: ''!

!DLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXC.
	previous := DLXXXVIII.! !


!classDefinition: #DLXXXV category: 'NaturalNumbers'!
II subclass: #DLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXV class' category: 'NaturalNumbers'!
DLXXXV class
	instanceVariableNames: ''!

!DLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXVI.
	previous := DLXXXIV.! !


!classDefinition: #DLXXXVI category: 'NaturalNumbers'!
II subclass: #DLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVI class' category: 'NaturalNumbers'!
DLXXXVI class
	instanceVariableNames: ''!

!DLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXVII.
	previous := DLXXXV.! !


!classDefinition: #DLXXXVII category: 'NaturalNumbers'!
II subclass: #DLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVII class' category: 'NaturalNumbers'!
DLXXXVII class
	instanceVariableNames: ''!

!DLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXVIII.
	previous := DLXXXVI.! !


!classDefinition: #DLXXXVIII category: 'NaturalNumbers'!
II subclass: #DLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DLXXXVIII class' category: 'NaturalNumbers'!
DLXXXVIII class
	instanceVariableNames: ''!

!DLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DLXXXIX.
	previous := DLXXXVII.! !


!classDefinition: #DV category: 'NaturalNumbers'!
II subclass: #DV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DV class' category: 'NaturalNumbers'!
DV class
	instanceVariableNames: ''!

!DV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DVI.
	previous := DIV.! !


!classDefinition: #DVI category: 'NaturalNumbers'!
II subclass: #DVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVI class' category: 'NaturalNumbers'!
DVI class
	instanceVariableNames: ''!

!DVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DVII.
	previous := DV.! !


!classDefinition: #DVII category: 'NaturalNumbers'!
II subclass: #DVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVII class' category: 'NaturalNumbers'!
DVII class
	instanceVariableNames: ''!

!DVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DVIII.
	previous := DVI.! !


!classDefinition: #DVIII category: 'NaturalNumbers'!
II subclass: #DVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DVIII class' category: 'NaturalNumbers'!
DVIII class
	instanceVariableNames: ''!

!DVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DIX.
	previous := DVII.! !


!classDefinition: #DX category: 'NaturalNumbers'!
II subclass: #DX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DX class' category: 'NaturalNumbers'!
DX class
	instanceVariableNames: ''!

!DX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXI.
	previous := DIX.! !


!classDefinition: #DXC category: 'NaturalNumbers'!
II subclass: #DXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXC class' category: 'NaturalNumbers'!
DXC class
	instanceVariableNames: ''!

!DXC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCI.
	previous := DLXXXIX.! !


!classDefinition: #DXCI category: 'NaturalNumbers'!
II subclass: #DXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCI class' category: 'NaturalNumbers'!
DXCI class
	instanceVariableNames: ''!

!DXCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCII.
	previous := DXC.! !


!classDefinition: #DXCII category: 'NaturalNumbers'!
II subclass: #DXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCII class' category: 'NaturalNumbers'!
DXCII class
	instanceVariableNames: ''!

!DXCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCIII.
	previous := DXCI.! !


!classDefinition: #DXCIII category: 'NaturalNumbers'!
II subclass: #DXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIII class' category: 'NaturalNumbers'!
DXCIII class
	instanceVariableNames: ''!

!DXCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCIV.
	previous := DXCII.! !


!classDefinition: #DXCIV category: 'NaturalNumbers'!
II subclass: #DXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIV class' category: 'NaturalNumbers'!
DXCIV class
	instanceVariableNames: ''!

!DXCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCV.
	previous := DXCIII.! !


!classDefinition: #DXCIX category: 'NaturalNumbers'!
II subclass: #DXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCIX class' category: 'NaturalNumbers'!
DXCIX class
	instanceVariableNames: ''!

!DXCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DC.
	previous := DXCVIII.! !


!classDefinition: #DXCV category: 'NaturalNumbers'!
II subclass: #DXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCV class' category: 'NaturalNumbers'!
DXCV class
	instanceVariableNames: ''!

!DXCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCVI.
	previous := DXCIV.! !


!classDefinition: #DXCVI category: 'NaturalNumbers'!
II subclass: #DXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVI class' category: 'NaturalNumbers'!
DXCVI class
	instanceVariableNames: ''!

!DXCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCVII.
	previous := DXCV.! !


!classDefinition: #DXCVII category: 'NaturalNumbers'!
II subclass: #DXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVII class' category: 'NaturalNumbers'!
DXCVII class
	instanceVariableNames: ''!

!DXCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCVIII.
	previous := DXCVI.! !


!classDefinition: #DXCVIII category: 'NaturalNumbers'!
II subclass: #DXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXCVIII class' category: 'NaturalNumbers'!
DXCVIII class
	instanceVariableNames: ''!

!DXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXCIX.
	previous := DXCVII.! !


!classDefinition: #DXI category: 'NaturalNumbers'!
II subclass: #DXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXI class' category: 'NaturalNumbers'!
DXI class
	instanceVariableNames: ''!

!DXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXII.
	previous := DX.! !


!classDefinition: #DXII category: 'NaturalNumbers'!
II subclass: #DXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXII class' category: 'NaturalNumbers'!
DXII class
	instanceVariableNames: ''!

!DXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXIII.
	previous := DXI.! !


!classDefinition: #DXIII category: 'NaturalNumbers'!
II subclass: #DXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIII class' category: 'NaturalNumbers'!
DXIII class
	instanceVariableNames: ''!

!DXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXIV.
	previous := DXII.! !


!classDefinition: #DXIV category: 'NaturalNumbers'!
II subclass: #DXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIV class' category: 'NaturalNumbers'!
DXIV class
	instanceVariableNames: ''!

!DXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXV.
	previous := DXIII.! !


!classDefinition: #DXIX category: 'NaturalNumbers'!
II subclass: #DXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXIX class' category: 'NaturalNumbers'!
DXIX class
	instanceVariableNames: ''!

!DXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXX.
	previous := DXVIII.! !


!classDefinition: #DXL category: 'NaturalNumbers'!
II subclass: #DXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXL class' category: 'NaturalNumbers'!
DXL class
	instanceVariableNames: ''!

!DXL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLI.
	previous := DXXXIX.! !


!classDefinition: #DXLI category: 'NaturalNumbers'!
II subclass: #DXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLI class' category: 'NaturalNumbers'!
DXLI class
	instanceVariableNames: ''!

!DXLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLII.
	previous := DXL.! !


!classDefinition: #DXLII category: 'NaturalNumbers'!
II subclass: #DXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLII class' category: 'NaturalNumbers'!
DXLII class
	instanceVariableNames: ''!

!DXLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLIII.
	previous := DXLI.! !


!classDefinition: #DXLIII category: 'NaturalNumbers'!
II subclass: #DXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIII class' category: 'NaturalNumbers'!
DXLIII class
	instanceVariableNames: ''!

!DXLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:35'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLIV.
	previous := DXLII.! !


!classDefinition: #DXLIV category: 'NaturalNumbers'!
II subclass: #DXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIV class' category: 'NaturalNumbers'!
DXLIV class
	instanceVariableNames: ''!

!DXLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLV.
	previous := DXLIII.! !


!classDefinition: #DXLIX category: 'NaturalNumbers'!
II subclass: #DXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLIX class' category: 'NaturalNumbers'!
DXLIX class
	instanceVariableNames: ''!

!DXLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DL.
	previous := DXLVIII.! !


!classDefinition: #DXLV category: 'NaturalNumbers'!
II subclass: #DXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLV class' category: 'NaturalNumbers'!
DXLV class
	instanceVariableNames: ''!

!DXLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLVI.
	previous := DXLIV.! !


!classDefinition: #DXLVI category: 'NaturalNumbers'!
II subclass: #DXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVI class' category: 'NaturalNumbers'!
DXLVI class
	instanceVariableNames: ''!

!DXLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLVII.
	previous := DXLV.! !


!classDefinition: #DXLVII category: 'NaturalNumbers'!
II subclass: #DXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVII class' category: 'NaturalNumbers'!
DXLVII class
	instanceVariableNames: ''!

!DXLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLVIII.
	previous := DXLVI.! !


!classDefinition: #DXLVIII category: 'NaturalNumbers'!
II subclass: #DXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXLVIII class' category: 'NaturalNumbers'!
DXLVIII class
	instanceVariableNames: ''!

!DXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXLIX.
	previous := DXLVII.! !


!classDefinition: #DXV category: 'NaturalNumbers'!
II subclass: #DXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXV class' category: 'NaturalNumbers'!
DXV class
	instanceVariableNames: ''!

!DXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXVI.
	previous := DXIV.! !


!classDefinition: #DXVI category: 'NaturalNumbers'!
II subclass: #DXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVI class' category: 'NaturalNumbers'!
DXVI class
	instanceVariableNames: ''!

!DXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXVII.
	previous := DXV.! !


!classDefinition: #DXVII category: 'NaturalNumbers'!
II subclass: #DXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVII class' category: 'NaturalNumbers'!
DXVII class
	instanceVariableNames: ''!

!DXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXVIII.
	previous := DXVI.! !


!classDefinition: #DXVIII category: 'NaturalNumbers'!
II subclass: #DXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXVIII class' category: 'NaturalNumbers'!
DXVIII class
	instanceVariableNames: ''!

!DXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXIX.
	previous := DXVII.! !


!classDefinition: #DXX category: 'NaturalNumbers'!
II subclass: #DXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXX class' category: 'NaturalNumbers'!
DXX class
	instanceVariableNames: ''!

!DXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:36'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXI.
	previous := DXIX.! !


!classDefinition: #DXXI category: 'NaturalNumbers'!
II subclass: #DXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXI class' category: 'NaturalNumbers'!
DXXI class
	instanceVariableNames: ''!

!DXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXII.
	previous := DXX.! !


!classDefinition: #DXXII category: 'NaturalNumbers'!
II subclass: #DXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXII class' category: 'NaturalNumbers'!
DXXII class
	instanceVariableNames: ''!

!DXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXIII.
	previous := DXXI.! !


!classDefinition: #DXXIII category: 'NaturalNumbers'!
II subclass: #DXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIII class' category: 'NaturalNumbers'!
DXXIII class
	instanceVariableNames: ''!

!DXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXIV.
	previous := DXXII.! !


!classDefinition: #DXXIV category: 'NaturalNumbers'!
II subclass: #DXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIV class' category: 'NaturalNumbers'!
DXXIV class
	instanceVariableNames: ''!

!DXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXV.
	previous := DXXIII.! !


!classDefinition: #DXXIX category: 'NaturalNumbers'!
II subclass: #DXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXIX class' category: 'NaturalNumbers'!
DXXIX class
	instanceVariableNames: ''!

!DXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXX.
	previous := DXXVIII.! !


!classDefinition: #DXXV category: 'NaturalNumbers'!
II subclass: #DXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXV class' category: 'NaturalNumbers'!
DXXV class
	instanceVariableNames: ''!

!DXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXVI.
	previous := DXXIV.! !


!classDefinition: #DXXVI category: 'NaturalNumbers'!
II subclass: #DXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVI class' category: 'NaturalNumbers'!
DXXVI class
	instanceVariableNames: ''!

!DXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXVII.
	previous := DXXV.! !


!classDefinition: #DXXVII category: 'NaturalNumbers'!
II subclass: #DXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVII class' category: 'NaturalNumbers'!
DXXVII class
	instanceVariableNames: ''!

!DXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXVIII.
	previous := DXXVI.! !


!classDefinition: #DXXVIII category: 'NaturalNumbers'!
II subclass: #DXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXVIII class' category: 'NaturalNumbers'!
DXXVIII class
	instanceVariableNames: ''!

!DXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXIX.
	previous := DXXVII.! !


!classDefinition: #DXXX category: 'NaturalNumbers'!
II subclass: #DXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXX class' category: 'NaturalNumbers'!
DXXX class
	instanceVariableNames: ''!

!DXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:37'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXI.
	previous := DXXIX.! !


!classDefinition: #DXXXI category: 'NaturalNumbers'!
II subclass: #DXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXI class' category: 'NaturalNumbers'!
DXXXI class
	instanceVariableNames: ''!

!DXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXII.
	previous := DXXX.! !


!classDefinition: #DXXXII category: 'NaturalNumbers'!
II subclass: #DXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXII class' category: 'NaturalNumbers'!
DXXXII class
	instanceVariableNames: ''!

!DXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXIII.
	previous := DXXXI.! !


!classDefinition: #DXXXIII category: 'NaturalNumbers'!
II subclass: #DXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIII class' category: 'NaturalNumbers'!
DXXXIII class
	instanceVariableNames: ''!

!DXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXIV.
	previous := DXXXII.! !


!classDefinition: #DXXXIV category: 'NaturalNumbers'!
II subclass: #DXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIV class' category: 'NaturalNumbers'!
DXXXIV class
	instanceVariableNames: ''!

!DXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXV.
	previous := DXXXIII.! !


!classDefinition: #DXXXIX category: 'NaturalNumbers'!
II subclass: #DXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXIX class' category: 'NaturalNumbers'!
DXXXIX class
	instanceVariableNames: ''!

!DXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXL.
	previous := DXXXVIII.! !


!classDefinition: #DXXXV category: 'NaturalNumbers'!
II subclass: #DXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXV class' category: 'NaturalNumbers'!
DXXXV class
	instanceVariableNames: ''!

!DXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXVI.
	previous := DXXXIV.! !


!classDefinition: #DXXXVI category: 'NaturalNumbers'!
II subclass: #DXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVI class' category: 'NaturalNumbers'!
DXXXVI class
	instanceVariableNames: ''!

!DXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXVII.
	previous := DXXXV.! !


!classDefinition: #DXXXVII category: 'NaturalNumbers'!
II subclass: #DXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVII class' category: 'NaturalNumbers'!
DXXXVII class
	instanceVariableNames: ''!

!DXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXVIII.
	previous := DXXXVI.! !


!classDefinition: #DXXXVIII category: 'NaturalNumbers'!
II subclass: #DXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DXXXVIII class' category: 'NaturalNumbers'!
DXXXVIII class
	instanceVariableNames: ''!

!DXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := DXXXIX.
	previous := DXXXVII.! !


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

!III class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:38'!
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

!IV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := V.
	previous := III.! !


!classDefinition: #IX category: 'NaturalNumbers'!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: 'NaturalNumbers'!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := X.
	previous := VIII.! !


!classDefinition: #L category: 'NaturalNumbers'!
II subclass: #L
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'L class' category: 'NaturalNumbers'!
L class
	instanceVariableNames: ''!

!L class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LI.
	previous := XLIX.! !


!classDefinition: #LI category: 'NaturalNumbers'!
II subclass: #LI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LI class' category: 'NaturalNumbers'!
LI class
	instanceVariableNames: ''!

!LI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LII.
	previous := L.! !


!classDefinition: #LII category: 'NaturalNumbers'!
II subclass: #LII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LII class' category: 'NaturalNumbers'!
LII class
	instanceVariableNames: ''!

!LII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIII.
	previous := LI.! !


!classDefinition: #LIII category: 'NaturalNumbers'!
II subclass: #LIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIII class' category: 'NaturalNumbers'!
LIII class
	instanceVariableNames: ''!

!LIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIV.
	previous := LII.! !


!classDefinition: #LIV category: 'NaturalNumbers'!
II subclass: #LIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIV class' category: 'NaturalNumbers'!
LIV class
	instanceVariableNames: ''!

!LIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LV.
	previous := LIII.! !


!classDefinition: #LIX category: 'NaturalNumbers'!
II subclass: #LIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIX class' category: 'NaturalNumbers'!
LIX class
	instanceVariableNames: ''!

!LIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LX.
	previous := LVIII.! !


!classDefinition: #LV category: 'NaturalNumbers'!
II subclass: #LV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LV class' category: 'NaturalNumbers'!
LV class
	instanceVariableNames: ''!

!LV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVI.
	previous := LIV.! !


!classDefinition: #LVI category: 'NaturalNumbers'!
II subclass: #LVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVI class' category: 'NaturalNumbers'!
LVI class
	instanceVariableNames: ''!

!LVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVII.
	previous := LV.! !


!classDefinition: #LVII category: 'NaturalNumbers'!
II subclass: #LVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVII class' category: 'NaturalNumbers'!
LVII class
	instanceVariableNames: ''!

!LVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:39'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVIII.
	previous := LVI.! !


!classDefinition: #LVIII category: 'NaturalNumbers'!
II subclass: #LVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVIII class' category: 'NaturalNumbers'!
LVIII class
	instanceVariableNames: ''!

!LVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIX.
	previous := LVII.! !


!classDefinition: #LX category: 'NaturalNumbers'!
II subclass: #LX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LX class' category: 'NaturalNumbers'!
LX class
	instanceVariableNames: ''!

!LX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXI.
	previous := LIX.! !


!classDefinition: #LXI category: 'NaturalNumbers'!
II subclass: #LXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXI class' category: 'NaturalNumbers'!
LXI class
	instanceVariableNames: ''!

!LXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXII.
	previous := LX.! !


!classDefinition: #LXII category: 'NaturalNumbers'!
II subclass: #LXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXII class' category: 'NaturalNumbers'!
LXII class
	instanceVariableNames: ''!

!LXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIII.
	previous := LXI.! !


!classDefinition: #LXIII category: 'NaturalNumbers'!
II subclass: #LXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIII class' category: 'NaturalNumbers'!
LXIII class
	instanceVariableNames: ''!

!LXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIV.
	previous := LXII.! !


!classDefinition: #LXIV category: 'NaturalNumbers'!
II subclass: #LXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIV class' category: 'NaturalNumbers'!
LXIV class
	instanceVariableNames: ''!

!LXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXV.
	previous := LXIII.! !


!classDefinition: #LXIX category: 'NaturalNumbers'!
II subclass: #LXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIX class' category: 'NaturalNumbers'!
LXIX class
	instanceVariableNames: ''!

!LXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXX.
	previous := LXVIII.! !


!classDefinition: #LXV category: 'NaturalNumbers'!
II subclass: #LXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXV class' category: 'NaturalNumbers'!
LXV class
	instanceVariableNames: ''!

!LXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVI.
	previous := LXIV.! !


!classDefinition: #LXVI category: 'NaturalNumbers'!
II subclass: #LXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVI class' category: 'NaturalNumbers'!
LXVI class
	instanceVariableNames: ''!

!LXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVII.
	previous := LXV.! !


!classDefinition: #LXVII category: 'NaturalNumbers'!
II subclass: #LXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVII class' category: 'NaturalNumbers'!
LXVII class
	instanceVariableNames: ''!

!LXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVIII.
	previous := LXVI.! !


!classDefinition: #LXVIII category: 'NaturalNumbers'!
II subclass: #LXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVIII class' category: 'NaturalNumbers'!
LXVIII class
	instanceVariableNames: ''!

!LXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIX.
	previous := LXVII.! !


!classDefinition: #LXX category: 'NaturalNumbers'!
II subclass: #LXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXX class' category: 'NaturalNumbers'!
LXX class
	instanceVariableNames: ''!

!LXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXI.
	previous := LXIX.! !


!classDefinition: #LXXI category: 'NaturalNumbers'!
II subclass: #LXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXI class' category: 'NaturalNumbers'!
LXXI class
	instanceVariableNames: ''!

!LXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXII.
	previous := LXX.! !


!classDefinition: #LXXII category: 'NaturalNumbers'!
II subclass: #LXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXII class' category: 'NaturalNumbers'!
LXXII class
	instanceVariableNames: ''!

!LXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIII.
	previous := LXXI.! !


!classDefinition: #LXXIII category: 'NaturalNumbers'!
II subclass: #LXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIII class' category: 'NaturalNumbers'!
LXXIII class
	instanceVariableNames: ''!

!LXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIV.
	previous := LXXII.! !


!classDefinition: #LXXIV category: 'NaturalNumbers'!
II subclass: #LXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIV class' category: 'NaturalNumbers'!
LXXIV class
	instanceVariableNames: ''!

!LXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXV.
	previous := LXXIII.! !


!classDefinition: #LXXIX category: 'NaturalNumbers'!
II subclass: #LXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIX class' category: 'NaturalNumbers'!
LXXIX class
	instanceVariableNames: ''!

!LXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXX.
	previous := LXXVIII.! !


!classDefinition: #LXXV category: 'NaturalNumbers'!
II subclass: #LXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXV class' category: 'NaturalNumbers'!
LXXV class
	instanceVariableNames: ''!

!LXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVI.
	previous := LXXIV.! !


!classDefinition: #LXXVI category: 'NaturalNumbers'!
II subclass: #LXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVI class' category: 'NaturalNumbers'!
LXXVI class
	instanceVariableNames: ''!

!LXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVII.
	previous := LXXV.! !


!classDefinition: #LXXVII category: 'NaturalNumbers'!
II subclass: #LXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVII class' category: 'NaturalNumbers'!
LXXVII class
	instanceVariableNames: ''!

!LXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVIII.
	previous := LXXVI.! !


!classDefinition: #LXXVIII category: 'NaturalNumbers'!
II subclass: #LXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVIII class' category: 'NaturalNumbers'!
LXXVIII class
	instanceVariableNames: ''!

!LXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIX.
	previous := LXXVII.! !


!classDefinition: #LXXX category: 'NaturalNumbers'!
II subclass: #LXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXX class' category: 'NaturalNumbers'!
LXXX class
	instanceVariableNames: ''!

!LXXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXI.
	previous := LXXIX.! !


!classDefinition: #LXXXI category: 'NaturalNumbers'!
II subclass: #LXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXI class' category: 'NaturalNumbers'!
LXXXI class
	instanceVariableNames: ''!

!LXXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXII.
	previous := LXXX.! !


!classDefinition: #LXXXII category: 'NaturalNumbers'!
II subclass: #LXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXII class' category: 'NaturalNumbers'!
LXXXII class
	instanceVariableNames: ''!

!LXXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIII.
	previous := LXXXI.! !


!classDefinition: #LXXXIII category: 'NaturalNumbers'!
II subclass: #LXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIII class' category: 'NaturalNumbers'!
LXXXIII class
	instanceVariableNames: ''!

!LXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIV.
	previous := LXXXII.! !


!classDefinition: #LXXXIV category: 'NaturalNumbers'!
II subclass: #LXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIV class' category: 'NaturalNumbers'!
LXXXIV class
	instanceVariableNames: ''!

!LXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXV.
	previous := LXXXIII.! !


!classDefinition: #LXXXIX category: 'NaturalNumbers'!
II subclass: #LXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIX class' category: 'NaturalNumbers'!
LXXXIX class
	instanceVariableNames: ''!

!LXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XC.
	previous := LXXXVIII.! !


!classDefinition: #LXXXV category: 'NaturalNumbers'!
II subclass: #LXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXV class' category: 'NaturalNumbers'!
LXXXV class
	instanceVariableNames: ''!

!LXXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVI.
	previous := LXXXIV.! !


!classDefinition: #LXXXVI category: 'NaturalNumbers'!
II subclass: #LXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVI class' category: 'NaturalNumbers'!
LXXXVI class
	instanceVariableNames: ''!

!LXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVII.
	previous := LXXXV.! !


!classDefinition: #LXXXVII category: 'NaturalNumbers'!
II subclass: #LXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVII class' category: 'NaturalNumbers'!
LXXXVII class
	instanceVariableNames: ''!

!LXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVIII.
	previous := LXXXVI.! !


!classDefinition: #LXXXVIII category: 'NaturalNumbers'!
II subclass: #LXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVIII class' category: 'NaturalNumbers'!
LXXXVIII class
	instanceVariableNames: ''!

!LXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:42'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIX.
	previous := LXXXVII.! !


!classDefinition: #M category: 'NaturalNumbers'!
II subclass: #M
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'M class' category: 'NaturalNumbers'!
M class
	instanceVariableNames: ''!

!M class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := CMXCIX.! !


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

!V class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
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

!VI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VII.
	previous := V.! !


!classDefinition: #VII category: 'NaturalNumbers'!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: 'NaturalNumbers'!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VIII.
	previous := VI.! !


!classDefinition: #VIII category: 'NaturalNumbers'!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: 'NaturalNumbers'!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IX.
	previous := VII.! !


!classDefinition: #X category: 'NaturalNumbers'!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: 'NaturalNumbers'!
X class
	instanceVariableNames: ''!

!X class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XI.
	previous := IX.! !


!classDefinition: #XC category: 'NaturalNumbers'!
II subclass: #XC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XC class' category: 'NaturalNumbers'!
XC class
	instanceVariableNames: ''!

!XC class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCI.
	previous := LXXXIX.! !


!classDefinition: #XCI category: 'NaturalNumbers'!
II subclass: #XCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCI class' category: 'NaturalNumbers'!
XCI class
	instanceVariableNames: ''!

!XCI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCII.
	previous := XC.! !


!classDefinition: #XCII category: 'NaturalNumbers'!
II subclass: #XCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCII class' category: 'NaturalNumbers'!
XCII class
	instanceVariableNames: ''!

!XCII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIII.
	previous := XCI.! !


!classDefinition: #XCIII category: 'NaturalNumbers'!
II subclass: #XCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIII class' category: 'NaturalNumbers'!
XCIII class
	instanceVariableNames: ''!

!XCIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIV.
	previous := XCII.! !


!classDefinition: #XCIV category: 'NaturalNumbers'!
II subclass: #XCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIV class' category: 'NaturalNumbers'!
XCIV class
	instanceVariableNames: ''!

!XCIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:43'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCV.
	previous := XCIII.! !


!classDefinition: #XCIX category: 'NaturalNumbers'!
II subclass: #XCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIX class' category: 'NaturalNumbers'!
XCIX class
	instanceVariableNames: ''!

!XCIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := C.
	previous := XCVIII.! !


!classDefinition: #XCV category: 'NaturalNumbers'!
II subclass: #XCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCV class' category: 'NaturalNumbers'!
XCV class
	instanceVariableNames: ''!

!XCV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVI.
	previous := XCIV.! !


!classDefinition: #XCVI category: 'NaturalNumbers'!
II subclass: #XCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVI class' category: 'NaturalNumbers'!
XCVI class
	instanceVariableNames: ''!

!XCVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVII.
	previous := XCV.! !


!classDefinition: #XCVII category: 'NaturalNumbers'!
II subclass: #XCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVII class' category: 'NaturalNumbers'!
XCVII class
	instanceVariableNames: ''!

!XCVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVIII.
	previous := XCVI.! !


!classDefinition: #XCVIII category: 'NaturalNumbers'!
II subclass: #XCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVIII class' category: 'NaturalNumbers'!
XCVIII class
	instanceVariableNames: ''!

!XCVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIX.
	previous := XCVII.! !


!classDefinition: #XI category: 'NaturalNumbers'!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: 'NaturalNumbers'!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XII.
	previous := X.! !


!classDefinition: #XII category: 'NaturalNumbers'!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: 'NaturalNumbers'!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIII.
	previous := XI.! !


!classDefinition: #XIII category: 'NaturalNumbers'!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: 'NaturalNumbers'!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIV.
	previous := XII.! !


!classDefinition: #XIV category: 'NaturalNumbers'!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: 'NaturalNumbers'!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XV.
	previous := XIII.! !


!classDefinition: #XIX category: 'NaturalNumbers'!
II subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIX class' category: 'NaturalNumbers'!
XIX class
	instanceVariableNames: ''!

!XIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XX.
	previous := XVIII.! !


!classDefinition: #XL category: 'NaturalNumbers'!
II subclass: #XL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XL class' category: 'NaturalNumbers'!
XL class
	instanceVariableNames: ''!

!XL class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLI.
	previous := XXXIX.! !


!classDefinition: #XLI category: 'NaturalNumbers'!
II subclass: #XLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLI class' category: 'NaturalNumbers'!
XLI class
	instanceVariableNames: ''!

!XLI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLII.
	previous := XL.! !


!classDefinition: #XLII category: 'NaturalNumbers'!
II subclass: #XLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLII class' category: 'NaturalNumbers'!
XLII class
	instanceVariableNames: ''!

!XLII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIII.
	previous := XLI.! !


!classDefinition: #XLIII category: 'NaturalNumbers'!
II subclass: #XLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIII class' category: 'NaturalNumbers'!
XLIII class
	instanceVariableNames: ''!

!XLIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIV.
	previous := XLII.! !


!classDefinition: #XLIV category: 'NaturalNumbers'!
II subclass: #XLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIV class' category: 'NaturalNumbers'!
XLIV class
	instanceVariableNames: ''!

!XLIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLV.
	previous := XLIII.! !


!classDefinition: #XLIX category: 'NaturalNumbers'!
II subclass: #XLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIX class' category: 'NaturalNumbers'!
XLIX class
	instanceVariableNames: ''!

!XLIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := L.
	previous := XLVIII.! !


!classDefinition: #XLV category: 'NaturalNumbers'!
II subclass: #XLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLV class' category: 'NaturalNumbers'!
XLV class
	instanceVariableNames: ''!

!XLV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVI.
	previous := XLIV.! !


!classDefinition: #XLVI category: 'NaturalNumbers'!
II subclass: #XLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVI class' category: 'NaturalNumbers'!
XLVI class
	instanceVariableNames: ''!

!XLVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVII.
	previous := XLV.! !


!classDefinition: #XLVII category: 'NaturalNumbers'!
II subclass: #XLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVII class' category: 'NaturalNumbers'!
XLVII class
	instanceVariableNames: ''!

!XLVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVIII.
	previous := XLVI.! !


!classDefinition: #XLVIII category: 'NaturalNumbers'!
II subclass: #XLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVIII class' category: 'NaturalNumbers'!
XLVIII class
	instanceVariableNames: ''!

!XLVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIX.
	previous := XLVII.! !


!classDefinition: #XV category: 'NaturalNumbers'!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: 'NaturalNumbers'!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:45'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVI.
	previous := XIV.! !


!classDefinition: #XVI category: 'NaturalNumbers'!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: 'NaturalNumbers'!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVII.
	previous := XV.! !


!classDefinition: #XVII category: 'NaturalNumbers'!
II subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVII class' category: 'NaturalNumbers'!
XVII class
	instanceVariableNames: ''!

!XVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVIII.
	previous := XVI.! !


!classDefinition: #XVIII category: 'NaturalNumbers'!
II subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVIII class' category: 'NaturalNumbers'!
XVIII class
	instanceVariableNames: ''!

!XVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIX.
	previous := XVII.! !


!classDefinition: #XX category: 'NaturalNumbers'!
II subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XX class' category: 'NaturalNumbers'!
XX class
	instanceVariableNames: ''!

!XX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXI.
	previous := XIX.! !


!classDefinition: #XXI category: 'NaturalNumbers'!
II subclass: #XXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXI class' category: 'NaturalNumbers'!
XXI class
	instanceVariableNames: ''!

!XXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXII.
	previous := XX.! !


!classDefinition: #XXII category: 'NaturalNumbers'!
II subclass: #XXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXII class' category: 'NaturalNumbers'!
XXII class
	instanceVariableNames: ''!

!XXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIII.
	previous := XXI.! !


!classDefinition: #XXIII category: 'NaturalNumbers'!
II subclass: #XXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIII class' category: 'NaturalNumbers'!
XXIII class
	instanceVariableNames: ''!

!XXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIV.
	previous := XXII.! !


!classDefinition: #XXIV category: 'NaturalNumbers'!
II subclass: #XXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIV class' category: 'NaturalNumbers'!
XXIV class
	instanceVariableNames: ''!

!XXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXV.
	previous := XXIII.! !


!classDefinition: #XXIX category: 'NaturalNumbers'!
II subclass: #XXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIX class' category: 'NaturalNumbers'!
XXIX class
	instanceVariableNames: ''!

!XXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXX.
	previous := XXVIII.! !


!classDefinition: #XXV category: 'NaturalNumbers'!
II subclass: #XXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXV class' category: 'NaturalNumbers'!
XXV class
	instanceVariableNames: ''!

!XXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVI.
	previous := XXIV.! !


!classDefinition: #XXVI category: 'NaturalNumbers'!
II subclass: #XXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVI class' category: 'NaturalNumbers'!
XXVI class
	instanceVariableNames: ''!

!XXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:46'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVII.
	previous := XXV.! !


!classDefinition: #XXVII category: 'NaturalNumbers'!
II subclass: #XXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVII class' category: 'NaturalNumbers'!
XXVII class
	instanceVariableNames: ''!

!XXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVIII.
	previous := XXVI.! !


!classDefinition: #XXVIII category: 'NaturalNumbers'!
II subclass: #XXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVIII class' category: 'NaturalNumbers'!
XXVIII class
	instanceVariableNames: ''!

!XXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIX.
	previous := XXVII.! !


!classDefinition: #XXX category: 'NaturalNumbers'!
II subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXX class' category: 'NaturalNumbers'!
XXX class
	instanceVariableNames: ''!

!XXX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXI.
	previous := XXIX.! !


!classDefinition: #XXXI category: 'NaturalNumbers'!
II subclass: #XXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXI class' category: 'NaturalNumbers'!
XXXI class
	instanceVariableNames: ''!

!XXXI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXII.
	previous := XXX.! !


!classDefinition: #XXXII category: 'NaturalNumbers'!
II subclass: #XXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXII class' category: 'NaturalNumbers'!
XXXII class
	instanceVariableNames: ''!

!XXXII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIII.
	previous := XXXI.! !


!classDefinition: #XXXIII category: 'NaturalNumbers'!
II subclass: #XXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIII class' category: 'NaturalNumbers'!
XXXIII class
	instanceVariableNames: ''!

!XXXIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIV.
	previous := XXXII.! !


!classDefinition: #XXXIV category: 'NaturalNumbers'!
II subclass: #XXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIV class' category: 'NaturalNumbers'!
XXXIV class
	instanceVariableNames: ''!

!XXXIV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXV.
	previous := XXXIII.! !


!classDefinition: #XXXIX category: 'NaturalNumbers'!
II subclass: #XXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIX class' category: 'NaturalNumbers'!
XXXIX class
	instanceVariableNames: ''!

!XXXIX class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XL.
	previous := XXXVIII.! !


!classDefinition: #XXXV category: 'NaturalNumbers'!
II subclass: #XXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXV class' category: 'NaturalNumbers'!
XXXV class
	instanceVariableNames: ''!

!XXXV class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVI.
	previous := XXXIV.! !


!classDefinition: #XXXVI category: 'NaturalNumbers'!
II subclass: #XXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVI class' category: 'NaturalNumbers'!
XXXVI class
	instanceVariableNames: ''!

!XXXVI class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVII.
	previous := XXXV.! !


!classDefinition: #XXXVII category: 'NaturalNumbers'!
II subclass: #XXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVII class' category: 'NaturalNumbers'!
XXXVII class
	instanceVariableNames: ''!

!XXXVII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVIII.
	previous := XXXVI.! !


!classDefinition: #XXXVIII category: 'NaturalNumbers'!
II subclass: #XXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NaturalNumbers'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVIII class' category: 'NaturalNumbers'!
XXXVIII class
	instanceVariableNames: ''!

!XXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'JL 9/3/2022 17:04:48'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIX.
	previous := XXXVII.! !

II initializeAfterFileIn!
C initializeAfterFileIn!
CC initializeAfterFileIn!
CCC initializeAfterFileIn!
CCCI initializeAfterFileIn!
CCCII initializeAfterFileIn!
CCCIII initializeAfterFileIn!
CCCIV initializeAfterFileIn!
CCCIX initializeAfterFileIn!
CCCL initializeAfterFileIn!
CCCLI initializeAfterFileIn!
CCCLII initializeAfterFileIn!
CCCLIII initializeAfterFileIn!
CCCLIV initializeAfterFileIn!
CCCLIX initializeAfterFileIn!
CCCLV initializeAfterFileIn!
CCCLVI initializeAfterFileIn!
CCCLVII initializeAfterFileIn!
CCCLVIII initializeAfterFileIn!
CCCLX initializeAfterFileIn!
CCCLXI initializeAfterFileIn!
CCCLXII initializeAfterFileIn!
CCCLXIII initializeAfterFileIn!
CCCLXIV initializeAfterFileIn!
CCCLXIX initializeAfterFileIn!
CCCLXV initializeAfterFileIn!
CCCLXVI initializeAfterFileIn!
CCCLXVII initializeAfterFileIn!
CCCLXVIII initializeAfterFileIn!
CCCLXX initializeAfterFileIn!
CCCLXXI initializeAfterFileIn!
CCCLXXII initializeAfterFileIn!
CCCLXXIII initializeAfterFileIn!
CCCLXXIV initializeAfterFileIn!
CCCLXXIX initializeAfterFileIn!
CCCLXXV initializeAfterFileIn!
CCCLXXVI initializeAfterFileIn!
CCCLXXVII initializeAfterFileIn!
CCCLXXVIII initializeAfterFileIn!
CCCLXXX initializeAfterFileIn!
CCCLXXXI initializeAfterFileIn!
CCCLXXXII initializeAfterFileIn!
CCCLXXXIII initializeAfterFileIn!
CCCLXXXIV initializeAfterFileIn!
CCCLXXXIX initializeAfterFileIn!
CCCLXXXV initializeAfterFileIn!
CCCLXXXVI initializeAfterFileIn!
CCCLXXXVII initializeAfterFileIn!
CCCLXXXVIII initializeAfterFileIn!
CCCV initializeAfterFileIn!
CCCVI initializeAfterFileIn!
CCCVII initializeAfterFileIn!
CCCVIII initializeAfterFileIn!
CCCX initializeAfterFileIn!
CCCXC initializeAfterFileIn!
CCCXCI initializeAfterFileIn!
CCCXCII initializeAfterFileIn!
CCCXCIII initializeAfterFileIn!
CCCXCIV initializeAfterFileIn!
CCCXCIX initializeAfterFileIn!
CCCXCV initializeAfterFileIn!
CCCXCVI initializeAfterFileIn!
CCCXCVII initializeAfterFileIn!
CCCXCVIII initializeAfterFileIn!
CCCXI initializeAfterFileIn!
CCCXII initializeAfterFileIn!
CCCXIII initializeAfterFileIn!
CCCXIV initializeAfterFileIn!
CCCXIX initializeAfterFileIn!
CCCXL initializeAfterFileIn!
CCCXLI initializeAfterFileIn!
CCCXLII initializeAfterFileIn!
CCCXLIII initializeAfterFileIn!
CCCXLIV initializeAfterFileIn!
CCCXLIX initializeAfterFileIn!
CCCXLV initializeAfterFileIn!
CCCXLVI initializeAfterFileIn!
CCCXLVII initializeAfterFileIn!
CCCXLVIII initializeAfterFileIn!
CCCXV initializeAfterFileIn!
CCCXVI initializeAfterFileIn!
CCCXVII initializeAfterFileIn!
CCCXVIII initializeAfterFileIn!
CCCXX initializeAfterFileIn!
CCCXXI initializeAfterFileIn!
CCCXXII initializeAfterFileIn!
CCCXXIII initializeAfterFileIn!
CCCXXIV initializeAfterFileIn!
CCCXXIX initializeAfterFileIn!
CCCXXV initializeAfterFileIn!
CCCXXVI initializeAfterFileIn!
CCCXXVII initializeAfterFileIn!
CCCXXVIII initializeAfterFileIn!
CCCXXX initializeAfterFileIn!
CCCXXXI initializeAfterFileIn!
CCCXXXII initializeAfterFileIn!
CCCXXXIII initializeAfterFileIn!
CCCXXXIV initializeAfterFileIn!
CCCXXXIX initializeAfterFileIn!
CCCXXXV initializeAfterFileIn!
CCCXXXVI initializeAfterFileIn!
CCCXXXVII initializeAfterFileIn!
CCCXXXVIII initializeAfterFileIn!
CCI initializeAfterFileIn!
CCII initializeAfterFileIn!
CCIII initializeAfterFileIn!
CCIV initializeAfterFileIn!
CCIX initializeAfterFileIn!
CCL initializeAfterFileIn!
CCLI initializeAfterFileIn!
CCLII initializeAfterFileIn!
CCLIII initializeAfterFileIn!
CCLIV initializeAfterFileIn!
CCLIX initializeAfterFileIn!
CCLV initializeAfterFileIn!
CCLVI initializeAfterFileIn!
CCLVII initializeAfterFileIn!
CCLVIII initializeAfterFileIn!
CCLX initializeAfterFileIn!
CCLXI initializeAfterFileIn!
CCLXII initializeAfterFileIn!
CCLXIII initializeAfterFileIn!
CCLXIV initializeAfterFileIn!
CCLXIX initializeAfterFileIn!
CCLXV initializeAfterFileIn!
CCLXVI initializeAfterFileIn!
CCLXVII initializeAfterFileIn!
CCLXVIII initializeAfterFileIn!
CCLXX initializeAfterFileIn!
CCLXXI initializeAfterFileIn!
CCLXXII initializeAfterFileIn!
CCLXXIII initializeAfterFileIn!
CCLXXIV initializeAfterFileIn!
CCLXXIX initializeAfterFileIn!
CCLXXV initializeAfterFileIn!
CCLXXVI initializeAfterFileIn!
CCLXXVII initializeAfterFileIn!
CCLXXVIII initializeAfterFileIn!
CCLXXX initializeAfterFileIn!
CCLXXXI initializeAfterFileIn!
CCLXXXII initializeAfterFileIn!
CCLXXXIII initializeAfterFileIn!
CCLXXXIV initializeAfterFileIn!
CCLXXXIX initializeAfterFileIn!
CCLXXXV initializeAfterFileIn!
CCLXXXVI initializeAfterFileIn!
CCLXXXVII initializeAfterFileIn!
CCLXXXVIII initializeAfterFileIn!
CCV initializeAfterFileIn!
CCVI initializeAfterFileIn!
CCVII initializeAfterFileIn!
CCVIII initializeAfterFileIn!
CCX initializeAfterFileIn!
CCXC initializeAfterFileIn!
CCXCI initializeAfterFileIn!
CCXCII initializeAfterFileIn!
CCXCIII initializeAfterFileIn!
CCXCIV initializeAfterFileIn!
CCXCIX initializeAfterFileIn!
CCXCV initializeAfterFileIn!
CCXCVI initializeAfterFileIn!
CCXCVII initializeAfterFileIn!
CCXCVIII initializeAfterFileIn!
CCXI initializeAfterFileIn!
CCXII initializeAfterFileIn!
CCXIII initializeAfterFileIn!
CCXIV initializeAfterFileIn!
CCXIX initializeAfterFileIn!
CCXL initializeAfterFileIn!
CCXLI initializeAfterFileIn!
CCXLII initializeAfterFileIn!
CCXLIII initializeAfterFileIn!
CCXLIV initializeAfterFileIn!
CCXLIX initializeAfterFileIn!
CCXLV initializeAfterFileIn!
CCXLVI initializeAfterFileIn!
CCXLVII initializeAfterFileIn!
CCXLVIII initializeAfterFileIn!
CCXV initializeAfterFileIn!
CCXVI initializeAfterFileIn!
CCXVII initializeAfterFileIn!
CCXVIII initializeAfterFileIn!
CCXX initializeAfterFileIn!
CCXXI initializeAfterFileIn!
CCXXII initializeAfterFileIn!
CCXXIII initializeAfterFileIn!
CCXXIV initializeAfterFileIn!
CCXXIX initializeAfterFileIn!
CCXXV initializeAfterFileIn!
CCXXVI initializeAfterFileIn!
CCXXVII initializeAfterFileIn!
CCXXVIII initializeAfterFileIn!
CCXXX initializeAfterFileIn!
CCXXXI initializeAfterFileIn!
CCXXXII initializeAfterFileIn!
CCXXXIII initializeAfterFileIn!
CCXXXIV initializeAfterFileIn!
CCXXXIX initializeAfterFileIn!
CCXXXV initializeAfterFileIn!
CCXXXVI initializeAfterFileIn!
CCXXXVII initializeAfterFileIn!
CCXXXVIII initializeAfterFileIn!
CD initializeAfterFileIn!
CDI initializeAfterFileIn!
CDII initializeAfterFileIn!
CDIII initializeAfterFileIn!
CDIV initializeAfterFileIn!
CDIX initializeAfterFileIn!
CDL initializeAfterFileIn!
CDLI initializeAfterFileIn!
CDLII initializeAfterFileIn!
CDLIII initializeAfterFileIn!
CDLIV initializeAfterFileIn!
CDLIX initializeAfterFileIn!
CDLV initializeAfterFileIn!
CDLVI initializeAfterFileIn!
CDLVII initializeAfterFileIn!
CDLVIII initializeAfterFileIn!
CDLX initializeAfterFileIn!
CDLXI initializeAfterFileIn!
CDLXII initializeAfterFileIn!
CDLXIII initializeAfterFileIn!
CDLXIV initializeAfterFileIn!
CDLXIX initializeAfterFileIn!
CDLXV initializeAfterFileIn!
CDLXVI initializeAfterFileIn!
CDLXVII initializeAfterFileIn!
CDLXVIII initializeAfterFileIn!
CDLXX initializeAfterFileIn!
CDLXXI initializeAfterFileIn!
CDLXXII initializeAfterFileIn!
CDLXXIII initializeAfterFileIn!
CDLXXIV initializeAfterFileIn!
CDLXXIX initializeAfterFileIn!
CDLXXV initializeAfterFileIn!
CDLXXVI initializeAfterFileIn!
CDLXXVII initializeAfterFileIn!
CDLXXVIII initializeAfterFileIn!
CDLXXX initializeAfterFileIn!
CDLXXXI initializeAfterFileIn!
CDLXXXII initializeAfterFileIn!
CDLXXXIII initializeAfterFileIn!
CDLXXXIV initializeAfterFileIn!
CDLXXXIX initializeAfterFileIn!
CDLXXXV initializeAfterFileIn!
CDLXXXVI initializeAfterFileIn!
CDLXXXVII initializeAfterFileIn!
CDLXXXVIII initializeAfterFileIn!
CDV initializeAfterFileIn!
CDVI initializeAfterFileIn!
CDVII initializeAfterFileIn!
CDVIII initializeAfterFileIn!
CDX initializeAfterFileIn!
CDXC initializeAfterFileIn!
CDXCI initializeAfterFileIn!
CDXCII initializeAfterFileIn!
CDXCIII initializeAfterFileIn!
CDXCIV initializeAfterFileIn!
CDXCIX initializeAfterFileIn!
CDXCV initializeAfterFileIn!
CDXCVI initializeAfterFileIn!
CDXCVII initializeAfterFileIn!
CDXCVIII initializeAfterFileIn!
CDXI initializeAfterFileIn!
CDXII initializeAfterFileIn!
CDXIII initializeAfterFileIn!
CDXIV initializeAfterFileIn!
CDXIX initializeAfterFileIn!
CDXL initializeAfterFileIn!
CDXLI initializeAfterFileIn!
CDXLII initializeAfterFileIn!
CDXLIII initializeAfterFileIn!
CDXLIV initializeAfterFileIn!
CDXLIX initializeAfterFileIn!
CDXLV initializeAfterFileIn!
CDXLVI initializeAfterFileIn!
CDXLVII initializeAfterFileIn!
CDXLVIII initializeAfterFileIn!
CDXV initializeAfterFileIn!
CDXVI initializeAfterFileIn!
CDXVII initializeAfterFileIn!
CDXVIII initializeAfterFileIn!
CDXX initializeAfterFileIn!
CDXXI initializeAfterFileIn!
CDXXII initializeAfterFileIn!
CDXXIII initializeAfterFileIn!
CDXXIV initializeAfterFileIn!
CDXXIX initializeAfterFileIn!
CDXXV initializeAfterFileIn!
CDXXVI initializeAfterFileIn!
CDXXVII initializeAfterFileIn!
CDXXVIII initializeAfterFileIn!
CDXXX initializeAfterFileIn!
CDXXXI initializeAfterFileIn!
CDXXXII initializeAfterFileIn!
CDXXXIII initializeAfterFileIn!
CDXXXIV initializeAfterFileIn!
CDXXXIX initializeAfterFileIn!
CDXXXV initializeAfterFileIn!
CDXXXVI initializeAfterFileIn!
CDXXXVII initializeAfterFileIn!
CDXXXVIII initializeAfterFileIn!
CI initializeAfterFileIn!
CII initializeAfterFileIn!
CIII initializeAfterFileIn!
CIV initializeAfterFileIn!
CIX initializeAfterFileIn!
CL initializeAfterFileIn!
CLI initializeAfterFileIn!
CLII initializeAfterFileIn!
CLIII initializeAfterFileIn!
CLIV initializeAfterFileIn!
CLIX initializeAfterFileIn!
CLV initializeAfterFileIn!
CLVI initializeAfterFileIn!
CLVII initializeAfterFileIn!
CLVIII initializeAfterFileIn!
CLX initializeAfterFileIn!
CLXI initializeAfterFileIn!
CLXII initializeAfterFileIn!
CLXIII initializeAfterFileIn!
CLXIV initializeAfterFileIn!
CLXIX initializeAfterFileIn!
CLXV initializeAfterFileIn!
CLXVI initializeAfterFileIn!
CLXVII initializeAfterFileIn!
CLXVIII initializeAfterFileIn!
CLXX initializeAfterFileIn!
CLXXI initializeAfterFileIn!
CLXXII initializeAfterFileIn!
CLXXIII initializeAfterFileIn!
CLXXIV initializeAfterFileIn!
CLXXIX initializeAfterFileIn!
CLXXV initializeAfterFileIn!
CLXXVI initializeAfterFileIn!
CLXXVII initializeAfterFileIn!
CLXXVIII initializeAfterFileIn!
CLXXX initializeAfterFileIn!
CLXXXI initializeAfterFileIn!
CLXXXII initializeAfterFileIn!
CLXXXIII initializeAfterFileIn!
CLXXXIV initializeAfterFileIn!
CLXXXIX initializeAfterFileIn!
CLXXXV initializeAfterFileIn!
CLXXXVI initializeAfterFileIn!
CLXXXVII initializeAfterFileIn!
CLXXXVIII initializeAfterFileIn!
CM initializeAfterFileIn!
CMI initializeAfterFileIn!
CMII initializeAfterFileIn!
CMIII initializeAfterFileIn!
CMIV initializeAfterFileIn!
CMIX initializeAfterFileIn!
CML initializeAfterFileIn!
CMLI initializeAfterFileIn!
CMLII initializeAfterFileIn!
CMLIII initializeAfterFileIn!
CMLIV initializeAfterFileIn!
CMLIX initializeAfterFileIn!
CMLV initializeAfterFileIn!
CMLVI initializeAfterFileIn!
CMLVII initializeAfterFileIn!
CMLVIII initializeAfterFileIn!
CMLX initializeAfterFileIn!
CMLXI initializeAfterFileIn!
CMLXII initializeAfterFileIn!
CMLXIII initializeAfterFileIn!
CMLXIV initializeAfterFileIn!
CMLXIX initializeAfterFileIn!
CMLXV initializeAfterFileIn!
CMLXVI initializeAfterFileIn!
CMLXVII initializeAfterFileIn!
CMLXVIII initializeAfterFileIn!
CMLXX initializeAfterFileIn!
CMLXXI initializeAfterFileIn!
CMLXXII initializeAfterFileIn!
CMLXXIII initializeAfterFileIn!
CMLXXIV initializeAfterFileIn!
CMLXXIX initializeAfterFileIn!
CMLXXV initializeAfterFileIn!
CMLXXVI initializeAfterFileIn!
CMLXXVII initializeAfterFileIn!
CMLXXVIII initializeAfterFileIn!
CMLXXX initializeAfterFileIn!
CMLXXXI initializeAfterFileIn!
CMLXXXII initializeAfterFileIn!
CMLXXXIII initializeAfterFileIn!
CMLXXXIV initializeAfterFileIn!
CMLXXXIX initializeAfterFileIn!
CMLXXXV initializeAfterFileIn!
CMLXXXVI initializeAfterFileIn!
CMLXXXVII initializeAfterFileIn!
CMLXXXVIII initializeAfterFileIn!
CMV initializeAfterFileIn!
CMVI initializeAfterFileIn!
CMVII initializeAfterFileIn!
CMVIII initializeAfterFileIn!
CMX initializeAfterFileIn!
CMXC initializeAfterFileIn!
CMXCI initializeAfterFileIn!
CMXCII initializeAfterFileIn!
CMXCIII initializeAfterFileIn!
CMXCIV initializeAfterFileIn!
CMXCIX initializeAfterFileIn!
CMXCV initializeAfterFileIn!
CMXCVI initializeAfterFileIn!
CMXCVII initializeAfterFileIn!
CMXCVIII initializeAfterFileIn!
CMXI initializeAfterFileIn!
CMXII initializeAfterFileIn!
CMXIII initializeAfterFileIn!
CMXIV initializeAfterFileIn!
CMXIX initializeAfterFileIn!
CMXL initializeAfterFileIn!
CMXLI initializeAfterFileIn!
CMXLII initializeAfterFileIn!
CMXLIII initializeAfterFileIn!
CMXLIV initializeAfterFileIn!
CMXLIX initializeAfterFileIn!
CMXLV initializeAfterFileIn!
CMXLVI initializeAfterFileIn!
CMXLVII initializeAfterFileIn!
CMXLVIII initializeAfterFileIn!
CMXV initializeAfterFileIn!
CMXVI initializeAfterFileIn!
CMXVII initializeAfterFileIn!
CMXVIII initializeAfterFileIn!
CMXX initializeAfterFileIn!
CMXXI initializeAfterFileIn!
CMXXII initializeAfterFileIn!
CMXXIII initializeAfterFileIn!
CMXXIV initializeAfterFileIn!
CMXXIX initializeAfterFileIn!
CMXXV initializeAfterFileIn!
CMXXVI initializeAfterFileIn!
CMXXVII initializeAfterFileIn!
CMXXVIII initializeAfterFileIn!
CMXXX initializeAfterFileIn!
CMXXXI initializeAfterFileIn!
CMXXXII initializeAfterFileIn!
CMXXXIII initializeAfterFileIn!
CMXXXIV initializeAfterFileIn!
CMXXXIX initializeAfterFileIn!
CMXXXV initializeAfterFileIn!
CMXXXVI initializeAfterFileIn!
CMXXXVII initializeAfterFileIn!
CMXXXVIII initializeAfterFileIn!
CV initializeAfterFileIn!
CVI initializeAfterFileIn!
CVII initializeAfterFileIn!
CVIII initializeAfterFileIn!
CX initializeAfterFileIn!
CXC initializeAfterFileIn!
CXCI initializeAfterFileIn!
CXCII initializeAfterFileIn!
CXCIII initializeAfterFileIn!
CXCIV initializeAfterFileIn!
CXCIX initializeAfterFileIn!
CXCV initializeAfterFileIn!
CXCVI initializeAfterFileIn!
CXCVII initializeAfterFileIn!
CXCVIII initializeAfterFileIn!
CXI initializeAfterFileIn!
CXII initializeAfterFileIn!
CXIII initializeAfterFileIn!
CXIV initializeAfterFileIn!
CXIX initializeAfterFileIn!
CXL initializeAfterFileIn!
CXLI initializeAfterFileIn!
CXLII initializeAfterFileIn!
CXLIII initializeAfterFileIn!
CXLIV initializeAfterFileIn!
CXLIX initializeAfterFileIn!
CXLV initializeAfterFileIn!
CXLVI initializeAfterFileIn!
CXLVII initializeAfterFileIn!
CXLVIII initializeAfterFileIn!
CXV initializeAfterFileIn!
CXVI initializeAfterFileIn!
CXVII initializeAfterFileIn!
CXVIII initializeAfterFileIn!
CXX initializeAfterFileIn!
CXXI initializeAfterFileIn!
CXXII initializeAfterFileIn!
CXXIII initializeAfterFileIn!
CXXIV initializeAfterFileIn!
CXXIX initializeAfterFileIn!
CXXV initializeAfterFileIn!
CXXVI initializeAfterFileIn!
CXXVII initializeAfterFileIn!
CXXVIII initializeAfterFileIn!
CXXX initializeAfterFileIn!
CXXXI initializeAfterFileIn!
CXXXII initializeAfterFileIn!
CXXXIII initializeAfterFileIn!
CXXXIV initializeAfterFileIn!
CXXXIX initializeAfterFileIn!
CXXXV initializeAfterFileIn!
CXXXVI initializeAfterFileIn!
CXXXVII initializeAfterFileIn!
CXXXVIII initializeAfterFileIn!
D initializeAfterFileIn!
DC initializeAfterFileIn!
DCC initializeAfterFileIn!
DCCC initializeAfterFileIn!
DCCCI initializeAfterFileIn!
DCCCII initializeAfterFileIn!
DCCCIII initializeAfterFileIn!
DCCCIV initializeAfterFileIn!
DCCCIX initializeAfterFileIn!
DCCCL initializeAfterFileIn!
DCCCLI initializeAfterFileIn!
DCCCLII initializeAfterFileIn!
DCCCLIII initializeAfterFileIn!
DCCCLIV initializeAfterFileIn!
DCCCLIX initializeAfterFileIn!
DCCCLV initializeAfterFileIn!
DCCCLVI initializeAfterFileIn!
DCCCLVII initializeAfterFileIn!
DCCCLVIII initializeAfterFileIn!
DCCCLX initializeAfterFileIn!
DCCCLXI initializeAfterFileIn!
DCCCLXII initializeAfterFileIn!
DCCCLXIII initializeAfterFileIn!
DCCCLXIV initializeAfterFileIn!
DCCCLXIX initializeAfterFileIn!
DCCCLXV initializeAfterFileIn!
DCCCLXVI initializeAfterFileIn!
DCCCLXVII initializeAfterFileIn!
DCCCLXVIII initializeAfterFileIn!
DCCCLXX initializeAfterFileIn!
DCCCLXXI initializeAfterFileIn!
DCCCLXXII initializeAfterFileIn!
DCCCLXXIII initializeAfterFileIn!
DCCCLXXIV initializeAfterFileIn!
DCCCLXXIX initializeAfterFileIn!
DCCCLXXV initializeAfterFileIn!
DCCCLXXVI initializeAfterFileIn!
DCCCLXXVII initializeAfterFileIn!
DCCCLXXVIII initializeAfterFileIn!
DCCCLXXX initializeAfterFileIn!
DCCCLXXXI initializeAfterFileIn!
DCCCLXXXII initializeAfterFileIn!
DCCCLXXXIII initializeAfterFileIn!
DCCCLXXXIV initializeAfterFileIn!
DCCCLXXXIX initializeAfterFileIn!
DCCCLXXXV initializeAfterFileIn!
DCCCLXXXVI initializeAfterFileIn!
DCCCLXXXVII initializeAfterFileIn!
DCCCLXXXVIII initializeAfterFileIn!
DCCCV initializeAfterFileIn!
DCCCVI initializeAfterFileIn!
DCCCVII initializeAfterFileIn!
DCCCVIII initializeAfterFileIn!
DCCCX initializeAfterFileIn!
DCCCXC initializeAfterFileIn!
DCCCXCI initializeAfterFileIn!
DCCCXCII initializeAfterFileIn!
DCCCXCIII initializeAfterFileIn!
DCCCXCIV initializeAfterFileIn!
DCCCXCIX initializeAfterFileIn!
DCCCXCV initializeAfterFileIn!
DCCCXCVI initializeAfterFileIn!
DCCCXCVII initializeAfterFileIn!
DCCCXCVIII initializeAfterFileIn!
DCCCXI initializeAfterFileIn!
DCCCXII initializeAfterFileIn!
DCCCXIII initializeAfterFileIn!
DCCCXIV initializeAfterFileIn!
DCCCXIX initializeAfterFileIn!
DCCCXL initializeAfterFileIn!
DCCCXLI initializeAfterFileIn!
DCCCXLII initializeAfterFileIn!
DCCCXLIII initializeAfterFileIn!
DCCCXLIV initializeAfterFileIn!
DCCCXLIX initializeAfterFileIn!
DCCCXLV initializeAfterFileIn!
DCCCXLVI initializeAfterFileIn!
DCCCXLVII initializeAfterFileIn!
DCCCXLVIII initializeAfterFileIn!
DCCCXV initializeAfterFileIn!
DCCCXVI initializeAfterFileIn!
DCCCXVII initializeAfterFileIn!
DCCCXVIII initializeAfterFileIn!
DCCCXX initializeAfterFileIn!
DCCCXXI initializeAfterFileIn!
DCCCXXII initializeAfterFileIn!
DCCCXXIII initializeAfterFileIn!
DCCCXXIV initializeAfterFileIn!
DCCCXXIX initializeAfterFileIn!
DCCCXXV initializeAfterFileIn!
DCCCXXVI initializeAfterFileIn!
DCCCXXVII initializeAfterFileIn!
DCCCXXVIII initializeAfterFileIn!
DCCCXXX initializeAfterFileIn!
DCCCXXXI initializeAfterFileIn!
DCCCXXXII initializeAfterFileIn!
DCCCXXXIII initializeAfterFileIn!
DCCCXXXIV initializeAfterFileIn!
DCCCXXXIX initializeAfterFileIn!
DCCCXXXV initializeAfterFileIn!
DCCCXXXVI initializeAfterFileIn!
DCCCXXXVII initializeAfterFileIn!
DCCCXXXVIII initializeAfterFileIn!
DCCI initializeAfterFileIn!
DCCII initializeAfterFileIn!
DCCIII initializeAfterFileIn!
DCCIV initializeAfterFileIn!
DCCIX initializeAfterFileIn!
DCCL initializeAfterFileIn!
DCCLI initializeAfterFileIn!
DCCLII initializeAfterFileIn!
DCCLIII initializeAfterFileIn!
DCCLIV initializeAfterFileIn!
DCCLIX initializeAfterFileIn!
DCCLV initializeAfterFileIn!
DCCLVI initializeAfterFileIn!
DCCLVII initializeAfterFileIn!
DCCLVIII initializeAfterFileIn!
DCCLX initializeAfterFileIn!
DCCLXI initializeAfterFileIn!
DCCLXII initializeAfterFileIn!
DCCLXIII initializeAfterFileIn!
DCCLXIV initializeAfterFileIn!
DCCLXIX initializeAfterFileIn!
DCCLXV initializeAfterFileIn!
DCCLXVI initializeAfterFileIn!
DCCLXVII initializeAfterFileIn!
DCCLXVIII initializeAfterFileIn!
DCCLXX initializeAfterFileIn!
DCCLXXI initializeAfterFileIn!
DCCLXXII initializeAfterFileIn!
DCCLXXIII initializeAfterFileIn!
DCCLXXIV initializeAfterFileIn!
DCCLXXIX initializeAfterFileIn!
DCCLXXV initializeAfterFileIn!
DCCLXXVI initializeAfterFileIn!
DCCLXXVII initializeAfterFileIn!
DCCLXXVIII initializeAfterFileIn!
DCCLXXX initializeAfterFileIn!
DCCLXXXI initializeAfterFileIn!
DCCLXXXII initializeAfterFileIn!
DCCLXXXIII initializeAfterFileIn!
DCCLXXXIV initializeAfterFileIn!
DCCLXXXIX initializeAfterFileIn!
DCCLXXXV initializeAfterFileIn!
DCCLXXXVI initializeAfterFileIn!
DCCLXXXVII initializeAfterFileIn!
DCCLXXXVIII initializeAfterFileIn!
DCCV initializeAfterFileIn!
DCCVI initializeAfterFileIn!
DCCVII initializeAfterFileIn!
DCCVIII initializeAfterFileIn!
DCCX initializeAfterFileIn!
DCCXC initializeAfterFileIn!
DCCXCI initializeAfterFileIn!
DCCXCII initializeAfterFileIn!
DCCXCIII initializeAfterFileIn!
DCCXCIV initializeAfterFileIn!
DCCXCIX initializeAfterFileIn!
DCCXCV initializeAfterFileIn!
DCCXCVI initializeAfterFileIn!
DCCXCVII initializeAfterFileIn!
DCCXCVIII initializeAfterFileIn!
DCCXI initializeAfterFileIn!
DCCXII initializeAfterFileIn!
DCCXIII initializeAfterFileIn!
DCCXIV initializeAfterFileIn!
DCCXIX initializeAfterFileIn!
DCCXL initializeAfterFileIn!
DCCXLI initializeAfterFileIn!
DCCXLII initializeAfterFileIn!
DCCXLIII initializeAfterFileIn!
DCCXLIV initializeAfterFileIn!
DCCXLIX initializeAfterFileIn!
DCCXLV initializeAfterFileIn!
DCCXLVI initializeAfterFileIn!
DCCXLVII initializeAfterFileIn!
DCCXLVIII initializeAfterFileIn!
DCCXV initializeAfterFileIn!
DCCXVI initializeAfterFileIn!
DCCXVII initializeAfterFileIn!
DCCXVIII initializeAfterFileIn!
DCCXX initializeAfterFileIn!
DCCXXI initializeAfterFileIn!
DCCXXII initializeAfterFileIn!
DCCXXIII initializeAfterFileIn!
DCCXXIV initializeAfterFileIn!
DCCXXIX initializeAfterFileIn!
DCCXXV initializeAfterFileIn!
DCCXXVI initializeAfterFileIn!
DCCXXVII initializeAfterFileIn!
DCCXXVIII initializeAfterFileIn!
DCCXXX initializeAfterFileIn!
DCCXXXI initializeAfterFileIn!
DCCXXXII initializeAfterFileIn!
DCCXXXIII initializeAfterFileIn!
DCCXXXIV initializeAfterFileIn!
DCCXXXIX initializeAfterFileIn!
DCCXXXV initializeAfterFileIn!
DCCXXXVI initializeAfterFileIn!
DCCXXXVII initializeAfterFileIn!
DCCXXXVIII initializeAfterFileIn!
DCI initializeAfterFileIn!
DCII initializeAfterFileIn!
DCIII initializeAfterFileIn!
DCIV initializeAfterFileIn!
DCIX initializeAfterFileIn!
DCL initializeAfterFileIn!
DCLI initializeAfterFileIn!
DCLII initializeAfterFileIn!
DCLIII initializeAfterFileIn!
DCLIV initializeAfterFileIn!
DCLIX initializeAfterFileIn!
DCLV initializeAfterFileIn!
DCLVI initializeAfterFileIn!
DCLVII initializeAfterFileIn!
DCLVIII initializeAfterFileIn!
DCLX initializeAfterFileIn!
DCLXI initializeAfterFileIn!
DCLXII initializeAfterFileIn!
DCLXIII initializeAfterFileIn!
DCLXIV initializeAfterFileIn!
DCLXIX initializeAfterFileIn!
DCLXV initializeAfterFileIn!
DCLXVI initializeAfterFileIn!
DCLXVII initializeAfterFileIn!
DCLXVIII initializeAfterFileIn!
DCLXX initializeAfterFileIn!
DCLXXI initializeAfterFileIn!
DCLXXII initializeAfterFileIn!
DCLXXIII initializeAfterFileIn!
DCLXXIV initializeAfterFileIn!
DCLXXIX initializeAfterFileIn!
DCLXXV initializeAfterFileIn!
DCLXXVI initializeAfterFileIn!
DCLXXVII initializeAfterFileIn!
DCLXXVIII initializeAfterFileIn!
DCLXXX initializeAfterFileIn!
DCLXXXI initializeAfterFileIn!
DCLXXXII initializeAfterFileIn!
DCLXXXIII initializeAfterFileIn!
DCLXXXIV initializeAfterFileIn!
DCLXXXIX initializeAfterFileIn!
DCLXXXV initializeAfterFileIn!
DCLXXXVI initializeAfterFileIn!
DCLXXXVII initializeAfterFileIn!
DCLXXXVIII initializeAfterFileIn!
DCV initializeAfterFileIn!
DCVI initializeAfterFileIn!
DCVII initializeAfterFileIn!
DCVIII initializeAfterFileIn!
DCX initializeAfterFileIn!
DCXC initializeAfterFileIn!
DCXCI initializeAfterFileIn!
DCXCII initializeAfterFileIn!
DCXCIII initializeAfterFileIn!
DCXCIV initializeAfterFileIn!
DCXCIX initializeAfterFileIn!
DCXCV initializeAfterFileIn!
DCXCVI initializeAfterFileIn!
DCXCVII initializeAfterFileIn!
DCXCVIII initializeAfterFileIn!
DCXI initializeAfterFileIn!
DCXII initializeAfterFileIn!
DCXIII initializeAfterFileIn!
DCXIV initializeAfterFileIn!
DCXIX initializeAfterFileIn!
DCXL initializeAfterFileIn!
DCXLI initializeAfterFileIn!
DCXLII initializeAfterFileIn!
DCXLIII initializeAfterFileIn!
DCXLIV initializeAfterFileIn!
DCXLIX initializeAfterFileIn!
DCXLV initializeAfterFileIn!
DCXLVI initializeAfterFileIn!
DCXLVII initializeAfterFileIn!
DCXLVIII initializeAfterFileIn!
DCXV initializeAfterFileIn!
DCXVI initializeAfterFileIn!
DCXVII initializeAfterFileIn!
DCXVIII initializeAfterFileIn!
DCXX initializeAfterFileIn!
DCXXI initializeAfterFileIn!
DCXXII initializeAfterFileIn!
DCXXIII initializeAfterFileIn!
DCXXIV initializeAfterFileIn!
DCXXIX initializeAfterFileIn!
DCXXV initializeAfterFileIn!
DCXXVI initializeAfterFileIn!
DCXXVII initializeAfterFileIn!
DCXXVIII initializeAfterFileIn!
DCXXX initializeAfterFileIn!
DCXXXI initializeAfterFileIn!
DCXXXII initializeAfterFileIn!
DCXXXIII initializeAfterFileIn!
DCXXXIV initializeAfterFileIn!
DCXXXIX initializeAfterFileIn!
DCXXXV initializeAfterFileIn!
DCXXXVI initializeAfterFileIn!
DCXXXVII initializeAfterFileIn!
DCXXXVIII initializeAfterFileIn!
DI initializeAfterFileIn!
DII initializeAfterFileIn!
DIII initializeAfterFileIn!
DIV initializeAfterFileIn!
DIX initializeAfterFileIn!
DL initializeAfterFileIn!
DLI initializeAfterFileIn!
DLII initializeAfterFileIn!
DLIII initializeAfterFileIn!
DLIV initializeAfterFileIn!
DLIX initializeAfterFileIn!
DLV initializeAfterFileIn!
DLVI initializeAfterFileIn!
DLVII initializeAfterFileIn!
DLVIII initializeAfterFileIn!
DLX initializeAfterFileIn!
DLXI initializeAfterFileIn!
DLXII initializeAfterFileIn!
DLXIII initializeAfterFileIn!
DLXIV initializeAfterFileIn!
DLXIX initializeAfterFileIn!
DLXV initializeAfterFileIn!
DLXVI initializeAfterFileIn!
DLXVII initializeAfterFileIn!
DLXVIII initializeAfterFileIn!
DLXX initializeAfterFileIn!
DLXXI initializeAfterFileIn!
DLXXII initializeAfterFileIn!
DLXXIII initializeAfterFileIn!
DLXXIV initializeAfterFileIn!
DLXXIX initializeAfterFileIn!
DLXXV initializeAfterFileIn!
DLXXVI initializeAfterFileIn!
DLXXVII initializeAfterFileIn!
DLXXVIII initializeAfterFileIn!
DLXXX initializeAfterFileIn!
DLXXXI initializeAfterFileIn!
DLXXXII initializeAfterFileIn!
DLXXXIII initializeAfterFileIn!
DLXXXIV initializeAfterFileIn!
DLXXXIX initializeAfterFileIn!
DLXXXV initializeAfterFileIn!
DLXXXVI initializeAfterFileIn!
DLXXXVII initializeAfterFileIn!
DLXXXVIII initializeAfterFileIn!
DV initializeAfterFileIn!
DVI initializeAfterFileIn!
DVII initializeAfterFileIn!
DVIII initializeAfterFileIn!
DX initializeAfterFileIn!
DXC initializeAfterFileIn!
DXCI initializeAfterFileIn!
DXCII initializeAfterFileIn!
DXCIII initializeAfterFileIn!
DXCIV initializeAfterFileIn!
DXCIX initializeAfterFileIn!
DXCV initializeAfterFileIn!
DXCVI initializeAfterFileIn!
DXCVII initializeAfterFileIn!
DXCVIII initializeAfterFileIn!
DXI initializeAfterFileIn!
DXII initializeAfterFileIn!
DXIII initializeAfterFileIn!
DXIV initializeAfterFileIn!
DXIX initializeAfterFileIn!
DXL initializeAfterFileIn!
DXLI initializeAfterFileIn!
DXLII initializeAfterFileIn!
DXLIII initializeAfterFileIn!
DXLIV initializeAfterFileIn!
DXLIX initializeAfterFileIn!
DXLV initializeAfterFileIn!
DXLVI initializeAfterFileIn!
DXLVII initializeAfterFileIn!
DXLVIII initializeAfterFileIn!
DXV initializeAfterFileIn!
DXVI initializeAfterFileIn!
DXVII initializeAfterFileIn!
DXVIII initializeAfterFileIn!
DXX initializeAfterFileIn!
DXXI initializeAfterFileIn!
DXXII initializeAfterFileIn!
DXXIII initializeAfterFileIn!
DXXIV initializeAfterFileIn!
DXXIX initializeAfterFileIn!
DXXV initializeAfterFileIn!
DXXVI initializeAfterFileIn!
DXXVII initializeAfterFileIn!
DXXVIII initializeAfterFileIn!
DXXX initializeAfterFileIn!
DXXXI initializeAfterFileIn!
DXXXII initializeAfterFileIn!
DXXXIII initializeAfterFileIn!
DXXXIV initializeAfterFileIn!
DXXXIX initializeAfterFileIn!
DXXXV initializeAfterFileIn!
DXXXVI initializeAfterFileIn!
DXXXVII initializeAfterFileIn!
DXXXVIII initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
L initializeAfterFileIn!
LI initializeAfterFileIn!
LII initializeAfterFileIn!
LIII initializeAfterFileIn!
LIV initializeAfterFileIn!
LIX initializeAfterFileIn!
LV initializeAfterFileIn!
LVI initializeAfterFileIn!
LVII initializeAfterFileIn!
LVIII initializeAfterFileIn!
LX initializeAfterFileIn!
LXI initializeAfterFileIn!
LXII initializeAfterFileIn!
LXIII initializeAfterFileIn!
LXIV initializeAfterFileIn!
LXIX initializeAfterFileIn!
LXV initializeAfterFileIn!
LXVI initializeAfterFileIn!
LXVII initializeAfterFileIn!
LXVIII initializeAfterFileIn!
LXX initializeAfterFileIn!
LXXI initializeAfterFileIn!
LXXII initializeAfterFileIn!
LXXIII initializeAfterFileIn!
LXXIV initializeAfterFileIn!
LXXIX initializeAfterFileIn!
LXXV initializeAfterFileIn!
LXXVI initializeAfterFileIn!
LXXVII initializeAfterFileIn!
LXXVIII initializeAfterFileIn!
LXXX initializeAfterFileIn!
LXXXI initializeAfterFileIn!
LXXXII initializeAfterFileIn!
LXXXIII initializeAfterFileIn!
LXXXIV initializeAfterFileIn!
LXXXIX initializeAfterFileIn!
LXXXV initializeAfterFileIn!
LXXXVI initializeAfterFileIn!
LXXXVII initializeAfterFileIn!
LXXXVIII initializeAfterFileIn!
M initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XC initializeAfterFileIn!
XCI initializeAfterFileIn!
XCII initializeAfterFileIn!
XCIII initializeAfterFileIn!
XCIV initializeAfterFileIn!
XCIX initializeAfterFileIn!
XCV initializeAfterFileIn!
XCVI initializeAfterFileIn!
XCVII initializeAfterFileIn!
XCVIII initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XL initializeAfterFileIn!
XLI initializeAfterFileIn!
XLII initializeAfterFileIn!
XLIII initializeAfterFileIn!
XLIV initializeAfterFileIn!
XLIX initializeAfterFileIn!
XLV initializeAfterFileIn!
XLVI initializeAfterFileIn!
XLVII initializeAfterFileIn!
XLVIII initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!
XXI initializeAfterFileIn!
XXII initializeAfterFileIn!
XXIII initializeAfterFileIn!
XXIV initializeAfterFileIn!
XXIX initializeAfterFileIn!
XXV initializeAfterFileIn!
XXVI initializeAfterFileIn!
XXVII initializeAfterFileIn!
XXVIII initializeAfterFileIn!
XXX initializeAfterFileIn!
XXXI initializeAfterFileIn!
XXXII initializeAfterFileIn!
XXXIII initializeAfterFileIn!
XXXIV initializeAfterFileIn!
XXXIX initializeAfterFileIn!
XXXV initializeAfterFileIn!
XXXVI initializeAfterFileIn!
XXXVII initializeAfterFileIn!
XXXVIII initializeAfterFileIn!