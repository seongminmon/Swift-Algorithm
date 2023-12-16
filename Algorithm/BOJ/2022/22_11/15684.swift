//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/06.
//
// 15684 : 사다리 조작
// https://www.acmicpc.net/problem/15684

import Foundation

let nmh = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,h) = (nmh[0], nmh[1], nmh[2])

var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: h)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    let (a,b) = (ab[0], ab[1])
    visited[a][b] = true
}

func check() -> Bool {
    for i in 0..<n {
        var now = i
        for j in 0..<h {
            if 0 <= now, now < n, visited[j][now] {
                now += 1
            } else if 0 <= now-1, now-1 < n, visited[j][now-1] {
                now -= 1
            }
        }
        
        if i != now {
            return false
        }
    }
    return true
}

var ans = -1
func solve(_ depth: Int, _ start: Int, _ target: Int) {
    if depth == target {
        if check() {
            ans = target
        }
        return
    }
    
    for i in start..<h {
        for j in 0..<n-1 {
            if !visited[i][j] {
                visited[i][j] = true
                solve(depth+1, i, target)
                visited[i][j] = false
            }
        }
    }
}

for i in 0...3 {
    solve(0, 0, i)
    if ans != -1 { break }
}
print(ans)
