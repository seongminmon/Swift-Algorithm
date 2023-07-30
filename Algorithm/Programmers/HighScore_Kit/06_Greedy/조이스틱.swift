//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/12.
//
// 조이스틱
// 탐욕법(Greedy)
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42860

import Foundation

func solution(_ name:String) -> Int {
    let n = name.count
    let name = Array(name)
    
    let aValue = Int(Character("A").asciiValue!)
    let zValue = Int(Character("Z").asciiValue!)
    
    var changeCnt = 0
    var moveCnt = n-1
    for i in 0..<n {
        let nowValue = Int(name[i].asciiValue!)
        let diff1 = nowValue - aValue
        let diff2 = zValue - nowValue + 1
        changeCnt += min(diff1, diff2)
        
        var j = i+1
        while j < n && name[j] == "A" {
            j += 1
        }
        let move1 = 2 * i + (n - j)
        let move2 = 2 * (n - j) + i
        moveCnt = min(moveCnt, move1, move2)
    }
    
    return changeCnt + moveCnt
}

print(solution("JEROEN"))
print(solution("JAN"))
print(solution("JAJAAJ"))
print(solution("AAA"))
