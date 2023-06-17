//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/14.
//
// 8980 : 택배
// https://www.acmicpc.net/problem/8980

import Foundation

struct Box {
    var start: Int
    var end: Int
    var cnt: Int
}

let nc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,c) = (nc[0], nc[1])

let m = Int(readLine()!)!
var boxes = [Box]()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    boxes.append(Box(start: input[0], end: input[1], cnt: input[2]))
}
boxes.sort { $0.end < $1.end }

var ans = 0
var counts = [Int](repeating: 0, count: n+1)
for box in boxes {
    let maxCnt = counts[box.start..<box.end].max()!
    let count = min(box.cnt, c - maxCnt)
    for i in box.start..<box.end {
        counts[i] += count
    }
    ans += count
}
print(ans)
