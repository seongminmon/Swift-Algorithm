//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/08.
//
// 1789 : 수들의 합
// https://www.acmicpc.net/problem/1789

import Foundation

var s = Int(readLine()!)!

var num = 1
var result = 0
while s > 0 {
    s -= num
    num += 1
    result += 1
}
if s < 0 {
    result -= 1
}
print(result)
