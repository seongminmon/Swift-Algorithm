//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/30.
//
// 4991 : 로봇 청소기
// https://www.acmicpc.net/problem/4991

import Foundation

while let line = readLine() {
    // 입력
    let mn = line.split(separator: " ").map{ Int(String($0))! }
    let (n,m) = (mn[1], mn[0])
    
    // 종료 조건
    if n == 0, m == 0 {
        break
    }
    
    var graph = [[String]]()
    var locations = [(Int,Int)]()
    for i in 0 ..< n {
        let input = readLine()!.map{ String($0) }
        graph.append(input)
        
        for j in 0 ..< m {
            if graph[i][j] == "o" {
                locations.insert((i,j), at: 0)
            } else if graph[i][j] == "*" {
                locations.append((i,j))
            }
        }
    }
    
    // 풀이
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    func bfs(_ start: (Int,Int)) -> [[Int]] {
        var queue = [(Int,Int)]()
        var idx = 0
        var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
        
        queue.append(start)
        visited[start.0][start.1] = 0
        
        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1
            
            for d in 0 ..< 4 {
                let (nx, ny) = (x + dx[d], y + dy[d])
                
                if 0 <= nx, nx < n, 0 <= ny, ny < m,
                   graph[nx][ny] != "x", visited[nx][ny] == -1 {
                    queue.append((nx,ny))
                    visited[nx][ny] = visited[x][y] + 1
                }
                
            }
        }
        
        return visited
    }
    
    var check = true
    var dist = [[Int]](repeating: [Int](repeating: 0, count: locations.count), count: locations.count)
    for i in 0 ..< locations.count {
        let temp = bfs(locations[i])
        
        for j in 0 ..< locations.count {
            dist[i][j] = temp[locations[j].0][locations[j].1]
            
            if dist[i][j] == -1 {
                check = false
            }
        }
    }
    
    var permutation = Array(0 ..< locations.count)
    var result = Int.max
    func dfs(_ depth: Int) {
        // 종료 조건
        if depth == permutation.count - 1 {
            var sum = 0
            for i in 0 ..< permutation.count - 1 {
                sum += dist[permutation[i]][permutation[i+1]]
            }
            
            result = min(result, sum)
            return
        }
        
        for i in depth ..< permutation.count {
            permutation.swapAt(i, depth)
            dfs(depth + 1)
            permutation.swapAt(i, depth)
        }
    }
    
    // 출력
    if check {
        dfs(1)
        print(result)
    } else {
        print(-1)
    }
}
