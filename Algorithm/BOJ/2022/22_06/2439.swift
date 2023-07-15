//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/20.
//
// 2439 : 별 찍기 - 2
// https://www.acmicpc.net/problem/2439

import Foundation

let n = Int(readLine()!)!

for i in 1 ... n {
    var star: String = ""
    for _ in 0 ..< n-i {
        star += " "
    }
    for _ in 0 ..< i {
        star += "*"
    }
    print(star)
}

