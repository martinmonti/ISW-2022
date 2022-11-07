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
	instanceVariableNames: 'testObjectsFactory debitBehavior'
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

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
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

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #UserInterfaceTest category: 'TusLibros'!
TestCase subclass: #UserInterfaceTest
	instanceVariableNames: 'testObjectsFactory authenticationBehavior debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserInterfaceTest methodsFor: 'create cart' stamp: 'JL 11/3/2022 19:53:56'!
createCartFor: userId authenticatedWith: password 
	authenticationBehavior value: userId value: password.! !


!UserInterfaceTest methodsFor: 'setup' stamp: 'MMM 11/7/2022 01:24:04'!
setUp
	testObjectsFactory := StoreTestObjectsFactory new.
	authenticationBehavior := [ :anUser :aPassword | ].
! !


!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/6/2022 23:12:18'!
test01CanNotCreateCartWhitInvalidUser

| interfaz password userId authenticator |

userId := 'Pepe'.
password := '1234'.

authenticator := AuthenticateSimulator for: false.
interfaz := UserInterface withAuthenticator: authenticator catalog: testObjectsFactory defaultCatalog.
.

self should: [ interfaz createCartFor: userId authenticatedWith: password.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface invalidUserErrorMessage]! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/6/2022 23:12:17'!
test02ListNewCartReturnsEmptyList

| interfaz password userId cartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: testObjectsFactory defaultCatalog.

cartId := interfaz createCartFor: userId authenticatedWith: password.

self assert: (interfaz listCart: cartId) equals: OrderedCollection new.! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/6/2022 23:12:18'!
test03ListCartRemembersAddedItems

| interfaz password userId aCartId item quantity authenticator |

userId := 'Pepe'.
password := '12345'.
item := testObjectsFactory itemSellByTheStore.
quantity := 1.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: testObjectsFactory defaultCatalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.
interfaz addToCart: aCartId item: item withQuantityOf: quantity.

self assert: (interfaz listCart: aCartId) equals: (OrderedCollection with: item).! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/6/2022 23:12:18'!
test04CanNotAddItemToAnInvalidCart

| interfaz password userId aCartId item quantity authenticator |

userId := 'Pepe'.
password := '12345'.
item := testObjectsFactory itemSellByTheStore.
quantity := 1.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: testObjectsFactory defaultCatalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.

self should: [ interfaz addToCart: 3 item: item withQuantityOf: quantity.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface cartIdNotExistsErrorMessage]
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/6/2022 23:12:18'!
test05CanNotListInvalidCart

| interfaz password userId aCartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: testObjectsFactory defaultCatalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.

self should: [ interfaz listCart: 3.]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface cartIdNotExistsErrorMessage]
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/6/2022 23:12:18'!
test06CanNotCheckOutInvalidCart

| interfaz password userId aCartId authenticator |

userId := 'Pepe'.
password := '12345'.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: testObjectsFactory defaultCatalog.
aCartId := interfaz createCartFor: userId authenticatedWith: password.

self should: [ interfaz checkOutCart: 3 charging: testObjectsFactory notExpiredCreditCard .]
	raise: Error - MessageNotUnderstood 
	withExceptionDo: [:anError |
			self assert: anError messageText = UserInterface cartIdNotExistsErrorMessage]
! !

!UserInterfaceTest methodsFor: 'tests' stamp: 'MMM 11/7/2022 04:35:02'!
test07ListPurchasesRemebersCartCheckoutsForSimpleTransaction

| interfaz password userId cartId authenticator selledBook catalog purchasesList notSelledBook |

userId := 'Pepe'.
password := '12345'.

selledBook:=testObjectsFactory itemSellByTheStore.
notSelledBook:=testObjectsFactory itemNotSellByTheStore .
catalog:=testObjectsFactory defaultCatalog.

authenticator := AuthenticateSimulator for: true.
interfaz := UserInterface withAuthenticator: authenticator catalog: catalog.
cartId := interfaz createCartFor: userId authenticatedWith: password.
interfaz addToCart: cartId item: selledBook withQuantityOf: 1.
interfaz checkOutCart: cartId charging: testObjectsFactory notExpiredCreditCard .

purchasesList:=interfaz listPurchases: userId.
self assert: (purchasesList totalAmmount) equals: (testObjectsFactory itemSellByTheStorePrice).
self assert: (purchasesList purchasesItems) size equals:1.
self assert: (purchasesList includeSellFor: selledBook) equals:true.
self assert: (purchasesList quantityFor:selledBook) equals:1.
self assert: (purchasesList includeSellFor:notSelledBook) equals:false.
self assert: (purchasesList quantityFor:notSelledBook) equals:0.
	! !


!classDefinition: #AuthenticateSimulator category: 'TusLibros'!
Object subclass: #AuthenticateSimulator
	instanceVariableNames: 'canAuthenticate boolean'
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


