import Foundation

func selectionSort(_ list: inout [Int]) -> [Int] {
    var result: [Int] = []
    for _ in 0..<list.count {
        let smallestIndex = findSmallest(list)
        result.append(list[smallestIndex])
        list.remove(at: smallestIndex)
    }
    return result
}

func findSmallest(_ list: [Int]) -> Int {
    var smallest = list[0]
    var smallestIndex = 0
    list.enumerated().forEach {
        if $1 < smallest {
            smallest = $1
            smallestIndex = $0
        }
    }
    return smallestIndex
}
