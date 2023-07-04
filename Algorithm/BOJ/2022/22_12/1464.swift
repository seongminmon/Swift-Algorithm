//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/24.
//
// 1464 : 뒤집기 3
// https://www.acmicpc.net/problem/1464

import Foundation

// 입력
let str = readLine()!.map{ String($0) }

// 풀이
var result = [str[0]]
for i in 1 ..< str.count {
    if result[0] < str[i] {
        result.append(str[i])
    } else {
        result.reverse()
        result.append(str[i])
        result.reverse()
    }
}

// 출력
print(result.joined())
