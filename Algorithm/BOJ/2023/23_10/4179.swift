//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/28.
//
// 4179 : 불!
// https://www.acmicpc.net/problem/4179

import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r,c) = (rc[0], rc[1])

var graph = [[String]]()
var fireGraph = [[Int]](repeating: [Int](repeating: Int.max, count: c), count: r)
var fireQueue = [(Int,Int,Int)]()
var now = (0,0)
for i in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
    
    for j in 0..<c {
        if graph[i][j] == "J" {
            graph[i][j] = "."
            now = (i,j)
        } else if graph[i][j] == "F" {
            fireGraph[i][j] = 0
            fireQueue.append((i, j, 0))
        }
    }
}

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func moveFire() {
    var idx = 0
    while idx < fireQueue.count {
        let (x, y, dist) = fireQueue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < r, 0 <= ny, ny < c,
               graph[nx][ny] == ".", fireGraph[nx][ny] > dist+1 {
                fireGraph[nx][ny] = dist+1
                fireQueue.append((nx, ny, dist+1))
            }
        }
    }
}

func bfs() -> Int {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
    visited[now.0][now.1] = true
    var queue = [(now.0, now.1, 0)]
    var idx = 0
    
    while idx < queue.count {
        let (x, y, dist) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < r, 0 <= ny, ny < c {
                if graph[nx][ny] == ".", !visited[nx][ny], fireGraph[nx][ny] > dist+1 {
                    visited[nx][ny] = true
                    queue.append((nx, ny, dist+1))
                }
            } else {
                // 탈출 성공
                return dist+1
            }
        }
    }
    
    // 탈출 실패
    return -1
}

moveFire()
let ans = bfs()
print(ans == -1 ? "IMPOSSIBLE" : ans)

//let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (r,c) = (rc[0], rc[1])
//
//var graph = [[String]]()
//var fireGraph = [[Int]](repeating: [Int](repeating: Int.max, count: c), count: r)
//var visited = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
//
//var now = (0,0)
//var fire = [(Int,Int,Int)]()
//for i in 0..<r {
//    let input = readLine()!.map { String($0) }
//    graph.append(input)
//
//    for j in 0..<c {
//        if graph[i][j] == "J" {
//            now = (i, j)
//            graph[i][j] = "."
//        } else if graph[i][j] == "F" {
//            fire.append((i, j, 0))
//            fireGraph[i][j] = 0
//        }
//    }
//}
//
//let dx = [0,0,1,-1]
//let dy = [1,-1,0,0]
//
//func moveFire() {
//    var idx = 0
//    while idx < fire.count {
//        let (x, y, dist) = fire[idx]
//        idx += 1
//
//        for i in 0..<4 {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//
//            if 0 <= nx, nx < r, 0 <= ny, ny < c,
//                graph[nx][ny] != "#" && fireGraph[nx][ny] > dist+1 {
//                fireGraph[nx][ny] = dist+1
//                fire.append((nx, ny, dist+1))
//            }
//        }
//    }
//}
//
//func bfs() {
//    visited[now.0][now.1] = true
//    var queue = [(now.0, now.1, 0)]
//    var idx = 0
//
//    while idx < queue.count {
//        let (x, y, dist) = queue[idx]
//        idx += 1
//
//        for i in 0..<4 {
//            let nx = x + dx[i]
//            let ny = y + dy[i]
//
//            if 0 <= nx, nx < r, 0 <= ny, ny < c {
//                if graph[nx][ny] != "#" && fireGraph[nx][ny] > dist+1 && !visited[nx][ny] {
//                    visited[nx][ny] = true
//                    queue.append((nx, ny, dist+1))
//                }
//            } else {
//                // 미로 탈출시 종료
//                print(dist + 1)
//                return
//            }
//        }
//    }
//
//    // 미로 탈출 실패
//    print("IMPOSSIBLE")
//}
//
//moveFire()
//bfs()
