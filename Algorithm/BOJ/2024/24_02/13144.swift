//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/17/24.
//
// 13144 : List of Unique Numbers
// https://www.acmicpc.net/problem/13144

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var check = [Bool](repeating: false, count: 100_001)
check[arr[0]] = true

var ans = 0
var e = 0
for s in 0..<n {
    while e < n-1 && !check[arr[e+1]] {
        e += 1
        check[arr[e]] = true
    }
    check[arr[s]] = false
    ans += e - s + 1
}
print(ans)
