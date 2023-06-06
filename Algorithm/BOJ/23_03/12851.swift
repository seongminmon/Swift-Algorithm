//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/11.
//
// 12851 : 숨바꼭질 2
// https://www.acmicpc.net/problem/12851

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

let SIZE = 100001
var minDist = Int.max
var cnt = 1

func bfs() {
    var visited = [Int](repeating: Int.max, count: SIZE)
    visited[n] = 0
    var queue = [(n,0)]
    var idx = 0
    
    while idx < queue.count {
        let (now, dist) = queue[idx]
        idx += 1
        
        if now == k {
            if minDist > dist {
                minDist = dist
                cnt = 1
            } else if minDist == dist {
                cnt += 1
            }
        }
        
        let nextList = [now*2, now+1, now-1]
        for next in nextList {
            if 0 <= next, next < SIZE,
               dist+1 <= visited[next] {
                queue.append((next, dist+1))
                visited[next] = dist+1
            }
        }
    }
}

bfs()

print(minDist)
print(cnt)
