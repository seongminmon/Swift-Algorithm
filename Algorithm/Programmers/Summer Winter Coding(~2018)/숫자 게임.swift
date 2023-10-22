//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 숫자 게임
// Summer/Winter Coding(~2018)
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/12987

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let n = a.count
    var a = a.sorted()
    var b = b.sorted()
    
    var ans = 0
    var aIdx = 0
    var bIdx = 0
    while aIdx < n && bIdx < n {
        if a[aIdx] < b[bIdx] {
            aIdx += 1
            ans += 1
        }
        bIdx += 1
    }
    
    return ans
}

print(solution([5,1,3,7], [2,2,6,8]))
print(solution([2,2,2,2], [1,1,1,1]))
