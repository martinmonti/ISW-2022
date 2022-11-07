!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 12:59:13'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: merchantProcessor 
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 12:59:23'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: merchantProcessor 
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 13:08:22'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  debitBehaviour |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.

	debitBehaviour := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ]. 

	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: (MerchantProcessorSimulator for: debitBehaviour)
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 13:05:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard errorDebitBehaviour |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	errorDebitBehaviour := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: (MerchantProcessorSimulator for: errorDebitBehaviour)
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'MMM 11/7/2022 13:02:28'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	merchantProcessor := MerchantProcessorSimulator for: [ :anAmount :aCreditCard | ].! !


!classDefinition: #UserInterfaceTest category: 'TusLibros'!
TestCase subclass: #UserInterfaceTest
	instanceVariableNames: 'testObjectsFactory authenticationBehavior debitBehavior selledBook selledBookPrice anotherSelledBook notSelledBook catalog creditCard anotherSelledBookPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserInterfaceTest methodsFor: 'create cart' stamp: 'JL 11/3/2022 19:53:56'!
createCartFor: userId authenticatedWith: password 
	authenticationBehavior value: userId value: password.! !


!UserInterfaceTest methodsFor: 'setup' stamp: 'MMM 11/7/2022 05:45:42'!
setUp
	testObjectsFactory := StoreTestObjectsFactory new.
	
	selledBook:=testObjectsFactory itemSellByTheStore.
	selledBookPrice:=testObjectsFactory itemSellByTheStorePrice .
	anotherSelledBook:=testObjectsFactory anotherItemSellByTheStore.
	anotherSelledBookPrice:=testObjectsFactory anotherItemSellByTheStorePrice .
	notSelledBook:=testObjectsFactory itemNotSellByTheStore .
	catalog:=testObjectsFactory defaultCatalog.
	creditCard := testObjectsFactory notExpiredCreditCard.
	
	authenticationBehavior := [ :anUser :aPassword | ].
! !


!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:49:35'!
test01_CreateCart_CanNotWhitInvalidUser

| interfaz password userId authenticator |

userId := 'Pepe'.
password := '1234'.

authenticator := AuthenticateSimulator for: false.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.

self should: [ interfaz createCartFor: userId authenticatedWith: password.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface invalidUserErrorMessage]! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:46:36'!
test02_ListCart_WithNewCartReturnsEmptyList

| interfaz password userId cartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.

cartId := interfaz createCartFor: userId authenticatedWith: password.

self assert: (interfaz listCart: cartId) equals: OrderedCollection new.! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:48:55'!
test03_ListCart_RemembersAddedItems

| interfaz password userId aCartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.
interfaz addToCart: aCartId item: selledBook withQuantityOf: 1.

self assert: (interfaz listCart: aCartId) equals: (OrderedCollection with: selledBook).! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:47:12'!
test04_AddItem_CanNoAddToAnInvalidCart

| interfaz password userId aCartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.

self should: [ interfaz addToCart: 3 item: selledBook withQuantityOf: 1.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface cartIdNotExistsErrorMessage]
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:43:49'!
test05_ListCart_CanNotListInvalidCart

| interfaz password userId aCartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.

self should: [ interfaz listCart: 3.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface cartIdNotExistsErrorMessage]
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:43:26'!
test06_CheckOut_CanNotToAnInvalidCart

| interfaz authenticator |

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog .

self should: [ interfaz checkOutCart: 3 charging: creditCard .]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface cartIdNotExistsErrorMessage]
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 05:55:12'!
test07_ListPurchases_MakeListForOneSale

| interfaz password userId cartId authenticator purchasesList |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.

cartId := interfaz createCartFor: userId authenticatedWith: password.
interfaz addToCart: cartId item: selledBook withQuantityOf: 1.
interfaz checkOutCart: cartId charging: creditCard .

purchasesList:=interfaz listPurchases: userId.

self assert: (purchasesList purchasesItems) size equals:1.
self assert: (purchasesList includeSellFor: selledBook) equals:true.
self assert: (purchasesList quantityFor:selledBook) equals:1.
self assert: (purchasesList includeSellFor:notSelledBook) equals:false.
self assert: (purchasesList quantityFor:notSelledBook) equals:0.
self assert: (purchasesList totalAmmount) equals: selledBookPrice.
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 06:04:02'!
test08_ListPurchases_MakeListForManySales

| interfaz password userId firstCartId authenticator secondCartId purchasesList |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.

