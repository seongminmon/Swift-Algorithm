//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/16.
//
// 12026 : BOJ 거리
// https://www.acmicpc.net/problem/12026

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.map{ String($0) }

var dp = [Int](repeating: Int.max, count: n)
dp[0] = 0

for i in 0 ..< n {
    if dp[i] == Int.max { continue }
    
    for j in i+1 ..< n {
        var target = ""
        switch arr[i] {
        case "B": target = "O"
        case "O": target = "J"
        default: target = "B"
        }
        
        if arr[j] == target {
            dp[j] = min(dp[j], dp[i] + (j-i) * (j-i))
        }
    }
}

print(dp[n-1] == Int.max ? -1 : dp[n-1])
