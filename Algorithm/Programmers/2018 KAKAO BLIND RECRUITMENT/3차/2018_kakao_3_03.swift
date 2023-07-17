//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/17.
//
// [3차] 파일명 정렬
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17686

import Foundation

struct File {
    var name: String
    var head: String
    var number: String
}

func solution(_ files:[String]) -> [String] {
    var result = [File]()
    for file in files {
        let file = Array(file)
        var idx = 0
        var head = [Character]()
        while idx < file.count && !file[idx].isNumber {
            head.append(file[idx])
            idx += 1
        }
        
        var number = [Character]()
        var cnt = 0
        while idx < file.count && file[idx].isNumber && cnt < 5 {
            number.append(file[idx])
            cnt += 1
            idx += 1
        }
        while number.count < 5 {
            number.insert(Character("0"), at: 0)
        }
        
        result.append(File(
            name: file.map { String($0) }.joined(),
            head: head.map { String($0) }.joined(),
            number: number.map { String($0) }.joined()
        ))
    }
    
    result.sort {
        if $0.head.uppercased() == $1.head.uppercased() {
            return $0.number < $1.number
        } else {
            return $0.head.uppercased() < $1.head.uppercased()
        }
    }
    
    return result.map { $0.name }
}

print(solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
print(solution(["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]))
