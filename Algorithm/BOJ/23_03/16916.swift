//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/03/08.
//
// 16916 : 부분 문자열
// https://www.acmicpc.net/problem/16916

import Foundation

let s = readLine()!.map{ String($0) }
let p = readLine()!.map{ String($0) }

func makeTable(_ pattern: [String]) -> [Int] {
    var table = [Int](repeating: 0, count: pattern.count)
    
    var j = 0
    for i in 1 ..< pattern.count {
        while j > 0, pattern[i] != pattern[j] {
            j = table[j-1]
        }
        
        if pattern[i] == pattern[j] {
            j += 1
            table[i] = j
        }
    }
    
    return table
}

func kmp(_ parent: [String], _ pattern: [String]) -> Int {
    let table = makeTable(pattern)
    
    var j = 0
    for i in 0 ..< parent.count {
        while j > 0, parent[i] != pattern[j] {
            j = table[j-1]
        }
        
        if parent[i] == pattern[j] {
            if j == pattern.count - 1 {
                return 1
            } else {
                j += 1
            }
        }
    }
    
    return 0
}

print(kmp(s,p))
