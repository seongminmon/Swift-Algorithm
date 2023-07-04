//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/10.
//
// 2565 : 전깃줄
// https://www.acmicpc.net/problem/2565

import Foundation

// 입력
let n = Int(readLine()!)!
var AB = [(Int,Int)]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    AB.append((input[0], input[1]))
}

// 풀이
AB.sort{ $0.0 < $1.0 }
var B = AB.map{ $0.1 }

var dp = [Int](repeating: 1, count: n)
for i in 1 ..< n {
    for j in 0 ..< i {
        if B[j] < B[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

// 출력
print(n - dp.max()!)
