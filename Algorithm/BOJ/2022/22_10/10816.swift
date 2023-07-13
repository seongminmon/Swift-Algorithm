//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2022/10/20.
//
// 10816 : 숫자 카드 2
// https://www.acmicpc.net/problem/10816

import Foundation

// 입력
let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{ Int(String($0))!}
let m = Int(readLine()!)!
var targetArr = readLine()!.split(separator: " ").map{ Int(String($0))!}

// 풀이 1: lowerBound, upperBound 풀이
arr.sort()

func lowerBound(_ arr: [Int], _ target: Int) -> Int {
   var start = 0
   var end = n

   while start < end {
       let mid = (start + end) / 2

       if arr[mid] < target {
           start = mid + 1
       } else {
           end = mid
       }
   }

   return start
}

func upperBound(_ arr: [Int], _ target: Int) -> Int {
   var start = 0
   var end = n

   while start < end {
       let mid = (start + end) / 2

       if arr[mid] <= target {
           start = mid + 1
       } else {
           end = mid
       }
   }

   return start
}

var result = [Int]()
for target in targetArr {
   let s = lowerBound(arr, target)
   let e = upperBound(arr, target)
   result.append(e - s)
}

// 풀이 2. 딕셔너리 풀이
//var dict = [Int: Int]()
//for i in arr {
//    if dict[i] != nil {
//        dict[i]! += 1
//    } else {
//        dict[i] = 1
//    }
//}
//
//var result = [Int]()
//for target in targetArr {
//    if dict[target] != nil {
//        result.append(dict[target]!)
//    } else {
//        result.append(0)
//    }
//}

// 출력
print(result.map{ String($0) }.joined(separator: " "))
