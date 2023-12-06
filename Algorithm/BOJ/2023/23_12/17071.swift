//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/5/23.
//
// 17071 : 숨바꼭질 5
// https://www.acmicpc.net/problem/17071

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
var (n,k) = (nk[0], nk[1])

let SIZE = 500001

var visited = [[Bool]](repeating: [Bool](repeating: false, count: 2), count: SIZE)
visited[n][0] = true
var queue = [n]
var idx = 0

var ans = -1
var time = 0

while idx < queue.count {
    k += time
    
    if k < 0 || k >= SIZE { break }
    
    if visited[k][time % 2] {
        ans = time
        break
    }
    
    var nextQueue = [Int]()
    while idx < queue.count {
        let now = queue[idx]
        idx += 1
        
        let dir = [now*2, now+1, now-1]
        for next in dir {
            if 0 <= next, next < SIZE, !visited[next][(time+1) % 2] {
                visited[next][(time+1) % 2] = true
                nextQueue.append(next)
            }
        }
    }
    
    time += 1
    
    queue = nextQueue
    idx = 0
}

print(ans)
