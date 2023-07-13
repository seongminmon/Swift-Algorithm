//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/26.
//
// 13975 : 파일 합치기 3
// https://www.acmicpc.net/problem/13975

import Foundation

struct Heap<T> {
    var nodes = [T]()
    var comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    var count: Int {
        return nodes.count
    }
    
    mutating func push(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0, !comparer(nodes[idx], nodes[(idx - 1) / 2]) {
            nodes.swapAt(idx, (idx - 1) / 2)
            idx = (idx - 1) / 2
        }
    }
    
    mutating func pop() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count - 1)
        var result = nodes.removeLast()
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

let t = Int(readLine()!)!
for _ in 0 ..< t {
    // 입력
    let k = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    // 풀이
    var queue = Heap<Int>{ $0 > $1 }
    for i in arr { queue.push(i) }
    
    var result = 0
    while queue.count > 1 {
        let a = queue.pop()!
        let b = queue.pop()!
        queue.push(a + b)
        result += a + b
    }
    
    // 출력
    print(result)
}
