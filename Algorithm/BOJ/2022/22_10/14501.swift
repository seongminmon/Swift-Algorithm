//
//  14501.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/01.
//
// 14501 : 퇴사
// https://www.acmicpc.net/problem/14501

import Foundation

// 입력
let n = Int(readLine()!)!
var time = [Int]()
var price = [Int]()

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    time.append(input[0])
    price.append(input[1])
}

// 풀이
var dp = [Int](repeating: 0, count: n+5)
for i in 0 ..< n {
    if dp[i+1] < dp[i] {
        dp[i+1] = dp[i]
    }
    
    if dp[time[i] + i] < dp[i] + price[i] {
        dp[time[i] + i] = dp[i] + price[i]
    }
}

// 출력
print(dp[n])
