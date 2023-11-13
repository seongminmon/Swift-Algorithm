//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/11/13.
//
// 1114 : 통나무 자르기
// https://www.acmicpc.net/problem/1114

import Foundation

let lkc = readLine()!.split(separator: " ").map { Int(String($0))! }
var (l,k,c) = (lkc[0], lkc[1], lkc[2])
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

// 중복 제거 + 정렬, k값 갱신
let arr = Array(Set(input)).sorted()
k = arr.count

func check(_ length: Int) -> Int? {
    var pre = l
    var cnt = 0
    for i in stride(from: k-1, through: 0, by: -1) {
        if pre - arr[i] > length {
            if i == k-1 || arr[i+1] - arr[i] > length {
                return nil
            }
            pre = arr[i+1]
            cnt += 1
        }
        if cnt >= c { break }
    }
    
    if cnt < c {
        pre = arr[0]
    }
    
    if pre > length {
        return nil
    } else {
        return pre
    }
}

var ans = (0,0)
var start = 0
var end = l
while start <= end {
    let mid = (start + end) / 2
    
    if let point = check(mid) {
        end = mid - 1
        ans = (mid, point)
    } else {
        start = mid + 1
    }
}
print(ans.0, ans.1)
