//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/18.
//
// 9657 : 돌 게임 3
// https://www.acmicpc.net/problem/9657

import Foundation

// 입력
let n = Int(readLine()!)!

// 풀이
var dp = [Bool](repeating: true, count: 1001)
dp[2] = false

for i in 5 ... 1000 {
    if dp[i-1] && dp[i-3] && dp[i-4] {
        dp[i] = false
    }
}

// 출력
if dp[n] {
    print("SK")
} else {
    print("CY")
}
