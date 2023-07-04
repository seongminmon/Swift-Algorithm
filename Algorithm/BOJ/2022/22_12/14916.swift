//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 14916 : 거스름돈
// https://www.acmicpc.net/problem/14916

import Foundation

// 입력
let n = Int(readLine()!)!

// 풀이
let MAX = Int(1e9)
var dp = [Int](repeating: MAX, count: 100001)
dp[0] = 0
dp[2] = 1
dp[4] = 2

for i in 5 ..< dp.count {
    dp[i] = min(dp[i-2], dp[i-5]) + 1
}

// 출력
print(dp[n] != MAX ? dp[n] : -1)
