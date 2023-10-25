//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/08.
//
// 광고 삽입
// 2021 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/72414

import Foundation

func strToInt(_ str: String) -> Int {
    let str = str.split(separator: ":").map { Int(String($0))! }
    return str[0] * 3600 + str[1] * 60 + str[2]
}

func intToStr(_ num: Int) -> String {
    var num = num
    let hh = String(format: "%02d", num / 3600)
    num %= 3600
    let mm = String(format: "%02d", num / 60)
    let ss = String(format: "%02d", num % 60)
    
    return "\(hh):\(mm):\(ss)"
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let playTime = strToInt(play_time)
    let adTime = strToInt(adv_time)
    
    var times = [Double](repeating: 0, count: playTime+1)
    for log in logs {
        let se = log.split(separator: "-").map { String($0) }
        let s = strToInt(se[0])
        let e = strToInt(se[1])
        times[s] += 1
        times[e] -= 1
    }
    
    for i in 1...playTime {
        times[i] += times[i-1]
    }
    
    for i in 1...playTime {
        times[i] += times[i-1]
    }
    
    var maxStart = 0
    var maxSum = times[adTime-1]
    for i in adTime..<playTime {
        let nowSum = times[i] - times[i - adTime]
        
        if maxSum < nowSum {
            maxSum = nowSum
            maxStart = i - adTime + 1
        }
    }
    return intToStr(maxStart)
}

print(solution("02:03:55", "00:14:15", ["01:20:15-01:45:14", "00:40:31-01:00:00", "00:25:50-00:48:29", "01:30:59-01:53:29", "01:37:44-02:02:30"]))
print(solution("99:59:59", "25:00:00", ["69:59:59-89:59:59", "01:00:00-21:00:00", "79:59:59-99:59:59", "11:00:00-31:00:00"]))
print(solution("50:00:00", "50:00:00", ["15:36:51-38:21:49", "10:14:18-15:36:51", "38:21:49-42:51:45"]))
