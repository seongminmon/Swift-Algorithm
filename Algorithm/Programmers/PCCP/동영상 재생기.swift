//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 10/30/24.
//
// [PCCP 기출문제] 1번 / 동영상 재생기
// PCCP 기출문제
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/340213?language=swift

import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    let total = strToInt(video_len)
    var now = strToInt(pos)
    let opStart = strToInt(op_start)
    let opEnd = strToInt(op_end)
    
    for command in commands {
        if opStart <= now, now <= opEnd {
            now = opEnd
        }
        if command == "prev" {
            now = max(0, now - 10)
        } else {
            now = min(total, now + 10)
        }
        if opStart <= now, now <= opEnd {
            now = opEnd
        }
    }
    let minute = now / 60
    let second = now - minute * 60
    return String(format: "%02d:%02d", minute, second)
}

func strToInt(_ str: String) -> Int {
    let arr = str.split(separator: ":").map { Int($0)! }
    let minute = arr[0]
    let second = arr[1]
    return minute * 60 + second
}

print(solution("34:33", "13:00", "00:55", "02:55", ["next", "prev"]))  // "13:00"
print(solution("10:55", "00:05", "00:15", "06:55", ["prev", "next", "next"]))  // "06:55"
print(solution("07:22", "04:05", "00:15", "04:07", ["next"]))  // "04:17"
