//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/10.
//
// 17143 : 낚시왕
// https://www.acmicpc.net/problem/17143

import Foundation

let rcm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c,m) = (rcm[0], rcm[1], rcm[2])

var graph = [[[Int]]](repeating: [[Int]](repeating: [], count: c), count: r)
for _ in 0..<m {
    let shark = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x,y,s,d,z) = (shark[0]-1, shark[1]-1, shark[2], shark[3], shark[4])
    graph[x][y] = [s,d,z]
}

var ans = 0

func catchShark(_ j: Int) {
    for i in 0..<r {
        if !graph[i][j].isEmpty {
            ans += graph[i][j][2]
            graph[i][j] = []
            return
        }
    }
}

func findSharks() -> [[Int]] {
    var sharks = [[Int]]()
    for i in 0..<r {
        for j in 0..<c {
            if !graph[i][j].isEmpty {
                let (s,d,z) = (graph[i][j][0], graph[i][j][1], graph[i][j][2])
                sharks.append([i,j,s,d,z])
            }
        }
    }
    return sharks
}

func moveSharks(_ sharks: [[Int]]) {
    var newGraph = [[[Int]]](repeating: [[Int]](repeating: [], count: c), count: r)
    
    for i in sharks {
        var (x,y,s,d,z) = (i[0], i[1], i[2], i[3], i[4])
        
        // 위치 정하기
        // 1,2,3,4 : 위, 아래, 오른쪽, 왼쪽
        let dx = [0, -1, 1, 0, 0]
        let dy = [0, 0, 0, 1, -1]
        
        var ns = s
        if d == 1 || d == 2 {
            ns %= 2 * r - 2
        } else {
            ns %= 2 * c - 2
        }
        
        var nx = x
        var ny = y
        while ns > 0 {
            nx += dx[d]
            ny += dy[d]
            
            if 0 <= nx, nx < r, 0 <= ny, ny < c {
                ns -= 1
            } else {
                nx -= dx[d]
                ny -= dy[d]
                
                if d == 1 || d == 3 {
                    d += 1
                } else {
                    d -= 1
                }
            }
        }
        
        // 상어 추가
        if newGraph[nx][ny].isEmpty {
            newGraph[nx][ny] = [s,d,z]
        } else {
            // 겹치면 크기가 큰 상어만 남음
            if newGraph[nx][ny][2] < z {
                newGraph[nx][ny] = [s,d,z]
            }
        }
    }
    
    // 그래프 갱신
    graph = newGraph
}

for j in 0..<c {
    catchShark(j)
    moveSharks(findSharks())
}
print(ans)
