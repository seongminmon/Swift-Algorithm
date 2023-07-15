//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/27.
//
// 2525 : 오븐 시계
// https://www.acmicpc.net/problem/2525

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var a = input[0]
var b = input[1]
let c = Int(readLine()!)!

b += c
a += b / 60
b %= 60
a %= 24
print(a,b)
