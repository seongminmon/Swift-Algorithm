//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/01.
//
// 메뉴 리뉴얼
// 2021 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var dict = [String: Int]()
    for i in 0..<orders.count {
        let order = orders[i].map { String($0) }.sorted()
        var visited = [Bool](repeating: false, count: order.count)
        
        func dfs(_ depth: Int, _ start: Int, _ str: String) {
            if str.count >= 2 {
                dict[str, default: 0] += 1
            }
            
            if depth == order.count {
                return
            }
            
            for i in start..<order.count {
                if !visited[i] {
                    visited[i] = true
                    dfs(depth+1, i, str + order[i])
                    visited[i] = false
                }
            }
        }
        
        dfs(0, 0, "")
    }
    
    var temp = [[(String, Int)]](repeating: [], count: 11)
    for (key, value) in dict {
        if value >= 2 && course.contains(key.count) {
            temp[key.count].append((key, value))
        }
    }
    
    var result = [String]()
    for num in course {
        var MAX = -1
        for i in temp[num] {
            MAX = max(MAX, i.1)
        }
        for i in temp[num] {
            if i.1 == MAX {
                result.append(i.0)
            }
        }
    }
    
    return result.sorted()
}

print(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))
print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
