//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/11.
//
// 13913 : 숨바꼭질 4
// https://www.acmicpc.net/problem/13913

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

let SIZE = 100001
var visited = [Int](repeating: Int.max, count: SIZE)
var beforeList = [Int](repeating: -1, count: SIZE)
var queue = [Int]()
var idx = 0

visited[n] = 0
queue.append(n)

while idx < queue.count {
    let now = queue[idx]
    idx += 1
    
    // 종료 조건
    if now == k {
        print(visited[k])
        
        var path = [Int]()
        var before = k
        while before != n {
            path.append(before)
            before = beforeList[before]
        }
        path.append(n)
        
        print(path.reversed().map{ String($0) }.joined(separator: " "))
        
        break
    }
    
    let nextList = [now*2, now+1, now-1]
    for next in nextList {
        if 0 <= next, next < SIZE,
           visited[next] > visited[now] + 1 {
            visited[next] = visited[now] + 1
            beforeList[next] = now
            queue.append(next)
        }
    }
}
