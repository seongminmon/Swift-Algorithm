//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/05.
//
// 1978 : 소수 찾기
// https://www.acmicpc.net/problem/1978

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))! }

// 풀이
func isPrime(_ num: Int) -> Bool {
    if num == 1 {
        return false
    }
    
    for i in 2 ..< num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

// 출력
var result = 0
for i in arr {
    if isPrime(i) {
        result += 1
    }
}
print(result)
