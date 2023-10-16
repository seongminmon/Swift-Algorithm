//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/14.
//
// 10986 : 나머지 합
// https://www.acmicpc.net/problem/10986

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var sumArr = arr
for i in 1..<n {
    sumArr[i] += sumArr[i-1]
}

var count = [Int](repeating: 0, count: m)
for i in 0..<n {
    count[sumArr[i] % m] += 1
}

var ans = count[0]
for i in 0..<m {
    ans += count[i] * (count[i] - 1) / 2
}
print(ans)
