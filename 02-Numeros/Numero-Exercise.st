!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'JL 9/13/2022 18:08:48'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:54:47'!
addEntero: anAdder
	self subclassResponsibility 
! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !


!Numero methodsFor: 'fraccion initialization' stamp: 'MMM 9/15/2022 13:05:46'!
verifyAsDivisor
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de n?mero inv?lido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:06:46'!
* aMultiplier 
	^aMultiplier multiplyByEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:54:47'!
+ anAdder 
	^anAdder addEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:02:25'!
- aSubtrahend 
	^aSubtrahend subtractFromEntero: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:24:53'!
/ aDivisor 
	^ aDivisor divideAnEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/13/2022 18:04:44'!
// aDivisor 
	
	^Entero with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:55:31'!
addEntero: anEnteroAdder

 	 ^Entero with: (anEnteroAdder integerValue + value)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:26:36'!
addFraccion: aFraccionAdder 
	^(aFraccionAdder numerator + (self * aFraccionAdder denominator)) / (aFraccionAdder denominator)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/13/2022 18:12:11'!
divideAFraccion: aFraccionDividend
	^(aFraccionDividend numerator) / (aFraccionDividend denominator * self)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:44:09'!
divideAnEntero: anEnteroDividend
	^Fraccion with: anEnteroDividend over: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/13/2022 18:26:23'!
fibonacci
	self subclassResponsibility 
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/13/2022 18:04:53'!
greatestCommonDivisorWith: anEntero 
	
	^Entero with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:05:47'!
multiplyByEntero: anEnteroMultiplier 
	
	^Entero with: anEnteroMultiplier integerValue * self integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:58:37'!
multiplyByFraccion: aFraccionMultiplier
	
	^(self * aFraccionMultiplier numerator) / (aFraccionMultiplier denominator)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:01:46'!
