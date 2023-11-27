//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/27/23.
//
// 1159 : 농구 경기
// https://www.acmicpc.net/problem/1159

import Foundation

let n = Int(readLine()!)!
var dict = [String: Int]()
for _ in 0..<n {
    let str = readLine()!
    dict[String(str.first!), default: 0] += 1
}
let ans = dict.filter { $0.value >= 5 }.keys.sorted().joined()
print(ans.isEmpty ? "PREDAJA" : ans)
