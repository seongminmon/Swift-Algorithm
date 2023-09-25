//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/24.
//
// 1744 : 수 묶기
// https://www.acmicpc.net/problem/1744

import Foundation

let n = Int(readLine()!)!
var positiveArr = [Int]()
var negativeArr = [Int]()
for _ in 0..<n {
    let num = Int(readLine()!)!
    if num > 0 {
        positiveArr.append(num)
    } else {
        negativeArr.append(num)
    }
}

positiveArr.sort(by: >)
negativeArr.sort(by: <)

var ans = 0
var idx = 0
while idx < positiveArr.count {
    if idx+1 < positiveArr.count && positiveArr[idx] > 1 && positiveArr[idx+1] > 1 {
        ans += positiveArr[idx] * positiveArr[idx+1]
        idx += 2
    } else {
        ans += positiveArr[idx]
        idx += 1
    }
}

idx = 0
while idx < negativeArr.count {
    if idx+1 < negativeArr.count {
        ans += negativeArr[idx] * negativeArr[idx+1]
        idx += 2
    } else {
        ans += negativeArr[idx]
        idx += 1
    }
}

print(ans)
