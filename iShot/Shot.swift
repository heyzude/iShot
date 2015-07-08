//
//  Shot.swift
//  iShot
//
//  Created by Hey Jude on 2015. 7. 8..
//  Copyright (c) 2015년 Hey Jude. All rights reserved.
//

import Foundation

class Shot{
    
    var id : Int!
    var title : String!
    var date :  String!
    var description : String!
    var commentCount : Int!
    var likesCount : Int!
    var viewsCount : Int!
    var commentUrl : String!
    var imageUrl : String!
    
    var imageData :  NSData?
    
    init(data : NSDictionary){
        
        self.id = data["id"] as! Int
        self.commentCount =  data["comments_count"] as! Int
        self.likesCount = data["likes_count"] as! Int
        self.viewsCount = data["views_count"] as! Int
        
        self.commentUrl = getStringFromJSON(data, key: "comments_url")
        self.title = getStringFromJSON(data, key: "title")
        
        let dateInfo = getStringFromJSON(data, key: "created_at")
        self.date = dateInfo
        
        let desc = getStringFromJSON(data, key: "description")
        self.description = desc
        
        let images = data["images"] as! NSDictionary
        self.imageUrl = getStringFromJSON(images, key: "normal")
        
    }
    
    func getStringFromJSON(data: NSDictionary, key: String) -> String{
       
        
        if let info = data[key] as? String {
            return info
        }
        return ""
    }
    
}