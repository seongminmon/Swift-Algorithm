//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 4375 : 1
// https://www.acmicpc.net/problem/4375

import Foundation

while let input = readLine() {
    let num = Int(input)!
    
    var target = 1
    var ans = 1
    while true {
        if target % num == 0 {
            print(ans)
            break
        } else {
            target = (target * 10 + 1) % num
            ans += 1
        }
    }
}
