!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'JL 10/31/2022 19:05:17'!
test09CartListIncludesAllAddedItems

	| cart list |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	list := cart list.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = (list occurrencesOf: self itemSellByTheStore)! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'JL 10/31/2022 20:31:22'!
defaultCatalog
	
	| catalog |
	catalog := Dictionary new.
	catalog at: self itemSellByTheStore put: 50.
	^catalog! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:14:22'!
newCashier: merchantProcessor

	^ Cashier newWithMerchantProcessor: merchantProcessor! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:15:05'!
test01CanNotCheckoutEmptyCart

	| cart catalog cashier creditCard |
	
	catalog := self newCatalogWithOneItem.
	cart := self newEmptyCartWithCatalog: catalog.
	cashier := 	self newCashier: MerchantProcessorDouble new.
	creditCard := self newValidCreditCard.
	
	self
		should: [cashier checkout: cart withCreditCard: creditCard]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText = cashier emptyCartErrorMessage.
			self assert: cashier salesBookIsEmpty]! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:15:19'!
test02CheckoutOfCartWithOneItemReturnsItemsValue

	| cart catalog cashier creditCard |
	
	catalog := self newCatalogWithOneItem.
	cart := self newEmptyCartWithCatalog: catalog.
	cart add: 'validBook'.
	creditCard := self newValidCreditCard.
	cashier := 	self newCashier: MerchantProcessorDouble new.
	
	self assert: (cashier checkout: cart withCreditCard: creditCard) equals: 50.
	self deny: cashier salesBookIsEmpty! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:15:24'!
test03CheckoutOfCartWithItemsReturnsItemsValue

	| cart catalog cashier creditCard |
	
	catalog := self newCatalogWithTwoItems .
	cart := self newEmptyCartWithCatalog: catalog.
	cart add: 'validBook'.
	cart add: 'anotherValidBook'.
	creditCard := self newValidCreditCard.
	cashier := 	self newCashier: MerchantProcessorDouble new.
	
	self assert: (cashier checkout: cart withCreditCard: creditCard) equals: 80.
	self deny: cashier salesBookIsEmpty! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:15:28'!
test04CanNotCheckOutWithExpiredCreditCard

	| cart catalog cashier creditCard |
	
	catalog := Dictionary new.
	catalog at: 'validBook' put: 50.
	cart := self newEmptyCartWithCatalog: catalog.
	creditCard := self newExpiredCreditCard.
	cashier := 	self newCashier: MerchantProcessorDouble new.
	cart add: 'validBook'.
		
	self 
		should: [ cashier checkout: cart withCreditCard: creditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cashier expiredCreditCardErrorMessage.
			self assert: cashier salesBookIsEmpty ]	! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:25:16'!
test05CanNotCheckOutWithStolenCreditCard

	| cart catalog cashier creditCard merchantProcessor |
	
	merchantProcessor:=MerchantProcessorDouble new.
	catalog := Dictionary new.
	catalog at: 'validBook' put: 50.
	cart := self newEmptyCartWithCatalog: catalog.
	creditCard := merchantProcessor getAStolenCreditCard.
	cashier := 	self newCashier: merchantProcessor.
	cart add: 'validBook'.
		
	self 
		should: [ cashier checkout: cart withCreditCard: creditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cashier stoledCreditCardErrorMessage.
			self assert: cashier salesBookIsEmpty ]	! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/3/2022 16:51:01'!
test06CanNotCheckOutWithCreditCardWithoutCredit
	| cart catalog cashier creditCard merchantProcessor |
	
	merchantProcessor:=MerchantProcessorDouble new.
	catalog := Dictionary new.
	catalog at: 'validBook' put: 50.
	cart := self newEmptyCartWithCatalog: catalog.
	creditCard := merchantProcessor getACreditCardWhitNoCredit .
	cashier := 	self newCashier: merchantProcessor.
	cart add: 'validBook'.
		
	self 
		should: [ cashier checkout: cart withCreditCard: creditCard ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cashier notEnoughCreditErrorMessage.
			self assert: cashier salesBookIsEmpty ]	! !


!CashierTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:52:48'!
newCatalogWithOneItem
	| catalog |
	catalog := Dictionary new.
	catalog at: 'validBook' put: 50.
	^catalog! !

!CashierTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:57:12'!
newCatalogWithTwoItems
	| catalog |
	catalog := Dictionary new.
	catalog at: 'validBook' put: 50.
	catalog at: 'anotherValidBook' put: 30.
	^catalog! !

!CashierTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:48:44'!
newEmptyCartWithCatalog: catalog

	^ Cart acceptingItemsOf: catalog! !

!CashierTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:56:20'!
newExpiredCreditCard
	| expiracyDate |
	expiracyDate := Month month: 09 year: 2022.
	^ CreditCard withNumber: 1234567890123456 expiracyDate: expiracyDate of: 'Pepepepepepepepepepepepepepepe'! !

!CashierTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:56:02'!
newValidCreditCard
	| expiracyDate |
	expiracyDate := Month month: 09 year: 2023.
	^ CreditCard withNumber: 1234567890123456 expiracyDate: expiracyDate of: 'Pepepepepepepepepepepepepepepe'! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'JL 10/31/2022 21:55:04'!
test01CanNotCreateCreditCardWithNegativeNumber
	| expiracyDate ownerName |
	expiracyDate := self validExpiracyDate.
	ownerName := self validOwnerName.
	self 
		should: [CreditCard withNumber: -12 expiracyDate: expiracyDate of: ownerName]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard negativeCreditCardNumberErrorMessage]! !

!CreditCardTest methodsFor: 'tests' stamp: 'JL 10/31/2022 21:54:58'!
test02CanNotCreateCreditCardWithNonIntegerNumber
	| expiracyDate ownerName |
	expiracyDate := self validExpiracyDate.
	ownerName := self validOwnerName.
	self 
		should: [CreditCard withNumber: 1.5 expiracyDate: expiracyDate of: ownerName]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard nonIntegerCreditCardNumberErrorMessage]! !

!CreditCardTest methodsFor: 'tests' stamp: 'JL 10/31/2022 21:55:10'!
test03CanNotCreateCreditCardWithNumberWithout16Digits
	| expiracyDate ownerName |
	expiracyDate := self validExpiracyDate.
	ownerName := self validOwnerName.
	self 
		should: [CreditCard withNumber: 1124 expiracyDate: expiracyDate of: ownerName]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard numberWithout16DigitsErrorMessage]! !

!CreditCardTest methodsFor: 'tests' stamp: 'JL 10/31/2022 21:54:10'!
test04CanNotCreateCreditCardWithOwnerNameLongerThan30Characters
	| expiracyDate ownerName validNumber |
	expiracyDate := self validExpiracyDate.
	ownerName := self invalidOwnerName.
	validNumber := self validCreditCardNumber.
	
	self 
		should: [CreditCard withNumber: validNumber expiracyDate: expiracyDate of: ownerName]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard ownerNameLongerThan30CharacterErrorMessage]! !

!CreditCardTest methodsFor: 'tests' stamp: 'JL 10/31/2022 21:43:13'!
test05CanNotCreateCreditCardWithOwnerNameIncludingNonLetters
	| expiracyDate ownerName validNumber |
	expiracyDate := self validExpiracyDate.
	ownerName := 'Pepe1'.
	validNumber := self validCreditCardNumber.
	
	self 
		should: [CreditCard withNumber: validNumber expiracyDate: expiracyDate of: ownerName]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = CreditCard ownerNameHasNonLetterCharErrorMessage]! !


!CreditCardTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:54:09'!
invalidOwnerName

	^ 'Pepepepepepepepepepepepepepepep'! !

!CreditCardTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:43:13'!
validCreditCardNumber

	^ 1234567890123456! !

!CreditCardTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:42:42'!
validExpiracyDate

	^ Month month: 09 year: 2025! !

!CreditCardTest methodsFor: 'support' stamp: 'JL 10/31/2022 21:54:50'!
validOwnerName

	^ 'Pepepepepepepepepepepepepepepe'! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'JL 10/31/2022 20:26:32'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'JL 10/31/2022 18:08:50'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !

!Cart methodsFor: 'testing' stamp: 'JL 10/31/2022 20:36:29'!
totalAmmount
	^items inject: 0 into: [:totalAmmount :anItem | 	totalAmmount + catalog at: anItem ]
! !


!Cart methodsFor: 'adding' stamp: 'JL 10/31/2022 20:29:42'!
add: anItem
	self assertIsValidItem: anItem.
	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'JL 10/31/2022 18:09:36'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.
	
	items add: anItem withOccurrences: aQuantity.! !


!Cart methodsFor: 'accessing' stamp: 'JL 10/31/2022 19:05:38'!
list
	^items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'salesBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout' stamp: 'MMM 11/3/2022 16:19:59'!
checkout: cart withCreditCard: creditCard 
	| totalAmmount |
	self assertCartIsNotEmpty: cart.
	self assertCreditCardHasNotExpired: creditCard. 
	totalAmmount := cart totalAmmount.
	
	merchantProcessor debit: totalAmmount from: creditCard.
	
	salesBook add: totalAmmount.
	^totalAmmount! !


