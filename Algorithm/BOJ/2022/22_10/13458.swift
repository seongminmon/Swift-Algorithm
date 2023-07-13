//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/08.
//
// 13458 : 시험 감독
// https://www.acmicpc.net/problem/13458

import Foundation

// 입력
let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
let bc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (b,c) = (bc[0], bc[1])

// 풀이
var result = 0
for i in 0 ..< n {
    a[i] -= b
    result += 1
    
    if a[i] > 0 {
        if a[i] % c == 0 {
            result += a[i] / c
        } else {
            result += a[i] / c + 1
        }
    }
}

// 출력
print(result)
