//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/22.
//
// 2632 : 피자판매
// https://www.acmicpc.net/problem/2632

import Foundation

let target = Int(readLine()!)!
let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m,n) = (mn[0], mn[1])

var a = [Int]()
for _ in 0..<m {
    a.append(Int(readLine()!)!)
}
var b = [Int]()
for _ in 0..<n {
    b.append(Int(readLine()!)!)
}

func makeDict(_ arr: [Int]) -> [Int: Int] {
    var dict = [Int: Int]()
    for i in 0..<arr.count {
        var temp = 0
        for j in i..<i+arr.count-1 {
            temp += arr[j % arr.count]

            if temp > target { break }

            dict[temp, default: 0] += 1
        }
    }

    let sum = arr.reduce(0,+)
    if sum <= target {
        dict[sum, default: 0] += 1
    }

    return dict
}

var dictA = makeDict(a)
var dictB = makeDict(b)

var ans = 0
ans += dictA[target] ?? 0
ans += dictB[target] ?? 0
for key in dictA.keys {
    if let cnt = dictB[target - key] {
        ans += dictA[key]! * cnt
    }
}
print(ans)
