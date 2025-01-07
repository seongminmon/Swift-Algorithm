//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/7/25.
//
// 2675 : 문자열 반복
// https://www.acmicpc.net/problem/2675

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let (r, s) = (Int(input[0])!, input[1].map { String($0) })
    var p = ""
    for ch in s {
        for _ in 0..<r {
            p.append(ch)
        }
    }
    print(p)
}
