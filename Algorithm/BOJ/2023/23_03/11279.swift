//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/18.
//
// 11279 : 최대 힙
// https://www.acmicpc.net/problem/11279

import Foundation

let n = Int(readLine()!)!
var maxHeap = Heap<Int>{ $0 < $1 }
for _ in 0 ..< n {
    let x = Int(readLine()!)!
    if x == 0 {
        print(maxHeap.pop() ?? 0)
    } else {
        maxHeap.push(x)
    }
}

struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }
    
    mutating func push(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0, !comparer(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
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
                if comparer(nodes[left], nodes[right]),
                   comparer(nodes[idx], nodes[right]) {
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
