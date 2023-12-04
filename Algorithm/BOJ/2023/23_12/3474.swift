//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/3/23.
//
// 3474 : 교수가 된 현우
// https://www.acmicpc.net/problem/3474

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let num = Int(readLine()!)!
    var ans = 0
    var i = 5
    while i <= num {
        ans += num / i
        i *= 5
    }
    print(ans)
}
