//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/27/23.
//
// 13244 : Tree
// https://www.acmicpc.net/problem/13244

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let m = Int(readLine()!)!
    
    var graph = [[Int]](repeating: [], count: n+1)
    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (a,b) = (ab[0], ab[1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var cnt = 0
    var visited = [Bool](repeating: false, count: n+1)
    func dfs(_ now: Int) {
        visited[now] = true
        for next in graph[now] {
            if !visited[next] {
                dfs(next)
            }
        }
    }
    
    for i in 1...n {
        if !visited[i] {
            dfs(i)
            cnt += 1
        }
    }
    
    if m == n-1 && cnt == 1 {
        print("tree")
    } else {
        print("graph")
    }
}
