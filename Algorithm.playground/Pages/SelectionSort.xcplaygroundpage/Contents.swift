import Foundation

func selectionSort(_ list: inout [Int]) {
    for i in 0..<list.count {
        var smallestIndex = i
        for j in i..<list.count {
            if list[j] < list[smallestIndex] {
                smallestIndex = j
            }
        }
        list.swapAt(i, smallestIndex)
    }
}

var list = [6, 3, 4, 9, 1]
selectionSort(&list)
