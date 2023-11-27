//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/27/23.
//
// 2979 : 트럭 주차
// https://www.acmicpc.net/problem/2979

import Foundation

let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (a,b,c) = (abc[0], abc[1], abc[2])

var arr = [(Int,Int)]()
for _ in 0..<3 {
    let se = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (s,e) = (se[0], se[1])
    arr.append((s,e))
}

var ans = 0
for time in 1..<100 {
    var cnt = 0
    for (s,e) in arr {
        if s <= time && time < e {
            cnt += 1
        }
    }
    
    switch cnt {
    case 1: ans += a
    case 2: ans += b*2
    case 3: ans += c*3
    default: break
    }
}
print(ans)
