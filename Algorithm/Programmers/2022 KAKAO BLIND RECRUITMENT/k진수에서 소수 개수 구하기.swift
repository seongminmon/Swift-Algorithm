//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/13.
//
// k진수에서 소수 개수 구하기
// 2022 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/92335

import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let change = String(n, radix: k)
    let numbers = change.split(separator: "0")

    var count = 0
    for num in numbers {
        if isPrime(Int(num)!) {
            count += 1
        }
    }

    return count
}

func isPrime(_ n: Int) -> Bool {
    if n == 1 { return false }
    if n == 2 || n == 3 { return true }

    let sq = Int(sqrt(Double(n)))
    for i in 2 ... sq {
        if n % i == 0 {
            return false
        }
    }

    return true
}

print(solution(437674, 3))
print(solution(110011, 10))
