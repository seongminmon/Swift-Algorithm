//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 8/6/24.
//
// 1019 : 책 페이지
// https://www.acmicpc.net/problem/1019

import Foundation

let n = Int(readLine()!)!

var check = [Int](repeating: 0, count: 10)

func calc(_ n: Int, _ ten: Int) {
    var n = n
    while n > 0 {
        check[Int(n) % 10] += ten
        n /= 10
    }
}

func solve(_ a: Int, _ b: Int, _ ten: Int) {
    var a = a
    var b = b
    
    while a % 10 != 0 && a <= b {
        calc(a, ten)
        a += 1
    }
    if a > b { return }
    
    while b % 10 != 9 && b >= a {
        calc(b, ten)
        b -= 1
    }
    
    let cnt = (b / 10 - a / 10 + 1)
    for i in 0..<10 {
        check[i] += cnt * ten
    }
    
    solve(a / 10, b / 10, ten * 10)
}

solve(1, n, 1)

for i in 0..<10 {
    print(check[i], terminator: " ")
}
