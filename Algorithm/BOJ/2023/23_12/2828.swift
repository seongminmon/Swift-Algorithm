//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/3/23.
//
// 2828 : 사과 담기 게임
// https://www.acmicpc.net/problem/2828

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var s = 0
var e = m - 1
var ans = 0

let cnt = Int(readLine()!)!
for _ in 0..<cnt {
    let loc = Int(readLine()!)! - 1
    if loc < s {
        // 왼쪽 이동
        let diff = s - loc
        ans += diff
        s -= diff
        e -= diff
    } else if loc > e {
        // 오른쪽 이동
        let diff = loc - e
        ans += diff
        s += diff
        e += diff
    }
}
print(ans)
