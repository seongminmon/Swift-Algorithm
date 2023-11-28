//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 1629 : 곱셈
// https://www.acmicpc.net/problem/1629

import Foundation

let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a,b,c) = (abc[0], abc[1], abc[2])

func solve(_ cnt: Int) -> Int {
    if cnt == 1 { return a % c }
    
    var ret = solve(cnt / 2)
    ret = ret * ret % c
    if cnt % 2 == 1 {
        ret = ret * a % c
    }
    return ret
}

print(solve(b))
