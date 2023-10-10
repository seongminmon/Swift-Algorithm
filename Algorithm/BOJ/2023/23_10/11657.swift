//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/10.
//
// 11657 : 타임머신
// https://www.acmicpc.net/problem/11657

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var edges = [(Int,Int,Int)]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges.append((input[0], input[1], input[2]))
}

var dist = [Int](repeating: Int.max, count: n+1)
func bellmanFord(_ start: Int) -> Bool {
    dist[start] = 0
    
    for i in 1...n {
        for j in 0..<m {
            let (now, next, cost) = edges[j]
            
            if dist[now] != Int.max && dist[next] > dist[now] + cost {
                dist[next] = dist[now] + cost
                
                // 사이클 확인
                if i == n {
                    return true
                }
            }
        }
    }
    
    return false
}

let cycle = bellmanFord(1)

if cycle {
    print(-1)
} else {
    for i in 2...n {
        print(dist[i] == Int.max ? -1 : dist[i])
    }
}
