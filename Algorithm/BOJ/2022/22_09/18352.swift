//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/18.
//
// 18352 : 특정 거리의 도시 찾기
// https://www.acmicpc.net/problem/18352

import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,k,x) = (input[0],input[1],input[2],input[3])

var graph = [[Int]](repeating: [], count: n+1)
for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[input[0]].append(input[1])
}

// 풀이
var visited = [Bool](repeating: false, count: n+1)
var queue = [(Int,Int)]()
queue.append((x,0))
visited[x] = true

var result = [Int]()
while !queue.isEmpty {
    let (node, dist) = queue.removeFirst()
    
    if dist >= k { continue }
    
    for next in graph[node] {
        if !visited[next] {
            visited[next] = true
            queue.append((next,dist + 1))
            if dist+1 == k {
                result.append(next)
            }
        }
    }
}

// 출력
if result.isEmpty {
    print(-1)
} else {
    result.sort()
    for i in result {
        print(i)
    }
}
