//
//  Tweet.swift
//  Tweeter
//
//  Created by Jessica Choi on 7/1/16.
//  Copyright © 2016 Jessica Choi. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timeStamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var retweetedTweet: NSDictionary? = nil
    var favorited: Bool = false
    var retweeted: Bool = false
    
    var user: User?
    
    var id: String?
    
    init(dictionary: NSDictionary){
        text = dictionary["text"] as? String
        
        let timeStampString = dictionary["created_at"] as? String
        if let timeStampString = timeStampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timeStamp = formatter.dateFromString(timeStampString)
        }
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        favorited = (dictionary["favorited"] as? Bool)!
        retweeted = (dictionary["retweeted"] as? Bool)!
        
        user = User(dictionary: (dictionary["user"] as? NSDictionary)!)
        retweetedTweet = (dictionary["retweeted_status"] as? NSDictionary)
        id = (dictionary["id_str"] as? String)
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }

}
