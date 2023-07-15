//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/12.
//
// 2231 : 분해합
// https://www.acmicpc.net/problem/2231

import Foundation

var n = Int(readLine()!)!

for i in 1 ... n {
    let a = i / 100000
    let b = i / 10000 - a * 10
    let c = i / 1000 - a * 100 - b * 10
    let d = i / 100 - a * 1000 - b * 100 - c * 10
    let e = i / 10 - a * 10000 - b * 1000 - c * 100 - d * 10
    let f = i % 10
    let decompose = i+a+b+c+d+e+f
    if decompose == n {
        print(i)
        break
    } else if i == n {
        print(0)
    }
}
