//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/11.
//
// 13913 : 숨바꼭질 4
// https://www.acmicpc.net/problem/13913

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])

let SIZE = 100_001

var route = [Int](repeating: -1, count: SIZE)
var visited = [Int](repeating: Int.max, count: SIZE)
visited[n] = 0
var queue = [n]
var idx = 0

while idx < queue.count {
    let now = queue[idx]
    idx += 1
    
    // 종료 조건
    if now == k { break }
    
    let dir = [now*2, now+1, now-1]
    for next in dir {
        if 0 <= next, next < SIZE,
           visited[next] > visited[now] + 1 {
            visited[next] = visited[now] + 1
            route[next] = now
            queue.append(next)
        }
    }
}

var result = [k]
var before = k
while route[before] != -1 {
    result.append(route[before])
    before = route[before]
}
print(visited[k])
print(result.reversed().map { String($0) }.joined(separator: " "))
