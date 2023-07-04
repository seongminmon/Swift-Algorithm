//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/12.
//
// 1043 : 거짓말
// https://www.acmicpc.net/problem/1043

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var parents = [Int](repeating: 0, count: n+1)
for i in 0...n { parents[i] = i }

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 1..<input.count { parents[input[i]] = 0 }

func find(_ x: Int) -> Int {
    if x != parents[x] {
        parents[x] = find(parents[x])
    }
    return parents[x]
}

func union(_ x: Int, _ y: Int) {
    let x = find(x)
    let y = find(y)
    
    if x > y {
        parents[x] = y
    } else {
        parents[y] = x
    }
}

var parties = [[Int]]()
for _ in 0..<m {
    let party = readLine()!.split(separator: " ").map { Int(String($0))! }
    parties.append(party)
    
    for i in stride(from: 2, to: party.count, by: 1) {
        union(party[i-1], party[i])
    }
}

var ans = 0
for party in parties {
    var isTrue = false
    for i in 1..<party.count {
        if find(party[i]) == 0 {
            isTrue = true
            break
        }
    }
    if !isTrue { ans += 1 }
}
print(ans)
