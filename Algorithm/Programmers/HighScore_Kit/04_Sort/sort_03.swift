//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/06.
//
// H-Index
// 정렬
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42747

import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    
    for i in 0..<citations.count {
        if citations[i] <= i {
            return i
        }
    }
    
    return citations.count
}

// 풀이2 (이진탐색)
//func solution(_ citations:[Int]) -> Int {
//    var result = 0
//    var start = 0
//    var end = 10000
//    while start <= end {
//        let mid = (start + end) / 2
//
//        var cnt = 0
//        for i in 0..<citations.count {
//            if citations[i] >= mid {
//                cnt += 1
//            }
//        }
//
//        if cnt >= mid {
//            result = mid
//            start = mid + 1
//        } else {
//            end = mid - 1
//        }
//    }
//
//    return result
//}

print(solution([3, 0, 6, 1, 5]))
