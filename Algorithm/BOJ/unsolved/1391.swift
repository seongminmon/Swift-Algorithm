//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/28.
//
// 1391 : 종이접기
// https://www.acmicpc.net/problem/1391

// unsolved...

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let paper = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    func solve(_ paper: [Int]) -> Bool {
        var paren = [(Int,Bool,Int)]()
        var ident = 0
        for i in stride(from: 1, to: n, by: 2) {
            var open = paper[i-1]
            var close = paper[i]
            
            if open > close {
                (open, close) = (close, open)
            }
            
            paren.append((open, false, ident))
            paren.append((close, true, ident))
            ident += 1;
        }
        paren.sort { $0.0 < $1.0 }
        
        var stack = [Int]()
        for (_, isClose, ident) in paren {
            if isClose {
                if let top = stack.popLast(),
                   top != ident {
                    return false
                }
            } else {
                stack.append(ident)
            }
        }
        return true
    }
    
    print(solve(paper) && solve(Array(paper[1...])) ? "YES" : "NO")
}
