//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/08.
//
// 5585 : 거스름돈
// https://www.acmicpc.net/problem/5585

import Foundation

var value = 1000 - Int(readLine()!)!
var ans = 0
var arr = [500, 100, 50, 10, 5, 1]
for num in arr {
    ans += value / num
    value %= num
}
print(ans)
