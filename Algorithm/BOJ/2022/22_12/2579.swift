//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/10.
//
// 2579 : 계단 오르기
// https://www.acmicpc.net/problem/2579

import Foundation

// 입력
let n = Int(readLine()!)!
var stairs = [0,0]
for _ in 0 ..< n {
    stairs.append(Int(readLine()!)!)
}

// 풀이
var dp = [Int](repeating: 0, count: n+2)
dp[2] = stairs[2]
for i in 3 ..< n+2 {
    dp[i] = stairs[i]
          + max(dp[i-2], dp[i-3] + stairs[i-1])
}

// 출력
//print(dp)
print(dp.last!)
