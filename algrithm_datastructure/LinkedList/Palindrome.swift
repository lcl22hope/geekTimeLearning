import Foundation

func isPalindrome(content: String) -> Bool {
    let list = LinkedList<Character>()
    for c in content {
        list.append(value: c)
    }
    print(list)
    guard var first = list.pop() else {
        return false
    }
    guard var last = list.removeLast() else {
        return false
    }

    while(!list.isEmpty() && list.head !== list.tail) {
        if (first != last) { return false }
        else {
            first = list.pop()!
            last = list.removeLast()!
        }
    }
    return true;
}
