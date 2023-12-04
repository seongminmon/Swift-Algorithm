//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/4/23.
//
// 2852 : NBA 농구
// https://www.acmicpc.net/problem/2852

import Foundation

let n = Int(readLine()!)!

var arr = [(Int,Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let timeStr = input[1].split(separator: ":").map { Int(String($0))! }
    let winner = Int(input[0])!
    let time = timeStr[0] * 60 + timeStr[1]
    arr.append((winner, time))
}
arr.sort { $0.1 < $1.1 }

var score = 0
var time1 = 0
var time2 = 0

score += arr[0].0 == 1 ? 1 : -1

for i in 1..<n {
    if score > 0 {
        time1 += arr[i].1 - arr[i-1].1
    } else if score < 0 {
        time2 += arr[i].1 - arr[i-1].1
    }
    score += arr[i].0 == 1 ? 1 : -1
}

if score > 0 {
    time1 += 48 * 60 - arr[n-1].1
} else if score < 0 {
    time2 += 48 * 60 - arr[n-1].1
}

func timeToString(_ time: Int) -> String {
    let minute = String(format: "%02d", time / 60)
    let second = String(format: "%02d", time % 60)
    return "\(minute):\(second)"
}

print(timeToString(time1))
print(timeToString(time2))
