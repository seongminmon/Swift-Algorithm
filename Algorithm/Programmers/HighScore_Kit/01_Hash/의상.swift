//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/30.
//
// 의상
// 해시
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42578

import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String: Int]()
    for i in 0..<clothes.count {
        if dict[clothes[i][1]] == nil {
            dict[clothes[i][1]] = 2
        } else {
            dict[clothes[i][1]]! += 1
        }
    }
    
    var result = 1
    for (_, value) in dict {
        result *= value
    }
    result -= 1
    
    return result
}

print(solution(
    [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]
))

print(solution(
    [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]
))
