//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/23.
//
// 1932 : 정수 삼각형
// https://www.acmicpc.net/problem/1932

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [[Int]](repeating: [], count: n)
for i in 0 ..< n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    arr[i] = input
}

// 풀이
var dpTable = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
dpTable[0][0] = arr[0][0]

for i in 1 ..< n {
    for j in 0 ... i {
        dpTable[i][j] = arr[i][j]
        if j == 0 {
            dpTable[i][j] += dpTable[i-1][j]
        } else if j == i {
            dpTable[i][j] += dpTable[i-1][j-1]
        } else {
            dpTable[i][j] += max(dpTable[i-1][j-1], dpTable[i-1][j])
        }
    }
}

// 출력
print(dpTable[n-1].max()!)
