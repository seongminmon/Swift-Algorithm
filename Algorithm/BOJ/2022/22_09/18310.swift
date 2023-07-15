//
//  18310.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/22.
//
// 18310 : 안테나
// https://www.acmicpc.net/problem/18310

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map {Int(String($0))!}

// 풀이
arr.sort()

var sumArr = [Int](repeating: 0, count: n)
var sum = 0
for i in 1 ..< n {
    sum += arr[i] - arr[0]
}
sumArr[0] = sum

for i in 1 ..< n {
    let diff = arr[i] - arr[i-1]
    sumArr[i] = sumArr[i-1]
    sumArr[i] -= diff * (n-i-1)
    sumArr[i] += diff * (i-1)
}

// 출력
var Min = sumArr.min()!
var ans = arr[sumArr.firstIndex(of: Min)!]
print(ans)
