//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/06.
//
// 2606 : 바이러스
// https://www.acmicpc.net/problem/2606

import Foundation

// 입력
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[Int]](repeating: [], count: n)
for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph[input[0]-1].append(input[1]-1)
    graph[input[1]-1].append(input[0]-1)
}

// 풀이
// 1. dfs
var visited = [Bool](repeating: false, count: n)

var result = 0
func dfs(_ x: Int) {
    visited[x] = true
    
    for i in graph[x] {
        if !visited[i] {
            result += 1
            dfs(i)
        }
    }
}

dfs(0)

// 출력
print(result)

// 2. bfs
//var queue = [Int]()
//var idx = 0
//var visited = [Bool](repeating: false, count: n)

//queue.append(0)
//visited[0] = true
//
//while idx < queue.count {
//    let now = queue[idx]
//    idx += 1
//
//    for i in graph[now] {
//        if !visited[i] {
//            visited[i] = true
//            queue.append(i)
//        }
//    }
//}
//
//// 출력
//print(queue.count-1)
