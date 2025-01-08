//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/8/25.
//
// 10991 : 별 찍기 - 16
// https://www.acmicpc.net/problem/10991

import Foundation

let n = Int(readLine()!)!
for i in 0..<n {
    print(String(repeating: " ", count: n - i - 1) + "*" + String(repeating: " *", count: i))
}