!Cashier methodsFor: 'error messages' stamp: 'JL 10/31/2022 18:38:52'!
emptyCartErrorMessage
	^'Cart is empty!!!!'! !

!Cashier methodsFor: 'error messages' stamp: 'JL 10/31/2022 19:29:29'!
expiredCreditCardErrorMessage
	^'Credit card has expired!!!!'! !

!Cashier methodsFor: 'error messages' stamp: 'MMM 11/3/2022 16:56:27'!
notEnoughCreditErrorMessage
	^merchantProcessor class noCreditError .! !


!Cashier methodsFor: 'initialization' stamp: 'MMM 11/3/2022 16:17:03'!
initializeNewWithMerchantProcessor: aMerchantProcessorDouble 
	merchantProcessor := aMerchantProcessorDouble.
	salesBook := OrderedCollection new.! !


!Cashier methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:10:09'!
assertCartIsNotEmpty: cart

	^ cart isEmpty ifTrue: [self error: self emptyCartErrorMessage]! !

!Cashier methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:10:37'!
assertCreditCardHasNotExpired: aCreditCard
	(aCreditCard isExpiredOn: Month current start) ifTrue: [self error: self expiredCreditCardErrorMessage]! !


!Cashier methodsFor: 'testing' stamp: 'JL 10/31/2022 21:03:20'!
salesBookIsEmpty
	^salesBook isEmpty.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'MMM 11/3/2022 16:26:18'!
stoledCreditCardErrorMessage
^merchantProcessor class stolenCreditCardError .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'MMM 11/3/2022 16:04:19'!
newWithMerchantProcessor: aMerchantProcessorDouble 
	^self new initializeNewWithMerchantProcessor: aMerchantProcessorDouble ! !

!Cashier class methodsFor: 'instance creation' stamp: 'JL 10/31/2022 19:15:37'!
with: aPriceList
	^self new initializeWith: aPriceList ! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber creditCardExpiracyDate creditCardOwner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'JL 10/31/2022 21:37:21'!
initializeWithNumber: aCreditCardNumber expiracyDate: aCreditCardExpiracyDate of: aCreditCardOwner 

	creditCardNumber := aCreditCardNumber.
	creditCardExpiracyDate := aCreditCardExpiracyDate.
	creditCardOwner := aCreditCardOwner.! !


!CreditCard methodsFor: 'accessing' stamp: 'JL 10/31/2022 19:38:31'!
expiracyDate
	^creditCardExpiracyDate ! !

!CreditCard methodsFor: 'accessing' stamp: 'MMM 11/3/2022 16:23:21'!
number
^creditCardNumber ! !


!CreditCard methodsFor: 'testing' stamp: 'JL 10/31/2022 21:09:16'!
isExpiredOn: aMonthDate
	^creditCardExpiracyDate start < aMonthDate ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'error messages' stamp: 'JL 10/31/2022 19:54:50'!
negativeCreditCardNumberErrorMessage
	^'Credit card number is negative!!!!!!'! !

!CreditCard class methodsFor: 'error messages' stamp: 'JL 10/31/2022 19:58:12'!
nonIntegerCreditCardNumberErrorMessage
	^'Credit card number is not an integer!!!!!!'! !

!CreditCard class methodsFor: 'error messages' stamp: 'JL 10/31/2022 21:28:06'!
numberWithout16DigitsErrorMessage
	^'Credit card number has not 16 digits!!!!!!'! !

!CreditCard class methodsFor: 'error messages' stamp: 'JL 10/31/2022 21:20:34'!
ownerNameHasNonLetterCharErrorMessage
	^'Owner name has non letter char!!!!!!'! !

!CreditCard class methodsFor: 'error messages' stamp: 'JL 10/31/2022 21:14:55'!
ownerNameLongerThan30CharacterErrorMessage
	^'Owner name is longer than 30 characters!!!!!!'! !


!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:41:28'!
assertCreditCardNumberHas16Digits: aCreditCardNumber

	^ (aCreditCardNumber asString size = 16) ifFalse: [self error: self numberWithout16DigitsErrorMessage ]! !

!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:41:10'!
assertCreditCardNumberIsInteger: aCreditCardNumber

	^ (aCreditCardNumber isInteger) ifFalse: [self error: self nonIntegerCreditCardNumberErrorMessage]! !

!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:40:59'!
assertCreditCardNumberIsPositive: aCreditCardNumber

	^ (aCreditCardNumber < 0) ifTrue: [self error: self negativeCreditCardNumberErrorMessage]! !

