//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/17.
//
// 성격 유형 검사하기
// 2022 KAKAO TECH INTERNSHIP
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/118666

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    // 매우 비동의 ~ 매우 동의 (1~7)
    let scores = [0, 3, 2, 1, 0, -1, -2, -3]
    
    var result = ""
    var rt = 0
    var cf = 0
    var jm = 0
    var an = 0
    
    // 검사 진행
    for i in 0..<survey.count {
        let score = scores[choices[i]]
        switch survey[i] {
            case "RT": rt += score
            case "TR": rt -= score
            case "CF": cf += score
            case "FC": cf -= score
            case "JM": jm += score
            case "MJ": jm -= score
            case "AN": an += score
            case "NA": an -= score
            default: break
        }
    }
    
    // 성격 유형 정하기
    result += rt >= 0 ? "R" : "T"
    result += cf >= 0 ? "C" : "F"
    result += jm >= 0 ? "J" : "M"
    result += an >= 0 ? "A" : "N"
    return result
}

print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
print(solution(["TR", "RT", "TR"], [7, 1, 3]))
