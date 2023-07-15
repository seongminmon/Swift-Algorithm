//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/06.
//
// 1463 : 1로 만들기
// https://www.acmicpc.net/problem/1463

import Foundation

let n = Int(readLine()!)!
var dpTable = [Int](repeating: n, count: n*5)
dpTable[1] = 0

for i in 1 ... n {
    dpTable[i*3] = min(dpTable[i]+1, dpTable[i*3])
    dpTable[i*2] = min(dpTable[i]+1, dpTable[i*2])
    dpTable[i+1] = min(dpTable[i]+1, dpTable[i+1])
}
print(dpTable[n])
