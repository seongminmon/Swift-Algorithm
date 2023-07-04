//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/25.
//
// 11967 : 불켜기
// https://www.acmicpc.net/problem/11967

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var map = [[[(Int,Int)]]](repeating: [[(Int,Int)]](repeating: [], count: n), count: n)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x,y,a,b) = (input[0]-1, input[1]-1, input[2]-1, input[3]-1)
    map[x][y].append((a,b))
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var light = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
visited[0][0] = true
light[0][0] = true

var queue = [(0,0)]
var idx = 0
while idx < queue.count {
    let (x,y) = queue[idx]
    idx += 1
    
    for (a,b) in map[x][y] {
        light[a][b] = true
        
        if visited[a][b] { continue }
        
        var isCanMove = false
        for i in 0..<4 {
            let na = a + dx[i]
            let nb = b + dy[i]
            
            if 0 <= na, na < n, 0 <= nb, nb < n,
               visited[na][nb] {
                isCanMove = true
                break
            }
        }
        
        if isCanMove {
            visited[a][b] = true
            queue.append((a,b))
        }
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if 0 <= nx, nx < n, 0 <= ny, ny < n,
           !visited[nx][ny], light[nx][ny] {
            visited[nx][ny] = true
            queue.append((nx,ny))
        }
    }
}

var ans = 0
for i in 0..<n {
    for j in 0..<n {
        if light[i][j] {
            ans += 1
        }
    }
}
print(ans)