firstCartId := interfaz createCartFor: userId authenticatedWith: password.
interfaz addToCart: firstCartId item: selledBook withQuantityOf: 10.
interfaz addToCart: firstCartId item: anotherSelledBook withQuantityOf: 20.
interfaz checkOutCart: firstCartId charging: creditCard .

secondCartId := interfaz createCartFor: userId authenticatedWith: password.
interfaz addToCart: secondCartId item: selledBook withQuantityOf: 5.
interfaz checkOutCart: secondCartId charging: creditCard .

purchasesList:=interfaz listPurchases: userId.

self assert: (purchasesList purchasesItems) size equals:2.
self assert: (purchasesList includeSellFor: selledBook) equals:true.
self assert: (purchasesList quantityFor:selledBook) equals:15.
self assert: (purchasesList includeSellFor: anotherSelledBook ) equals:true.
self assert: (purchasesList quantityFor:anotherSelledBook) equals:20.
self assert: (purchasesList includeSellFor:notSelledBook) equals:false.
self assert: (purchasesList quantityFor:notSelledBook) equals:0.
self assert: (purchasesList totalAmmount) equals: (selledBookPrice*15+(anotherSelledBookPrice*20)).
! !


!classDefinition: #AuthenticateSimulator category: 'TusLibros'!
Object subclass: #AuthenticateSimulator
	instanceVariableNames: 'canAuthenticate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!AuthenticateSimulator methodsFor: 'initialization' stamp: 'JL 11/3/2022 20:39:10'!
initializeFor: aBoolean 
	canAuthenticate := aBoolean.! !


!AuthenticateSimulator methodsFor: 'accessing' stamp: 'JL 11/3/2022 20:41:16'!
canAuthenticate
	^canAuthenticate! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AuthenticateSimulator class' category: 'TusLibros'!
AuthenticateSimulator class
	instanceVariableNames: ''!

!AuthenticateSimulator class methodsFor: 'instance creation' stamp: 'JL 11/3/2022 20:38:50'!
for: aBoolean
	^self new initializeFor: aBoolean ! !


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


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'list' stamp: 'JL 11/3/2022 21:06:58'!
list
	^items copy! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'MMM 11/7/2022 04:46:22'!
createSale

	^ Sale of: total forItems: (cart list).
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !


!classDefinition: #MerchantProcessorSimulator category: 'TusLibros'!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'debitBehaviour'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'debit' stamp: 'MMM 11/7/2022 13:04:49'!
debit: anAmount from: aCreditCard 
	^debitBehaviour value: anAmount value: aCreditCard .! !


!MerchantProcessorSimulator methodsFor: 'initialize' stamp: 'MMM 11/7/2022 13:04:49'!
initializeFor: aDebitBehaviour 
	debitBehaviour := aDebitBehaviour .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorSimulator class' category: 'TusLibros'!
MerchantProcessorSimulator class
	instanceVariableNames: ''!

!MerchantProcessorSimulator class methodsFor: 'instance creation' stamp: 'MMM 11/7/2022 13:03:08'!
for: debitBehaviour 
	^self new initializeFor: debitBehaviour ! !


!classDefinition: #PurchasesSummary category: 'TusLibros'!
Object subclass: #PurchasesSummary
	instanceVariableNames: 'items totalAmmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PurchasesSummary methodsFor: 'initialization' stamp: 'MMM 11/7/2022 06:23:35'!
initialize
	items:=Bag new.
	totalAmmount:=0.! !


!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 04:59:51'!
includeSellFor: aBook 
	^items includes: aBook.! !

!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 06:00:09'!
purchasesItems
	| collapsedItems |
	collapsedItems := Dictionary new.
	items do: [:item| collapsedItems at: item put: (items occurrencesOf: item)].
	^collapsedItems.! !

!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 05:01:12'!
quantityFor: aBook 
^items occurrencesOf: aBook.! !

!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 06:25:16'!
totalAmmount
	^totalAmmount .! !


!PurchasesSummary methodsFor: 'building' stamp: 'MMM 11/7/2022 06:24:47'!
addItems: someItems withPartialAmmount: aPartialAmmount 
	items addAll: someItems.
	totalAmmount:=totalAmmount +aPartialAmmount .! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'total items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'MMM 11/7/2022 04:51:42'!
initializeTotal: aTotal forItems: someItems
	items:=someItems.
	total := aTotal.! !


!Sale methodsFor: 'items' stamp: 'MMM 11/7/2022 04:56:56'!
items
	^items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'MMM 11/7/2022 04:49:30'!
of: aTotal forItems: items 
	^self new initializeTotal: aTotal forItems: items.! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'MMM 11/7/2022 05:24:02'!
