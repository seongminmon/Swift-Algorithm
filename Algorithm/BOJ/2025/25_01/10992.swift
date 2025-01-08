//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/7/25.
//
// 10992 : 별 찍기 - 17
// https://www.acmicpc.net/problem/10992

import Foundation

let n = Int(readLine()!)!
for i in 0..<n {
    if i == 0 {
        print(String(repeating: " ", count: n-1) + "*")
    } else if i == n-1 {
        print(String(repeating: "*", count: 2 * (n - 1) + 1))
    } else {
        print(String(repeating: " ", count: n - i - 1) + "*" + String(repeating: " ", count: 2 * (i - 1) + 1) + "*")
    }
}
