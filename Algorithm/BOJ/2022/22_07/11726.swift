//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/09.
//
// 11726 : 2*n 타일링
// https://www.acmicpc.net/problem/11726

import Foundation

let n = Int(readLine()!)!
var dpTable = [Int](repeating: 0, count: n+2)
dpTable[1] = 1
dpTable[2] = 2

if n > 2 {
    for i in 3 ... n {
        dpTable[i] = (dpTable[i-1] + dpTable[i-2]) % 10007
    }
}
print(dpTable[n])
