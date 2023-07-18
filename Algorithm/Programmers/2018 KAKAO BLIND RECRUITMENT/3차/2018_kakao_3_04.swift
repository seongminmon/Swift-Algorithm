//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/17.
//
// [3차] 방금그곡
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17683

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let m = m.map { String($0) }
    var newM = [String]()
    var idx = 0
    while idx < m.count {
        var s = m[idx]
        if idx+1 < m.count && m[idx+1] == "#" {
            s += m[idx+1]
            idx += 1
        }
        newM.append(s)
        idx += 1
    }
    
    var result = [(String, Int)]()
    for i in 0..<musicinfos.count {
        let musicinfo = musicinfos[i].split(separator: ",")
        
        let start = musicinfo[0].split(separator: ":").map { Int($0)! }
        let startTime = start[0] * 60 + start[1]
        let end = musicinfo[1].split(separator: ":").map { Int($0)! }
        let endTime = end[0] * 60 + end[1]
        let time = endTime - startTime
        
        let name = musicinfo[2].map { String($0) }.joined()
        let str = musicinfo[3].map { String($0) }
        var music = [String]()
        var idx = 0
        while idx < str.count {
            var s = str[idx]
            if idx+1 < str.count && str[idx+1] == "#" {
                s += str[idx+1]
                idx += 1
            }
            music.append(s)
            idx += 1
        }
        
        while music.count < time {
            music += music
        }
        while music.count > time {
            music.removeLast()
        }
        
        idx = 0
        while idx < music.count {
            if music[idx] != newM[0] {
                idx += 1
                continue
            }
            
            if idx + newM.count > music.count { break }
            if music[idx..<(idx + newM.count)].joined() == newM.joined() {
                result.append((name, time))
            }
            idx += 1
        }
    }
    
    return result.isEmpty ? "(None)" : result.sorted { $0.1 > $1.1 }.first!.0
}

print(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
print(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))
print(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))
