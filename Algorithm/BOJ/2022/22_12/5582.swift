//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 5582 : 공통 부분 문자열
// https://www.acmicpc.net/problem/5582
import Foundation

// 입력
let a = readLine()!.map{ String($0) }
let b = readLine()!.map{ String($0) }

// 풀이
var dp = [[Int]](repeating: [Int](repeating: 0, count: b.count+1), count: a.count+1)
var MAX = 0
for i in 1 ... a.count {
    for j in 1 ... b.count {
        if a[i-1] == b[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
            MAX = max(MAX, dp[i][j])
        }
    }
}

// 출력
for i in dp { print(i) }
print(MAX)
