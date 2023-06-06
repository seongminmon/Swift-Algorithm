//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/28.
//
// 1916 : 최소비용 구하기
// https://www.acmicpc.net/problem/1916

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]].append((input[1], input[2]))
}

let se = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (start, end) = (se[0], se[1])

struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
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

let INF = Int(1e9)
var distance = [Int](repeating: INF, count: n+1)
distance[start] = 0

var queue = Heap<(Int,Int)> { $0.1 > $1.1 }
queue.push((start, 0))

while !queue.isEmpty {
    let (now, nowDist) = queue.pop()!
    
    if distance[now] < nowDist {
        continue
    }
    
    for (next, nextDist) in graph[now] {
        let cost = nowDist + nextDist
        if distance[next] > cost {
            distance[next] = cost
            queue.push((next, cost))
        }
    }
}

print(distance[end])
