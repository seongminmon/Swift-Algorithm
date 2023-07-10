//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/09.
//
// [1차] 뉴스 클러스터링
// 2018 KAKAO BLIND RECRUITMENT
// Lv. 2
// https://school.programmers.co.kr/learn/courses/30/lessons/17677

func makeSet(_ str: [Character]) -> [String] {
    var set = [String]()
    for i in 0..<str.count-1 {
        let (a,b) = (str[i], str[i+1])
        if a.isLetter && b.isLetter {
            set.append(String(a) + String(b))
        }
    }
    return set
}

func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = makeSet(Array(str1.uppercased()))
    var str2 = makeSet(Array(str2.uppercased()))

    if str1.isEmpty && str2.isEmpty { return 65536 }

    var unionCnt = str1.count + str2.count
    var interCnt = 0
    for i in 0..<str1.count {
        for j in 0..<str2.count {
            if str1[i] == str2[j] {
                interCnt += 1
                str2.remove(at: j)
                break
            }
        }
    }
    unionCnt -= interCnt

    return Int(Double(interCnt) / Double(unionCnt) * 65536)
}

print(solution("FRANCE", "french"))
print(solution("handshake", "shake hands"))
print(solution("aa1+aa2", "AAAA12"))
print(solution("E=M*C^2", "e=m*c^2"))
