//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/02/19.
//
// 14719 : 빗물
// https://www.acmicpc.net/problem/14719

import Foundation

let hw = readLine()!.split(separator: " ").map{ Int(String($0))!}
let (h,w) = (hw[0], hw[1])
let heights = readLine()!.split(separator: " ").map{ Int(String($0))!}

// 풀이 1
var leftMax = [Int](repeating: 0, count: w)
var rightMax = [Int](repeating: 0, count: w)
leftMax[0] = heights[0]
rightMax[w-1] = heights[w-1]

for i in 1 ..< w {
    leftMax[i] = max(leftMax[i-1], heights[i])
}
for i in stride(from: w-2, through: 0, by: -1) {
    rightMax[i] = max(rightMax[i+1], heights[i])
}

var result = 0
for i in stride(from: 1, to: w-1, by: 1) {
    result += min(leftMax[i], rightMax[i]) - heights[i]
}
print(result)

// 풀이 2
//var result = 0
//for i in stride(from: 1, to: w-1, by: 1) {
//    var lMax = 0
//    var rMax = 0
//    for j in 0 ... i {
//        lMax = max(lMax, heights[j])
//    }
//    for j in i ..< heights.count {
//        rMax = max(rMax, heights[j])
//    }
//
////    print(lMax, rMax, heights[i], min(lMax, rMax) - heights[i])
//    result += min(lMax, rMax) - heights[i]
//}
//print(result)
