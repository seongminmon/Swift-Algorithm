//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/14.
//
// 15591 : MooTube (Silver)
// https://www.acmicpc.net/problem/15591

import Foundation

let nq = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,q) = (nq[0], nq[1])

var graph = [[(Int,Int)]](repeating: [], count: n+1)
for _ in 0..<n-1 {
    let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b,c) = (abc[0], abc[1], abc[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

func bfs(_ k: Int, _ start: Int) -> Int {
    var usado = [Int](repeating: Int.max, count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    visited[start] = true
    var queue = [start]
    var idx = 0

    while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        for (next, cost) in graph[now] {
            if !visited[next] {
                usado[next] = min(usado[now], cost)
                visited[next] = true
                queue.append(next)
            }
        }
    }
    
    return usado.filter { $0 >= k }.count - 2
}

for _ in 0..<q {
    let q = readLine()!.split(separator: " ").map{ Int(String($0))! }
    print(bfs(q[0], q[1]))
}
