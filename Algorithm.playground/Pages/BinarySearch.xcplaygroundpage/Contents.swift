import Foundation

func binarySearch(_ list: [Int], _ item: Int) -> Int {
    var low: Int = 0
    var high: Int = list.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        let guess = list[mid]
        if guess == item {
            return mid
        } else if guess > item {
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    return -1
}
