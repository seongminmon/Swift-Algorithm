//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/20.
//
// 1541 : 잃어버린 괄호
// https://www.acmicpc.net/problem/1541

import Foundation

var formula = readLine()!

var a = formula.split(separator: "-")
var b = a.map{ $0.split(separator: "+") }
var c = [[Int]](repeating: [], count: b.count)
for i in 0 ..< b.count {
    c[i] = b[i].map{ Int($0)! }
}

var sum = c[0].reduce(0, +)
var minus: Int
for i in 1 ..< c.count {
    minus = c[i].reduce(0, +)
    sum -= minus
}

print(sum)
