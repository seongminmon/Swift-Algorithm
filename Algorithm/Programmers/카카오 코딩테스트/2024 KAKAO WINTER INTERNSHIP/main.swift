//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/23/24.
//
// 주사위 고르기
// 2024 KAKAO WINTER INTERNSHIP
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/258709

import Foundation

func solution(_ dice:[[Int]]) -> [Int] {
    let n = dice.count
    
    var result = [Int]()
    var maxWin = 0
    var visited = [Bool](repeating: false, count: n)
    
    func calculate() -> Int {
        var win = 0
        
        func combi(_ depth: Int, _ start: Int, _ a: Int, _ b: Int) {
            if depth == n {
                if a > b { win += 1 }
                return
            }
            
            for i in start..<n {
                for j in 0..<6 {
                    if visited[i] {
                        combi(depth+1, i+1, a + dice[i][j], b)
                    } else {
                        combi(depth+1, i+1, a, b + dice[i][j])
                    }
                }
            }
        }
        
        combi(0, 0, 0, 0)
        
        return win
    }
    
    func dfs(_ depth: Int, _ start: Int) {
        if depth == n/2 {
            let temp = calculate()
            if maxWin < temp {
                var tempResult = [Int]()
                for i in 0..<n {
                    if visited[i] {
                        tempResult.append(i+1)
                    }
                }
                maxWin = temp
                result = tempResult
            }
            return
        }
        
        for i in start..<n {
            visited[i] = true
            dfs(depth+1, i+1)
            visited[i] = false
        }
    }
    
    dfs(0, 0)
    
    return result
}

print(solution([[1, 2, 3, 4, 5, 6], [3, 3, 3, 3, 4, 4], [1, 3, 3, 4, 4, 4], [1, 1, 4, 4, 5, 5]]))
print(solution([[1, 2, 3, 4, 5, 6], [2, 2, 4, 4, 6, 6]]))
print(solution([[40, 41, 42, 43, 44, 45], [43, 43, 42, 42, 41, 41], [1, 1, 80, 80, 80, 80], [70, 70, 1, 1, 70, 70]]))
