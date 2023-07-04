//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/07.
//
// 1941 : 소문난 칠공주
// https://www.acmicpc.net/problem/1941

import Foundation

let n = 5
var graph = [[String]]()
var oneGraph = [String]()
for _ in 0 ..< n {
    let input = readLine()!.map{ String($0) }
    graph.append(input)
    oneGraph += input
}

var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var result = 0

func dfs(_ depth: Int, _ start: Int, _ queue: [(Int,Int)], _ sCnt: Int) {
    // 종료 조건
    if depth == 7 {
        if sCnt >= 4 && bfs(queue) {
            result += 1
        }
        return
    }
    
    for k in start ..< n*n {
        let i = k / n
        let j = k % n
        if !visited[i][j] {
            visited[i][j] = true
            dfs(depth+1, k, queue + [(i,j)], graph[i][j] == "S" ? sCnt+1 : sCnt)
            visited[i][j] = false
        }
    }
}

func bfs(_ queue: [(Int,Int)]) -> Bool {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var newVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    newVisited[queue[0].0][queue[0].1] = true
    var newQueue = [queue[0]]
    var idx = 0
    
    while idx < newQueue.count {
        let (x,y) = newQueue[idx]
        idx += 1
        
        for i in 0 ..< 4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n,
               visited[nx][ny], !newVisited[nx][ny] {
                newVisited[nx][ny] = true
                newQueue.append((nx,ny))
            }
        }
    }
    
    return newQueue.count == 7
}

dfs(0, 0, [], 0)
print(result)
