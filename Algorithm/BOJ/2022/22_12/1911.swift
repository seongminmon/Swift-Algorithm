//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/21.
//
// 1911 : 흙길 보수하기
// https://www.acmicpc.net/problem/1911

import Foundation

let nl = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,l) = (nl[0], nl[1])

var arr = [(Int, Int)]()
for _ in 0..<n {
    let se = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append((se[0], se[1]))
}

arr.sort { $0.0 < $1.0 }

var ans = 0
var loc = 0
for (s,e) in arr {
    if loc > e { continue }
    
    loc = max(loc, s)
    
    let dist = e - loc
    let val = dist % l == 0 ? dist / l : dist / l + 1
    
    loc += l * val
    ans += val
}
print(ans)
