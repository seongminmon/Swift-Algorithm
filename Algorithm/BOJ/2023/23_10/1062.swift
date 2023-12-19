//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/16.
//
// 1062 : 가르침
// https://www.acmicpc.net/problem/1062

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])

let aAscii = Int(Character("a").asciiValue!)
var bitmaskList = [Int](repeating: 0, count: n)
for i in 0..<n {
    let word = readLine()!
    for ch in word {
        let bit = Int(ch.asciiValue!) - aAscii
        bitmaskList[i] |= (1 << bit)
    }
}

var ans = 0
let alphabet = "antic"
var bitmask = 0
for ch in alphabet {
    let bit = Int(ch.asciiValue!) - aAscii
    bitmask |= (1 << bit)
}

func dfs(_ depth: Int, _ start: Int) {
    if depth == k {
        var cnt = 0
        for i in 0..<n {
            if bitmaskList[i] & bitmask == bitmaskList[i] {
                cnt += 1
            }
        }
        ans = max(ans, cnt)
        return
    }
    
    for i in start..<26 {
        if bitmask & (1 << i) == 0 {
            bitmask |= (1 << i)
            dfs(depth+1, i)
            bitmask &= ~(1 << i)
        }
    }
}

if k < 5 {
    print(0)
} else {
    dfs(5, 0)
    print(ans)
}
