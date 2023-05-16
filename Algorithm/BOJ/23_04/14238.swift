//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/05.
//
// 14238 : 출근 기록
// https://www.acmicpc.net/problem/14238

import Foundation

let s = readLine()!.map { String($0) }
let n = s.count

var cnt = [0,0,0]
for i in 0 ..< n {
    switch s[i] {
    case "A": cnt[0] += 1
    case "B": cnt[1] += 1
    default: cnt[2] += 1
    }
}

var dp = [[[[[Bool]]]]](repeating: [[[[Bool]]]](repeating: [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 3), count: 3), count: n+1), count: n+1), count: n+1)
var result = [String](repeating: "", count: n)

func dfs(_ a: Int, _ b: Int, _ c: Int, _ pre1: Int, _ pre2: Int) -> Bool {
    if [a,b,c] == cnt { return true }
    
    if dp[a][b][c][pre1][pre2] { return false }
    
    dp[a][b][c][pre1][pre2] = true
    
    if a < cnt[0] {
        result[a+b+c] = "A"
        if dfs(a+1, b, c, 0, pre1) {
            return true
        }
    }
    
    if b < cnt[1] {
        result[a+b+c] = "B"
        if pre1 != 1 {
            if dfs(a, b+1, c, 1, pre1) {
                return true
            }
        }
    }
    
    if c < cnt[2] {
        result[a+b+c] = "C"
        if pre1 != 2, pre2 != 2 {
            if dfs(a, b, c+1, 2, pre1) {
                return true
            }
        }
    }
    
    return false
}

if dfs(0, 0, 0, 0, 0) {
    print(result.joined())
} else {
    print(-1)
}
