//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 1965 : 상자넣기
// https://www.acmicpc.net/problem/1965

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
var dp = [Int](repeating: 1, count: n)
for i in 0 ..< n {
    for j in 0 ..< i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

// 출력
//print(dp)
print(dp.max()!)
