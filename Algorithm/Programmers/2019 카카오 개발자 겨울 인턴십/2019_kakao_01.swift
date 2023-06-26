//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/14.
//
// 크레인 인형뽑기 게임
// 2019 카카오 개발자 겨울 인턴십
// Lv. 1
// https://school.programmers.co.kr/learn/courses/30/lessons/64061

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    
    var stack = [Int]()
    var result = 0
    for i in 0 ..< moves.count {
        let move = moves[i] - 1
        
        for j in 0 ..< board.count {
            if board[j][move] != 0 {
                if stack.last == board[j][move] {
                    stack.removeLast()
                    result += 2
                } else {
                    stack.append(board[j][move])
                }
                
                board[j][move] = 0
                break
            }
        }
        
    }
    
    return result
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4]))
