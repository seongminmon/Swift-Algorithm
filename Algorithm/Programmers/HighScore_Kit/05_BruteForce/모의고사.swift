//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/08.
//
// 모의고사
// 완전탐색
// LV.1
// https://school.programmers.co.kr/learn/courses/30/lessons/42840

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var first = [1,2,3,4,5]
    var second = [2,1,2,3,2,4,2,5]
    var third = [3,3,1,1,2,2,4,4,5,5]
    for _ in 1...20 {
        first += first
        second += second
        third += third
    }
    
    var solArr = [Int]()
    var fc = 0
    var sc = 0
    var tc = 0
    
    for i in 0 ... answers.count-1 {
        if answers[i] == first[i] {
            fc += 1
        }
        if answers[i] == second[i] {
            sc += 1
        }
        if answers[i] == third[i] {
            tc += 1
        }
    }
    
    if fc>=sc && fc>=tc {
        solArr.append(1)
    }
    if sc>=fc && sc>=tc {
        solArr.append(2)
    }
    if tc>=sc && tc>=fc {
        solArr.append(3)
    }
    
    return solArr
}
