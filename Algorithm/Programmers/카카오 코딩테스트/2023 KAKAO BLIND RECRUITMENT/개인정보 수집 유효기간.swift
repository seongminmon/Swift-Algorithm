//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/22.
//
// 개인정보 수집 유효기간
// 2023 KAKAO BLIND RECRUITMENT
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/150370

import Foundation

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    let todayDate = today.split(separator: ".").map { Int(String($0))! }
    let todayNum = todayDate[0] * 12 * 28 + todayDate[1] * 28 + todayDate[2]
    
    var dict = [String: Int]()
    for term in terms {
        let str = term.split(separator: " ").map { String($0) }
        dict[str[0]] = Int(str[1])! * 28
    }
    
    var result = [Int]()
    for i in 0..<privacies.count {
        let privacy = privacies[i].split(separator: " ").map { String($0) }
        let date = privacy[0].split(separator: ".").map { Int(String($0))! }
        let dateNum = date[0] * 12 * 28 + date[1] * 28 + date[2]
        if dateNum + dict[privacy[1]]! <= todayNum {
            result.append(i+1)
        }
    }
    return result
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))
print(solution("2020.01.01", ["Z 3", "D 5"], ["2019.01.01 D", "2019.11.15 Z", "2019.08.02 D", "2019.07.01 D", "2018.12.28 Z"]))
