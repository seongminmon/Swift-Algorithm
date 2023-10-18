//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/10/17.
//
// 4195 : 친구 네트워크
// https://www.acmicpc.net/problem/4195

import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let f = Int(readLine()!)!
    
    var parent = [String: String]()
    var friendCount = [String: Int]()
    
    func find(_ a: String) -> String {
        if parent[a]! != a {
            parent[a] = find(parent[a]!)
        }
        return parent[a]!
    }

    func union(_ a: String, _ b: String) {
        let pa = find(a)
        let pb = find(b)
        
        if pa < pb {
            parent[pa] = pb
            friendCount[pb]! += friendCount[pa]!
        } else if pa > pb {
            parent[pb] = pa
            friendCount[pa]! += friendCount[pb]!
        }
    }
    
    for _ in 0..<f {
        let ab = readLine()!.split(separator: " ")
        let (a,b) = (String(ab[0]), String(ab[1]))
        
        if parent[a] == nil {
            parent[a] = a
        }
        if parent[b] == nil {
            parent[b] = b
        }
        
        if friendCount[a] == nil {
            friendCount[a] = 1
        }
        if friendCount[b] == nil {
            friendCount[b] = 1
        }
        
        union(a, b)
        
        print(friendCount[find(a)]!)
    }
}
