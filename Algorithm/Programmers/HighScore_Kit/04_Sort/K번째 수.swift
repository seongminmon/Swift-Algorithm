//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/06/08.
//
// K번째 수
// 정렬
// LV.1
// https://school.programmers.co.kr/learn/courses/30/lessons/42748

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var start : Int
    var end : Int
    var target : Int
    var tempArr : [Int] = []
    var solArr : [Int] = []
    
    for i in 0 ... commands.count - 1 {
        start = commands[i][0] - 1
        end = commands[i][1] - 1
        target = commands[i][2] - 1
        tempArr.removeAll()
        for j in start ... end {
            tempArr.append(array[j])
        }
        tempArr.sort()
        solArr.append(tempArr[target])
    }
    return solArr
}
