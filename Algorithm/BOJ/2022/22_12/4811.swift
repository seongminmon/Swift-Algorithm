//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/19.
//
// 4811 : 알약
// https://www.acmicpc.net/problem/4811

import Foundation

// 입력
var arr = [Int]()
while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    arr.append(n)
}

// 풀이
var dp = [Int](repeating: 0, count: 31)
dp[0] = 1

for i in 1 ... 30 {
    for j in 0 ..< i {
        dp[i] += dp[j] * dp[i-1-j]
    }
}

// 출력
var result = ""
for i in arr {
    result += "\(dp[i])\n"
}
print(result)
