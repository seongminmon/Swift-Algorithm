//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 1026 : 보물
// https://www.acmicpc.net/problem/1026

import Foundation

// 입력
let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map{ Int(String($0))! }
var b = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
a.sort()
b.sort(by: >)

var result = 0
for i in 0 ..< n {
    result += a[i] * b[i]
}

// 출력
print(result)
