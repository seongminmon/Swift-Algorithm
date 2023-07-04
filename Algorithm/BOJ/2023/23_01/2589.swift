//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/07.
//
// 2589 : 보물섬
// https://www.acmicpc.net/problem/2589

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var board = [[String]]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    board.append(input)
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func bfs(_ sx: Int, _ sy: Int) -> Int {
    var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    var queue = [(Int,Int)]()
    var idx = 0
    
    queue.append((sx,sy))
    visited[sx][sy] = 0
    
    var maxDist = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            // 범위 내, 미방문, 육지
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
            visited[nx][ny] == -1, board[nx][ny] == "L" {
                queue.append((nx,ny))
                visited[nx][ny] = visited[x][y] + 1
                maxDist = max(maxDist, visited[nx][ny])
            }
        }
    }
    
    return maxDist
}

var result = 0
for i in 0 ..< n {
    for j in 0 ..< m {
        if board[i][j] == "L" {
            let temp = bfs(i,j)
            result = max(result, temp)
        }
    }
}

print(result)
