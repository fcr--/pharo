"
I am a context of selected packages in full browser
"
Class {
	#name : 'ClyFullBrowserPackageContext',
	#superclass : 'ClyFullBrowserContext',
	#category : 'Calypso-SystemTools-FullBrowser-Contexts',
	#package : 'Calypso-SystemTools-FullBrowser',
	#tag : 'Contexts'
}

{ #category : 'selection strategy' }
ClyFullBrowserPackageContext class >> selectionStrategy [
	<classAnnotation>

	^ClyContextSelectionStrategyAnnotation for: ClyFullBrowserMorph selectionType: RPackage
]

{ #category : 'selection-class groups' }
ClyFullBrowserPackageContext >> isClassGroupSelected [
	^false
]

{ #category : 'selection-class groups' }
ClyFullBrowserPackageContext >> isClassTagSelected [
	^false
]

{ #category : 'public' }
ClyFullBrowserPackageContext >> lastSelectedClassGroup [
	^self lastSelectedObject
]

{ #category : 'selection-packages' }
ClyFullBrowserPackageContext >> selectedPackageItems [
	^selectedItems
]
