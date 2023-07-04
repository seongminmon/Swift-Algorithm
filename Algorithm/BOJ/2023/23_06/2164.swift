//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/01.
//
// 2164 : 카드2
// https://www.acmicpc.net/problem/2164

import Foundation

let n = Int(readLine()!)!
var arr = Array(1...n)
var idx = 0
for _ in 1..<n {
    idx += 1
    arr.append(arr[idx])
    idx += 1
}
print(arr.last!)
