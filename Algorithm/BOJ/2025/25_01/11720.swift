//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/7/25.
//
// 11720 : 숫자의 합
// https://www.acmicpc.net/problem/11720

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.map { Int(String($0))! }
print(arr.reduce(0, +))
