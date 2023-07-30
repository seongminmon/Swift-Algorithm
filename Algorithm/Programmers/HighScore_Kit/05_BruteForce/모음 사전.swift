//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/05/10.
//
// 모음 사전
// 완전탐색
// LV.2
// https://school.programmers.co.kr/learn/courses/30/lessons/84512

import Foundation

func solution(_ word:String) -> Int {
    let vowels = ["A", "E", "I", "O", "U"]
    var wordArr = [String]()
    func permutation(_ perm: [Int], cnt: Int) {
        if perm.count == cnt {
            var str = ""
            for idx in perm {
                str += vowels[idx]
            }
            wordArr.append(str)
            return
        }

        for i in 0..<5 {
            permutation(perm + [i], cnt: cnt)
        }
    }

    for i in 1...5 {
        permutation([], cnt: i)
    }

    wordArr.sort()
    return wordArr.firstIndex(of: word)! + 1
}

// 풀이2
//func solution(_ word:String) -> Int {
//    let alphabet = ["A", "E", "I", "O", "U"]
//    var result = [String]()
//
//    func permutation(cur: String) {
//        result.append(cur)
//
//        if cur.count == 5 { return }
//
//        for i in 0..<5 {
//            permutation(cur: cur + alphabet[i])
//        }
//    }
//
//    permutation(cur: "")
//
//    return result.firstIndex(of: word)!
//}

print(solution("AAAAE"))
print(solution("AAAE"))
print(solution("I"))
print(solution("EIO"))
