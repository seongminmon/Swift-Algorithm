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


// 정답: 80, 내답: 85
//3 100
//56 71 70 25 52 77 76 8 68 71 51 65 13 23 7 16 19 54 95 18 86 74 29 76 61 93 44 96 32 72 64 19 50 49 22 14 7 64 24 83 6 3 2 76 99 7 76 100 60 60 6 50 90 49 27 51 37 61 16 84 89 51 73 28 90 77 73 39 78 96 78 13 92 54 70 69 62 78 7 75 30 67 97 98 19 86 90 90 2 39 41 58 57 84 19 8 52 39 26 7
