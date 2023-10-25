//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/13.
//
// 양궁대회
// 2022 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/92342

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var result = [Int](repeating: 0, count: 11)
    var maxDiff = 1

    var visited = [Bool](repeating: false, count: 11)
    func dfs(_ depth: Int, _ start: Int, _ temp: [Int]) {
        // 종료 조건 (화살을 다 쏜 경우)
        if depth == n {
            var diff = 0
            for i in 0..<10 {
                if info[i] >= temp[i] {
                    if info[i] != 0 {
                        diff -= 10 - i
                    }
                } else {
                    diff += 10 - i
                }
            }

            // 갱신
            if maxDiff < diff {
                maxDiff = diff
                result = temp
                return
            }

            if maxDiff == diff {
                var idx = 10
                while idx >= 0 && result[idx] == temp[idx] {
                    idx -= 1
                }

                if idx >= 0 && result[idx] < temp[idx] {
                    result = temp
                    return
                } else {
                    return
                }
            }
        }

        var temp = temp
        for i in start...10 {
            if !visited[i] {
                visited[i] = true

                // 1. 어피치보다 한발 더 쏘기
                if depth + info[i] + 1 <= n {
                    temp[i] += info[i] + 1
                    dfs(depth + info[i] + 1, i, temp)
                    temp[i] -= info[i] + 1
                }

                // 2. 0발 쏘기
                dfs(depth, i, temp)

                // 화살이 남는 경우 0점에 모두 쏘기
                if i == 10 {
                    temp[i] += n - depth
                    dfs(n, i, temp)
                    temp[i] -= n - depth
                }

                visited[i] = false
            }
        }
    }

    dfs(0, 0, [Int](repeating: 0, count: 11))

    return result.reduce(0,+) == 0 ? [-1] : result
}

print(solution(5, [2,1,1,1,0,0,0,0,0,0,0]))
print(solution(1, [1,0,0,0,0,0,0,0,0,0,0]))
print(solution(9, [0,0,1,2,0,1,1,1,1,1,1]))
print(solution(10, [0,0,0,0,0,0,0,0,3,4,3]))
