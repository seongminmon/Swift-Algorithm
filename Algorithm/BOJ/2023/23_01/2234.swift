//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/09.
//
// 2234 : 성곽
// https://www.acmicpc.net/problem/2234

import Foundation

let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m,n) = (mn[0], mn[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph.append(input)
}

// [서,북,동,남]
let dx = [0,-1,0,1]
let dy = [-1,0,1,0]

var visited = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
func bfs(_ sx: Int, _ sy: Int, _ cnt: Int) -> Int {
    visited[sx][sy] = cnt
    var queue = [(sx,sy)]
    var idx = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 > nx || nx >= n || 0 > ny || ny >= m ||
                visited[nx][ny] != 0 || graph[x][y] & (1 << i) != 0 { continue }
            
            visited[nx][ny] = cnt
            queue.append((nx,ny))
        }
    }
    return queue.count
}

var roomCnt = 0
var maxRoomSize = 0
var groupCnt = [0]
for i in 0..<n {
    for j in 0..<m {
        if visited[i][j] == 0 {
            roomCnt += 1
            let cnt = bfs(i, j, roomCnt)
            maxRoomSize = max(maxRoomSize, cnt)
            groupCnt.append(cnt)
        }
    }
}
print(roomCnt)
print(maxRoomSize)

maxRoomSize = 0
for i in 0..<n {
    for j in 0..<m {
        for d in 0..<4 {
            let nx = i + dx[d]
            let ny = j + dy[d]
            
            if 0 > nx || nx >= n || 0 > ny || ny >= m ||
                visited[i][j] == visited[nx][ny] || graph[i][j] & (1 << d) == 0 { continue }
            
            maxRoomSize = max(maxRoomSize, groupCnt[visited[i][j]] + groupCnt[visited[nx][ny]])
        }
    }
}
print(maxRoomSize)
