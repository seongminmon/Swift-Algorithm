//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/07.
//
// 2251 : 물통
// https://www.acmicpc.net/problem/2251

import Foundation

let size = readLine()!.split(separator: " ").map { Int(String($0))! }
let (aSize, bSize, cSize) = (size[0], size[1], size[2])

var visited = [[Bool]](repeating: [Bool](repeating: false, count: bSize+1), count: aSize+1)
var queue = [(0,0)]
var idx = 0

while idx < queue.count {
    let (a,b) = queue[idx]
    let c = cSize - a - b
    idx += 1
    
    if visited[a][b] { continue }
    visited[a][b] = true
    
    if a > 0 {
        if a > bSize - b {
            queue.append((a - bSize + b, bSize))
        } else {
            queue.append((0, b + a))
        }
        if a > cSize - c {
            queue.append((a - cSize + c, b))
        } else {
            queue.append((0, b))
        }
    }
    
    if b > 0 {
        if b > aSize - a {
            queue.append((aSize, b - aSize + a))
        } else {
            queue.append((a + b, 0))
        }
        if b > cSize - c {
            queue.append((a, b - cSize + c))
        } else {
            queue.append((a, 0))
        }
    }
    
    if c > 0 {
        if c > aSize - a {
            queue.append((aSize, b))
        } else {
            queue.append((a + c, b))
        }
        if c > bSize - b {
            queue.append((a, bSize))
        } else {
            queue.append((a, b + c))
        }
    }
}

var result = Set<Int>()
for b in 0 ... bSize {
    if visited[0][b] {
        result.insert(cSize - b)
    }
}

for i in Array(result).sorted() {
    print(i, terminator: " ")
}
