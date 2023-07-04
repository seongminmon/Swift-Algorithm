//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 16194 : 카드 구매하기 2
// https://www.acmicpc.net/problem/16194

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
let MAX = Int(1e9)
var dp = [Int](repeating: MAX, count: n+1)

dp[0] = 0
for i in 0 ..< arr.count {
    for j in 1 ... n {
        if j >= i+1 {
            dp[j] = min(dp[j], dp[j-(i+1)] + arr[i])
        }
    }
}

// 출력
//print(dp)
print(dp[n])
