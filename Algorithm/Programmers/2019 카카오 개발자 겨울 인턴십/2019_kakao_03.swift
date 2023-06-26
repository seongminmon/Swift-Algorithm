//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/11/21.
//
// 불량 사용자
// 2019 카카오 개발자 겨울 인턴십
// Lv. 3
// https://school.programmers.co.kr/learn/courses/30/lessons/64064

import Foundation

// 입력 1 : 2
//let user_id = ["frodo", "fradi", "crodo", "abc123", "frodoc"]
//let banned_id = ["fr*d*", "abc1**"]

// 입력 2 : 3
let user_id = ["frodo", "fradi", "crodo", "abc123", "frodoc"]
let banned_id = ["fr*d*", "*rodo", "******", "******"]

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var result = [[Int]](repeating: [], count: banned_id.count)
    
    for i in 0 ..< banned_id.count {
        let banID = banned_id[i].map{ String($0) }
        
        for j in 0 ..< user_id.count {
            let userID = user_id[j].map{ String($0) }
            
            // 조기 탈출
            if banID.count != userID.count {
                continue
            }
            
            // 가능한지 체크
            var check = true
            for k in 0 ..< banID.count {
                if banID[k] != "*", banID[k] != userID[k] {
                    check = false
                    break
                }
            }
            
            // 가능하면 추가
            if check {
                result[i].append(j)
            }
            
        }
    }
    
    // 조합 구하기
    var set = Set<[Int]>()
    func combination(_ index: Int, _ select: [Int]) {
        if select.count == banned_id.count {
            set.insert(select.sorted())
            return
        }
        
        var select = select
        for i in result[index] {
            if select.contains(i) {
                continue
            }
            select.append(i)
            combination(index + 1, select)
            select.removeLast()
        }
    }
    combination(0, [])
    
    return set.count
}

print(solution(user_id, banned_id))
