//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/01.
//
// 2252 : 줄 세우기
// https://www.acmicpc.net/problem/2252

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[Int]](repeating: [], count: n+1)
var inDegree = [Int](repeating: 0, count: n+1)

for _ in 0 ..< m {
    let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a,b) = (ab[0], ab[1])
    graph[a].append(b)
    inDegree[b] += 1
}

func topologySort() -> [Int] {
    var result = [Int]()
    var queue = [Int]()
    
    // 진입차수 0인것들 큐에 추가
    for i in 1 ... n {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }
    
    // n번만 실행
    for _ in 0 ..< n {
        // 사이클 생길 경우
        if queue.isEmpty { return [] }
        
        let now = queue.removeFirst()
        result.append(now)
        
        for next in graph[now] {
            inDegree[next] -= 1
            if inDegree[next] == 0 {
                queue.append(next)
            }
        }
    }
    
    return result
}

let result = topologySort().map { String($0) }.joined(separator: " ")
print(result)
