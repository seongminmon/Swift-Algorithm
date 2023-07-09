//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/09.
//
// [1차] 뉴스 클러스터링
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17677

import Foundation

func solution(_ str1:String, _ str2:String) -> Int {
    let multiSet1 = makeMultiSet(str1.uppercased())
    let multiSet2 = makeMultiSet(str2.uppercased())
    
    if multiSet1.isEmpty && multiSet2.isEmpty {
        return 65536
    }
    
    var intsersection = [String]()
    for i in 0..<multiSet1.count {
        for j in 0..<multiSet2.count {
            if multiSet1[i] == multiSet2[j] {
                intsersection.append(multiSet1[i])
                break
            }
        }
    }
    
    var union = multiSet1 + multiSet2
    for i in 0..<intsersection.count {
        if let idx = union.firstIndex(of: intsersection[i]) {
            union.remove(at: idx)
        }
    }
    return Int(Double(intsersection.count) / Double(union.count) * 65536)
}

func makeMultiSet(_ str: String) -> [String] {
    var multiSet = [String]()
    let strArr = str.map{ String($0) }
    
    for i in 0..<strArr.count-1 {
        let a = strArr[i]
        let b = strArr[i+1]
        
        if ("A"..."Z").contains(a) && ("A"..."Z").contains(b) {
            multiSet.append(a+b)
        }
    }
    
    return multiSet
}

print(solution("FRANCE", "french"))
print(solution("handshake", "shake hands"))
print(solution("aa1+aa2", "AAAA12"))
print(solution("E=M*C^2", "e=m*c^2"))
