//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/12.
//
// 1436 : 영화감독 숌
// https://www.acmicpc.net/problem/1436

import Foundation

var n = Int(readLine()!)!
var num = 665
while n > 0 {
    num += 1
    
    var cnt = 0
    for s in String(num) {
        cnt = s == "6" ? cnt+1 : 0
        
        if cnt == 3 {
            n -= 1
            break
        }
    }
}

print(num)
