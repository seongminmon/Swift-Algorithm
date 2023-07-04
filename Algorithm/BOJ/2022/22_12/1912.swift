//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/08.
//
// 1912 : 연속합
// https://www.acmicpc.net/problem/1912

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
var result = arr.max()!
var temp = 0
if result >= 0 {
    for i in 0 ..< n {
        temp = max(temp+arr[i], arr[i])
        result = max(result, temp)
    }
}

// 출력
print(result)
