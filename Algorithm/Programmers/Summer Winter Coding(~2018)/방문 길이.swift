//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/22.
//
// 방문 길이
// Summer/Winter Coding(~2018)
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/49994

import Foundation

func solution(_ dirs:String) -> Int {
    var set: Set<[Int]> = []
    
    var now = [0, 0]
    for dir in dirs {
        var next = now
        
        switch dir {
        case "U": next[1] += 1
        case "D": next[1] -= 1
        case "R": next[0] -= 1
        case "L": next[0] += 1
        default: break
        }
        
        if (-5...5) ~= next[0] && (-5...5) ~= next[1] {
            set.insert(now + next)
            set.insert(next + now)
            now = next
        }
    }
    
    return set.count / 2
}

print(solution("ULURRDLLU"))
print(solution("LULLLLLLU"))
