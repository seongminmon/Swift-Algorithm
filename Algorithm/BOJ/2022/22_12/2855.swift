//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/23.
//
// 2855 : 초콜릿 식사
// https://www.acmicpc.net/problem/2855

import Foundation

// 입력
var k = Int(readLine()!)!

// 풀이
var size = 1
while size < k {
    size *= 2
}

var temp = size
var count = 0
while k > 0 {
    if temp > k {
        temp /= 2
        count += 1
    } else {
        k -= temp
    }
}

// 출력
print(size, count)
