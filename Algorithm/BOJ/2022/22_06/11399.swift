//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/20.
//
// 11399 : ATM
// https://www.acmicpc.net/problem/11399

import Foundation

let n = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map{ Int($0)! }
times.sort()

var ans = 0
for i in (0..<n).reversed() {
    ans += (i+1) * times[n-i-1]
}
print(ans)
