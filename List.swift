class List<T> : Sequence {
	@final var elements: Array<T>
	
	init(_ elements: Array<T>) {
		self.elements = elements
	}
	
	convenience init() {
		self.init([])
	}
	
	convenience init(_ list: List<T>) {
		self.init(list)
	}
	
	convenience init(_ elements: T...) {
		self.init(elements)
	}
	
	subscript(index: Int) -> T {
		get {
			return elements[index]
		}
		set {
			elements[index] = newValue
		}
	}
	
	subscript(subRange: Range<Int>) -> Slice<T> {
		get {
			return elements[subRange]
		}
		set {
			elements[subRange] = newValue
		}
	}
	
	func append(newElement: T) {
		elements.append(newElement)
	}
	
	func insert(newElement: T, atIndex index: Int) {
		elements.insert(newElement, atIndex: index)
	}
	
	func removeAtIndex(index: Int) -> T {
		return elements.removeAtIndex(index)
	}
	
	func removeLast() -> T {
		return elements.removeLast()
	}
	
	func removeAll(keepCapacity: Bool = false) {
		elements.removeAll(keepCapacity: keepCapacity)
	}

	func reserveCapacity(minimumCapacity: Int) {
		elements.reserveCapacity(minimumCapacity)
	}

	var count: Int {
		get {
			return elements.count
		}
	}
	
	var isEmpty: Bool {
		get {
			return elements.isEmpty
		}
	}

	var capacity: Int {
		get {
			return elements.capacity
		}
	}
	
	func sort(isOrderedBefore: (T, T) -> Bool) {
		elements.sort(isOrderedBefore)
	}
	
	func reverse() -> Array<T> {
		return elements.reverse()
	}

	func filter(includeElement: (T) -> Bool) -> List<T> {
		return List(elements.filter(includeElement))
	}
	
	func map<U>(transform: (T) -> U) -> List<U> {
		return List<U>(elements.map(transform))
	}

	func reduce<U>(initial: U, combine: (U, T) -> U) -> U {
		return elements.reduce(initial, combine)
	}
	
	func generate() -> ListGenerator<T> {
		return ListGenerator(self)
	}
}

@assignment func += <T>(inout lhs: List<T>, rhs: T) {
	lhs.elements += rhs
}

@assignment func += <T>(inout lhs: List<T>, rhs: List<T>) {
	lhs.elements += rhs.elements
}

@assignment func += <T>(inout lhs: List<T>, rhs: Array<T>) {
	lhs.elements += rhs
}

struct ListGenerator<T> : Generator {
	let list : List<T>
	var index : Int
	
	init(_ list: List<T>) {
		self.list = list
		index = 0
	}
	
	mutating func next() -> T? {
		if index >= list.count { return nil }
		return list[index++]
	}
}
