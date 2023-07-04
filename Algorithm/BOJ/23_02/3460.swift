//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 3460 : 이진수
// https://www.acmicpc.net/problem/3460

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    let n = Int(readLine()!)!
    let str = String(n, radix: 2).reversed().map{ String($0) }
    
    for i in 0 ..< str.count {
        if str[i] == "1" {
            print(i, terminator: " ")
        }
    }
}
