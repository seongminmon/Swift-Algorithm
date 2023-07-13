//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/22.
//
// 23288 : 주사위 굴리기 2
// https://www.acmicpc.net/problem/23288

import Foundation

// 입력
let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
struct Dice {
    var top: Int
    var down: Int
    var east: Int
    var west: Int
    var south: Int
    var north: Int
}
var dice: Dice = Dice(top: 1, down: 6, east: 3, west: 4, south: 5, north: 2)
var location = (0,0)
var direction = 0

// 동, 남, 서, 북
let dx = [0, 1, 0, -1]
let dy = [1, 0, -1, 0]

var result = 0
for _ in 0 ..< k {
    // 1.
    let nx = location.0 + dx[direction]
    let ny = location.1 + dy[direction]
    
    if 0 <= nx, nx < n, 0 <= ny, ny < m {
        location = (nx, ny)
    } else {
        direction = (direction + 2) % 4
        location.0 += dx[direction]
        location.1 += dy[direction]
    }
    
    // dice 상태 변화 (동, 남, 서, 북)
    switch direction {
    case 0:
        dice = Dice(
            top: dice.west,
            down: dice.east,
            east: dice.top,
            west: dice.down,
            south: dice.south,
            north: dice.north
        )
    case 1:
        dice = Dice(
            top: dice.north,
            down: dice.south,
            east: dice.east,
            west: dice.west,
            south: dice.top,
            north: dice.down
        )
    case 2:
        dice = Dice(
            top: dice.east,
            down: dice.west,
            east: dice.down,
            west: dice.top,
            south: dice.south,
            north: dice.north
        )
    default:
        dice = Dice(
            top: dice.south,
            down: dice.north,
            east: dice.east,
            west: dice.west,
            south: dice.down,
            north: dice.top
        )
    }
    
    // 2.
    let B = graph[location.0][location.1]
    let C = bfs(location.0, location.1)
    result += B * C
    
    // 3.
    if dice.down > B {
        direction  = (direction + 1) % 4
    } else if dice.down < B {
        direction  = (direction + 3) % 4
    }
}

func bfs(_ x: Int, _ y: Int) -> Int {
    let num = graph[x][y]
    var queue = [(Int,Int)]()
    var idx = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    queue.append((x,y))
    visited[x][y] = true
    
    while idx < queue.count {
        let (nowx, nowy) = queue[idx]
        idx += 1
        
        for d in 0 ..< 4 {
            let nx = nowx + dx[d]
            let ny = nowy + dy[d]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m {
                if graph[nx][ny] == num, !visited[nx][ny] {
                    queue.append((nx,ny))
                    visited[nx][ny] = true
                }
            }
        }
    }
    
    return queue.count
}

// 출력
print(result)
