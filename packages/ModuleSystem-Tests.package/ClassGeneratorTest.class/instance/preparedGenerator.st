initializing
preparedGenerator
	| spec innerSpec |
	spec := ModuleSpecification new.

	spec addMethodString: 'Inner < class > ^ target subclass' protocol: 'generator'.
	innerSpec := spec classDict at: #Inner.
	innerSpec addMethodString: 'collect: aBlock | new | new := OrderedCollection new. self do: [ :item | (aBlock value: item) ifTrue: [ new add: item ] ]. ^ new' protocol: 'filtering'.
	
	^ spec generateWithSubclass: ClassGenerator