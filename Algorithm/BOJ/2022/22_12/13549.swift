//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/27.
//
// 13549 : 숨바꼭질 3
// https://www.acmicpc.net/problem/13549

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
var (n,k) = (nk[0], nk[1])

// 풀이
let SIZE = 100001
let MAX = Int(1e9)
var visited = [Int](repeating: MAX, count: SIZE)

func bfs(_ n: Int) -> Int {
    var queue = [Int]()
    var idx = 0
    
    queue.append(n)
    visited[n] = 0
    
    while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        if now == k {
            return visited[now]
        }
        
        if now+1 < SIZE {
            if visited[now] + 1 < visited[now+1] {
                visited[now+1] = visited[now] + 1
                queue.append(now+1)
            }
        }
        if now-1 >= 0 {
            if visited[now] + 1 < visited[now-1] {
                visited[now-1] = visited[now] + 1
                queue.append(now-1)
            }
        }
        if now*2 < SIZE {
            if visited[now] < visited[now*2] {
                visited[now*2] = visited[now]
                queue.append(now*2)
            }
        }
    }
    
    return -1
}

// 출력
print(bfs(n))
