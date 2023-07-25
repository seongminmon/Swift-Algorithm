//
//  main.swift
//  Algorithm
//
//  Created by 김성민 on 2023/07/24.
//
// 매칭 점수
// 2019 KAKAO BLIND RECRUITMENT
// Lv.3
// https://school.programmers.co.kr/learn/courses/30/lessons/42893
// unsolved...

import Foundation

//extension String {
//    func getAllMatchAfterRegex(_ pattern: String, _ option: NSRegularExpression.Options) -> [String] {
//        // 옵셔널을 벗기기 위해 do-catch를 사용
//        do {
//            let regex = try NSRegularExpression(pattern: pattern, options: option)
//            let range = NSRange(self.startIndex..., in: self)
//            let matches = regex.matches(in: self, range: range)
//
//            return matches.map { String(self[Range($0.range, in: self)!]) }
//        } catch let error {
//            print("invalid regex: \(error.localizedDescription)")
//            return []
//        }
//    }
//}
//
//func parsing(_ target: String, _ page: String) -> (String, Int, [String]) {
//    // 1. url
//    // head -> meta 태그안의 url을 추출
//    let head = page.getAllMatchAfterRegex("<head>(.+)</head>", .dotMatchesLineSeparators)[0]
//    let url = head.getAllMatchAfterRegex("(?<=meta property=\"og:url\" content=\"https://)([^\"]+)", .dotMatchesLineSeparators)[0]
//
//    // 2. 기본점수
//    // target과 일치하는 단어 count
//    let wordList = page.getAllMatchAfterRegex("[a-zA-Z]+", [])
//    var basicCnt = 0
//    for i in 0..<wordList.count {
//        if target == wordList[i].lowercased() {
//            basicCnt += 1
//        }
//    }
//
//    // 3. 링크 리스트
//    // 후방탐색으로 외부링크 추출
//    var linkList = page.getAllMatchAfterRegex("(?<=<a href=\"https://)([^\"]+)", .dotMatchesLineSeparators)
//    linkList = Array(Set(linkList)) // 중복 삭제
//
//    return (url, basicCnt, linkList)
//}
//
//class Page {
//    var index: Int
//    var url: String
//    var basicScore: Int
//    var linkList: [String]
//    var totalScore: Double
//
//    init(index: Int, url: String, basicScore: Int, linkList: [String], totalScore: Double) {
//        self.index = index
//        self.url = url
//        self.basicScore = basicScore
//        self.linkList = linkList
//        self.totalScore = totalScore
//    }
//}
//
//func solution(_ word:String, _ pages:[String]) -> Int {
//    let word = word.lowercased()
//    var pageList = [Page]()
//    var pageDict = [String: Int]()  // [url: index]
//
//    for i in 0..<pages.count {
//        let page = pages[i]
//        let (url, basicScore, linkList) = parsing(word, page)
//        pageList.append(Page(
//            index: i,
//            url: url,
//            basicScore: basicScore,
//            linkList: linkList,
//            totalScore: Double(basicScore)
//        ))
//        pageDict[url] = i
//    }
//
//    // 링크 점수 뿌려주기
//    for page in pageList {
//        if page.linkList.isEmpty { continue }
//
//        // 링크 점수 = 기본 점수 / 외부 링크 수
//        let linkScore = Double(page.basicScore) / Double(page.linkList.count)
//        for link in page.linkList {
//            if let targetIdx = pageDict[link] {
//                pageList[targetIdx].totalScore += linkScore
//            }
//        }
//    }
//
//    // test 출력
////    for page in pageList {
////        print(page.index, page.url, page.basicScore, page.linkList, page.totalScore)
////    }
//
//    pageList.sort { $0.totalScore == $1.totalScore ? $0.index < $1.index : $0.totalScore > $1.totalScore }
//
//    return pageList[0].index
//}

print(solution("blind", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://a.com\"/>\n</head>  \n<body>\nBlind Lorem Blind ipsum dolor Blind test sit amet, consectetur adipiscing elit. \n<a href=\"https://b.com\"> Link to b </a>\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://b.com\"/>\n</head>  \n<body>\nSuspendisse potenti. Vivamus venenatis tellus non turpis bibendum, \n<a href=\"https://a.com\"> Link to a </a>\nblind sed congue urna varius. Suspendisse feugiat nisl ligula, quis malesuada felis hendrerit ut.\n<a href=\"https://c.com\"> Link to c </a>\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://c.com\"/>\n</head>  \n<body>\nUt condimentum urna at felis sodales rutrum. Sed dapibus cursus diam, non interdum nulla tempor nec. Phasellus rutrum enim at orci consectetu blind\n<a href=\"https://a.com\"> Link to a </a>\n</body>\n</html>"]))
print(solution("Muzi", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://careers.kakao.com/interview/list\"/>\n</head>  \n<body>\n<a href=\"https://programmers.co.kr/learn/courses/4673\"></a>#!MuziMuzi!)jayg07con&&\n\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://www.kakaocorp.com\"/>\n</head>  \n<body>\ncon%\tmuzI92apeach&2<a href=\"https://hashcode.co.kr/tos\"></a>\n\n\t^\n</body>\n</html>"]))
