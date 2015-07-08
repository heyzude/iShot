//
//  DribbbleAPI.swift
//  iShot
//
//  Created by Hey Jude on 2015. 7. 8..
//  Copyright (c) 2015년 Hey Jude. All rights reserved.
//

import Foundation

class DribbbleAPI {
    
    let accessToken = "63c96ad75f630654685a971bc5b2a192d52b1fa93d68bbfd00730ebbde958d52"
    func loadShots(completion: (AnyObject -> Void)!) {
        var urlString = "https://api.dribbble.com/v1/shots?access_token=" + accessToken
        
        let session = NSURLSession.sharedSession()
        let shotsUrl = NSURL(string: urlString)
        
        var task = session.dataTaskWithURL(shotsUrl!){
            (data, response, error) -> Void in
            
            if error !=aq nil {
                println(error.localizedDescription)
            } else {
                
                var error : NSError?
                
                var shotsData = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers,  error: &error) as! NSArray
                
                var shots = [Shot]()
                
                for shot in shotsData{
                    let shot = Shot(data: shot as! NSDictionary)
                    shots.append(shot)
                }
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        completion(shots)
                    }
                }
                
                
            }
            }
        task.resume()
            }
        }


