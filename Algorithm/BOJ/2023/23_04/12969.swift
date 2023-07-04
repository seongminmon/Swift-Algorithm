//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/12.
//
// 12969 : ABC
// https://www.acmicpc.net/problem/12969

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])

var dp = [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 436), count: 31), count: 31), count: 31)

var s = [String](repeating: "", count: n)
func solve(_ tempN: Int, _ a: Int, _ b: Int, _ tempK: Int) -> Bool {
    // 종료 조건
    if tempN == n {
        if tempK == k {
            return true
        } else {
            return false
        }
    }
    
    // 재방문
    if dp[tempN][a][b][tempK] {
        return false
    }
    
    // 방문 표시
    dp[tempN][a][b][tempK] = true
    
    // 1.
    s[tempN] = "A"
    if solve(tempN+1, a+1, b, tempK) {
        return true
    }
    
    // 2.
    s[tempN] = "B"
    if solve(tempN+1, a, b+1, tempK + a) {
        return true
    }
    
    // 3.
    s[tempN] = "C"
    if solve(tempN+1, a, b, tempK + a + b) {
        return true
    }
    
    return false
}

print(solve(0, 0, 0, 0) ? s.joined() : -1)
