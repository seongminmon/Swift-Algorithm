//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/9/23.
//
// 3197 : 백조의 호수
// https://www.acmicpc.net/problem/3197

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var graph = [[String]]()
var (sx,sy,ex,ey) = (-1,-1,-1,-1)
var waterQueue = [(Int,Int)]()

for i in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
    
    for j in 0..<m {
        if graph[i][j] == "L" {
            graph[i][j] = "."
            waterQueue.append((i,j))
            
            if (sx,sy) == (-1,-1) {
                (sx,sy) = (i,j)
            } else {
                (ex,ey) = (i,j)
            }
        } else if graph[i][j] == "." {
            waterQueue.append((i,j))
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
visited[sx][sy] = true
var swanQueue = [(sx,sy)]
func moveSwan() -> Bool {
    var nextSwanQueue = [(Int,Int)]()
    var idx = 0
    
    while idx < swanQueue.count {
        let (x,y) = swanQueue[idx]
        idx += 1
        
        if (x,y) == (ex,ey) {
            return true
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m, !visited[nx][ny] {
                visited[nx][ny] = true
                if graph[nx][ny] == "." {
                    swanQueue.append((nx,ny))
                } else {
                    nextSwanQueue.append((nx,ny))
                }
            }
        }
    }
    swanQueue = nextSwanQueue
    return false
}

func meltIce() {
    var nextWaterQueue = [(Int,Int)]()
    var idx = 0
    
    while idx < waterQueue.count {
        let (x,y) = waterQueue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               graph[nx][ny] == "X" {
                graph[nx][ny] = "."
                nextWaterQueue.append((nx,ny))
            }
        }
    }
    waterQueue = nextWaterQueue
}

var ans = 0
while !moveSwan() {
    meltIce()
    ans += 1
}
print(ans)
