//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/14.
//
// [1차] 추석 트래픽
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/17676

import Foundation

func solution(_ lines:[String]) -> Int {
    let n = lines.count
    var startTimes = [Int]()
    var finishedTimes = [Int]()
    
    for line in lines {
        let str = line.split(separator: " ").map { String($0) }
        
        let s1 = str[1].split(separator: ":").map { String($0) }
        let s2 = s1[2].split(separator: ".").map { String($0) }
        
        var finishedTime = Int(s1[0])! * 60 * 60 * 1000
        finishedTime += Int(s1[1])! * 60 * 1000
        finishedTime += Int(s2[0])! * 1000
        finishedTime += Int(s2[1])!
        finishedTimes.append(finishedTime)
        
        var s3 = str[2]
        s3.removeLast()
        let s4 = s3.split(separator: ".").map { String($0) }
        var t = Int(s4[0])! * 1000
        if s4.count == 2 { t += Int(s4[1])! }
        let startTime = finishedTime - t + 1
        startTimes.append(startTime)
    }
    
    var ans = 0
    for i in 0..<n {
        var cnt = 1
        for j in i+1..<n {
            if startTimes[j] < finishedTimes[i] + 1000 {
                cnt += 1
            }
        }
        ans = max(ans, cnt)
    }
    return ans
}

// 1, 1, 1, 2, 7, 1
print(solution(["2016-09-15 00:00:00.000 3s"]))
print(solution(["2016-09-15 23:59:59.999 0.001s"]))
print(solution(["2016-09-15 01:00:04.001 2.0s", "2016-09-15 01:00:07.000 2s"]))
print(solution(["2016-09-15 01:00:04.002 2.0s", "2016-09-15 01:00:07.000 2s"]))
print(solution(["2016-09-15 20:59:57.421 0.351s", "2016-09-15 20:59:58.233 1.181s", "2016-09-15 20:59:58.299 0.8s", "2016-09-15 20:59:58.688 1.041s", "2016-09-15 20:59:59.591 1.412s", "2016-09-15 21:00:00.464 1.466s", "2016-09-15 21:00:00.741 1.581s", "2016-09-15 21:00:00.748 2.31s", "2016-09-15 21:00:00.966 0.381s", "2016-09-15 21:00:02.066 2.62s"]))
print(solution(["2016-09-15 00:00:00.000 2.3s", "2016-09-15 23:59:59.999 0.1s"]))
