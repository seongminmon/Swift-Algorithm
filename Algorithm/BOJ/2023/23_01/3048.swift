//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/27.
//
// 3048 : 개미
// https://www.acmicpc.net/problem/3048

import Foundation

let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (n,m) = (nm[0], nm[1])
var ant1 = Array(readLine()!.map{ String($0) }.reversed())
var ant2 = readLine()!.map{ String($0) }
var ant = ant1 + ant2
let t = Int(readLine()!)!

var idxList = [Int](repeating: 0, count: n)
for i in 0 ..< n { idxList[i] = i }

for _ in 0 ..< t {
    for i in 0 ..< n {
        if i < n-1, idxList[i]+1 == idxList[i+1] {
            continue
        }
        
        if idxList[i]+1 > n+m-1 {
            continue
        }
        
        ant.swapAt(idxList[i], idxList[i]+1)
        idxList[i] += 1
    }
    
    if idxList[0] == m {
        break
    }
}
print(ant.joined())
