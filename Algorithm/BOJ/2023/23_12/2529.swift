//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/10/23.
//
// 2529 : 부등호
// https://www.acmicpc.net/problem/2529

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { String($0) }

var Min = String(repeating: "9", count: n+1)
var Max = String(repeating: "0", count: n+1)

var visited = [Bool](repeating: false, count: 10)
var permu = [String]()
func solve(_ depth: Int) {
    if depth == n+1 {
        let temp = permu.joined()
        Min = min(Min, temp)
        Max = max(Max, temp)
        return
    }
    
    for i in 0..<10 {
        if !visited[i] {
            if let pre = permu.last {
                if input[depth-1] == "<" {
                    if pre > String(i) {
                        continue
                    }
                } else {
                    if pre < String(i) {
                        continue
                    }
                }
            }
            
            visited[i] = true
            permu.append(String(i))
            solve(depth+1)
            visited[i] = false
            permu.removeLast()
        }
    }
}

solve(0)

print(Max)
print(Min)
