//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/09.
//
// [1차] 비밀지도
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 1
// https://school.programmers.co.kr/learn/courses/30/lessons/17681

import Foundation

// 풀이 1
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    func makeMap(_ arr: [Int]) -> [[String]] {
        var map = [[String]](repeating: [String](repeating: " ", count: n), count: n)
        for i in 0 ..< arr.count {
            var now = arr[i]
            var j = n-1
            while now > 0 {
                let temp = Int(pow(2, Double(j)))
                if now >= temp {
                    now -= temp
                    map[i][n-j-1] = "#"
                }
                j -= 1
            }
        }
        
        return map
    }
    
    let map1 = makeMap(arr1)
    let map2 = makeMap(arr2)
    var map = [[String]](repeating: [String](repeating: " ", count: n), count: n)
    for i in 0 ..< n {
        for j in 0 ..< n {
            if map1[i][j] == "#" || map2[i][j] == "#" {
                map[i][j] = "#"
            }
        }
    }
    
    var result = [String]()
    for i in 0 ..< n {
        result.append(map[i].joined())
    }
    return result
}

// 풀이 2
func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        let binary = String(arr1[$0] | arr2[$0], radix: 2)
        let padded = String(repeating: "0", count: n - binary.count) + binary
        return padded.reduce("") { $0 + ($1 == "0" ? " " : "#") }
    }
}

print(solution(
    5,
    [9, 20, 28, 18, 11],
    [30, 1, 21, 17, 28]
))

print(solution(
    6,
    [46, 33, 33 ,22, 31, 50],
    [27 ,56, 19, 14, 14, 10]
))
