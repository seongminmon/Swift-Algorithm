//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 3/19/24.
//
// 15662 : 톱니바퀴 (2)
// https://www.acmicpc.net/problem/15662

import Foundation

let t = Int(readLine()!)!
var arr = [[Int]]()
for _ in 0..<t {
    let input = readLine()!.map { Int(String($0))! }
    arr.append(input)
}

func rotate(_ idx: Int, _ d: Int) {
    // 시계 방향
    if d == 1 {
        let temp = arr[idx].removeLast()
        arr[idx].insert(temp, at: 0)
    } else {
        // 반시계 방향
        let temp = arr[idx].removeFirst()
        arr[idx].append(temp)
    }
}

func solve(_ idx: Int, _ d: Int) {
    var result = [(idx, d)]
    
    // 왼쪽
    var nd = d
    for left in stride(from: idx-1, through: 0, by: -1) {
        if arr[left][2] == arr[left+1][6] { break }
        nd = nd == 1 ? -1 : 1
        result.append((left, nd))
    }
    
    // 오른쪽
    nd = d
    for right in stride(from: idx+1, to: t, by: 1) {
        if arr[right][6] == arr[right-1][2] { break }
        nd = nd == 1 ? -1 : 1
        result.append((right, nd))
    }
    
    // 회전
    for (idx, d) in result {
        rotate(idx, d)
    }
}

let k = Int(readLine()!)!
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (idx, d) = (input[0]-1, input[1])
    solve(idx, d)
}

var ans = 0
for i in 0..<t {
    ans += arr[i][0]
}
print(ans)
