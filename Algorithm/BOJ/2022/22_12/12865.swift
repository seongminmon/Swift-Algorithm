//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/13.
//
// 12865 : 평범한 배낭
// https://www.acmicpc.net/problem/12865

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var w = [0]
var v = [0]
for _ in 0 ..< n {
    let wv = readLine()!.split(separator: " ").map{ Int(String($0))! }
    w.append(wv[0])
    v.append(wv[1])
}

// 풀이
var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
for i in 1 ... n {
    for j in 1 ... k {
        if j >= w[i] {
            dp[i][j] = max(dp[i-1][j],
                           dp[i-1][j - w[i]] + v[i])
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

// 출력
//for i in dp { print(i) }
print(dp[n][k])
