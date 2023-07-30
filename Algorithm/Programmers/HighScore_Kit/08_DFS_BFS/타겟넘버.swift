//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/23.
//
// 타겟넘버
// 깊이/너비 우선 탐색(DFS/BFS)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/43165

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var cnt = 0
    func dfs(_ idx: Int, _ sum: Int) {
        if idx == numbers.count-1 {
            if sum == target {
                cnt += 1
            }
            return
        }
        
        dfs(idx+1, sum + numbers[idx+1])
        dfs(idx+1, sum - numbers[idx+1])
    }
    
    dfs(-1, 0)
    
    return cnt
}

print(solution([1, 1, 1, 1, 1], 3))
print(solution([4, 1, 2, 1], 4))