!classDefinition: #PurchaseItem category: 'TusLibros'!
Object subclass: #PurchaseItem
	instanceVariableNames: 'quantity book'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PurchaseItem methodsFor: 'initialization' stamp: 'MMM 11/7/2022 04:16:13'!
initializeFor: aQuantity of: aBook 
	quantity := aQuantity.
	book := aBook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PurchaseItem class' category: 'TusLibros'!
PurchaseItem class
	instanceVariableNames: ''!

!PurchaseItem class methodsFor: 'instance creation' stamp: 'MMM 11/7/2022 04:15:28'!
for: aQuantity of: aBook 
	^self new initializeFor: aQuantity of: aBook ! !


!classDefinition: #PurchasesSummary category: 'TusLibros'!
Object subclass: #PurchasesSummary
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!PurchasesSummary methodsFor: 'initialization' stamp: 'MMM 11/7/2022 04:59:13'!
initialize
	items:=Bag new.! !


!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 04:59:51'!
includeSellFor: aBook 
	^items includes: aBook.! !

!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 04:17:09'!
purchasesItems
	^OrderedCollection with: (PurchaseItem for: 1 of:(StoreTestObjectsFactory new itemSellByTheStore ) ).! !

!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 05:01:12'!
quantityFor: aBook 
^items occurrencesOf: aBook.! !

!PurchasesSummary methodsFor: 'testing' stamp: 'MMM 11/7/2022 04:13:33'!
totalAmmount
	^StoreTestObjectsFactory new itemSellByTheStorePrice .! !


!PurchasesSummary methodsFor: 'building' stamp: 'MMM 11/7/2022 04:59:40'!
addItems: someItems
	items addAll: someItems.! !


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

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
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
	instanceVariableNames: 'authenticator cartsForCartId catalog maxCartIdUsed purchasesForClientId clientIdForCartId debitBehavior maxTransactionIdUsed'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UserInterface methodsFor: 'initialization' stamp: 'MMM 11/7/2022 02:02:23'!
initializeWithAuthenticator: anAuthenticateSimulator catalog: aCatalog 
	authenticator := anAuthenticateSimulator.
	catalog := aCatalog.
	cartsForCartId := Dictionary new.
	purchasesForClientId := Dictionary new.
	clientIdForCartId := Dictionary new.
	maxCartIdUsed := 0.	
	maxTransactionIdUsed := 0.	
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 00:23:58'!
addToCart: aCartId item: anItem withQuantityOf: aQuantity 
	| cart |
	cart := cartsForCartId at: aCartId ifAbsent: [^self error: self class cartIdNotExistsErrorMessage].
	cart add: aQuantity of: anItem.! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 01:16:00'!
checkOutCart: aCartId charging: aCreditCard 
	| cart cashier clientId clientPurchases |
	cart := cartsForCartId at: aCartId ifAbsent: [self error: self class cartIdNotExistsErrorMessage].
	clientId := clientIdForCartId at: aCartId ifAbsent: ["ERROR"].
	clientPurchases := purchasesForClientId at: clientId.
	cashier := Cashier 
		toCheckout: cart
		charging: aCreditCard
		throught: self
		on: DateAndTime now
		registeringOn: clientPurchases.

	cashier checkOut.
	purchasesForClientId at: clientId put: clientPurchases.
	
	^self newTransactionId! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 04:43:00'!
createCartFor: userId authenticatedWith: password 
	"user == client"
	| actualCartId |
	(authenticator canAuthenticate) ifFalse: [self error: self class invalidUserErrorMessage].
	actualCartId := self unusedCartId.
	cartsForCartId at: actualCartId put: (Cart acceptingItemsOf: catalog).
	purchasesForClientId at: userId put: OrderedCollection new.
	clientIdForCartId at: actualCartId put: userId.
	^maxCartIdUsed.! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 00:23:58'!
listCart: aCartId
 	| cart |
	cart := cartsForCartId at: aCartId ifAbsent: [^self error: self class cartIdNotExistsErrorMessage].
	^cart list! !

!UserInterface methodsFor: 'interface functions' stamp: 'MMM 11/7/2022 04:57:46'!
listPurchases: userId 
	| purchasesSummary |
	purchasesSummary := PurchasesSummary new.
	(purchasesForClientId at: userId) do: [:aSale|purchasesSummary addItems: (aSale items)].
	^purchasesSummary.! !


!UserInterface methodsFor: 'interface functions - private' stamp: 'MMM 11/7/2022 02:02:04'!
newTransactionId
	maxTransactionIdUsed := maxTransactionIdUsed + 1.
	^maxTransactionIdUsed .! !

!UserInterface methodsFor: 'interface functions - private' stamp: 'MMM 11/7/2022 00:19:29'!
unusedCartId

	maxCartIdUsed := maxCartIdUsed + 1.
	^maxCartIdUsed ! !


!UserInterface methodsFor: 'merchant processor protocol' stamp: 'MMM 11/7/2022 01:23:40'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !

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
