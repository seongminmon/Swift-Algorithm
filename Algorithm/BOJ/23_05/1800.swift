//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/17.
//
// 1800 : 인터넷 설치
// https://www.acmicpc.net/problem/1800

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
    
    mutating func enqueue(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 && !comparer(nodes[idx], nodes[(idx-1)/2]) {
            nodes.swapAt(idx, (idx-1)/2)
            idx = (idx-1)/2
        }
    }
    
    mutating func dequeue() -> T? {
        if nodes.isEmpty { return nil }
        if nodes.count == 1 { return nodes.removeLast() }
        
        nodes.swapAt(0, nodes.count-1)
        let result = nodes.removeLast()
        
        var idx = 0
        while idx < nodes.count {
            let left = idx * 2 + 1
            let right = left + 1
            
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]) && comparer(nodes[idx], nodes[right]) {
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

let npk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,p,k) = (npk[0], npk[1], npk[2])

var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<p {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

func dijkstra(_ value: Int) -> Bool {
    var distance = [Int](repeating: Int.max, count: n+1)
    distance[1] = 0
    var queue = Heap<(Int,Int)> { $0.1 > $1.1 }
    queue.enqueue((1,0))
    
    while !queue.isEmpty {
        let (now, nowDist) = queue.dequeue()!
        
        if distance[now] < nowDist {
            continue
        }
        
        for (next, nextDist) in graph[now] {
            let cost = nextDist > value ? nowDist + 1 : nowDist
            
            if distance[next] > cost {
                distance[next] = cost
                queue.enqueue((next, cost))
            }
        }
    }
    
    return distance[n] <= k
}

var ans = -1
var start = 0
var end = 1_000_000
while start <= end {
    let mid = (start + end) / 2
    if dijkstra(mid) {
        ans = mid
        end = mid - 1
    } else {
        start = mid + 1
    }
}

print(ans)
