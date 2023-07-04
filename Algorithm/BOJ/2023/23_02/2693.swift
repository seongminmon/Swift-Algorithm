//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/14.
//
// 2693 : N번째 큰 수
// https://www.acmicpc.net/problem/2693

import Foundation

let t = Int(readLine()!)!
for _ in 0 ..< t {
    var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted(by: >)
    print(arr[2])
}
