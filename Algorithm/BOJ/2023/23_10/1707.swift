//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/01.
//
// 1707 : 이분 그래프
// https://www.acmicpc.net/problem/1707

import Foundation

let k = Int(readLine()!)!
for _ in 0..<k {
    let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (v,e) = (ve[0], ve[1])
    
    var graph = [[Int]](repeating: [], count: v+1)
    for _ in 0..<e {
        let ab = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (a,b) = (ab[0], ab[1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    var result = true
    var visited = [Int](repeating: 0, count: v+1)
    func dfs(_ now: Int) {
        for next in graph[now] {
            if visited[next] == 0 {
                visited[next] = visited[now] == 1 ? 2 : 1
                dfs(next)
            } else {
                if visited[now] == visited[next] {
                    result = false
                    return
                }
            }
        }
    }
    
    for i in 1...v {
        if !result { break }
        
        if visited[i] == 0 {
            visited[i] = 1
        }
        dfs(i)
    }
    
    print(result ? "YES" : "NO")
}
