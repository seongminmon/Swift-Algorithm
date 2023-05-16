//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 2176 : 합리적인 이동경로
// https://www.acmicpc.net/problem/2176

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
    
    mutating func push(_ x: T) {
        var idx = nodes.count
        nodes.append(x)
        
        while idx > 0 , !comparer(nodes[idx], nodes[(idx-1)/2]) {
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

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let (s,t) = (1,2)

var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0 ..< m {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

func dijkstra(_ start: Int) -> [Int] {
    var distance = [Int](repeating: Int.max, count: n+1)
    distance[start] = 0
    
    var queue = Heap<(Int,Int)> { $0.1 > $1.1 }
    queue.push((start,0))
    
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
    
    return distance
}

let distance = dijkstra(t)
var dp = [Int](repeating: 0, count: n+1)
dp[t] = 1
func dfs(_ now: Int) -> Int {
    if dp[now] == 0 {
        for (next, _) in graph[now] {
            if distance[now] > distance[next] {
                dp[now] += dfs(next)
            }
        }
        return dp[now]
    }
    return dp[now]
}

print(dfs(s))
