//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/10.
//
// 2146 : 다리 만들기
// https://www.acmicpc.net/problem/2146

import Foundation

// 입력
let n = Int(readLine()!)!
var graph = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    graph.append(input)
}

// 풀이
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

func labeling(_ sx: Int, _ sy: Int, _ label: Int) -> [(Int,Int)] {
    var queue = [(sx,sy)]
    var idx = 0
    graph[sx][sy] = label
    
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               graph[nx][ny] == 1 {
                graph[nx][ny] = label
                queue.append((nx,ny))
            }
        }
    }
    
    return queue
}

var label = 2
var unions = [[(Int,Int)]]()
for i in 0 ..< n {
    for j in 0 ..< n {
        if graph[i][j] == 1 {
            unions.append(labeling(i, j, label))
            label += 1
        }
    }
}

let INF = Int(1e9)
func bfs(_ queue: [(Int,Int)]) -> Int {
    var dist = [[Int]](repeating: [Int](repeating: INF, count: n), count: n)
    for (x,y) in queue { dist[x][y] = 0 }
    
    var queue = queue
    var idx = 0
    
    let label = graph[queue[0].0][queue[0].1]
    while idx < queue.count {
        let (x,y) = queue[idx]
        idx += 1
        
        if graph[x][y] != 0, graph[x][y] != label {
            return dist[x][y]
        }
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               dist[nx][ny] > dist[x][y] + 1 {
                dist[nx][ny] = dist[x][y] + 1
                queue.append((nx,ny))
            }
        }
    }
    
    return INF
}

var result = INF
for i in 0 ..< unions.count {
    result = min(result, bfs(unions[i]))
}

// 출력
print(result-1)
