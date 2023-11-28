//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/27/23.
//
// 9996 : 한국이 그리울 땐 서버에 접속하지
// https://www.acmicpc.net/problem/9996

import Foundation

let n = Int(readLine()!)!
let pattern = readLine()!.split(separator: "*").map { String($0) }

let left = pattern[0].map { String($0) }
let right = pattern[1].map { String($0) }

for _ in 0..<n {
    let str = readLine()!.map { String($0) }
    
    if str.count < left.count + right.count ||
        left != Array(str[0..<left.count]) ||
        right != Array(str[(str.count-right.count)..<str.count]) {
        print("NE")
    } else {
        print("DA")
    }
}
