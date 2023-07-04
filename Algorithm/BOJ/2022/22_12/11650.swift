//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/03.
//
// 11650 : 좌표 정렬하기
// https://www.acmicpc.net/problem/11650

import Foundation

// 입력
let n = Int(readLine()!)!
var points = [(Int,Int)]()
for _ in 0 ..< n {
    let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
    points.append((xy[0], xy[1]))
}

// 풀이
points.sort{
    if $0.0 == $1.0 {
        return $0.1 < $1.1
    } else {
       return $0.0 < $1.0
    }
}

// 출력
var result = ""
for i in points {
    result += "\(i.0) \(i.1)\n"
}
print(result)
