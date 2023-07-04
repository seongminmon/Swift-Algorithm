//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/08.
//
// 1904 : 01타일
// https://www.acmicpc.net/problem/1904

import Foundation

let n = Int(readLine()!)!

var dp = [Int](repeating: 0, count: n+5)
dp[1] = 1
dp[2] = 2
for i in stride(from: 3, through: n, by: 1) {
    dp[i] = (dp[i-1] + dp[i-2]) % 15746
}

//print(dp)
print(dp[n])
