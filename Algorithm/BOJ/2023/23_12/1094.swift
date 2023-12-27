//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/17/23.
//
// 1094 : 막대기
// https://www.acmicpc.net/problem/1094

import Foundation

var x = Int(readLine()!)!
var cnt = 0
while x > 0 {
    if x % 2 != 0 {
        cnt += 1
    }
    x /= 2
}
print(cnt)
