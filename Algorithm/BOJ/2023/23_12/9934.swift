//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 12/11/23.
//
// 9934 : 완전 이진 트리
// https://www.acmicpc.net/problem/9934

import Foundation

let k = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = [[Int]](repeating: [], count: k)
func solve(_ left: Int, _ right: Int, _ depth: Int) {
    if left > right { return }
    
    let mid = (left + right) / 2
    
    ans[depth].append(arr[mid])
    solve(left, mid-1, depth+1)
    solve(mid+1, right, depth+1)
}
solve(0, arr.count-1, 0)

ans.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}
