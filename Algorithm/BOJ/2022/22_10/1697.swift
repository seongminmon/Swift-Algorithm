//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/23.
//
// 1697 : 숨바꼭질
// https://www.acmicpc.net/problem/1697

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])

// 풀이
var visited = [Int](repeating: -1, count: 100001)
var queue = [Int]()
var idx = 0

queue.append(n)
visited[n] = 0

while idx < queue.count {
    let now = queue[idx]
    idx += 1
    
    if now == k {
        break
    }
    
    let dist = visited[now]
    let (next1, next2, next3) = (now*2, now+1, now-1)
    
    if 0 <= next1, next1 <= 100000, visited[next1] == -1 {
        visited[next1] = dist+1
        queue.append(next1)
    }
    
    if 0 <= next2, next2 <= 100000, visited[next2] == -1 {
        visited[next2] = dist+1
        queue.append(next2)
    }
    
    if 0 <= next3, next3 <= 100000, visited[next3] == -1 {
        visited[next3] = dist+1
        queue.append(next3)
    }
}

// 출력
let result = visited[k]
print(result)
