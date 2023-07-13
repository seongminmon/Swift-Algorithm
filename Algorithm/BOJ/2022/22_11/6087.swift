//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/29.
//
// 6087 : 레이저 통신
// https://www.acmicpc.net/problem/6087

import Foundation

// 입력
let mn = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (mn[1], mn[0])

var graph = [[String]]()
var se = [(Int,Int)]()
for i in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    graph.append(input)
    
    for j in 0 ..< m {
        if graph[i][j] == "C" {
            se.append((i,j))
        }
    }
}
let start = se[0]
let end = se[1]

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

// 최소 직선 개수 (최소 거울 개수 + 1)
var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)

func bfs(_ x: Int, _ y: Int) {
    var queue = [(Int,Int)]()
    var idx = 0

    queue.append((x, y))
    visited[x][y] = 0

    while idx < queue.count {
        let (nowx, nowy) = queue[idx]
        idx += 1

        for d in 0 ..< 4 {
            var nx = nowx + dx[d]
            var ny = nowy + dy[d]

            while 0 <= nx, nx < n, 0 <= ny, ny < m,
               graph[nx][ny] != "*" {
                // 아직 방문 안 했을 시 (첫 방문이 최소값임이 보장됨)
                if visited[nx][ny] == -1 {
                    visited[nx][ny] = visited[nowx][nowy] + 1
                    queue.append((nx, ny))
                }
                
                // 같은 방향으로 계속 탐색 진행
                nx += dx[d]
                ny += dy[d]
            }
        }
    }

}

bfs(start.0, start.1)

// 출력
print(visited[end.0][end.1] - 1)
