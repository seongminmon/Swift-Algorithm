//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/12/05.
//
// 6603 : 로또
// https://www.acmicpc.net/problem/6603

import Foundation

while let line = readLine() {
    // 입력
    var arr = line.split(separator: " ").map{ Int(String($0))! }
    
    // 종료 조건
    if arr[0] == 0 {
        break
    }
    
    let k = arr[0]
    arr.remove(at: 0)
    
    // 풀이
    var visited = [Bool](repeating: false, count: k)
    func dfs(_ depth: Int, _ start: Int) {
        // 종료 조건
        if depth == 6 {
            for i in 0 ..< k {
                if visited[i] {
                    print(arr[i], terminator: " ")
                }
            }
            print("")
            return
        }
        
        for i in start ..< k {
            if !visited[i] {
                visited[i] = true
                dfs(depth+1, i)
                visited[i] = false
            }
        }
    }
    
    dfs(0, 0)
    print("")
}
