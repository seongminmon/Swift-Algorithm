//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/02.
//
// 2559 : 수열
// https://www.acmicpc.net/problem/2559

import Foundation

let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,k) = (nk[0], nk[1])
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

var sumArr = [Int](repeating: 0, count: n)
sumArr[0] = arr[0]
for i in 1 ..< n {
    sumArr[i] = sumArr[i-1] + arr[i]
}

var MAX = sumArr[k-1]
for i in 1 ..< n {
    if i + k - 1 < n {
        let temp = sumArr[i + k - 1] - sumArr[i-1]
        MAX = max(MAX, temp)
    }
}
print(MAX)
