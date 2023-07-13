//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/11.
//
// 12865 : 평범한 배낭
// https://www.acmicpc.net/problem/12865

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var weight = [0]
var value = [0]
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    weight.append(input[0])
    value.append(input[1])
}

// 풀이
// 1. 2차원 dp 풀이
//var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1),count: n+1)
//for i in 1 ... n {
//    for j in 1 ... k {
//        if j >= weight[i] {
//            dp[i][j] = max(dp[i-1][j],
//                           dp[i-1][j - weight[i]] + value[i])
//        } else {
//            dp[i][j] = dp[i-1][j]
//        }
//    }
//}

// 2. 1차원 dp 풀이
var dp = [Int](repeating: 0, count: k+1)
for i in 1 ... n {
    for j in stride(from: k, to: 0, by: -1) {
        if j >= weight[i] {
            dp[j] = max(dp[j], dp[j - weight[i]] + value[i])
        }
    }
}

// 출력
//print(dp[n][k])
print(dp[k])
