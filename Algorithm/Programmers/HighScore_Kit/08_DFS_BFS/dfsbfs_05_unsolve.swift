//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/24.
//
// 퍼즐 조각 채우기
// 깊이/너비 우선 탐색(DFS/BFS)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/84021

// *unsolve
import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    let n = game_board.count
    var boardVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var tableVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    for i in 0 ..< n {
        for j in 0 ..< n {
            if game_board[i][j] == 1 {
                boardVisited[i][j] = true
            }
            if table[i][j] == 0 {
                tableVisited[i][j] = true
            }
        }
    }
    
    func bfs(_ sx: Int, _ sy: Int) {
        
    }
    
    return -1
}
