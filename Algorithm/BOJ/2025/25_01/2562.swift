//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/7/25.
//
// 2562 : 최댓값
// https://www.acmicpc.net/problem/2562

import Foundation

var maxValue = 0
var index = 0
for i in 1...9 {
    let num = Int(readLine()!)!
    if maxValue < num {
        maxValue = num
        index = i
    }
}
print(maxValue)
print(index)
