//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/08/27.
//
// 표 병합
// 2023 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/150366

import Foundation

func solution(_ commands:[String]) -> [String] {
    var values = [[String]](repeating: [String](repeating: "", count: 50), count: 50)
    var parent = [[(Int, Int)]](repeating: [(Int, Int)](repeating: (0, 0), count: 50), count: 50)
    for i in 0..<50 {
        for j in 0..<50 {
            parent[i][j] = (i, j)
        }
    }
    
    func update1(_ r: Int, _ c: Int, _ value: String) {
        let (pr, pc) = parent[r][c]
        values[pr][pc] = value
    }
    
    func update2(_ value1: String, _ value2: String) {
        for i in 0..<50 {
            for j in 0..<50 {
                if values[i][j] == value1 {
                    values[i][j] = value2
                }
            }
        }
    }
    
    func merge(_ r1: Int, _ c1: Int, _ r2: Int, _ c2: Int) {
        let (pr1, pc1) = parent[r1][c1]
        let (pr2, pc2) = parent[r2][c2]
        
        for i in 0..<50 {
            for j in 0..<50 {
                if parent[i][j] == (pr2, pc2) {
                    parent[i][j] = (pr1, pc1)
                }
            }
        }
        
        if values[pr1][pc1] == "" {
            values[pr1][pc1] = values[pr2][pc2]
        }
    }
    
    func unmerge(_ r: Int, _ c: Int) {
        let (pr, pc) = parent[r][c]
        let value = values[pr][pc]
        
        for i in 0..<50 {
            for j in 0..<50 {
                if parent[i][j] == (pr, pc) {
                    parent[i][j] = (i, j)
                    values[i][j] = ""
                }
            }
        }
        
        values[r][c] = value
    }
    
    var result = [String]()
    for command in commands {
        let com = command.split(separator: " ").map { String($0) }
        switch com[0] {
        case "UPDATE":
            if com.count == 4 {
                let r = Int(com[1])! - 1
                let c = Int(com[2])! - 1
                let value = com[3]
                update1(r, c, value)
            } else {
                let value1 = com[1]
                let value2 = com[2]
                update2(value1, value2)
            }
        case "MERGE":
            let r1 = Int(com[1])! - 1
            let c1 = Int(com[2])! - 1
            let r2 = Int(com[3])! - 1
            let c2 = Int(com[4])! - 1
            merge(r1, c1, r2, c2)
        case "UNMERGE":
            let r = Int(com[1])! - 1
            let c = Int(com[2])! - 1
            unmerge(r, c)
        case "PRINT":
            let r = Int(com[1])! - 1
            let c = Int(com[2])! - 1
            let (pr, pc) = parent[r][c]
            let value = values[pr][pc]
            result.append(value == "" ? "EMPTY" : value)
        default:
            break
        }
    }
    return result
}

print(solution(["UPDATE 1 1 menu", "UPDATE 1 2 category", "UPDATE 2 1 bibimbap", "UPDATE 2 2 korean", "UPDATE 2 3 rice", "UPDATE 3 1 ramyeon", "UPDATE 3 2 korean", "UPDATE 3 3 noodle", "UPDATE 3 4 instant", "UPDATE 4 1 pasta", "UPDATE 4 2 italian", "UPDATE 4 3 noodle", "MERGE 1 2 1 3", "MERGE 1 3 1 4", "UPDATE korean hansik", "UPDATE 1 3 group", "UNMERGE 1 4", "PRINT 1 3", "PRINT 1 4"]))
print(solution(["UPDATE 1 1 a", "UPDATE 1 2 b", "UPDATE 2 1 c", "UPDATE 2 2 d", "MERGE 1 1 1 2", "MERGE 2 2 2 1", "MERGE 2 1 1 1", "PRINT 1 1", "UNMERGE 2 2", "PRINT 1 1"]))
