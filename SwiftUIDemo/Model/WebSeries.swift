//
//  WebSeries.swift
//  SwiftUIDemo
//
//  Created by Gaurang Lathiya on 28/11/19.
//  Copyright © 2019 Gaurang Lathiya. All rights reserved.
//

import SwiftUI

struct WebSeries: Identifiable {
    
    private static var idSequence = sequence(first: 1, next: {$0 + 1})
    
    var id: Int
    var name: String
    
    var year: String
    var genere: String
    var numberOfSeason: Int
    
    var ratingIMDB: String
    var ratingRottenTomatoes: String
    var ratingTVCom: String
    
    var imgPosterImg: String
    
    var numberOfLikes: Int
    var isReacted: Bool
    
    var bio: String
    var firstEpisodDate: String
    var finalEpisodDate: String
    var numberOfEpisodes: Int
    var nominations: String
    var network: String
    
    mutating func updateReaction(withValue isReact: Bool) {
        self.isReacted = isReact
    }
    
    init(name: String, year: String, genere: String, numberOfSeason: Int, ratingIMDB: String, ratingRottenTomatoes: String, ratingTVCom: String, imgPosterImg: String, numberOfLikes: Int, isReacted: Bool, bio: String, firstEpisodDate: String, finalEpisodDate: String, numberOfEpisodes: Int, nominations: String, network: String) {
        
        self.id = WebSeries.idSequence.next() ?? 0
        self.name = name
        
        self.year = year
        self.genere = genere
        self.numberOfSeason = numberOfSeason
        
        self.ratingIMDB = ratingIMDB
        self.ratingRottenTomatoes = ratingRottenTomatoes
        self.ratingTVCom = ratingTVCom
        
        self.imgPosterImg = imgPosterImg
        
        self.numberOfLikes = numberOfLikes
        self.isReacted = isReacted
        
        self.bio = bio
        self.firstEpisodDate = firstEpisodDate
        self.finalEpisodDate = finalEpisodDate
        self.numberOfEpisodes = numberOfEpisodes
        self.nominations = nominations
        self.network = network
    }
    
}

#if DEBUG

let arrWebSeriesDummy: [WebSeries] = [
    
    WebSeries(name: "Tom Clancy's Jack Ryan", year: "2018", genere: "Action", numberOfSeason: 2, ratingIMDB: "8.2/10", ratingRottenTomatoes: "73%", ratingTVCom: "8.2/10", imgPosterImg: "JackRyan", numberOfLikes: 96, isReacted: false, bio: "Author Tom Clancy introduced the character of Jack Ryan in a series of books before Ryan headed to the big screen in several films. Now the former U.S. Marine is featured in an episodic series for the first time, with John Krasinski portraying Ryan in this Amazon original thriller that centers on Ryan as an up-and-coming CIA analyst. He is thrust into a dangerous field assignment for the first time and uncovers a pattern in terrorist communication. That launches him into the middle of a dangerous gambit with a new breed of terrorism that threatens destruction on a global scale.", firstEpisodDate: "31 August 2018",finalEpisodDate: "", numberOfEpisodes: 2, nominations: "Critics' Choice Television Award for Best Supporting Actress in a Drama Series, MORE",network: ""),
    
    WebSeries(name: "Shooter", year: "2016", genere: "Action", numberOfSeason: 3, ratingIMDB: "7.5/10", ratingRottenTomatoes: "", ratingTVCom: "8.6/10", imgPosterImg: "Shooter", numberOfLikes: 96, isReacted: false, bio: "Based on the best-selling novel \"Point of Impact\" by Stephen Hunter, and the 2007 feature film starring Mark Wahlberg, the series stars Ryan Phillippe (\"Secrets and Lies\") and follows the courageous journey of Bob Lee Swagger, a highly-decorated ex-Marine sniper who is coaxed back into action after he learns about a plot to kill the president. When Swagger's former commanding officer Isaac Johnson, played by Omar Epps (\"House\"), solicits his expertise in a clandestine operation, Swagger re-emerges from exile only to discover that he is inextricably involved in a disastrous operation with ties to his past.", firstEpisodDate: "15 November 2016", finalEpisodDate: "21 September 2018", numberOfEpisodes: 31, nominations: "",network: "USA Network"),
    
    WebSeries(name: "Taken", year: "2017", genere: "Action", numberOfSeason: 2, ratingIMDB: "6.6/10", ratingRottenTomatoes: "32%", ratingTVCom: "6.8/10", imgPosterImg: "Taken", numberOfLikes: 93, isReacted: false, bio: "Bryan Mills, a former CIA agent, sets out to take revenge on his enemies after a tragic incident changes his life entirely.", firstEpisodDate: "27 February 2017", finalEpisodDate: "30 June 2018", numberOfEpisodes: 26, nominations: "",network: "NBC"),
    
    WebSeries(name: "Berlin Station", year: "2016", genere: "Drama", numberOfSeason: 2, ratingIMDB: "7.6/10", ratingRottenTomatoes: "", ratingTVCom: "8.5/10", imgPosterImg: "BerlinStation", numberOfLikes: 93, isReacted: false, bio: "Transitioning from his job as a CIA analyst in the U.S., cerebral officer Daniel Miller's new mission puts him under cover at the agency's Berlin branch, tasked with sorting out messy cases involving damaging leaks, whistle-blowers, terrorism and more. Mentored by jaded veteran officer Hector DeJean, Daniel learns the disorderly world of field work means dealing with deception, danger and moral compromises. As he dives deeper into the German capital's hall of mirrors and discovers conspiracies that lead back to Washington, D.C., he wonders if anyone can ever be the same after a posting to Berlin.", firstEpisodDate: "16 October 2016", finalEpisodDate: "17 February 2019", numberOfEpisodes: 0, nominations: "",network: "Epix"),
    
    WebSeries(name: "Counterpart", year: "2017", genere: "Sci-fi", numberOfSeason: 2, ratingIMDB: "8.1/10", ratingRottenTomatoes: "100%", ratingTVCom: "8.3/10", imgPosterImg: "Counterpart", numberOfLikes: 95, isReacted: false, bio: "Howard Silk, a low-level bureaucrat in an agency, is not in a good place in life. He discovers that the agency that employs him is a gateway to a new dimension.", firstEpisodDate: "10 December 2017", finalEpisodDate: "17 February 2019", numberOfEpisodes: 0, nominations: "",network: "Starz"),
    
    WebSeries(name: "Rubicon", year: "2010", genere: "Drama", numberOfSeason: 1, ratingIMDB: "7.9/10", ratingRottenTomatoes: "69%", ratingTVCom: "8.4/10", imgPosterImg: "Rubicon", numberOfLikes: 90, isReacted: false, bio: "Nothing is as it appears to be for Will Travers, a beleaguered and brilliant analyst with the American Policy Institute, a New York-based federal intelligence agency. When he's faced with a shocking tragedy, he starts to uncover clues that could point to a complex conspiracy ... but in searching for the truth he also struggles with issues of mistrust, power, control and paranoia. Just another day at the office for the protagonist Will, who with every question he asks descends further into a mysterious, dangerous world.", firstEpisodDate: "13 June 2010", finalEpisodDate: "17 October 2010", numberOfEpisodes: 13, nominations: "",network: "AMC")
]

#endif

