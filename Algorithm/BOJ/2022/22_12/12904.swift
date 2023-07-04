//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/23.
//
// 12904 : A와 B
// https://www.acmicpc.net/problem/12904

import Foundation

// 입력
let s = readLine()!.map{ String($0) }
var t = readLine()!.map{ String($0) }

// 풀이
while t.count > s.count {
    if t.last! == "A" {
        t.removeLast()
    } else if t.last! == "B" {
        t.removeLast()
        t.reverse()
    }
}

// 출력
print(s == t ? 1 : 0)
