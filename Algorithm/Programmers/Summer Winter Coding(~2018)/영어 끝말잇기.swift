//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/21.
//
// 영어 끝말잇기
// Summer/Winter Coding(~2018)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/12981

import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var dict = [String: Int]()
    
    func isLose(_ str: String, _ last: String) -> Bool {
        // 한글자 || 마지막 문자와 다름 || 중복 단어
        return str.count == 1 || String(str.first!) != last || dict[str] != nil
    }
    
    var ans = [0,0]
    for i in 0..<words.count {
        if i > 0 && isLose(words[i], String(words[i-1].last!)) {
            ans = [i % n + 1, i / n + 1]
            break
        }
        // 사전 추가
        dict[words[i]] = 0
    }
    
    return ans
}

print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
print(solution(5, ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]))
print(solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
