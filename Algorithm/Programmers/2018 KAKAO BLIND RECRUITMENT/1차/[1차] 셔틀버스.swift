//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/13.
//
// [1차] 셔틀버스
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/17678

import Foundation

func timeToInt(_ time: String) -> Int {
    let num = time.split(separator: ":").map { String($0) }
    return Int(num[0])! * 60 + Int(num[1])!
}

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var ans = 0
    let times = timetable.sorted().map { timeToInt($0) }
    var shuttle = timeToInt("09:00")
    var idx = 0
    for _ in 0..<n {
        if idx == times.count { break }
        
        var cnt = 0
        while idx < times.count && times[idx] <= shuttle && cnt < m {
            idx += 1
            cnt += 1
        }
        
        ans = cnt < m ? shuttle : times[idx-1] - 1
        
        shuttle += t
    }
    
    return String(format: "%02d:%02d", ans / 60, ans % 60)
}

print(solution(1, 1, 5, ["08:00", "08:01", "08:02", "08:03"]))
print(solution(2, 10, 2, ["09:10", "09:09", "08:00"]))
print(solution(2, 1, 2, ["09:00", "09:00", "09:00", "09:00"]))
print(solution(1, 1, 5, ["00:01", "00:01", "00:01", "00:01", "00:01"]))
print(solution(1, 1, 1, ["23:59"]))
print(solution(10, 60, 45, ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"]))
