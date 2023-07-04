//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 5014 : 스타트링크
// https://www.acmicpc.net/problem/5014

import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (f,s,g,u,d) = (input[0], input[1], input[2], input[3], input[4])

// 풀이
var visited = [Int](repeating: -1, count: f+1)
var queue = [Int]()
var idx = 0

queue.append(s)
visited[s] = 0

while idx < queue.count {
    let now = queue[idx]
    idx += 1
    
    // 종료 조건
    if now == g {
        break
    }
    
    let nu = now + u
    if 0 < nu, nu <= f, visited[nu] == -1 {
        queue.append(nu)
        visited[nu] = visited[now] + 1
    }
    
    let nd = now - d
    if 0 < nd, nd <= f, visited[nd] == -1 {
        queue.append(nd)
        visited[nd] = visited[now] + 1
    }
}

// 출력
//print(visited)
print(visited[g] != -1 ? visited[g] : "use the stairs")