anotherItemSellByTheStore
	^ 'anotherValidBook'.! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'MMM 11/7/2022 05:24:25'!
anotherItemSellByTheStorePrice
	
	^15! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'MMM 11/7/2022 05:26:19'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!classDefinition: #UserInterface category: 'TusLibros'!
Object subclass: #UserInterface
	instanceVariableNames: 'authenticator cartsForCartId catalog maxCartIdUsed purchasesForClientId clientIdForCartId maxTransactionIdUsed merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserInterface methodsFor: 'initialization' stamp: 'MMM 11/7/2022 13:10:17'!
initializeWithAuthenticator: anAuthenticateSimulator catalog: aCatalog 
	authenticator := anAuthenticateSimulator.
	catalog := aCatalog.
	cartsForCartId := Dictionary new.
	purchasesForClientId := Dictionary new.
	clientIdForCartId := Dictionary new.
	maxCartIdUsed := 0.	
	maxTransactionIdUsed := 0.	
	merchantProcessor:= MerchantProcessorSimulator for:[ :anAmount :aCreditCard | ].! !


!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 00:23:58'!
addToCart: aCartId item: anItem withQuantityOf: aQuantity 
	| cart |
	cart := cartsForCartId at: aCartId ifAbsent: [^self error: self class cartIdNotExistsErrorMessage].
	cart add: aQuantity of: anItem.! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 13:12:59'!
checkOutCart: aCartId charging: aCreditCard 
	| cart cashier clientId |
	cart := cartsForCartId at: aCartId ifAbsent: [self error: self class cartIdNotExistsErrorMessage].
	clientId := clientIdForCartId at: aCartId ifAbsent: ["ERROR"].
	(purchasesForClientId includesKey: clientId) ifFalse: [purchasesForClientId at: clientId put: OrderedCollection new.].
	cashier := Cashier 
		toCheckout: cart
		charging: aCreditCard
		throught: merchantProcessor 
		on: DateAndTime now
		registeringOn: (purchasesForClientId at: clientId).
	cashier checkOut.
	^self newTransactionId! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 06:15:36'!
createCartFor: userId authenticatedWith: password 
	"user == client"
	| actualCartId |
	(authenticator canAuthenticate) ifFalse: [self error: self class invalidUserErrorMessage].
	actualCartId := self unusedCartId.
	cartsForCartId at: actualCartId put: (Cart acceptingItemsOf: catalog).
	clientIdForCartId at: actualCartId put: userId.
	^maxCartIdUsed.! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 00:23:58'!
listCart: aCartId
 	| cart |
	cart := cartsForCartId at: aCartId ifAbsent: [^self error: self class cartIdNotExistsErrorMessage].
	^cart list! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 06:22:54'!
listPurchases: userId 
	| purchasesSummary |
	purchasesSummary := PurchasesSummary new.
	(purchasesForClientId at: userId) do: [:aSale|purchasesSummary addItems: (aSale items) withPartialAmmount: (aSale total)].
	^purchasesSummary.! !


!UserInterface methodsFor: 'interface functions - private' stamp: 'MMM 11/7/2022 02:02:04'!
newTransactionId
	maxTransactionIdUsed := maxTransactionIdUsed + 1.
	^maxTransactionIdUsed .! !

!UserInterface methodsFor: 'interface functions - private' stamp: 'MMM 11/7/2022 00:19:29'!
unusedCartId

	maxCartIdUsed := maxCartIdUsed + 1.
	^maxCartIdUsed ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UserInterface class' category: 'TusLibros'!
UserInterface class
	instanceVariableNames: ''!

!UserInterface class methodsFor: 'instance creation' stamp: 'JL 11/3/2022 19:51:07'!
throught: aRestInterface
	^self new initializeThrought: aRestInterface ! !

!UserInterface class methodsFor: 'instance creation' stamp: 'JL 11/3/2022 20:39:24'!
withAuthenticator: anAuthenticateSimulator 
	^self new initializeWithAuthenticator: anAuthenticateSimulator ! !

!UserInterface class methodsFor: 'instance creation' stamp: 'JL 11/3/2022 20:52:42'!
withAuthenticator: anAuthenticateSimulator catalog: aCatalog 
	^self new initializeWithAuthenticator: anAuthenticateSimulator catalog: aCatalog ! !


!UserInterface class methodsFor: 'error message' stamp: 'JL 11/3/2022 21:14:43'!
cartIdNotExistsErrorMessage
	^'Cart Id Not Found'.! !

!UserInterface class methodsFor: 'error message' stamp: 'JL 11/3/2022 19:54:21'!
invalidUserErrorMessage
	^'User is invalid'! !
