//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/05.
//
// 12996 : Acka
// https://www.acmicpc.net/problem/12996

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (s,a,b,c) = (input[0], input[1], input[2], input[3])

let mod = 1_000_000_007
var dp = [[[[Int]]]](repeating: [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 51), count: 51), count: 51), count: 51)

func solve(_ s: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    if s < 0 || a < 0 || b < 0 || c < 0 {
        return 0
    }
    
    if s == 0 && a == 0 && b == 0 && c == 0 {
        return 1
    }
    
    if dp[s][a][b][c] != -1 {
        return dp[s][a][b][c]
    }
    
    dp[s][a][b][c] = 0
    dp[s][a][b][c] += solve(s-1, a-1, b, c)
    dp[s][a][b][c] += solve(s-1, a, b-1, c)
    dp[s][a][b][c] += solve(s-1, a, b, c-1)
    dp[s][a][b][c] += solve(s-1, a-1, b-1, c)
    dp[s][a][b][c] += solve(s-1, a, b-1, c-1)
    dp[s][a][b][c] += solve(s-1, a-1, b, c-1)
    dp[s][a][b][c] += solve(s-1, a-1, b-1, c-1)
    dp[s][a][b][c] %= mod
    
    return dp[s][a][b][c]
}

print(solve(s, a, b, c))
