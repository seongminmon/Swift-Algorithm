//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/05.
//
// 2831 : 댄스 파티
// https://www.acmicpc.net/problem/2831

import Foundation

let n = Int(readLine()!)!
let arr1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr2 = readLine()!.split(separator: " ").map { Int(String($0))! }

var Mplus = [Int]()
var Mminus = [Int]()
var Wplus = [Int]()
var Wminus = [Int]()
for i in 0..<n {
    if arr1[i] < 0 {
        Mminus.append(-arr1[i])
    } else {
        Mplus.append(arr1[i])
    }
    if arr2[i] < 0 {
        Wminus.append(-arr2[i])
    } else {
        Wplus.append(arr2[i])
    }
}
Mplus.sort()
Mminus.sort()
Wplus.sort()
Wminus.sort()

var ans = 0

var i = 0
var j = 0
while i < Mplus.count && j < Wminus.count {
    if Mplus[i] < Wminus[j] {
        ans += 1
        i += 1
        j += 1
    } else {
        j += 1
    }
}

i = 0
j = 0
while i < Mminus.count && j < Wplus.count {
    if Mminus[i] > Wplus[j] {
        ans += 1
        i += 1
        j += 1
    } else {
        i += 1
    }
}

print(ans)
