//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/04.
//
// 12869 : 뮤탈리스크
// https://www.acmicpc.net/problem/12869

import Foundation

let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
while input.count < 3 { input.append(0) }
let (sx,sy,sz) = (input[0], input[1], input[2])

let dir = [[1,3,9],
           [1,9,3],
           [3,1,9],
           [3,9,1],
           [9,1,3],
           [9,3,1]]

var visited = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: sz+1), count: sy+1), count: sx+1)
visited[sx][sy][sz] = 0
var queue = [(sx,sy,sz)]
var idx = 0

while idx < queue.count {
    let (x,y,z) = queue[idx]
    idx += 1
    
    if (x,y,z) == (0,0,0) { break }
    
    for d in dir {
        let nx = max(x - d[0], 0)
        let ny = max(y - d[1], 0)
        let nz = max(z - d[2], 0)
        
        if visited[nx][ny][nz] == -1 {
            visited[nx][ny][nz] = visited[x][y][z] + 1
            queue.append((nx,ny,nz))
        }
    }
}
print(visited[0][0][0])
