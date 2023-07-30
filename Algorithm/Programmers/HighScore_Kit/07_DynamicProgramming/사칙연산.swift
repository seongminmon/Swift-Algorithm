//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/04/25.
//
// 사칙연산
// 동적계획법(Dynamic Programming)
// LV.4
// https://school.programmers.co.kr/learn/courses/30/lessons/1843

import Foundation

func solution(_ input_array:[String]) -> Int {
    var nums = [Int]()
    var ops = [String]()
    for i in 0..<input_array.count {
        if i % 2 == 0 {
            nums.append(Int(input_array[i])!)
        } else {
            ops.append(input_array[i])
        }
    }

    let n = nums.count
    var maxDP = [[Int]](repeating: [Int](repeating: Int.min, count: n), count: n)
    var minDP = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    for i in 0..<n {
        maxDP[i][i] = nums[i]
        minDP[i][i] = nums[i]
    }

    for step in 1..<n {
        for i in 0..<n-step {
            let j = i + step

            for k in i..<j {
                if ops[k] == "+" {
                    maxDP[i][j] = max(maxDP[i][j], maxDP[i][k] + maxDP[k+1][j])
                    minDP[i][j] = min(minDP[i][j], minDP[i][k] + minDP[k+1][j])
                } else {
                    maxDP[i][j] = max(maxDP[i][j], maxDP[i][k] - minDP[k+1][j])
                    minDP[i][j] = min(minDP[i][j], minDP[i][k] - maxDP[k+1][j])
                }
            }
        }
    }

    return maxDP[0][n-1]
}

print(solution(["1", "-", "3", "+", "5", "-", "8"]))
print(solution(["5", "-", "3", "+", "1", "+", "2", "-", "4"]))
