//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/11.
//
// 2012 : 등수 매기기
// https://www.acmicpc.net/problem/2012

import Foundation

let n = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var ans = 0
for i in 0..<n {
    ans += abs(i + 1 - arr[i])
}
print(ans)
