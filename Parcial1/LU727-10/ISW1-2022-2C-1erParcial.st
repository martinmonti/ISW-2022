!classDefinition: #CrewTest category: 'ISW1-2022-2C-1erParcial'!
TestCase subclass: #CrewTest
	instanceVariableNames: 'crewPosition digPosition treePosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
setUp	
	crewPosition := 1@1.
	treePosition := 1@2.
	digPosition := 2@2.! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test01MovingCrewToTreePlaceDoesNotMove

	| island crew map |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.
			
	crew moveTo: treePosition.
	
	self deny: (island hasCrewAt: treePosition).
	self assert: (island hasCrewAt: crewPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test02MovingCrewToTreePlaceFilibusteroRemovesTree

	| island crew map |

	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	self deny: (island isEmptyAt: treePosition).
				
	crew moveTo: treePosition.

	self assert: (island isEmptyAt: treePosition).
	
	self deny: (island hasCrewAt: treePosition).
	self assert: (island hasCrewAt: crewPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test03MovingCrewToFreePlace

	| island crew nextPosition map |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.

	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	nextPosition := 2@1.
	self assert: (island isEmptyAt: nextPosition).
	
	crew moveTo: nextPosition.

	self deny: (island hasCrewAt: crewPosition).
	self assert: (island hasCrewAt: nextPosition).! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test04MovingCrewToFreePlaceCorsarioWritesDirectionInMap

	| island crew nextPosition map |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: 3@3).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	nextPosition := 2@1.
	self assert: map isEmpty.

	crew moveTo: nextPosition.

	self assert: map stepsSize equals: 1. 
	self assert: map lastPosition equals: nextPosition.
! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test05CrewCannotBuryTreasureIfBucaneroCannotDig

	| island crew map |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	
	self 
		should: [ crew buryTreasureAt: 3@1 ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | 
			self assert: error messageText equals: Bucanero cannotDigErrorDescription.
			self deny: map hasTreasureMark ]
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test06CrewCanBuryTreasureIfBucaneroCanDig

	| island crew map |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2.
	
	self assert: map hasTreasureMark.
	
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test07CaptainCanUseMap

	| island crew map pirate |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2.

	pirate := Bucanero new.
	pirate aCaptainIWasMeantToBe.
	
	self assert: (pirate searchTreasureIn: island with: map)! !

!CrewTest methodsFor: 'tests' stamp: 'MMM 9/22/2022 21:51:47'!
test08SimplePirateCannotUseMap

	| island crew map pirate |
	
	island := Island
		sized: 3@3
		treesAt: (OrderedCollection with: treePosition)
		digsAt: (OrderedCollection with: digPosition).
	
	map := Map of: island crewStartsAt: crewPosition.
	
	crew := Crew 
			at: island 
			composedBy: (OrderedCollection with: (Corsario with: map) with: Filibustero new with: Bucanero new)
			at: crewPosition.

	crew moveTo: 2@1.
	crew buryTreasureAt: 2@2.

	pirate := Bucanero new.
	
	self 
		should: [ pirate searchTreasureIn: island with: map ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: 'I am a simple pirate!!'
! !


!classDefinition: #Crew category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Crew
	instanceVariableNames: 'island pirates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Crew methodsFor: 'doingCrewThings' stamp: 'MMM 9/22/2022 21:05:17'!
buryTreasureAt: aPosition
	pirates asOrderedCollection do:[:pirate|pirate buryTreasureAt: aPosition inIsland: island]

	! !

!Crew methodsFor: 'doingCrewThings' stamp: 'MMM 9/22/2022 21:31:06'!
moveTo: aPosition

	|allCanMove|
		
	allCanMove := true.
	pirates asOrderedCollection do: [:pirate| allCanMove:=(pirate moveTo: aPosition inIsland: island withPartialGroupalSuccess: allCanMove)].
	"nos movemos si todos pueden moverse"
	allCanMove ifTrue: [ island crewAt: aPosition ].
	
	! !


!Crew methodsFor: 'initializing' stamp: 'FRT 9/17/2022 22:53:00'!
initializeWith: anIsland pirates: aPirates at: aPosition

	island := anIsland.
	pirates := aPirates.
	
	island crewAt: aPosition.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Crew class' category: 'ISW1-2022-2C-1erParcial'!
Crew class
	instanceVariableNames: ''!

!Crew class methodsFor: 'as yet unclassified' stamp: 'HAW 9/18/2022 19:21:29'!
at: anIsland composedBy: aCrew at: aPosition

	^ self new initializeWith: anIsland pirates: aCrew at: aPosition ! !


!classDefinition: #Island category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Island
	instanceVariableNames: 'boardSize crewAt treasureAt cells'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Island methodsFor: 'testingPositions' stamp: 'MMM 9/22/2022 21:07:23'!
clearTerrainAt: aPosition
	cells removeKey: aPosition

	
! !

!Island methodsFor: 'testingPositions' stamp: 'FRT 9/17/2022 15:45:56'!
hasCrewAt: aPosition

	^ crewAt = aPosition.! !

!Island methodsFor: 'testingPositions' stamp: 'MMM 9/22/2022 21:08:03'!
isEmptyAt: aPosition
	^(cells includesKey: aPosition) not.
! !


!Island methodsFor: 'doingThingsAtPositions' stamp: 'FRT 9/17/2022 15:37:10'!
crewAt: aPosition

	crewAt := aPosition.! !

!Island methodsFor: 'doingThingsAtPositions' stamp: 'FRT 9/17/2022 15:27:44'!
receiveTreasureAt: aPosition

	treasureAt := aPosition.! !


!Island methodsFor: 'obtainingCellAtPosition' stamp: 'MMM 9/22/2022 21:08:21'!
terrainAt: aPosition
	^cells at:aPosition ifAbsent: [^ EmptyCell new].
! !


!Island methodsFor: 'initializing' stamp: 'MMM 9/22/2022 18:51:51'!
initializeSized: size treesAt: treesPositions digsAt: digsPositions

	boardSize := size.
	treesAt := treesPositions.
	digsAt := digsPositions.
	cells:= Dictionary new.
	treesPositions asOrderedCollection do:[:treePosition|cells add: treePosition -> (TreeCell new) ].
	digsPositions asOrderedCollection do:[:digPosition|cells add: digPosition -> (DigCell new) ].
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Island class' category: 'ISW1-2022-2C-1erParcial'!
Island class
	instanceVariableNames: ''!

!Island class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:46:50'!
sized: size treesAt: treesPositions digsAt: digsPositions

	^ self new initializeSized: size treesAt: treesPositions digsAt: digsPositions 
! !


!classDefinition: #IslandCell category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #IslandCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!IslandCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:30:49'!
pirateBucanero: aPirateBucanero willBuryTreasureAtPosition: aPosition inIsland: anIsland
self subclassResponsibility .
	"terrain = #Tree ifTrue: [ self error: 'Arrgh!! I cannot dig this type of terrain!!' ].
	terrain = #Empty ifTrue: [ self error: 'Arrgh!! I cannot dig this type of terrain!!' ]	.
	terrain = #Diggable ifTrue: [ anIsland receiveTreasureAt: aPosition]."! !

!IslandCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:35:36'!
pirateCorsario: aPirateCorsario willBuryTreasureAtPosition: aPosition inIsland: anIsland
self subclassResponsibility .

"|terrain |
	
	terrain := anIsland terrainAt: aPosition.
	

			terrain = #Tree ifTrue: [].
			terrain = #Empty ifTrue: [].
			terrain = #Diggable ifTrue: [ 				self drawTreasureMarkAt: aPosition ]."! !

!IslandCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:33:28'!
pirateFilibustero: aPirateFilibustero willBuryTreasureAtPosition: aPosition inIsland: anIsland
self subclassResponsibility .

"|terrain |
	
	terrain := anIsland terrainAt: aPosition.
	
			terrain = #Tree ifTrue: [].
			terrain = #Empty ifTrue: [].
			terrain = #Diggable ifTrue: []."! !


!IslandCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:13:52'!
pirateBucanero: aPirateBucanero movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
self subclassResponsibility .! !

!IslandCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:11:14'!
pirateCorsario: aPirateCorsario movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
self subclassResponsibility .! !

!IslandCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 19:55:04'!
pirateFilibusteroMovingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
self subclassResponsibility .! !


!classDefinition: #DigCell category: 'ISW1-2022-2C-1erParcial'!
IslandCell subclass: #DigCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!DigCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:31:14'!
pirateBucanero: aPirateBucanero willBuryTreasureAtPosition: aPosition inIsland: anIsland
	 anIsland receiveTreasureAt: aPosition.! !

!DigCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 21:02:44'!
pirateCorsario: aPirateCorsario willBuryTreasureAtPosition: aPosition inIsland: anIsland
aPirateCorsario drawTreasureMarkAt: aPosition.! !

!DigCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:38:20'!
pirateFilibustero: aPirateFilibustero willBuryTreasureAtPosition: aPosition inIsland: anIsland! !


!DigCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:17:06'!
pirateBucanero: aPirateBucanero movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
^(partialSucess & true ).! !

!DigCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:17:12'!
pirateCorsario: aPirateCorsario movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
^(partialSucess & true) .! !

!DigCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:32:14'!
pirateFilibusteroMovingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
^(partialSucess & true ).! !


!classDefinition: #EmptyCell category: 'ISW1-2022-2C-1erParcial'!
IslandCell subclass: #EmptyCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!EmptyCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:31:35'!
pirateBucanero: aPirateBucanero willBuryTreasureAtPosition: aPosition inIsland: anIsland
	self error: 'Arrgh!! I cannot dig this type of terrain!!'.! !

!EmptyCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:37:33'!
pirateCorsario: aPirateCorsario willBuryTreasureAtPosition: aPosition inIsland: anIsland
! !

!EmptyCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:38:34'!
pirateFilibustero: aPirateFilibustero willBuryTreasureAtPosition: aPosition inIsland: anIsland! !


!EmptyCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:17:31'!
pirateBucanero: aPirateBucanero movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
^(partialSucess & true).! !

!EmptyCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:25:45'!
pirateCorsario: aPirateCorsario movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess

aPirateCorsario drawDirectionTo: aPosition.
^(partialSucess & true).! !

!EmptyCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 20:32:55'!
pirateFilibusteroMovingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
^(partialSucess & true).! !


!classDefinition: #TreeCell category: 'ISW1-2022-2C-1erParcial'!
IslandCell subclass: #TreeCell
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!TreeCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:31:53'!
pirateBucanero: aPirateBucanero willBuryTreasureAtPosition: aPosition inIsland: anIsland
self error: 'Arrgh!! I cannot dig this type of terrain!!' .
! !

!TreeCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:37:46'!
pirateCorsario: aPirateCorsario willBuryTreasureAtPosition: aPosition inIsland: anIsland
! !

!TreeCell methodsFor: 'piratesBuryingTreasure' stamp: 'MMM 9/22/2022 19:38:28'!
pirateFilibustero: aPirateFilibustero willBuryTreasureAtPosition: aPosition inIsland: anIsland! !


!TreeCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 21:00:19'!
pirateBucanero: aPirateBucanero movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
anIsland clearTerrainAt: aPosition.
^(partialSucess & false) .! !

!TreeCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 21:00:28'!
pirateCorsario: aPirateCorsario movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
anIsland clearTerrainAt: aPosition.
^(partialSucess & false) .! !

!TreeCell methodsFor: 'piratesMovingOnIt' stamp: 'MMM 9/22/2022 21:00:23'!
pirateFilibusteroMovingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
anIsland clearTerrainAt: aPosition.
^(partialSucess & false) .! !


!classDefinition: #Map category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Map
	instanceVariableNames: 'island startPosition steps treasureMarkPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Map methodsFor: 'initializing' stamp: 'FRT 9/17/2022 16:30:31'!
initializeWith: anIsland crewStartsAt: aPosition

	island := anIsland.
	startPosition := aPosition.
	steps := OrderedCollection new.
	
	! !


!Map methodsFor: 'addingStep' stamp: 'FRT 9/17/2022 16:39:01'!
nextStep: step

	^ steps add: step.
	
	! !


!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 19:00:56'!
hasTreasureMark

	^ treasureMarkPosition isNil not.
	
	! !

!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 16:43:52'!
isEmpty

	^ steps isEmpty
	
	! !

!Map methodsFor: 'testing' stamp: 'MMM 9/22/2022 21:26:58'!
lastPosition
	^steps asOrderedCollection inject: startPosition into: [:step1 :step2|step1+step2].
	! !

!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 16:33:43'!
startPosition

	^ startPosition
	
	! !

!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 16:32:59'!
step: ix

	^ steps at: ix.
	
	! !

!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 16:32:23'!
stepsSize

	^ steps size.
	
	! !

!Map methodsFor: 'testing' stamp: 'FRT 9/17/2022 19:01:06'!
treasureMarkAt: aPosition

	treasureMarkPosition := aPosition.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Map class' category: 'ISW1-2022-2C-1erParcial'!
Map class
	instanceVariableNames: ''!

!Map class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:28:38'!
of: island crewStartsAt: aPosition.

	^ self new initializeWith: island crewStartsAt: aPosition.! !


!classDefinition: #Pirate category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Pirate
	instanceVariableNames: 'rank'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Pirate methodsFor: 'aboutRanks' stamp: 'MMM 9/22/2022 21:37:42'!
aCaptainIWasMeantToBe
	rank:=Captain new.! !


!Pirate methodsFor: 'moving' stamp: 'MMM 9/22/2022 19:43:38'!
moveTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
self subclassResponsibility .! !


!Pirate methodsFor: 'buryingTreasures' stamp: 'MMM 9/22/2022 19:15:23'!
buryTreasureAt: aPosition inIsland: anIsland
self subclassResponsibility .
! !

!Pirate methodsFor: 'buryingTreasures' stamp: 'MMM 9/22/2022 18:00:14'!
searchTreasureIn: island with: aMap
	rank verifyCanSearchTreasureOrDo: [ self error: 'I am a simple pirate!!' ].
	^ true "Aye, Aye!! La implementación está fuera del scope del parcial.".! !


!classDefinition: #Bucanero category: 'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Bucanero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Bucanero methodsFor: 'buryingTreasures' stamp: 'MMM 9/22/2022 19:29:47'!
buryTreasureAt: aPosition inIsland: anIsland
	"|terrain |	
	terrain := anIsland terrainAt: aPosition.	
	terrain = #Tree ifTrue: [ self error: 'Arrgh!! I cannot dig this type of terrain!!' ].
	terrain = #Empty ifTrue: [ self error: 'Arrgh!! I cannot dig this type of terrain!!' ]	.
	terrain = #Diggable ifTrue: [ anIsland receiveTreasureAt: aPosition]."
	(anIsland terrainAt: aPosition) pirateBucanero: self willBuryTreasureAtPosition: aPosition inIsland: anIsland.
			! !


!Bucanero methodsFor: 'moving' stamp: 'MMM 9/22/2022 20:40:11'!
moveTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
"			terrain = #Tree ifTrue: [ acc := acc & false ].
			terrain = #Empty ifTrue: [ acc := acc & true ].
			terrain = #Diggable ifTrue: [ acc := acc & true ].
"
^(anIsland terrainAt: aPosition) pirateBucanero: self movingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess .! !


!Bucanero methodsFor: 'initializing' stamp: 'MMM 9/22/2022 17:51:19'!
initialize
	"rank := #SimplePirate."
	rank:= SimplePirate new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bucanero class' category: 'ISW1-2022-2C-1erParcial'!
Bucanero class
	instanceVariableNames: ''!

!Bucanero class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 17:12:39'!
cannotDigErrorDescription

	^ 'Arrgh!! I cannot dig this type of terrain!!'.! !


!classDefinition: #Corsario category: 'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Corsario
	instanceVariableNames: 'map'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Corsario methodsFor: 'moving' stamp: 'MMM 9/22/2022 20:28:13'!
moveTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess
"	terrain = #Tree ifTrue: [ acc := acc & false ].
			terrain = #Empty ifTrue: [ 
				pirate drawDirectionTo: aPosition.
				acc := acc & true 
			].
			terrain = #Diggable ifTrue: [ acc := acc & true ].
		"
^(anIsland terrainAt: aPosition) pirateCorsario: self movingTo:aPosition  inIsland: anIsland withPartialGroupalSuccess: partialSucess.! !


!Corsario methodsFor: 'initializing' stamp: 'MMM 9/22/2022 18:07:25'!
initialize
	! !

!Corsario methodsFor: 'initializing' stamp: 'MMM 9/22/2022 17:52:28'!
initializeWith: aMap

	"rank := #SimplePirate."
	rank:=SimplePirate new.
	map := aMap! !


!Corsario methodsFor: 'mapThings' stamp: 'FRT 9/17/2022 22:43:57'!
drawDirectionTo: aPosition

	map nextStep: aPosition - (map lastPosition).
	
! !

!Corsario methodsFor: 'mapThings' stamp: 'FRT 9/17/2022 19:01:22'!
drawTreasureMarkAt: aPosition

	map nextStep: aPosition - map lastPosition.
	map treasureMarkAt: aPosition.
	
! !


!Corsario methodsFor: 'buryingTreasures' stamp: 'MMM 9/22/2022 19:36:13'!
buryTreasureAt: aPosition inIsland: anIsland
"|terrain |
	
	terrain := anIsland terrainAt: aPosition.
	

			terrain = #Tree ifTrue: [].
			terrain = #Empty ifTrue: [].
			terrain = #Diggable ifTrue: [ 				self drawTreasureMarkAt: aPosition ]."
(anIsland terrainAt: aPosition) pirateCorsario: self willBuryTreasureAtPosition: aPosition inIsland: anIsland .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Corsario class' category: 'ISW1-2022-2C-1erParcial'!
Corsario class
	instanceVariableNames: ''!

!Corsario class methodsFor: 'as yet unclassified' stamp: 'FRT 9/15/2022 21:46:08'!
with: aMap

	^ self new initializeWith: aMap.! !


!classDefinition: #Filibustero category: 'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Filibustero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Filibustero methodsFor: 'moving' stamp: 'MMM 9/22/2022 20:28:23'!
moveTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess

"
			terrain = #Tree ifTrue: [ 
				island clearTerrainAt: aPosition.
				acc := acc & false
			].
			terrain = #Empty ifTrue: [ acc := acc & true ].
			terrain = #Diggable ifTrue: [ acc := acc & true ]."
