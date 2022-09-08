!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'jl 9/5/2022 21:51:37'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	|customerBook |

	customerBook := CustomerBook new.

	self verifyThan: [customerBook addCustomerNamed: 'John Lennon'.] takesLessThan: (50 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jl 9/5/2022 21:53:28'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	self verifyThan: [customerBook removeCustomerNamed: paulMcCartney.] takesLessThan: (100 * millisecond).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 14:12:17'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self verQueNoSePuedeEjecutar: [customerBook addCustomerNamed: '' ] provocando: Error chequeandoQue: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 14:12:31'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verQueNoSePuedeEjecutar: [customerBook removeCustomerNamed: 'Paul McCartney'] provocando: NotFound chequeandoQue: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 14:19:38'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addAndSuspendCustomerNamed: paulMcCartney.
	
	self verQue: customerBook tieneUnaCantidadDeCustomersActivosDe: 0 yUnaCantidadDeCustomersSuspendidosDe: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 14:36:54'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addAndSuspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self verQue: customerBook tieneUnaCantidadDeCustomersActivosDe: 0 yUnaCantidadDeCustomersSuspendidosDe: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 14:12:57'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self verQueNoSePuedeEjecutar: [customerBook suspendCustomerNamed: 'George Harrison']  provocando: CantSuspend  chequeandoQue: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]. ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 14:20:19'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addAndSuspendCustomerNamed: johnLennon.
	
	self verQueNoSePuedeEjecutar: [ customerBook suspendCustomerNamed: johnLennon] provocando:  CantSuspend chequeandoQue: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/6/2022 19:34:08'!
verQue: aCustomerBook tieneUnaCantidadDeCustomersActivosDe: unNumero yUnaCantidadDeCustomersSuspendidosDe: unNumero2
	
	self assert: unNumero equals: aCustomerBook numberOfActiveCustomers.
	self assert: unNumero2 equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: unNumero + unNumero2 equals: aCustomerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JL 9/8/2022 13:20:59'!
verQueNoSePuedeEjecutar: unaAccion provocando: unaEventualidad chequeandoQue: unaRespuestaAnteUnaEventualidad
	
	[unaAccion value self fail]
		on: unaEventualidad
		do: unaRespuestaAnteUnaEventualidad! !

!CustomerBookTest methodsFor: 'testing' stamp: 'jl 9/5/2022 21:55:19'!
verifyThan: aCustomerBookAction takesLessThan: aMeasureOfTime
	|millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aCustomerBookAction value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aMeasureOfTime 
	
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'JL 9/8/2022 14:16:48'!
addAndSuspendCustomerNamed: aName

self addCustomerNamed: aName.
self suspendCustomerNamed: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'JL 9/8/2022 14:01:24'!
remove: aName from: aCollection 
 
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'JL 9/8/2022 14:02:24'!
removeCustomer: aName
 
	1 to: self size do: 
	[ :index |
		aName = (self at: index)
			ifTrue: [
				self removeAt: index.
				^ aName 
			] 
	].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'JL 9/8/2022 14:47:16'!
removeCustomerNamed: aName
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].

	^NotFound signal

! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
