//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 10/30/24.
//
// 1446 : 지름길
// https://www.acmicpc.net/problem/1446

import Foundation

struct Heap<T> {
    var nodes = [T]()
    var comparer: (T, T) -> Bool
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ item: T) {
        nodes.append(item)
        var idx = nodes.count - 1
        
        while idx > 0, comparer(nodes[(idx - 1) / 2], nodes[idx]) {
            nodes.swapAt(idx, (idx - 1) / 2)
            idx = (idx - 1) / 2
        }
    }
    
    mutating func remove() -> T? {
        if nodes.isEmpty { return nil }
        
        nodes.swapAt(0, nodes.count - 1)
        let result = nodes.removeLast()
        
        var idx = 0
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count, comparer(nodes[idx], nodes[right]), comparer(nodes[left], nodes[right]) {
                nodes.swapAt(idx, right)
                idx = right
            } else if left < nodes.count, comparer(nodes[idx], nodes[left]) {
                nodes.swapAt(idx, left)
                idx = left
            } else {
                break
            }
        }
        
        return result
    }
}

let nd = readLine()!.split(separator: " ").map { Int($0)! }
let (n, d) = (nd[0], nd[1])

var graph = [[(Int, Int)]](repeating: [], count: 10001)
for _ in 0..<n {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    graph[a].append((b, c))
}

for i in 0..<graph.count - 1 {
    graph[i].append((i + 1, 1))
}

var distances = [Int](repeating: Int.max, count: graph.count)
distances[0] = 0

var minHeap = Heap<(Int, Int)> { $0.1 > $1.1 }
minHeap.insert((0, 0))

while !minHeap.isEmpty {
    let (now, dist) = minHeap.remove()!
    
    if distances[now] < dist { continue }
    
    for (next, nDist) in graph[now] {
        let cost = distances[now] + nDist
        if distances[next] > cost {
            distances[next] = cost
            minHeap.insert((next, cost))
        }
    }
}
print(distances[d])
