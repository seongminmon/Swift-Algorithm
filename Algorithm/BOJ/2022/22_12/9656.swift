//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/17.
//
// 9656 : 돌 게임 2
// https://www.acmicpc.net/problem/9656

import Foundation

let n = Int(readLine()!)!

if n % 4 == 0 || n % 4 == 2 {
    print("SK")
} else {
    print("CY")
}
