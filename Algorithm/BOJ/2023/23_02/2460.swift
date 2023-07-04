//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 2460 : 지능형 기차2
// https://www.acmicpc.net/problem/2460

import Foundation

var result = 0
var temp = 0
for _ in 0 ..< 10 {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    temp += input[1] - input[0]
    result = max(result, temp)
}
print(result)
