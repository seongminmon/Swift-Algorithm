//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/23.
//
// 1766 : 문제집
// https://www.acmicpc.net/problem/1766

import Foundation

struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 && !comparer(nodes[idx], nodes[(idx - 1) / 2]) {
            nodes.swapAt(idx, (idx - 1) / 2)
            idx = (idx - 1) / 2
        }
    }
    
    mutating func delete() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count-1)
        let result = nodes.removeLast()
        
        var idx = 0
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[idx], nodes[right]) && comparer(nodes[left], nodes[right]) {
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

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]](repeating: [], count: n+1)
var indegree = [Int](repeating: 0, count: n+1)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a,b) = (ab[0], ab[1])
    graph[a].append(b)
    indegree[b] += 1
}

var result = [Int]()
var queue = Heap<Int> { $0 > $1 }
for i in 1...n {
    if indegree[i] == 0 {
        queue.insert(i)
    }
}

while !queue.isEmpty {
    let now = queue.delete()!
    result.append(now)
    
    for next in graph[now] {
        indegree[next] -= 1
        if indegree[next] == 0 {
            queue.insert(next)
        }
    }
}

print(result.map { String($0) }.joined(separator: " "))
