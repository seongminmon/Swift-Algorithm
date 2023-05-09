//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/24.
//
// 단어 변환
// 깊이/너비 우선 탐색(DFS/BFS)
// LV.3
// https://school.programmers.co.kr/learn/courses/30/lessons/43163

import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = [Bool](repeating: false, count: words.count)
    
    var result = Int.max
    func dfs(_ cnt: Int, _ word: String) {
        if word == target {
            result = min(result, cnt)
            return
        }
        
        for i in 0 ..< words.count {
            if !visited[i] && isPossible(word, words[i])  {
                visited[i] = true
                dfs(cnt+1, words[i])
                visited[i] = false
            }
        }
    }
    
    dfs(0, begin)
    
    return result == Int.max ? 0 : result
}

func isPossible(_ a: String, _ b: String) -> Bool {
    let a = a.map { String($0) }
    let b = b.map { String($0) }
    var cnt = 0
    for i in 0 ..< a.count {
        if a[i] != b[i] {
            cnt += 1
        }
    }
    return cnt == 1
}

print(solution(
    "hit",
    "cog",
    ["hot", "dot", "dog", "lot", "log", "cog"]
))

print(solution(
    "hit",
    "cog",
    ["hot", "dot", "dog", "lot", "log"]
))
