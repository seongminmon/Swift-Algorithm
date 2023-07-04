//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/08.
//
// 2293 : 동전 1
// https://www.acmicpc.net/problem/2293

import Foundation

// 입력
let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var coins = [Int]()
for _ in 0 ..< n {
    coins.append(Int(readLine()!)!)
}

// 풀이
var dp = [Int](repeating: 0, count: k+1)
dp[0] = 1
for coin in coins {
    for j in 1 ... k {
        if j-coin >= 0 {
            dp[j] += dp[j-coin]
            if dp[j] > Int(pow(2.0, 31.0)) {
                dp[j] = 0
            }
        }
    }
}

// 출력
print(dp[k])
