//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/21.
//
// 소수 만들기
// Summer/Winter Coding(~2018)
// Lv.1
// https://school.programmers.co.kr/learn/courses/30/lessons/12977

import Foundation

func isPrime(_ num: Int) -> Bool {
    for i in 2 ..< num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var result = 0
    
    for i in 0 ... nums.count - 3 {
        for j in i+1 ... nums.count - 2 {
            for k in j+1 ... nums.count - 1 {
                if isPrime(nums[i] + nums[j] + nums[k]) {
                    result += 1
                }
            }
        }
    }
    
    return result
}

print(solution([1,2,3,4]))
print(solution([1,2,7,6,4]))
