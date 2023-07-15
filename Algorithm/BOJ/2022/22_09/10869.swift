//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/28.
//
// 10869 : 사칙연산
// https://www.acmicpc.net/problem/10869

import Foundation

let ab = readLine()!.split(separator: " ").map {Int(String($0))!}
let (a,b) = (ab[0],ab[1])

print(a+b)
print(a-b)
print(a*b)
print(a/b)
print(a%b)
