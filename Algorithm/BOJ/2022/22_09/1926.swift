//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/09/28.
//
// 1926 : 소수 구하기
// https://www.acmicpc.net/problem/1926

import Foundation

// 입력
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (n,m) = (input[0], input[1])

// 풀이
func eratosthenes(_ m: Int) -> [Int] {
    var arr = [Bool](repeating: true, count: m+1)
    var primes = [Int]()
    
    for i in 2 ... m {
        if arr[i] == true {
            for j in stride(from: i, through: m, by: i) {
                arr[j] = false
            }
            primes.append(i)
        }
    }
    return primes
}

// 출력
let result = eratosthenes(m)
for i in result {
    if i >= n {
        print(i)
    }
}
