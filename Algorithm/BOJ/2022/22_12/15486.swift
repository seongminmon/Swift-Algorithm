//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 15486 : 퇴사 2
// https://www.acmicpc.net/problem/15486

import Foundation

// 입력
let n = Int(readLine()!)!
var t = [0]
var p = [0]
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    t.append(input[0])
    p.append(input[1])
}

// 풀이
var dp = [Int](repeating: 0, count: n+2)
for i in stride(from: n, through: 1, by: -1) {
    if i + t[i] <= n+1 {
        dp[i] = max(dp[i+1], dp[i + t[i]] + p[i])
    } else {
        dp[i] = dp[i+1]
    }
}

// 출력
print(dp[1])
