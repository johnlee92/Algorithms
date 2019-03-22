import Foundation

func quickSort(_ list: [Int]) -> [Int] {
    if list.count < 2 {
        return list
    } else {
        let pivot = list[Int.random(in: 0..<list.count)]
        let less = list.filter { $0 < pivot }
        let greater = list.filter { $0 > pivot }
        
        return quickSort(less) + [pivot] + quickSort(greater)
    }
}

var list = [6, 3, 4, 9, 1, 7, 0]
quickSort(list)
