//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/02.
//
// 경주로 건설
// 2020 카카오 인턴십
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/67259

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    var visited = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: Int.max, count: 4), count: n), count: n)
    var queue = [(Int,Int,Int,Int)]()
    for i in 0..<4 {
        visited[0][0][i] = 0
        queue.append((0,0,0,i))
    }
    var idx = 0
    while idx < queue.count {
        let (x,y,cost,dir) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < n, board[nx][ny] == 0 {
                let nCost = dir == i ? cost + 100 : cost + 600
                if visited[nx][ny][i] > nCost {
                    visited[nx][ny][i] = nCost
                    queue.append((nx,ny,nCost,i))
                }
            }
        }
    }
    
    return visited[n-1][n-1].min()!
}

print(solution([[0,0,0],[0,0,0],[0,0,0]]))
print(solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]))
print(solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]]))
print(solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]]))
