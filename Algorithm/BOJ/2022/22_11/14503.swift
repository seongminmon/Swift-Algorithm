//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/10.
//
// 14503 : 로봇 청소기
// https://www.acmicpc.net/problem/14503

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let rcd = readLine()!.split(separator: " ").map{ Int(String($0))! }
var robot = (rcd[0], rcd[1], rcd[2])    // (x, y, 방향)

var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var wallCnt = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if graph[i][j] == 1 {
            visited[i][j] = true
            wallCnt += 1
        }
    }
}

let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
outerLoop: while true {
    // 1.
    visited[robot.0][robot.1] = true
    
    // 2.
    for i in 0 ..< 4 {
        robot.2 = (robot.2 + 3) % 4
        
        let nx = robot.0 + dx[robot.2]
        let ny = robot.1 + dy[robot.2]
        
        if !visited[nx][ny] {
            robot.0 = nx
            robot.1 = ny
            break
        }
        
        if i == 3 {
            let bx = robot.0 + dx[(robot.2 + 2) % 4]
            let by = robot.1 + dy[(robot.2 + 2) % 4]
            
            if graph[bx][by] == 1 {
                break outerLoop
            } else {
                robot.0 = bx
                robot.1 = by
            }
        }
    }
}

// 출력
var result = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if visited[i][j] {
            result += 1
        }
    }
}
print(result - wallCnt)
