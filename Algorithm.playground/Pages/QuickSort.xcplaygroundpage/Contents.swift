import Foundation

func quickSort(_ list: inout [Int]) -> [Int] {
    var result: [Int] = []
    for _ in 0..<list.count {
        let smallestIndex = findSmallest(list)
        result.append(list[smallestIndex])
        list.remove(at: smallestIndex)
    }
    return result
}
