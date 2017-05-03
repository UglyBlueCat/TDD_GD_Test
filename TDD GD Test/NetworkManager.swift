//
//  NetworkManager.swift
//  TDD GD Test
//
//  Created by Robin Spinks on 03/05/2017.
//  Copyright © 2017 Robin Spinks. All rights reserved.
//

import Foundation

class NetworkManager {
    
    enum Method: String {
        case GET, POST, PUT, DELETE
    }
    
    let urlSession : URLSession
    
    init() {
        self.urlSession = URLSession(configuration: .default)
    }
    
    /**
     Calls an HTTP request with the POST method
     
     - parameters:
         - headers: The http request headers
         - params: The parameters for the POST request
         - body: The body for the http request
         - urlString: the URL of the POST request
         - completion: A method to handle the returned data
     */
    func postRequest (headers: Dictionary<String, String>,
                      params: Dictionary<String, String>,
                      body : Data,
                      urlStr: String,
                      completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        makeRequest(method: .POST,
                    headers: headers,
                    params: params,
                    body : body,
                    urlStr: urlStr,
                    completion: completion)
    }
    
    /**
     Calls an HTTP request with the GET method
     
     - parameters:
         - headers: The http request headers
         - params: The parameters for the GET request
         - body: The body for the http request
         - urlString: the URL of the GET request
         - completion: A method to handle the returned data
     */
    func getRequest (headers: Dictionary<String, String>,
                     params: Dictionary<String, String>,
                     body : Data,
                     urlStr: String,
                     completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        makeRequest(method: .GET,
                    headers: headers,
                    params: params,
                    body : body,
                    urlStr: urlStr,
                    completion: completion)
    }
    
    /**
     Makes an HTTP request with the provided parameters
     
     - parameters:
         - method: The method for the request
         - headers: The http request headers
         - params: The parameters for the request
         - body: The body for the http request
         - urlStr: the URL of the request
         - completion: A method to handle the returned data
     */
    func makeRequest(method: Method,
                     headers: Dictionary<String, String>,
                     params: Dictionary<String, String>,
                     body : Data,
                     urlStr: String,
                     completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        if var urlComponents = URLComponents(string: urlStr) {
            
            var requestParams: [URLQueryItem] = []
            
            for (paramName, paramValue) in params {
                requestParams.append(URLQueryItem(name: paramName, value: paramValue))
            }
            
            urlComponents.queryItems = requestParams
            
            if let url : URL = urlComponents.url {
                var request : URLRequest = URLRequest(url: url)
                request.httpMethod = method.rawValue
                request.httpBody = body
                
                for (key, value) in headers {
                    request.setValue(value, forHTTPHeaderField: key)
                }
                
                self.handleRequest(request: request, completion: completion)
            } else {
                print("Could not obtain NSURL from \(urlComponents.debugDescription)")
            }
        } else {
            print("Could not construct NSURLComponents from \(urlStr)")
        }
    }
    
    /**
     Handles an HTTP request of any type
     
     - parameters:
         - request: The HTTP request
         - completion: A method to handle the returned data
     */
    func handleRequest (request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let task : URLSessionDataTask = urlSession.dataTask(with: request, completionHandler: completion)
        task.resume()
    }
}