subtractFromEntero: anEnteroMinuend
	^ Entero with: (anEnteroMinuend integerValue - self integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:02:02'!
subtractFromFraccion: aFraccionMinuend

	^(aFraccionMinuend numerator - (self * aFraccionMinuend denominator)) / (aFraccionMinuend denominator)
! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'MMM 9/15/2022 15:03:09'!
initializeWith: aValue 
	value:=aValue.! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'JL 9/14/2022 18:47:25'!
isNegative
	
	^self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'JL 9/14/2022 18:46:28'!
isOne
	
	self subclassResponsibility ! !

!Entero methodsFor: 'testing' stamp: 'JL 9/14/2022 18:48:13'!
isZero
	
	^self subclassResponsibility ! !


!Entero methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:59:22'!
initializeFraccionUnder: aNumerator	
	^Fraccion new initializeWith: aNumerator over: self.! !

!Entero methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:49:45'!
initializeOver: aDivisor
	^ self subclassResponsibility.! !

!Entero methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:59:22'!
initializeUnder: aDividend	
	|greatestCommonDivisor numerator denominator|
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: self. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.
	
	^denominator initializeFraccionUnder: numerator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est? definido aqu? para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'MMM 9/15/2022 15:02:44'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	(aValue < 0) ifTrue: [^Negativos new initializeWith: aValue].
	(aValue = 0) ifTrue: [^Cero new initializeWith: aValue].
	(aValue = 1) ifTrue: [^Uno new initializeWith: aValue].
	(aValue > 1) ifTrue: [	^ MayoresAUno new initializeWith: aValue].! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:49:25'!
* aMultiplier
	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:50:07'!
+ anAdder 
	^anAdder! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:50:44'!
- aSubtrahend 
	^aSubtrahend negated! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JL 9/15/2022 15:43:21'!
divideAFraccion: aFraccionDividend
	^self error: Numero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JL 9/15/2022 15:42:56'!
divideAnEntero: anEnteroDividend
	^self error: Numero canNotDivideByZeroErrorDescription.! !

!Cero methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:43:07'!
fibonacci

	^Uno with: 1! !


!Cero methodsFor: 'testing' stamp: 'JL 9/14/2022 18:47:34'!
isNegative
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'JL 9/14/2022 18:46:42'!
isOne
	
	^false! !

!Cero methodsFor: 'testing' stamp: 'JL 9/14/2022 18:48:23'!
isZero
	
	^true! !


!Cero methodsFor: 'initialization' stamp: 'MMM 9/15/2022 15:03:09'!
initializeWith: aValue 
	
	value := aValue! !


!Cero methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:54:44'!
initializeOver: aDivisor
	^self.! !

!Cero methodsFor: 'fraccion initialization' stamp: 'MMM 9/15/2022 15:26:13'!
verifyAsDivisor
	^ self error: Numero canNotDivideByZeroErrorDescription.! !


!classDefinition: #DistintosACero category: 'Numero-Exercise'!
Entero subclass: #DistintosACero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!DistintosACero methodsFor: 'testing' stamp: 'MMM 9/15/2022 15:05:03'!
isZero
	^false.! !


!DistintosACero methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:57:15'!
initializeOver: aDivisor
	^aDivisor initializeUnder: self.! !

!DistintosACero methodsFor: 'fraccion initialization' stamp: 'MMM 9/15/2022 13:09:04'!
verifyAsDivisor
	^self.! !


!classDefinition: #Negativos category: 'Numero-Exercise'!
DistintosACero subclass: #Negativos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Negativos methodsFor: 'testing' stamp: 'JL 9/14/2022 18:47:42'!
isNegative
	
	^true! !

!Negativos methodsFor: 'testing' stamp: 'JL 9/14/2022 18:46:55'!
isOne
	
	^false! !


!Negativos methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:31:30'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!Negativos methodsFor: 'initialization' stamp: 'MMM 9/15/2022 15:03:09'!
initializeWith: aValue 
	
	value := aValue! !


!Negativos methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:57:15'!
initializeUnder: aDividend
	^aDividend negated / self negated! !


!classDefinition: #Positivos category: 'Numero-Exercise'!
DistintosACero subclass: #Positivos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Positivos methodsFor: 'testing' stamp: 'JL 9/14/2022 18:47:51'!
isNegative
	
	^false! !


!Positivos methodsFor: 'initialization' stamp: 'MMM 9/15/2022 15:03:09'!
initializeWith: aValue 
	
	value := aValue! !


!classDefinition: #MayoresAUno category: 'Numero-Exercise'!
Positivos subclass: #MayoresAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!MayoresAUno methodsFor: 'initialization' stamp: 'MMM 9/15/2022 15:03:09'!
initializeWith: aValue 
	
	value := aValue! !


!MayoresAUno methodsFor: 'testing' stamp: 'JL 9/14/2022 18:47:02'!
isOne
	
	^false! !


!MayoresAUno methodsFor: 'arithmetic operations' stamp: 'JL 9/13/2022 18:08:36'!
fibonacci

	^ (self - (Uno with: 1)) fibonacci + (self - (MayoresAUno with: 2)) fibonacci
		! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Positivos subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'initialization' stamp: 'MMM 9/15/2022 15:03:09'!
initializeWith: aValue 
	
	value := aValue! !


!Uno methodsFor: 'testing' stamp: 'JL 9/14/2022 18:47:09'!
isOne
	
	^true! !


!Uno methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:49:45'!
* aMultiplier
	^aMultiplier! !

!Uno methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:33:45'!
fibonacci

	^self! !


!Uno methodsFor: 'fraccion initialization' stamp: 'JL 9/15/2022 15:59:22'!
initializeFraccionUnder: aNumerator	
	^aNumerator.! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:26:07'!
* aMultiplier 
	^aMultiplier multiplyByFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:56:17'!
+ anAdder 
	^anAdder addFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:02:32'!
- aSubtrahend 
	^aSubtrahend subtractFromFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:24:46'!
/ aDivisor 
	^ aDivisor divideAFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:45:19'!
addEntero: anEnteroAdder
	^anEnteroAdder addFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:56:50'!
addFraccion: aFraccionAdder 

	| newNumerator newDenominator |
	
	newNumerator := (aFraccionAdder numerator * denominator) + (aFraccionAdder denominator * numerator).
	newDenominator := aFraccionAdder denominator * denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:22:32'!
divideAFraccion: aFraccionDividend 
	^(aFraccionDividend numerator * self denominator) / (aFraccionDividend denominator * self numerator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:20:33'!
divideAnEntero:anEnteroDividend
	^ (anEnteroDividend * self denominator) / (self numerator).! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:29:02'!
multiplyByEntero: anEnteroMultiplier 
	^anEnteroMultiplier multiplyByFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 20:58:37'!
multiplyByFraccion: aFraccionMultiplier 
	^(aFraccionMultiplier numerator * numerator) / (aFraccionMultiplier denominator * denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/14/2022 18:29:54'!
subtractFromEntero: anEnteroMinuend
	^((anEnteroMinuend * denominator) - (numerator)) / (denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JL 9/12/2022 21:01:02'!
subtractFromFraccion: aFraccionMinuend 
	
	| newNumerator newDenominator |
	
	newNumerator := (aFraccionMinuend numerator * denominator) - (aFraccionMinuend denominator * numerator).
	newDenominator := aFraccionMinuend denominator * denominator.
	
	^newNumerator / newDenominator
! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !

!Fraccion methodsFor: 'initialization' stamp: 'MMM 9/15/2022 13:08:42'!
verifyAsDivisor
	^ self.! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'instance creation' stamp: 'JL 9/15/2022 15:49:46'!
with: aDividend over: aDivisor
	aDivisor verifyAsDivisor.
	^aDividend initializeOver: aDivisor.
	
	
! !
