//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/24.
//
// 13335 : 트럭
// https://www.acmicpc.net/problem/13335

import Foundation

let nwl = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,w,l) = (nwl[0], nwl[1], nwl[2])
var trucks = readLine()!.split(separator: " ").map { Int(String($0))! }

var time = 0
var cnt = 0
var idx = 0
var bridge = [(Int,Int)]()
var bridgeWeight = 0

while cnt < n {
    if let first = bridge.first {
        if first.1 == w {
            bridge.removeFirst()
            bridgeWeight -= first.0
            cnt += 1
        }
    }
    
    if idx < n && l - bridgeWeight >= trucks[idx] {
        bridge.append((trucks[idx], 0))
        bridgeWeight += trucks[idx]
        idx += 1
    }
    
    for i in 0..<bridge.count {
        bridge[i].1 += 1
    }
    
    time += 1
}

print(time)
