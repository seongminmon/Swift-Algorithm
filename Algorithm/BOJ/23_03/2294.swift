//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/10.
//
// 2294 : 동전 2
// https://www.acmicpc.net/problem/2294

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var coins = [Int]()
for _ in 0 ..< n {
    coins.append(Int(readLine()!)!)
}

let INF = Int(1e9)
var dp = [Int](repeating: INF, count: k+1)
for i in 0 ..< n {
    if coins[i] > k { continue }
    
    dp[coins[i]] = 1
    for j in coins[i] ... k {
        dp[j] = min(dp[j], dp[j - coins[i]] + 1)
    }
}
print(dp[k] == INF ? -1 : dp[k])
