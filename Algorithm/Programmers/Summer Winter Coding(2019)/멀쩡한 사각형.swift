//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/23.
//
// 멀쩡한 사각형
// Summer/Winter Coding(2019)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/62048

import Foundation

func solution(_ w:Int, _ h:Int) -> Int64 {
    func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    return Int64(w * h - (w + h - gcd(w, h)))
}

print(solution(8, 12))
