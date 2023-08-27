//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/23.
//
// 표현 가능한 이진트리
// 2023 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/150367

import Foundation

func solution(_ numbers:[Int64]) -> [Int] {
    func search(_ str: [String]) -> Bool {
        // 리프 노드이면 true
        if str.count == 1 {
            return true
        }
        
        let root = str.count / 2
        if str[root] == "0" {
            // 루트가 0이어도 자식이 모두 0이면 true
            // 자식 중 하나라도 1이 있으면 false
            return !str.contains("1")
        }
        return search(Array(str[0..<root])) && search(Array(str[(root+1)...]))
    }
    
    let possibleCnt = [1,3,7,15,31,63]
    var result = [Int]()
    for number in numbers {
        var str = String(number, radix: 2).map { String($0) }
        var size = 1
        while size < str.count {
            size = (size + 1) * 2 - 1
        }
        let plusZero = [String](repeating: "0", count: size - str.count)
        str = plusZero + str
        result.append(search(str) ? 1 : 0)
    }
    return result
}

print(solution([7, 42, 5]))
print(solution([63, 111, 95]))
