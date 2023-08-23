//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/23.
//
// 이모티콘 할인행사
// 2023 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/150368

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    var ans = [0, 0]
    func dfs(_ rates: [Int]) {
        // 종료 조건
        if rates.count == emoticons.count {
            var temp = [0, 0]
            for user in users {
                var val = 0
                for i in 0..<emoticons.count {
                    // 일정 할인율 이상이면 구매
                    if rates[i] >= user[0] {
                        val += emoticons[i] * (100 - rates[i]) / 100
                    }
                }
                
                // 총 구매액이 일정 구매액 이상이면 서비스 가입
                if val >= user[1] {
                    temp[0] += 1
                } else {
                    temp[1] += val
                }
            }
            
            // 갱신
            if ans[0] < temp[0] {
                ans = temp
            } else if ans[0] == temp[0] {
                ans[1] = max(ans[1], temp[1])
            }
            return
        }
        
        for i in [10, 20, 30, 40] {
            dfs(rates + [i])
        }
    }
    
    dfs([])
    return ans
}
print(solution([[40, 10000], [25, 10000]], [7000, 9000]))
print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900]))
