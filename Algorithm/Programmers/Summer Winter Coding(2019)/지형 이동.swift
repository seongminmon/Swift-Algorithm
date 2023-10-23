//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 지형 이동
// Summer/Winter Coding(2019)
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/62050

import Foundation

func solution(_ land:[[Int]], _ height:Int) -> Int {
    let n = land.count
    
    var edges = [(Int,Int,Int)]()
    
    var visited = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
    var groupNumber = 0
    func bfs(_ sx: Int, _ sy: Int) {
        let dx = [0,0,1,-1]
        let dy = [1,-1,0,0]
        
        visited[sx][sy] = groupNumber
        var queue = [(sx,sy)]
        var idx = 0
        
        while idx < queue.count {
            let (x,y) = queue[idx]
            idx += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if 0 <= nx, nx < n, 0 <= ny, ny < n {
                    let diff = abs(land[x][y] - land[nx][ny])
                    
                    // 사다리 없이 이동 가능
                    if visited[nx][ny] == -1 && diff <= height {
                        visited[nx][ny] = groupNumber
                        queue.append((nx,ny))
                    } else if visited[nx][ny] != -1 && diff > height {
                        // 사다리 연결 필요
                        edges.append((groupNumber, visited[nx][ny], diff))
                    }
                }
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if visited[i][j] == -1 {
                bfs(i,j)
                groupNumber += 1
            }
        }
    }
    
    edges.sort { $0.2 < $1.2 }
    
    // 부모 자기 자신으로 초기화
    var parent = [Int](repeating: 0, count: groupNumber)
    for i in 0..<parent.count { parent[i] = i }
    
    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    func union(_ x: Int, _ y: Int) {
        let px = find(x)
        let py = find(y)
        
        if px <= py {
            parent[py] = px
        } else {
            parent[px] = py
        }
    }
    
    var ans = 0
    var cnt = 0
    for (x, y, cost) in edges {
        // 조기 탈출
        if cnt == parent.count-1 { break }
        
        if find(x) != find(y) {
            union(x, y)
            ans += cost
            cnt += 1
        }
    }
    return ans
}

print(solution([[1, 4, 8, 10], [5, 5, 5, 5], [10, 10, 10, 10], [10, 10, 10, 20]], 3))
print(solution([[10, 11, 10, 11], [2, 21, 20, 10], [1, 20, 21, 11], [2, 1, 2, 1]], 1))
