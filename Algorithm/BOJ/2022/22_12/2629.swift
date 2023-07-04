//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/13.
//
// 2629 : 양팔저울
// https://www.acmicpc.net/problem/2629

import Foundation

// 입력
let n = Int(readLine()!)!
var weight = readLine()!.split(separator: " ").map{ Int(String($0))! }
let m = Int(readLine()!)!
var marble = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
let MAX = 40000
var dp = [Bool](repeating: false, count: MAX+1)
dp[weight[0]] = true

for i in 1 ..< n {
    var temp = [weight[i]]
    for j in 1 ... MAX {
        if dp[j] {
            temp.append(abs(j - weight[i]))
            temp.append(j + weight[i])
        }
    }

    for t in temp {
        dp[t] = true
    }
}

// 출력
var result = ""
for i in marble {
    result += "\(dp[i] ? "Y" : "N") "
}
print(result)