^(anIsland terrainAt: aPosition) pirateFilibusteroMovingTo: aPosition inIsland: anIsland withPartialGroupalSuccess: partialSucess .! !


!Filibustero methodsFor: 'buryingTreasures' stamp: 'MMM 9/22/2022 19:34:53'!
buryTreasureAt: aPosition inIsland: anIsland
"|terrain |
	
	terrain := anIsland terrainAt: aPosition.
	
			terrain = #Tree ifTrue: [].
			terrain = #Empty ifTrue: [].
			terrain = #Diggable ifTrue: []."
(anIsland terrainAt: aPosition ) pirateFilibustero: self willBuryTreasureAtPosition: aPosition inIsland: anIsland.! !


!Filibustero methodsFor: 'initializing' stamp: 'MMM 9/22/2022 17:52:45'!
initialize
	"rank := #SimplePirate"
	rank:=SimplePirate new.! !


!classDefinition: #PirateRank category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #PirateRank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!PirateRank methodsFor: 'verifyingCapabilities' stamp: 'MMM 9/22/2022 17:58:42'!
verifyCanSearchTreasureOrDo: anAction
	self subclassResponsibility .! !


!classDefinition: #Captain category: 'ISW1-2022-2C-1erParcial'!
PirateRank subclass: #Captain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Captain methodsFor: 'verifyingCapabilities' stamp: 'MMM 9/22/2022 17:58:31'!
verifyCanSearchTreasureOrDo: anAction
	^self.! !


!classDefinition: #SimplePirate category: 'ISW1-2022-2C-1erParcial'!
PirateRank subclass: #SimplePirate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!SimplePirate methodsFor: 'verifyingCapabilities' stamp: 'MMM 9/22/2022 17:58:12'!
verifyCanSearchTreasureOrDo: anAction
	anAction value.! !
