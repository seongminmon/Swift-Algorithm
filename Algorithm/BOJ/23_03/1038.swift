//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/10.
//
// 1038 : 감소하는 수
// https://www.acmicpc.net/problem/1038

import Foundation

let n = Int(readLine()!)!

var result = [0]
func solve(_ selected: [Int]) {
    if !selected.isEmpty {
        let temp = Int(selected.reduce("", { $0 + String($1) }))!
        result.append(temp)
    }
    
    for i in 0 ... 9 {
        if selected.isEmpty {
            if i != 0 {
                solve([i])
            }
        } else {
            if i < selected.last! {
                solve(selected + [i])
            }
        }
    }
}

solve([])
result.sort()

print(n < result.count ? result[n] : -1)
