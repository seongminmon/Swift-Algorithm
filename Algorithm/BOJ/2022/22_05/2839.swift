//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/05/29.
//
// 2839 : 설탕 배달
// https://www.acmicpc.net/problem/2839

import Foundation

// 동적 계획법
let n = Int(readLine()!)!
var arr: [Int] = Array(repeating: 5001, count: n+5)
arr[3] = 1
arr[5] = 1

if n>5 {
    for i in 6...n {
        arr[i] = min(arr[i-3], arr[i-5]) + 1
    }
}

if arr[n] < 5001 {
    print(arr[n])
} else {
    print(-1)
}
