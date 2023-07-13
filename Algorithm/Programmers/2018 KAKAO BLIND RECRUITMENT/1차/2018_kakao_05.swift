//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/11.
//
// [1차] 프렌즈4블록
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17679

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var map = [[String]]()
    for i in 0..<m {
        map.append(board[i].map { String($0) })
    }
    
    func deleteBlock() -> Int {
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let c = map[i][j]
                if c == "" { continue }
                
                var cnt = 1
                if map[i+1][j] == c { cnt += 1 }
                if map[i][j+1] == c { cnt += 1 }
                if map[i+1][j+1] == c { cnt += 1 }
                
                if cnt == 4 {
                    visited[i][j] = true
                    visited[i+1][j] = true
                    visited[i][j+1] = true
                    visited[i+1][j+1] = true
                }
            }
        }
        
        var ret = 0
        for i in 0..<m {
            for j in 0..<n {
                if visited[i][j] {
                    map[i][j] = ""
                    ret += 1
                }
            }
        }
        return ret
    }
    
    func down() {
        for i in stride(from: m-1, through: 0, by: -1) {
            for j in 0..<n {
                let c = map[i][j]
                if c == "" { continue }
                var idx = i
                while idx+1 < m, map[idx+1][j] == "" {
                    (map[idx][j], map[idx+1][j]) = (map[idx+1][j], map[idx][j])
                    idx += 1
                }
            }
        }
    }
    
    var ans = 0
    while true {
        let cnt = deleteBlock()
        if cnt == 0 { break }
        ans += cnt
        down()
    }
    
    return ans
}

print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
print(solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
