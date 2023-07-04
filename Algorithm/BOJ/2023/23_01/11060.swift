//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/13.
//
// 11060 : 점프 점프
// https://www.acmicpc.net/problem/11060

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

let INF = Int(1e9)
var dp = [Int](repeating: INF, count: n)
dp[0] = 0

var queue = [0]
var idx = 0

while idx < queue.count {
    let now = queue[idx]
    idx += 1
    
    for i in 0 ... arr[now] {
        let next = now + i
        if next < n, dp[next] > dp[now] + 1 {
            dp[next] = dp[now] + 1
            queue.append(next)
        }
    }
}

print(dp[n-1] != INF ? dp[n-1] : -1)
