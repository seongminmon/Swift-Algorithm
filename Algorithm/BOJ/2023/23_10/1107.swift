//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/02.
//
// 1107 : 리모컨
// https://www.acmicpc.net/problem/1107

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var brokenButtons = [Int]()
if m != 0 {
    brokenButtons = readLine()!.split(separator: " ").map { Int(String($0))! }
}

// 리모컨으로 만들 수 있는 숫자인지 판별
func isPossible(_ num: Int) -> Bool {
    if num == 0 && brokenButtons.contains(0) {
        return false
    }
    
    var num = num
    while num > 0 {
        if brokenButtons.contains(num % 10) {
            return false
        }
        num /= 10
    }
    return true
}

var ans = abs(n - 100)
for i in 0...1_000_000 {
    if isPossible(i) {
        ans = min(ans, String(i).count + abs(n - i))
    }
}
print(ans)
