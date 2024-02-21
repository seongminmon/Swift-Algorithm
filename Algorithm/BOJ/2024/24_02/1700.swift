//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2/18/24.
//
// 1700 : 멀티탭 스케줄링
// https://www.acmicpc.net/problem/1700

import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,k) = (nk[0], nk[1])
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }

var ans = 0
var plug = [Int]()
for i in 0..<k {
    if !plug.contains(arr[i]) {
        if plug.count == n {
            var temp = Set(plug)
            for j in i+1..<k {
                if temp.count == 1 { break }
                if temp.contains(arr[j]) {
                    temp.remove(arr[j])
                }
            }
            let target = temp.first!
            let targetIndex = plug.firstIndex(of: target)!
            plug.remove(at: targetIndex)
            ans += 1
        }
        plug.append(arr[i])
    }
}
print(ans)
