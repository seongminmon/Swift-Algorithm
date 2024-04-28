//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 4/27/24.
//
// 1072 : 게임
// https://www.acmicpc.net/problem/1072

import Foundation

let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
let (x,y) = (xy[0], xy[1])
let z = y * 100 / x

var ans = -1
var start = 1
var end = Int(1e9)
while start <= end {
    let mid = (start + end) / 2
    
    let tempx = x + mid
    let tempy = y + mid
    let tempz = tempy * 100 / tempx
    
    if tempz == z {
        start = mid + 1
    } else {
        end = mid - 1
        ans = mid
    }
}
print(ans)
