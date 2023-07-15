//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/05.
//
// 11792 : 하노이 탑 이동 순서
// https://www.acmicpc.net/problem/11792

import Foundation

var n = Int(readLine()!)!

func hanoiNumber(n: Int) -> Int {
    if n == 1 {
        return 1
    } else {
        return Int(pow(2.0, Double(n-1))) + hanoiNumber(n: n-1)
    }
}

func hanoi(n: Int, start: Int, end: Int, extra: Int) {
    if n == 1 {
        print("\(start) \(end)")
    } else {
        hanoi(n: n-1, start: start, end: extra, extra: end)
        print("\(start) \(end)")
        hanoi(n: n-1, start: extra, end: end, extra: start)
    }
}

print(hanoiNumber(n: n))
hanoi(n: n, start: 1, end: 3, extra: 2)

