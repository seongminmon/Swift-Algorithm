//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/18.
//
// 10825 : 국영수
// https://www.acmicpc.net/problem/10825

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = [(String, Int, Int, Int)]()
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    arr.append((input[0], Int(input[1])!, Int(input[2])!, Int(input[3])!))
}

// 풀이
arr.sort{ $0.0 < $1.0 }
arr.sort{ $0.3 > $1.3 }
arr.sort{ $0.2 < $1.2 }
arr.sort{ $0.1 > $1.1 }

// 출력
for i in arr {
    print(i.0)
}

