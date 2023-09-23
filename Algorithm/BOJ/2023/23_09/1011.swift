//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/09/05.
//
// 1011 : Fly me to the Alpha Centauri
// https://www.acmicpc.net/problem/1011

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (x,y) = (xy[0], xy[1])
    
    let diff = y - x
    var maxK = 1
    var sum = 2
    while sum < diff {
        maxK += 1
        sum += maxK * 2
    }
    
    if sum - maxK < diff {
        print(maxK * 2)
    } else {
        print(maxK * 2 - 1)
    }
}
