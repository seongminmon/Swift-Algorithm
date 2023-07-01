//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/28.
//
// 보석 쇼핑
// 2020 카카오 인턴십
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/67258

import Foundation

func solution(_ gems:[String]) -> [Int] {
    var ans = [0,0]
    var dict = [String: Int]()
    var start = 0
    for end in 0..<gems.count {
        dict[gems[end], default: 0] += 1

        if dict[gems[end]]! == 1 {
            ans = [start, end]
        } else {
            while start < end, dict[gems[start]]! > 1 {
                dict[gems[start]]! -= 1
                start += 1
            }
            if end - start < ans[1] - ans[0] {
                ans = [start, end]
            }
        }
    }

    return ans.map { $0+1 }
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
print(solution(["ZZZ", "YYY", "NNNN", "YYY", "BBB"]))
print(solution(["AA","AB","AB","AB","AC","AA","AB","AC"]))
