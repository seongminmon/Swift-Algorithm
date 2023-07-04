//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/23.
//
// 1461 : 도서관
// https://www.acmicpc.net/problem/1461

import Foundation

// 입력
let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
var bookPlus = [Int]()
var bookMinus = [Int]()
for i in 0 ..< n {
    if arr[i] > 0 {
        bookPlus.append(arr[i])
    } else {
        bookMinus.append(-arr[i])
    }
}

bookPlus.sort(by: >)
bookMinus.sort(by: >)

var result = 0
var MaxDist = 0
func solve(_ arr: [Int]) {
    var i = 0
    while i < arr.count {
        MaxDist = max(MaxDist, arr[i])
        result += arr[i] * 2
        
        if i + m < arr.count {
            i += m
        } else {
            break
        }
    }
}

solve(bookPlus)
solve(bookMinus)

// 출력
print(result - MaxDist)