!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:41:28'!
assertCreditCardNumberIsValid: aCreditCardNumber

	self assertCreditCardNumberIsPositive: aCreditCardNumber.
	self assertCreditCardNumberIsInteger: aCreditCardNumber.
	self assertCreditCardNumberHas16Digits: aCreditCardNumber! !

!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:39:18'!
assertCreditCardOwnerNameHasLessThan30Characters: aCreditCardOwnerName

	^ aCreditCardOwnerName size > 30 ifTrue: [self error: self ownerNameLongerThan30CharacterErrorMessage]! !

!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:40:13'!
assertCreditCardOwnerNameIsValid: aCreditCardOwnerName

	self assertCreditCardOwnerNameHasLessThan30Characters: aCreditCardOwnerName.
	self assertCreditCardOwnerNameNotIncludesNonLetterCharacters: aCreditCardOwnerName! !

!CreditCard class methodsFor: 'assertions' stamp: 'JL 10/31/2022 21:40:13'!
assertCreditCardOwnerNameNotIncludesNonLetterCharacters: aCreditCardOwnerName

	^ (aCreditCardOwnerName allSatisfy: [:char | char isLetter or: char isSeparator ]) ifFalse: [self error: self ownerNameHasNonLetterCharErrorMessage]! !


!CreditCard class methodsFor: 'instance creation' stamp: 'JL 10/31/2022 21:38:30'!
withNumber: aCreditCardNumber expiracyDate: aCreditCardExpiracyDate of: aCreditCardOwnerName 
	
	self assertCreditCardNumberIsValid: aCreditCardNumber.
	self assertCreditCardOwnerNameIsValid: aCreditCardOwnerName.

	^self new initializeWithNumber: aCreditCardNumber expiracyDate: aCreditCardExpiracyDate of: aCreditCardOwnerName ! !


!classDefinition: #MerchantProcessorDouble category: 'TusLibros'!
Object subclass: #MerchantProcessorDouble
	instanceVariableNames: 'stolenCreditCardNumbers validCreditCardWithoutCreditNumbers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorDouble methodsFor: 'testingSupporting' stamp: 'MMM 11/3/2022 16:55:20'!
getACreditCardWhitNoCredit
	^ CreditCard withNumber: (validCreditCardWithoutCreditNumbers asOrderedCollection first) expiracyDate: (Month month: 09 year: 2030) of: 'Pepepepepepepepepepepepepepepe'! !

!MerchantProcessorDouble methodsFor: 'testingSupporting' stamp: 'MMM 11/3/2022 15:40:15'!
getAStolenCreditCard
	^ CreditCard withNumber: (stolenCreditCardNumbers asOrderedCollection first) expiracyDate: (Month month: 09 year: 2030) of: 'Pepepepepepepepepepepepepepepe'! !


!MerchantProcessorDouble methodsFor: 'fakeData - private' stamp: 'MMM 11/3/2022 15:44:19'!
fakeStolenCreditCardNumbers
	^ Set with: 1122334455667788! !

!MerchantProcessorDouble methodsFor: 'fakeData - private' stamp: 'MMM 11/3/2022 16:52:48'!
fakeValidCreditCardWithoutCreditNumbers
	^ Set with: 1000000000000000! !


!MerchantProcessorDouble methodsFor: 'initializing' stamp: 'MMM 11/3/2022 16:52:34'!
initialize
	stolenCreditCardNumbers := self fakeStolenCreditCardNumbers.
	validCreditCardWithoutCreditNumbers  := self fakeValidCreditCardWithoutCreditNumbers.
	! !


!MerchantProcessorDouble methodsFor: 'merchant processing' stamp: 'MMM 11/3/2022 16:53:42'!
debit: totalAmmount from: creditCard 
	(stolenCreditCardNumbers includes: (creditCard number)) ifTrue: [self error: self class stolenCreditCardError].
	(validCreditCardWithoutCreditNumbers includes: (creditCard number) ) ifTrue: [self error: self class noCreditError].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorDouble class' category: 'TusLibros'!
MerchantProcessorDouble class
	instanceVariableNames: ''!

!MerchantProcessorDouble class methodsFor: 'errors' stamp: 'MMM 11/3/2022 16:53:56'!
noCreditError
	^'¡¡NO CREDIT IN CARD!!!!'.! !

!MerchantProcessorDouble class methodsFor: 'errors' stamp: 'MMM 11/3/2022 16:24:13'!
stolenCreditCardError
	^'¡¡STOLEN CREDIT CARD!!!!'.! !
