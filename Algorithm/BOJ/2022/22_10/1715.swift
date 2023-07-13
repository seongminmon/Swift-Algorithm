//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/07.
//
// 1715 : 카드 정렬하기
// https://www.acmicpc.net/problem/1715

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0 ..< n {
    let input = Int(readLine()!)!
    arr.append(input)
}

// 풀이
struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count: Int {
        return nodes.count
    }
    
    mutating func push(_ element: T) {
        var idx = nodes.count
        nodes.append(element)
        
        while idx > 0, !comparer(nodes[idx], nodes[(idx-1) / 2]) {
            nodes.swapAt(idx, (idx-1) / 2)
            idx = (idx-1) / 2
        }
    }
    
    mutating func pop() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count-1)
        let result = nodes.removeLast()
        
        var idx = 0
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), comparer(nodes[idx], nodes[right]) {
                    nodes.swapAt(idx, right)
                    idx = right
                } else if comparer(nodes[idx], nodes[left]) {
                    nodes.swapAt(idx, left)
                    idx = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if comparer(nodes[idx], nodes[left]) {
                    nodes.swapAt(idx, left)
                    idx = left
                } else {
                    break
                }
            } else {
                break
            }
        }
        
        return result
    }
}

var queue = Heap<Int>() { $0 > $1 } // MinHeap 생성
for i in arr { queue.push(i) }

var result = 0
while queue.count > 1 {
    let a = queue.pop()!
    let b = queue.pop()!
    queue.push(a+b)
    result += a+b
}

// 출력
print(result)
