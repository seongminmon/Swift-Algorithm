//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/25.
//
// 1806 : 부분합
// https://www.acmicpc.net/problem/1806

import Foundation

let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,s) = (ns[0], ns[1])

let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var sumArr = arr
for i in 1..<n {
    sumArr[i] += sumArr[i-1]
}

var ans = Int.max
var start = 0
var end = 0
while end < n && start <= end {
    let sum = start == 0 ? sumArr[end] : sumArr[end] - sumArr[start-1]
    if sum < s {
        end += 1
    } else {
        ans = min(ans, end - start + 1)
        start += 1
    }
}
print(ans == Int.max ? 0 : ans)
