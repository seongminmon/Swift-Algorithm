//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/20.
//
// 16967 : 배열 복원하기
// https://www.acmicpc.net/problem/16967

import Foundation

let hwxy = readLine()!.split(separator: " ").map { Int(String($0))! }
let (h,w,x,y) = (hwxy[0], hwxy[1], hwxy[2], hwxy[3])

var b = [[Int]]()
for _ in 0..<h+x {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    b.append(input)
}

var a = [[Int]](repeating: [Int](repeating: 0, count: w), count: h)
for i in 0..<h {
    for j in 0..<w {
        if i < x {
            a[i][j] = b[i][j]
        } else {
            if j < y {
                a[i][j] = b[i][j]
            } else {
                a[i][j] = b[i][j] - a[i-x][j-y]
            }
        }
    }
}

for i in 0..<h {
    print(a[i].map { String($0) }.joined(separator: " "))
}
