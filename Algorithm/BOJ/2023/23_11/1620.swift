//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 11/28/23.
//
// 1620 : 나는야 포켓몬 마스터 이다솜
// https://www.acmicpc.net/problem/1620

import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

var arr = [String](repeating: "", count: n+1)
var dict = [String: Int]()
for i in 1...n {
    let name = readLine()!
    arr[i] = name
    dict[name] = i
}

var ans = ""
for _ in 0..<m {
    let input = readLine()!
    if let num = Int(input) {
        ans += "\(arr[num])\n"
    } else {
        ans += "\(dict[input]!)\n"
    }
}
print(ans)
