//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 1874 : 스택 수열
// https://www.acmicpc.net/problem/1874

import Foundation

// 입력
let n = Int(readLine()!)!
var sequence = [Int]()
for _ in 0 ..< n {
    sequence.append(Int(readLine()!)!)
}

// 풀이
var pushArr = [Int]()
var popArr = [Int]()

var idx = 0
var num = 1
var result = ""
while num <= n {
    if !pushArr.isEmpty, sequence[idx] == pushArr.last! {
        // pop
        popArr.append(pushArr.popLast()!)
        idx += 1
        result += "-\n"
    } else {
        // push
        pushArr.append(num)
        num += 1
        result += "+\n"
    }
}

while !pushArr.isEmpty {
    // pop
    popArr.append(pushArr.popLast()!)
    result += "-\n"
}

// 출력
if sequence == popArr {
    print(result)
} else {
    print("NO")
}
