//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/01/26.
//
// 2784 : 가로 세로 퍼즐
// https://www.acmicpc.net/problem/2784

import Foundation

var words = [[String]]()
for _ in 0 ..< 6 {
    words.append(readLine()!.map{ String($0) })
}

func solve(_ puzzle: [[String]]) -> String {
    var selected = [Bool](repeating: false, count: 6)
    
    for i in 0 ..< 3 {
        for j in 0 ..< 6 {
            if !selected[j],
               puzzle[i] == words[j] {
                selected[j] = true
                break
            }
        }
        
        for j in 0 ..< 6 {
            if !selected[j],
               puzzle[0][i] == words[j][0],
               puzzle[1][i] == words[j][1],
               puzzle[2][i] == words[j][2] {
                selected[j] = true
                break
            }
        }
    }
    
    var cnt = 0
    for i in 0 ..< 6 {
        if selected[i] {
            cnt += 1
        }
    }
    
    var result = ""
    if cnt == 6 {
        for i in 0 ..< 3 {
            result += puzzle[i].joined()
            result += "\n"
        }
        return result
    }
    
    return ""
}

var puzzle = [[String]](repeating: [], count: 3)
var result = ""
outerLoop: for i in 0 ..< 6 {
    for j in 0 ..< 6 {
        for k in 0 ..< 6 {
            if i == j || j == k || k == i {
                continue
            }
            
            puzzle[0] = words[i]
            puzzle[1] = words[j]
            puzzle[2] = words[k]
            
            result = solve(puzzle)
            if result != "" {
                break outerLoop
            }
        }
    }
}

print(result == "" ? 0 : result)
