//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/04.
//
// 9012 : 괄호
// https://www.acmicpc.net/problem/9012

import Foundation

let n = Int(readLine()!)!

var result = ""
for _ in 0 ..< n {
    let str = readLine()!
    
    var cnt = 0
    for s in str {
        if s == "(" {
            cnt += 1
        } else {
            cnt -= 1
            if cnt < 0 {
                break
            }
        }
    }
    
    result += cnt == 0 ? "YES\n" : "NO\n"
}

print(result)
