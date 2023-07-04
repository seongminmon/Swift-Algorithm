//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/05.
//
// 9095 : 1,2,3 더하기
// https://www.acmicpc.net/problem/9095

import Foundation

let t = Int(readLine()!)!

var dp = [Int](repeating: 0, count: 11)
dp[1] = 1
dp[2] = 2
dp[3] = 4
for i in 4 ... 10 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

var result = ""
for _ in 0 ..< t {
    let num = Int(readLine()!)!
    result += "\(dp[num])\n"
}
print(result)
