"
SUnit tests for RPackage tags
"
Class {
	#name : 'RPackageTagTest',
	#superclass : 'RPackageTestCase',
	#category : 'RPackage-Tests',
	#package : 'RPackage-Tests'
}

{ #category : 'tests' }
RPackageTagTest >> testAddClass [

	| xPackage yPackage yTag class |
	xPackage := self ensureXPackage.
	class := self newClassNamed: #NewClass in: xPackage tag: #TAG.

	self assert: (xPackage includesClass: class).
	self assert: (xPackage hasTag: #TAG).
	self assert: ((xPackage classTagNamed: #TAG) includesClass: class).

	yPackage := self ensureYPackage.
	yTag := yPackage ensureTag: #YTag.
	yTag addClass: class.

	self deny: (xPackage includesClass: class).
	self assert: (yPackage includesClass: class).
	self assert: (yTag includesClass: class).
	self assert: class package equals: yPackage.
	self assert: class packageTag equals: yTag.
	self assert: class packageTag package equals: yPackage
]

{ #category : 'tests' }
RPackageTagTest >> testAddClassSettingPackageTag [

	| xPackage yPackage yTag class |
	xPackage := self ensureXPackage.
	class := self newClassNamed: #NewClass in: xPackage tag: #TAG.

	self assert: (xPackage includesClass: class).
	self assert: (xPackage hasTag: #TAG).
	self assert: ((xPackage classTagNamed: #TAG) includesClass: class).

	yPackage := self ensureYPackage.
	yTag := yPackage ensureTag: #YTag.
	class packageTag: yTag.

	self deny: (xPackage includesClass: class).
	self assert: (yPackage includesClass: class).
	self assert: (yTag includesClass: class).
	self assert: class package equals: yPackage.
	self assert: class packageTag equals: yTag.
	self assert: class packageTag package equals: yPackage
]

{ #category : 'tests' }
RPackageTagTest >> testAddTrait [

	| xPackage yPackage yTag class |
	xPackage := self ensureXPackage.
	class := self newTraitNamed: #NewClass in: xPackage tag: #TAG.

	self assert: (xPackage includesClass: class).
	self assert: (xPackage hasTag: #TAG).
	self assert: ((xPackage classTagNamed: #TAG) includesClass: class).

	yPackage := self ensureYPackage.
	yTag := yPackage ensureTag: #YTag.
	yTag addClass: class.

	self deny: (xPackage includesClass: class).
	self assert: (yPackage includesClass: class).
	self assert: (yTag includesClass: class).
	self assert: class package equals: yPackage.
	self assert: class packageTag equals: yTag.
	self assert: class packageTag package equals: yPackage
]

{ #category : 'tests' }
RPackageTagTest >> testAddTraitSettingPackageTag [

	| xPackage yPackage yTag class |
	xPackage := self ensureXPackage.
	class := self newTraitNamed: #NewClass in: xPackage tag: #TAG.

	self assert: (xPackage includesClass: class).
	self assert: (xPackage hasTag: #TAG).
	self assert: ((xPackage classTagNamed: #TAG) includesClass: class).

	yPackage := self ensureYPackage.
	yTag := yPackage ensureTag: #YTag.
	class packageTag: yTag.

	self deny: (xPackage includesClass: class).
	self assert: (yPackage includesClass: class).
	self assert: (yTag includesClass: class).
	self assert: class package equals: yPackage.
	self assert: class packageTag equals: yTag.
	self assert: class packageTag package equals: yPackage
]

{ #category : 'tests' }
RPackageTagTest >> testCanHaveTagOfTheSameNameAsThePackage [

	| xPackage xTag |
	xPackage := self ensureXPackage.
	xTag := xPackage ensureTag: xPackage name.

	self assert: xTag package identicalTo: xPackage.
	self deny: xTag isRoot
]

{ #category : 'tests' }
RPackageTagTest >> testIncludesClass [

	| package class tag |
	package := self ensurePackage: #Test1.
	class := self newClassNamed: 'TestClass' in: package tag: 'TAG'.
	tag := class packageTag.

	self assert: (package includesClass: class).
	self assert: (package hasTag: tag).
	self assert: tag name equals: 'TAG'.

	self assert: (tag includesClass: class).
	self assert: (tag includesClass: class class). "We want it to work with class side too"
	self deny: (tag includesClass: self class)
]

{ #category : 'tests' }
RPackageTagTest >> testPromoteAsPackage [

	| package1 package2 class tag1 |
	package1 := self ensurePackage: #Test1.
	class := self newClassNamed: 'TestClass' in: package1 tag: 'TAG1'.
	class compile: 'foo ^42' classified: 'accessing'.

	tag1 := package1 classTagNamed: 'TAG1'.

	tag1 promoteAsPackage.

	package2 := self organizer packageNamed: 'Test1-TAG1'.
	self assert: package2 isNotNil.
	self assert: (package2 classes includes: class).
	self deny: (package1 classes includes: class)
]

{ #category : 'tests' }
RPackageTagTest >> testRemoveClass [

	| package tag class |
	package := self ensurePackage: #Test1.
	tag := package ensureTag: #TAG.
	class := self newClassNamed: 'TestClass' in: package tag: 'TAG'.

	self assert: (tag includesClass: class).

	tag removeClass: class.

	self deny: (tag includesClass: class).
	self deny: (package includesClass: class).
	self deny: class packageTag equals: tag
]

{ #category : 'tests' }
RPackageTagTest >> testRemoveClassRemoveTagIfEmpty [

	| package tag class |
	package := self ensurePackage: #Test1.
	tag := package ensureTag: #TAG.
	class := self newClassNamed: 'TestClass' in: package tag: 'TAG'.

	self assert: (tag includesClass: class).
	self assert: (package hasTag: tag).

	tag removeClass: class.

	self deny: (tag includesClass: class).
	self deny: (package hasTag: tag)
]
