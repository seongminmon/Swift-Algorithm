//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/30.
//
// 블록 이동하기
// 2020 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/60063

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    
    func isValid(_ x: Int, _ y: Int) -> Bool {
        if x < 0 || x >= n || y < 0 || y >= n || board[x][y] == 1 {
            return false
        }
        return true
    }
    
    func canMove(_ location: [Int]) -> [[Int]] {
        var locationList = [[Int]]()
        
        let (x1, y1, x2, y2) = (location[0], location[1], location[2], location[3])
        
        let dx = [0,0,-1,1]
        let dy = [1,-1,0,0]
        
        for i in 0..<4 {
            let nx1 = x1 + dx[i]
            let ny1 = y1 + dy[i]
            let nx2 = x2 + dx[i]
            let ny2 = y2 + dy[i]
            
            if isValid(nx1, ny1) && isValid(nx2, ny2) {
                locationList.append([nx1, ny1, nx2, ny2])
            }
        }
        
        return locationList
    }
    
    func canRotate(_ location: [Int]) -> [[Int]] {
        var locationList = [[Int]]()
        
        let (x1, y1, x2, y2) = (location[0], location[1], location[2], location[3])
        
        if x1 == x2 {
            // 수평
            
            // 1. 왼쪽 중심축, 시계 방향
            if isValid(x1+1, y1) && isValid(x1+1, y2) {
                locationList.append([x1, y1, x1+1, y1])
            }
            // 2. 왼쪽 중심축, 반시계 방향
            if isValid(x1-1, y1) && isValid(x1-1, y2) {
                locationList.append([x1-1, y1, x1, y1])
            }
            // 3. 오른쪽 중심축, 시계 방향
            if isValid(x2-1, y2) && isValid(x2-1, y1) {
                locationList.append([x2-1, y2, x2, y2])
            }
            // 4. 오른쪽 중심축, 반시계 방향
            if isValid(x2+1, y2) && isValid(x2+1, y1) {
                locationList.append([x2, y2, x2+1, y2])
            }
        } else {
            // 수직
            
            // 1. 위쪽 중심축, 시계 방향
            if isValid(x1, y1-1) && isValid(x2, y1-1) {
                locationList.append([x1, y1-1, x1, y1])
            }
            // 2. 위쪽 중심축, 반시계 방향
            if isValid(x1, y1+1) && isValid(x2, y1+1) {
                locationList.append([x1, y1, x1, y1+1])
            }
            // 3. 아래쪽 중심축, 시계 방향
            if isValid(x2, y2+1) && isValid(x1, y2+1) {
                locationList.append([x2, y2, x2, y2+1])
            }
            // 4. 아래쪽 중심축, 반시계 방향
            if isValid(x2, y2-1) && isValid(x1, y2-1) {
                locationList.append([x2, y2-1, x2, y2])
            }
        }
        
        return locationList
    }
    
    var visited = [[Int]: Int]()
    visited[[0,0,0,1]] = 1
    var queue = [[Int]]()
    queue.append([0,0,0,1])
    var costQueue = [Int]()
    costQueue.append(0)
    var idx = 0
    
    while idx < queue.count {
        let now = queue[idx]
        let cost = costQueue[idx]
        idx += 1
        
        // 종료 조건
        if (now[0], now[1]) == (n-1, n-1) || (now[2], now[3]) == (n-1, n-1) {
            return cost
        }
        
        let nextList = canMove(now) + canRotate(now)
        for next in nextList {
            if visited[next] == nil {
                visited[next] = 1
                queue.append(next)
                costQueue.append(cost+1)
            }
        }
    }
    
    return -1
}

// 7
print(solution([[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]))

// 21
print(solution([[0, 0, 0, 0, 0, 0, 1],
                [1, 1, 1, 1, 0, 0, 1],
                [0, 0, 0, 0, 0, 0, 0],
                [0, 0, 1, 1, 1, 1, 0],
                [0, 1, 1, 1, 1, 1, 0],
                [0, 0, 0, 0, 0, 1, 1],
                [0, 0, 1, 0, 0, 0, 0]]))

// 11
print(solution([[0, 0, 0, 0, 0, 0, 1], [1, 1, 1, 1, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 1, 0], [0, 0, 1, 0, 0, 0, 0]]))

// 33
print(solution([[0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0]]))
