//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/06/27.
//
// 키패드 누르기
// 2020 카카오 인턴십
// Lv. 1
// https://school.programmers.co.kr/learn/courses/30/lessons/67256

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var dict = [String: (Int,Int)]()
    for i in 0..<3 {
        for j in 0..<3 {
            dict[String(3 * i + j + 1)] = (i,j)
        }
    }
    dict["*"] = (3,0)
    dict["0"] = (3,1)
    dict["#"] = (3,2)
    
    var left = dict["*"]!
    var right = dict["#"]!
    var result = ""
    for num in numbers {
        let location = dict[String(num)]!
        switch num {
        case 1,4,7:
            left = location
            result += "L"
        case 3,6,9:
            right = location
            result += "R"
        default:
            let lDist = abs(left.0 - location.0) + abs(left.1 - location.1)
            let rDist = abs(right.0 - location.0) + abs(right.1 - location.1)
            if lDist < rDist {
                left = location
                result += "L"
            } else if lDist > rDist {
                right = location
                result += "R"
            } else {
                if hand == "left" {
                    left = location
                    result += "L"
                } else {
                    right = location
                    result += "R"
                }
            }
        }
    }
    
    return result
}

print(solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right"))
print(solution([7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2], "left"))
print(solution([1, 2, 3, 4, 5, 6, 7, 8, 9, 0], "right"))
