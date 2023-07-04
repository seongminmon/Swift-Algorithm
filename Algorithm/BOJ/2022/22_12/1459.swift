//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/21.
//
// 1459 : 걷기
// https://www.acmicpc.net/problem/1459

import Foundation

// 입력
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (x,y,w,s) = (input[0], input[1], input[2], input[3])

// 풀이
var result = 0
if s > 2*w {
    result = (x+y) * w
} else if s < w {
    if abs(x-y) % 2 == 0 {
        result = max(x,y) * s
    } else {
        result = (max(x,y)-1) * s + w
    }
} else {
    result = min(x,y) * s + abs(x-y) * w
}

// 출력
print(result)
