//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/12.
//
// 1436 : 영화감독 숌
// https://www.acmicpc.net/problem/1436

import Foundation

let n = Int(readLine()!)!
var ans = [0]

for i in 666 ... 2666799 {
    var temp = i
    while temp >= 666 {
        if temp % 1000 == 666 {
            ans.append(i)
            break
        }
        temp /= 10
    }
}

print(ans[n])



