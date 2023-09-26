//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/25.
//
// 16928 : 뱀과 사다리 게임
// https://www.acmicpc.net/problem/16928

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var board = [Int](repeating: 0, count: 101)
for i in 1...100 { board[i] = i }

for _ in 0..<(n+m) {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x,y) = (xy[0], xy[1])
    board[x] = y
}

var visited = [Bool](repeating: false, count: 101)
visited[1] = true
var queue = [(1, 0)]
var idx = 0

var ans = 0
while idx < queue.count {
    let (now, cnt) = queue[idx]
    idx += 1
    
    // 종료 조건
    if now == 100 {
        ans = cnt
        break
    }
    
    // 주사위 던지기
    for i in 1...6 {
        if now + i <= 100 {
            let next = board[now + i]
            if !visited[next] {
                visited[next] = true
                queue.append((next, cnt+1))
            }
        }
    }
}

print(ans)
