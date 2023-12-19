//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/17/23.
//
// 1094 : 막대기
// https://www.acmicpc.net/problem/1094

import Foundation

let x = Int(readLine()!)!
let bitmask = String(x, radix: 2)

var ans = 0
for i in bitmask {
    if i == "1" {
        ans += 1
    }
}
print(ans)
