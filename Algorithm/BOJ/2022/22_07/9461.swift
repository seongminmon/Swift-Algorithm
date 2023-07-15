//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/11.
//
// 9461 : 파도반 수열
// https://www.acmicpc.net/problem/9461

import Foundation

let t = Int(readLine()!)!
var arr = [Int]()
for _ in 0 ..< t { arr.append(Int(readLine()!)!) }

var dp = [Int](repeating: 0, count: 101)
dp[0] = 1
dp[1] = 1
dp[2] = 1
dp[3] = 2
dp[4] = 2
dp[5] = 3
dp[6] = 4
dp[7] = 5
for i in 8 ... 100 { dp[i] = dp[i-1] + dp[i-5] }
for i in arr { print(dp[i-1]) }

