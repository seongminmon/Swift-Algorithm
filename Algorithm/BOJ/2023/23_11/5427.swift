//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/20/23.
//
// 5427 : 불
// https://www.acmicpc.net/problem/5427

import Foundation

let t = Int(readLine()!)!
outerLoop: for _ in 0..<t {
    let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (m,n) = (mn[0], mn[1])
    
    var graph = [[String]]()
    for _ in 0..<n {
        let input = readLine()!.map { String($0) }
        graph.append(input)
    }
    
    var now = (0,0)
    var fire = [(Int,Int)]()
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == "@" {
                // 빈칸으로 변경
                graph[i][j] = "."
                // 시작위치 기록
                now = (i,j)
            } else if graph[i][j] == "*" {
                fire.append((i,j))
            }
        }
    }
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    // 불 이동
    // 불이 도달한 시간 기록
    var fireVisited = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
    for (x,y) in fire { fireVisited[x][y] = 0 }
    var fireIdx = 0
    while fireIdx < fire.count {
        let (x,y) = fire[fireIdx]
        fireIdx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m,
                graph[nx][ny] == ".", fireVisited[nx][ny] > fireVisited[x][y] + 1 {
                fireVisited[nx][ny] = fireVisited[x][y] + 1
                fire.append((nx,ny))
            }
        }
    }
    
    // 상근 이동
    var visited = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
    visited[now.0][now.1] = 0
    var queue = [now]
    var idx = 0
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m {
                // 빈칸이고, 거리 갱신이 가능하고, 불이 번지기전에 이동 가능
                if graph[nx][ny] == ".", visited[nx][ny] > visited[x][y] + 1, fireVisited[nx][ny] > visited[x][y] + 1 {
                    visited[nx][ny] = visited[x][y] + 1
                    queue.append((nx,ny))
                }
            } else {
                // 범위 벗어났을 시 탈출 성공
                print(visited[x][y] + 1)
                continue outerLoop
            }
        }
    }
    print("IMPOSSIBLE")
}
