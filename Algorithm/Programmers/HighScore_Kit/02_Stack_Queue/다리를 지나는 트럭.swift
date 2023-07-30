//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 다리를 지나는 트럭
// 스택/큐
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42583

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var time = 1
    var result = 0
    var idx = 0

    var bridge = [(Int,Int)]()
    var bWeight = 0

    while result < truck_weights.count {
        if idx < truck_weights.count && bridge.count + 1 <= bridge_length && truck_weights[idx] + bWeight <= weight {
            bWeight += truck_weights[idx]
            bridge.append((truck_weights[idx], 0))
            idx += 1
        }

        for i in 0..<bridge.count {
            bridge[i].1 += 1
        }
        time += 1

        if !bridge.isEmpty && bridge[0].1 >= bridge_length {
            bWeight -= bridge[0].0
            bridge.removeFirst()
            result += 1
        }
    }

    return time
}

print(solution(
    2,
    10,
    [7,4,5,6]
))
print(solution(
    100,
    100,
    [10]
))
print(solution(
    100,
    100,
    [10,10,10,10,10,10,10,10,10,10]
))
