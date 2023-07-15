//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/28.
//
// 3003 : 킹, 퀸, 룩, 비숍, 나이트, 폰
// https://www.acmicpc.net/problem/3003

import Foundation

// 입력
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}

// 풀이+출력
var standard = [1,1,2,2,2,8]
for i in 0 ..< arr.count {
    standard[i] -= arr[i]
    print(standard[i], terminator: " ")
}

