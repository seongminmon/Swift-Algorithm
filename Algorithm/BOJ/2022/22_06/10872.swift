//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/17.
//
// 10872 : 팩토리얼
// https://www.acmicpc.net/problem/10872

import Foundation

let n = Int(readLine()!)!

func facto(x: Int) -> Int {
    if x == 0 {
        return 1
    } else {
        return x * facto(x: x-1)
    }
}

print(facto(x: n))
