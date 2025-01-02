//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 1/1/25.
//
// [PCCP 기출문제] 2번 / 충돌위험 찾기
// PCCP 기출문제
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/340211

import Foundation

func solution(_ points:[[Int]], _ routes:[[Int]]) -> Int {
    // ex)
    // points = [[3, 2], [6, 4], [4, 7], [1, 4]]
    // routes = [[4, 2], [1, 3], [2, 4]]

    // 1번 로봇 [1,4] -> [6,4]
    // 경로는 [1,4] [2,4], [3,4], [4,4], [5,4], [6,4] 6초

    // 2번 로봇 [3,2] -> [4,7]
    // 경로 = [3,2] [4,2] [4,3] [4,4] [4,5] [4,6] [4,7] 7초

    // 3번 로봇 [6,4] -> [1,4]
    // 경로 = [6,4] [5,4] [4,4] [3,4] [2,4] [1,4] 6초
    
    let x = routes.count
    let m = routes[0].count
    
    // 로봇들의 경로
    var locations = [[[Int]]](repeating: [[]], count: x)
    for i in 0..<x {
        let route = routes[i]
        var now = points[route[0] - 1]
        locations[i].append(now)
        for j in 1..<m {
            let next = points[route[j] - 1]
            while now != next {
                // r부터 이동
                if now[0] < next[0] {
                    now[0] += 1
                } else if now[0] > next[0] {
                    now[0] -= 1
                } else {
                    // r이 같다면 c이동
                    if now[1] < next[1] {
                        now[1] += 1
                    } else if now[1] > next[1] {
                        now[1] -= 1
                    }
                }
                locations[i].append(now)
            }
        }
    }
    
    // 가장 오래 걸린 시간
    var maxSecond = 0
    for location in locations {
        maxSecond = max(maxSecond, location.count)
    }
    
    // 같은 시간초에서 겹치는 지 확인
    var ans = 0
    for i in 1..<maxSecond {
        var dict = [[Int]: Int]()
        for j in 0..<x {
            if i < locations[j].count {
                // j번 로봇의 i초 일때의 좌표
                let loc = locations[j][i]
                dict[loc, default: 0] += 1
            }
        }
        // i초 일때 충돌 상황 개수 추가
        ans += dict.values.filter { $0 > 1 }.count
    }
    return ans
}

print(solution([[3, 2], [6, 4], [4, 7], [1, 4]], [[4, 2], [1, 3], [2, 4]])) // 1
print(solution([[3, 2], [6, 4], [4, 7], [1, 4]], [[4, 2], [1, 3], [4, 2], [4, 3]])) // 9
print(solution([[2, 2], [2, 3], [2, 7], [6, 6], [5, 2]], [[2, 3, 4, 5], [1, 3, 4, 5]])) // 0
