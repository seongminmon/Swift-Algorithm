//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/18.
//
// [3차] 자동완성
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 4
// https://school.programmers.co.kr/learn/courses/30/lessons/17685

import Foundation

func compareString(_ str1: String, _ str2: String) -> Int {
    let str1 = Array(str1)
    let str2 = Array(str2)
    var cnt = 0
    while cnt < str1.count && cnt < str2.count && str1[cnt] == str2[cnt] {
        cnt += 1
    }
    return cnt + 1
}

func solution(_ words:[String]) -> Int {
    let words = words.sorted()
    var ans = 0
    for i in 0..<words.count {
        let word = words[i]
        var cnt = (0,0)
        
        if i > 0 {
            let preWord = words[i-1]
            cnt.0 = compareString(word, preWord)
        }
        
        if i < words.count-1 {
            let postWord = words[i+1]
            cnt.1 = compareString(word, postWord)
        }
        
        ans += min(word.count, max(cnt.0, cnt.1))
    }
    
    return ans
}

print(solution(["go","gone","guild"]))
print(solution(["abc","def","ghi","jklm"]))
print(solution(["word","war","warrior","world"]))
