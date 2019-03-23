import Foundation

// Deque Implemation
// https://github.com/raywenderlich/swift-algorithm-club/blob/master/Deque/Deque-Optimized.swift

public struct Deque<T> {
    private var array: [T?]
    private var head: Int
    private var capacity: Int
    private let originalCapacity: Int
    
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        originalCapacity = self.capacity
        array = [T?](repeating: nil, count: capacity)
        head = capacity
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        if head == 0 {
            capacity *= 2
            let emptySpace = [T?](repeating: nil, count: capacity)
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        if capacity >= originalCapacity && head >= capacity*2 {
            let amountToRemove = capacity + capacity/2
            array.removeFirst(amountToRemove)
            head -= amountToRemove
            capacity /= 2
        }
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }
    }
    
    public func peekFront() -> T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public func peekBack() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.last!
        }
    }
}

// Breadth First Search

typealias Graph = [String: [String]]
typealias Edge = (String, String)

var graph: Graph = [:]

graph["You"] = ["Alice", "Bob", "Claire"]
graph["Bob"] = ["Anuj", "Peggy"]
graph["Alice"] = ["Peggy"]
graph["Claire"] = ["Thom", "Jonny"]
graph["Anuj"] = []
graph["Peggy"] = []
graph["Thom"] = []
graph["Jonny"] = []

func breadthFirstSearch(_ graph: Graph, _ targetDescriptor: (String) -> Bool) -> [Edge] {
    var result: [Edge] = []
    var searched: [String] = []
    var searchQueue = Deque<Edge>()
    graph["You"]?.forEach { searchQueue.enqueue(("You", $0)) }
    
    while searchQueue.count > 0 {
        guard let person = searchQueue.dequeue() else { return [] }
        guard !(searched.contains(person.1)) else { continue }
        if targetDescriptor(person.1) {
            result.append(person)
            return result
        } else {
            let prev: String = person.1
            graph[person.1]!.forEach { searchQueue.enqueue((person.1, $0)) }
            searched.append(person.1)
        }
    }
    return []
}

breadthFirstSearch(graph) {
    $0.last == "m"
}




