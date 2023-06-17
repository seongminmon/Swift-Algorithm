//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/17.
//
// 10159 : 저울
// https://www.acmicpc.net/problem/10159

import Foundation

// 1. 플로이드-워셜
let n = Int(readLine()!)!
let m = Int(readLine()!)!

var outGraph = [[Int]](repeating: [Int](repeating: Int(1e9), count: n+1), count: n+1)
var inGraph = [[Int]](repeating: [Int](repeating: Int(1e9), count: n+1), count: n+1)
for i in 1...n {
    outGraph[i][i] = 0
    inGraph[i][i] = 0
}
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
    outGraph[ab[0]][ab[1]] = 1
    inGraph[ab[1]][ab[0]] = 1
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            outGraph[i][j] = min(outGraph[i][j], outGraph[i][k] + outGraph[k][j])
            inGraph[i][j] = min(inGraph[i][j], inGraph[i][k] + inGraph[k][j])
        }
    }
}

for i in 1...n {
    var cnt = 0
    for j in 1...n {
        if outGraph[i][j] != Int(1e9) {
            cnt += 1
        }
        if inGraph[i][j] != Int(1e9) {
            cnt += 1
        }
    }
    print(n - cnt + 1)
}

// 2. dfs
//let n = Int(readLine()!)!
//let m = Int(readLine()!)!
//
//var outGraph = [[Int]](repeating: [], count: n+1)
//var inGraph = [[Int]](repeating: [], count: n+1)
//for _ in 0..<m {
//    let ab = readLine()!.split(separator : " " ).map{ Int(String($0))! }
//    outGraph[ab[0]].append(ab[1])
//    inGraph[ab[1]].append(ab[0])
//}
//
//var cnt = 0
//var visited = [Bool](repeating: false, count: n+1)
//func dfs(_ now: Int, _ graph: [[Int]]) {
//    for next in graph[now] {
//        if !visited[next] {
//            visited[next] = true
//            dfs(next, graph)
//            cnt += 1
//        }
//    }
//}
//
//for i in 1...n {
//    cnt = 0
//    visited = [Bool](repeating: false, count: n+1)
//    dfs(i, outGraph)
//    dfs(i, inGraph)
//    print(n - cnt - 1)
//}
