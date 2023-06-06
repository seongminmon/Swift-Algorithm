//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/16.
//
// 5557 : 1학년
// https://www.acmicpc.net/problem/5557

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

var dp = [[Int]](repeating: [Int](repeating: 0, count: 21), count: n-1)
dp[0][arr[0]] = 1

for i in 1 ..< n-1 {
    for j in 0 ... 20 {
        if dp[i-1][j] == 0 { continue }
        
        if j + arr[i] <= 20 {
            dp[i][j + arr[i]] += dp[i-1][j]
        }
        if j - arr[i] >= 0 {
            dp[i][j - arr[i]] += dp[i-1][j]
        }
    }
}

print(dp[n-2][arr[n-1]])
