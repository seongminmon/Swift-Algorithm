//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/11.
//
// 3190 : 뱀
// https://www.acmicpc.net/problem/3190

import Foundation

let n = Int(readLine()!)!

// 빈칸: 0, 뱀: 1, 사과: 2
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

let k = Int(readLine()!)!
for _ in 0..<k {
    let apple = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    graph[apple[0]][apple[1]] = 2
}

let l = Int(readLine()!)!
var order = [Int: Int]()
for _ in 0..<l {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (time, direction) = (Int(input[0])!, input[1])
    order[time] = direction == "D" ? 1 : 3
}

let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

var (x,y,d) = (0,0,0)
var snake = [(x,y)]
graph[x][y] = 1

var ans = 0
while true {
    ans += 1
    
    // 이동
    x += dx[d]
    y += dy[d]
    
    // 벽이거나 몸이면 종료
    if x < 0 || x >= n || y < 0 || y >= n || graph[x][y] == 1 {
        break
    }
    
    // 빈칸이면 tail 삭제, 사과면 그냥 이동
    if graph[x][y] == 0 {
        let tail = snake.removeFirst()
        graph[tail.0][tail.1] = 0
    }
    graph[x][y] = 1
    snake.append((x,y))
    
    // 방향 전환
    if let value = order[ans] {
        d = (d + value) % 4
    }
}
print(ans)
