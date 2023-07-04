//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/30.
//
// 17404 : RGB거리 2
// https://www.acmicpc.net/problem/17404

import Foundation

// 입력
let n = Int(readLine()!)!
var rgb = [[Int]]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    rgb.append(input)
}

// 풀이
let MAX = Int(1e9)
var dp = [[Int]](repeating: [0,0,0], count: n)
var result = MAX

for j in 0 ..< 3 {
    let j1 = (j+1) % 3
    let j2 = (j+2) % 3
    
    dp[0][j] = rgb[0][j]
    dp[0][j1] = MAX
    dp[0][j2] = MAX
    
    for i in 1 ..< n {
        dp[i][0] = rgb[i][0]
                 + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = rgb[i][1]
                 + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = rgb[i][2]
                 + min(dp[i-1][0], dp[i-1][1])
    }
    
    result = min(result, dp[n-1][j1], dp[n-1][j2])
}

// 출력
print(result)
