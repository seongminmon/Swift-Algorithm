//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/20.
//
// 2212 : 센서
// https://www.acmicpc.net/problem/2212

import Foundation

// 입력
let n = Int(readLine()!)!
let k = Int(readLine()!)!
var sensor = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
sensor.sort()
var distance = [Int]()
for i in 1 ..< n {
    distance.append(sensor[i] - sensor[i-1])
}

distance.sort()
for _ in 0 ..< k-1 {
    distance.popLast()
}

// 출력
print(distance.reduce(0,+))
