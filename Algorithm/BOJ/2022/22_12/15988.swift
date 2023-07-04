//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 15988 : 1,2,3 더하기 3
// https://www.acmicpc.net/problem/15988

import Foundation

// 입력
let t = Int(readLine()!)!
var arr = [Int]()
for _ in 0 ..< t {
    arr.append(Int(readLine()!)!)
}

// 풀이
let mod = 1000000009
var dp = [Int](repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4
for i in 4 ... 1000000 {
    dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % mod
}

// 출력
var result = ""
for i in arr {
    result += "\(dp[i])\n"
}
print(result)
