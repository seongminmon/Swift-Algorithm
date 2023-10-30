//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/29.
//
// 11779 : 최소비용 구하기 2
// https://www.acmicpc.net/problem/11779

import Foundation

struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    mutating func insert(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 && !comparer(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
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

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    graph[a].append((b,c))
}

let se = readLine()!.split(separator: " ").map { Int(String($0))! }
let (s,e) = (se[0], se[1])

var distance = [Int](repeating: Int.max, count: n+1)
distance[s] = 0
var queue = Heap<(Int,Int)> { $0.1 > $1.1 }
queue.insert((s,0))
var path = [Int: Int]()
for i in 1...n { path[i] = 0 }

while !queue.isEmpty {
    let (now, nowDist) = queue.delete()!
    
    if distance[now] < nowDist {
        continue
    }
    
    for (next, nextDist) in graph[now] {
        let cost = nowDist + nextDist
        if distance[next] > cost {
            distance[next] = cost
            queue.insert((next, cost))
            path[next] = now
        }
    }
}

var route = [Int]()
var node = e
while let next = path[node] {
    route.append(node)
    node = next
}

// 최소 비용
print(distance[e])
// 경로에 포함된 도시 개수
print(route.count)
// 경로
print(route.reversed().map { String($0) }.joined(separator: " "))
