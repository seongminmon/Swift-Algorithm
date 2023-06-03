//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/01.
//
// 1765 : 닭싸움 팀 정하기
// https://www.acmicpc.net/problem/1765

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var fGraph = [[Int]](repeating: [], count: n+1)
var eGraph = [[Int]](repeating: [], count: n+1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (p,q) = (Int(input[1])!, Int(input[2])!)
    if input[0] == "F" {
        fGraph[p].append(q)
        fGraph[q].append(p)
    } else {
        eGraph[p].append(q)
        eGraph[q].append(p)
    }
}

for i in 1...n {
    if eGraph[i].count >= 2 {
        for j in 0..<eGraph[i].count-1 {
            let a = eGraph[i][j]
            let b = eGraph[i][j+1]
            fGraph[a].append(b)
            fGraph[b].append(a)
        }
    }
}

var visited = [Bool](repeating: false, count: n+1)
func bfs(_ s: Int) {
    visited[s] = true
    var queue = [s]
    var idx = 0
    
    while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        for next in fGraph[now] {
            if !visited[next] {
                visited[next] = true
                queue.append(next)
            }
        }
    }
}

var ans = 0
for i in 1...n {
    if !visited[i] {
        bfs(i)
        ans += 1
    }
}
print(ans)
