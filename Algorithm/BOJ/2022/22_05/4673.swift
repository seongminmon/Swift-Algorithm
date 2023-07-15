//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/05/19.
//
// 4673 : 셀프 넘버
// https://www.acmicpc.net/problem/4673

import Foundation

func dn(_ n: Int) -> Int {
    var n = n
    var sum = n
    while n != 0 {
        sum += n % 10
        n /= 10
    }
    return sum
}

var isSelfNumber = [Bool](repeating: true, count: 10001)
for i in 1...10000 {
    let num = dn(i)
    if num <= 10000 {
        isSelfNumber[num] = false
    }
}

var result = ""
for i in 1...10000 {
    if isSelfNumber[i] {
        result += "\(i)\n"
    }
}
print(result)
