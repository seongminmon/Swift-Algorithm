//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/08.
//
// 1915 : 가장 큰 정사각형
// https://www.acmicpc.net/problem/1915

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var dp = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    dp.append(input)
}

for i in 1..<n {
    for j in 1..<m {
        if dp[i][j] == 1 {
            dp[i][j] += min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])
        }
    }
}

var ans = 0
for i in 0..<n {
    ans = max(ans, dp[i].max()!)
}
print(ans * ans)
