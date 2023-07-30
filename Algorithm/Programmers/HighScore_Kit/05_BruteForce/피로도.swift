//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/09.
//
// 피로도
// 완전탐색
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/87946

import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let n = dungeons.count
    var result = 0
    var visited = [Bool](repeating: false, count: n)
    func dfs(_ cnt: Int, _ nowK: Int) {
        if result < cnt {
            result = cnt
        }
        
        print(cnt, nowK)
        
        for i in 0..<n {
            if !visited[i] && nowK >= dungeons[i][0] {
                visited[i] = true
                dfs(cnt+1, nowK-dungeons[i][1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, k)
    
    return result
}

print(solution(80, [[80,20],[50,40],[30,10]]))
