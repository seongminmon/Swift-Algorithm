//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/22.
//
// 오픈채팅방
// 2019 KAKAO BLIND RECRUITMENT
// Lv.2
// https://school.programmers.co.kr/learn/courses/30/lessons/42888

import Foundation

struct Message {
    var id: String
    var order: String
}

func solution(_ record:[String]) -> [String] {
    var dict = [String: String]()
    var messages = [Message]()
    for i in 0..<record.count {
        let str = record[i].split(separator: " ").map { String($0) }
        let order = str[0]
        let uid = str[1]
        
        switch order {
        case "Enter":
            let name = str[2]
            dict[uid] = name
            messages.append(Message(id: uid, order: order))
        case "Leave":
            messages.append(Message(id: uid, order: order))
        case "Change":
            let name = str[2]
            dict[uid] = name
        default: break
        }
    }
    
    return messages.map { message in
        if message.order == "Enter" {
            return "\(dict[message.id]!)님이 들어왔습니다."
        } else {
            return "\(dict[message.id]!)님이 나갔습니다."
        }
    }
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))
