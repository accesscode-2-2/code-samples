import UIKit

// Linked Lists

class ListNode {
  var value: Int?
  var next: ListNode?

  init(value: Int, next: ListNode?) {
    self.value = value
    self.next = next
  }

  func removeHead() -> ListNode? {
    let next = self.next
    self.next = nil
    return next
  }
}

var head = ListNode(value: 5, next: ListNode(value: 6, next: ListNode(value: 7, next: nil)))

let v = head.value
head = head.removeHead()!

head.value

// Stacks

struct Stack<Element> {
  var array: [Element] = []

  var isEmpty: Bool {
    return array.isEmpty
  }

  func peek() -> Element? {
    return array.last
  }

  mutating func push(element: Element) {
    array.append(element)
  }

  mutating func pop() -> Element {
    return array.removeLast()
  }
}

func isBalanced(parens: String) -> Bool {
  var s = Stack<Character>()
  for c in parens.characters {
    if c == "(" {
      s.push(c)
    } else if c == ")" {
      if s.isEmpty {
        return false
      }
      s.pop()
    }
  }
  return s.isEmpty
}

isBalanced("(())()()(())(()()())()()")

// Hash tables

func hash(key: String) -> Int {
  return key.characters.count - 1
}
hash("aa")
hash("xy")

"aa".hash
"xy".hash

// Graphs

let graph: Dictionary<Int, [Int]> = [
  0 : [4],
  1 : [3, 4],
  2 : [0, 1, 3],
  3 : [4],
  4 : []
]

let start = 2
let connectedNodes = graph[start]
let next = connectedNodes![0]
let nextConnectedNodes = graph[next]

// start.next....
