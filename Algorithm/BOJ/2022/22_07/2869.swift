//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/07/11.
//
// 2869 : 달팽이는 올라가고 싶다
// https://www.acmicpc.net/problem/2869

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = input[0]
let b = input[1]
var v = input[2]

var ans = Int(ceil(Double(v-a) / Double((a-b)))) + 1
print(ans)
