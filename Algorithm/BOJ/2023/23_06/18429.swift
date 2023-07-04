//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/06.
//
// 18429 : 근손실
// https://www.acmicpc.net/problem/18429

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var visited = [Bool](repeating: false, count: n)
var ans = 0
func dfs(_ depth: Int, _ weight: Int) {
    if weight < 0 { return }
    
    if depth == n {
        ans += 1
        return
    }
    
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth+1, weight - k + arr[i])
            visited[i] = false
        }
    }
}

dfs(0, 0)

print(ans)
