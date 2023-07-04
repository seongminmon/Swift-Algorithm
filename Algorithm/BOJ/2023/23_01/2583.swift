//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/07.
//
// 2583 : 영역 구하기
// https://www.acmicpc.net/problem/2583

import Foundation

let nmk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m,k) = (nmk[0], nmk[1], nmk[2])

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
for _ in 0 ..< k {
    let square = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (y1, x1, y2, x2) = (square[0], square[1], square[2], square[3])
    
    for i in x1 ..< x2 {
        for j in y1 ..< y2 {
            visited[i][j] = true
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
func bfs(_ sx: Int, _ sy: Int) -> [(Int,Int)] {
    var queue = [(Int,Int)]()
    var idx = 0
    
    queue.append((sx,sy))
    visited[sx][sy] = true
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               !visited[nx][ny] {
                queue.append((nx,ny))
                visited[nx][ny] = true
            }
        }
    }
    
    return queue
}

var unions = [[(Int,Int)]]()
var cntArr = [Int]()
for i in 0 ..< n {
    for j in 0 ..< m {
        if !visited[i][j] {
            let temp = bfs(i,j)
            unions.append(temp)
            cntArr.append(temp.count)
        }
    }
}
cntArr.sort()

print(unions.count)
for i in cntArr {
    print(i, terminator: " ")
}
