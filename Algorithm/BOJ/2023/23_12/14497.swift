//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/6/23.
//
// 14497 : 주난의 난(難)
// https://www.acmicpc.net/problem/14497

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

let input = readLine()!.split(separator: " ").map { Int(String($0))!-1 }
let (sx,sy) = (input[0], input[1])
let (ex,ey) = (input[2], input[3])

var graph = [[String]]()
for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}
graph[sx][sy] = "0"
graph[ex][ey] = "1"

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
visited[sx][sy] = true
var queue = [(sx,sy)]
var idx = 0

var ans = 0
while graph[ex][ey] == "1" {
    var nextQueue = [(Int,Int)]()
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        if (x,y) == (ex,ey) {
            break
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
               !visited[nx][ny] {
                visited[nx][ny] = true
                if graph[nx][ny] == "0" {
                    queue.append((nx,ny))
                } else {
                    nextQueue.append((nx,ny))
                }
            }
        }
    }
    
    for (x,y) in nextQueue {
        graph[x][y] = "0"
    }
    
    queue = nextQueue
    idx = 0
    
    ans += 1
}

print(ans)
