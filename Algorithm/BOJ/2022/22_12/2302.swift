//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/18.
//
// 2302 : 극장 좌석
// https://www.acmicpc.net/problem/2302

import Foundation

// 입력
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var vip = [0]
for _ in 0 ..< m {
    vip.append(Int(readLine()!)!)
}

// 풀이
var dp = [Int](repeating: 0, count: n+5)
dp[0] = 1
dp[1] = 1
dp[2] = 2
for i in stride(from: 3, through: n, by: 1) {
    dp[i] = dp[i-1] + dp[i-2]
}

// 출력
var result = 1
for i in stride(from: 1, through: m, by: 1) {
    result *= dp[vip[i] - vip[i-1] - 1]
}
result *= dp[n - vip[m]]
print(result)
