//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/21.
//
// 튜플
// 2019 카카오 개발자 겨울 인턴십
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/64065

import Foundation

// 입력
let s = "{{1,2,3},{2,1},{1,2,4,3},{2}}"   // [2, 1, 3, 4]
//let s = "{{20,111},{111}}"                // [111, 20]
//let s = "{{4,2,3},{3},{2,3,4,1},{2,3}}"   // [3, 2, 4, 1]
//let s = "{{123}}"                         // [123]

// 풀이
func solution(_ s:String) -> [Int] {
    var str = s.components(separatedBy: "},{")
    // 앞에서 두개 자르기
    let startIndex = str[0].index(str[0].startIndex, offsetBy: 2)
    str[0] = String(str[0][startIndex...])
    // 뒤에서 두개 자르기
    let endIndex = str[str.count - 1].index(str[str.count - 1].endIndex, offsetBy: -3)
    str[str.count - 1] = String(str[str.count - 1][...endIndex])
    
    // [[Int]] 배열로 만들기
    var intStr = [[Int]]()
    for i in 0 ..< str.count {
        let temp = str[i].split(separator: ",").map{ Int($0)! }
        intStr.append(temp)
    }
    
    // 순서를 위해서 숫자들 카운트 하기
    var dict = [Int:Int]()
    for i in 0 ..< intStr.count {
        for j in intStr[i] {
            if dict.keys.contains(j) {
                dict[j]! += 1
            } else {
                dict[j] = 1
            }
        }
    }
    
    var result = [Int]()
    for i in dict.sorted(by: { $0.value > $1.value }) {
        result.append(i.key)
    }
    
    return result
}

// 출력
print(solution(s))
