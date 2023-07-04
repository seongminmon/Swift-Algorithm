//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/07.
//
// 18809 : Gaaaaaaaaaarden
// https://www.acmicpc.net/problem/18809

import Foundation

let nmgr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m,g,r) = (nmgr[0], nmgr[1], nmgr[2], nmgr[3])

var map = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map.append(input)
}

var locations = [(Int,Int)]()
for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 2 {
            locations.append((i,j))
        }
    }
}

var greens = [(Int,Int)]()
var reds = [(Int,Int)]()
var ans = 0
func dfs(_ depth: Int, _ gCnt: Int, _ rCnt: Int) {
    if (gCnt, rCnt) == (0,0) {
        if !greens.isEmpty && !reds.isEmpty {
            ans = max(ans, bfs())
        }
        return
    }
    
    if depth >= locations.count { return }
    
    for i in depth..<locations.count {
        if gCnt > 0 {
            greens.append(locations[i])
            dfs(i+1, gCnt-1, rCnt)
            greens.removeLast()
        }
        if rCnt > 0 {
            reds.append(locations[i])
            dfs(i+1, gCnt, rCnt-1)
            reds.removeLast()
        }
    }
}

func bfs() -> Int {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var distance = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
    var state = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var queue = [(Int,Int)]()
    var idx = 0
    
    for (gx, gy) in greens {
        distance[gx][gy] = 0
        state[gx][gy] = 1
        queue.append((gx,gy))
    }
    for (rx, ry) in reds {
        distance[rx][ry] = 0
        state[rx][ry] = 2
        queue.append((rx,ry))
    }
    
    var flowerCnt = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        if state[x][y] == 3 { continue }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m, map[nx][ny] != 0 {
                if state[nx][ny] == 0 {
                    distance[nx][ny] = distance[x][y] + 1
                    state[nx][ny] = state[x][y]
                    queue.append((nx,ny))
                } else if state[nx][ny] == 1 {
                    if distance[nx][ny] == distance[x][y] + 1 && state[x][y] == 2 {
                        state[nx][ny] = 3
                        flowerCnt += 1
                    }
                } else if state[nx][ny] == 2 {
                    if distance[nx][ny] == distance[x][y] + 1 && state[x][y] == 1 {
                        state[nx][ny] = 3
                        flowerCnt += 1
                    }
                }
            }
        }
    }
    
    return flowerCnt
}

dfs(0, g, r)

print(ans)
