//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/13.
//
// 15685 : 드래곤 커브
// https://www.acmicpc.net/problem/15685

import Foundation

// 입력
let n = Int(readLine()!)!
var dragonCurves = [(Int,Int,Int,Int)]()    // (y, x, 방향, 세대)
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    dragonCurves.append((input[0], input[1], input[2], input[3]))
}

// 풀이
var visited = [[Bool]](repeating: [Bool](repeating: false, count: 101), count: 101)
let dx = [0, -1, 0, 1]
let dy = [1, 0, -1, 0]

for (y, x, d, age) in dragonCurves {
    // 0세대
    visited[x][y] = true
    var nx = x + dx[d]
    var ny = y + dy[d]
    visited[nx][ny] = true
    
    // pass
    if age == 0 { continue }
    
    // 1 ~ age 세대
    var stack = [Int]()
    stack.append(d)
    for _ in 1 ... age {
        for i in stride(from: stack.count - 1, through: 0, by: -1) {
            let k = (stack[i] + 1) % 4
            nx += dx[k]
            ny += dy[k]
            visited[nx][ny] = true
            stack.append(k)
        }
    }
    
}

// 출력
var result = 0
for i in 0 ..< 100 {
    for j in 0 ..< 100 {
        if visited[i][j], visited[i][j+1], visited[i+1][j], visited[i+1][j+1] {
            result += 1
        }
    }
}
print(result)
