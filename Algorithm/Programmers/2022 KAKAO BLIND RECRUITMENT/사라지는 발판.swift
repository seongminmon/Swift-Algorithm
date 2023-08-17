//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/15.
//
// 사라지는 발판
// 2022 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/92345

import Foundation

func solution(_ board:[[Int]], _ aloc:[Int], _ bloc:[Int]) -> Int {
    let n = board.count
    let m = board[0].count
    
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    // (x1, y1)의 턴, (승패, 총 이동횟수)를 리턴
    func play(_ board: [[Int]], _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> (Bool, Int) {
        if board[x1][y1] == 0 {
            return (false, 0)
        }
        
        var board = board
        
        // 이동한 칸 빈칸으로 만들기
        board[x1][y1] = 0
        
        var Min = Int.max   // 이길때의 최솟값
        var Max = 0         // 질때의 최댓값
        for i in 0..<4 {
            let nx = x1 + dx[i]
            let ny = y1 + dy[i]
            
            if 0 <= nx, nx < n, 0 <= ny, ny < m, board[nx][ny] == 1 {
                let (isLose, cnt) = play(board, x2, y2, nx, ny)
                if isLose {
                    Max = max(Max, cnt+1)
                } else {
                    Min = min(Min, cnt+1)
                }
            }
        }
        
        // 복구
        board[x1][y1] = 1
        
        if Min != Int.max {
            return (true, Min)
        } else {
            return (false, Max)
        }
    }
    
    return play(board, aloc[0], aloc[1], bloc[0], bloc[1]).1
}

print(solution([[1, 1, 1], [1, 1, 1], [1, 1, 1]], [1, 0], [1, 2]))
print(solution([[1, 1, 1], [1, 0, 1], [1, 1, 1]], [1, 0], [1, 2]))
print(solution([[1, 1, 1, 1, 1]], [0, 0], [0, 4]))
print(solution([[1]], [0, 0], [0, 0]))
