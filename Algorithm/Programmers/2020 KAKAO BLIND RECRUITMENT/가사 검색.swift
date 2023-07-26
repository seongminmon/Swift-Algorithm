//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/25.
//
// 가사 검색
// 2020 KAKAO BLIND RECRUITMENT
// Lv.4
// https://school.programmers.co.kr/learn/courses/30/lessons/60060

import Foundation

// 트라이 구현 1
//class Node {
//    var key: String
//    var count: Int = 0
//    var child: [String: Node] = [:]
//
//    init(_ key: String) {
//        self.key = key
//    }
//}
//
//class Trie {
//    var root: Node = Node("")
//
//    func insert(_ str: String) {
//        var cur = root
//        for ch in str {
//            cur.count += 1
//            let ch = String(ch)
//            if cur.child[ch] == nil {
//                cur.child[ch] = Node(ch)
//            }
//            cur = cur.child[ch]!
//        }
//    }
//
//    func search(_ str: String) -> Int {
//        var cur = root
//        for ch in str {
//            let ch = String(ch)
//            if ch == "?" {
//                return cur.count
//            }
//            if cur.child[ch] == nil {
//                return 0
//            }
//            cur = cur.child[ch]!
//        }
//        return cur.count
//    }
//}

// 트라이 구현 2
class Trie {
    var child: [String: Trie] = [:]
    var count: Int = 0

    func insert(_ str: String) {
        var cur = self
        for ch in str {
            let ch = String(ch)
            cur.count += 1
            if cur.child[ch] == nil {
                cur.child[ch] = Trie()
            }
            cur = cur.child[ch]!
        }
        cur.count += 1
    }

    func search(_ str: String) -> Int {
        var cur = self
        for ch in str {
            let ch = String(ch)
            if ch == "?" {
                return cur.count
            }
            if cur.child[ch] == nil {
                return 0
            }
            cur = cur.child[ch]!
        }
        return cur.count
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var tries = [Int: Trie]()
    var reTries = [Int: Trie]()
    
    for word in words {
        let size = word.count
        if tries[size] == nil {
            tries[size] = Trie()
            reTries[size] = Trie()
        }
        tries[size]?.insert(word)
        reTries[size]?.insert(String(word.reversed()))
    }

    var result = [Int]()
    for query in queries {
        let size = query.count
        var cnt = 0
        if query.first! == "?" {
            if reTries[size] != nil {
                cnt = reTries[size]!.search(String(query.reversed()))
            }
        } else {
            if tries[size] != nil {
                cnt = tries[size]!.search(query)
            }
        }
        result.append(cnt)
    }
    return result
}

print(solution(["frodo", "front", "frost", "frozen", "frame", "kakao"], ["fro??", "????o", "fr???", "fro???", "pro?"]))
