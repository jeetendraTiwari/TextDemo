//
//  NetworkManager.swift
//  WeatherDemo
//
//  Created by Jeetendra on 15/03/21.
//

import Foundation
import Alamofire


class NetworkManager: NSObject {
    static let objGlobalMethod = NetworkManager()
    


    
    func getResult(url:String,name: MethodName, parameters:[String : Any], method: HTTPMethod , completion: @escaping (Bool, Any?) -> Void) {
        
        let _headers : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        
        
        switch name {
        case .Login:
            print("Lots of planets have a north")
        case .SignUp:
            print("Watch out for penguins")
        case .Dashboard:
            print("Where the sun rises")
        case .vechile:
            print("Where the skies are blue")
        case .Message:
            print("Where the skies are blue")
        case .Deliveries:
            print("Where the skies are blue")
        case .AccessControl:
            print("Where the skies are blue")
        case .Amenities:
            print("Where the skies are blue")
        case .Weater:
            print("Where the skies are blue")
        }
        
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.httpBody , headers: _headers)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                case .success(_):
                    if let json = response.value
                    {
                        
                        completion(true, json)
                        
                    }
                    break
                case .failure(let error):
                    completion(false, error)
                    break
                }
                
            }
    }

       
  /*
    
    /**********************------This is for Get request------**********************/
    class func callWebAPIGetRequest(apiURL: String,CallBack: @escaping (_ data: Data?, _ error : ApiError?)->Void){
        if Reachability.isConnectedToNetwork(){
            let apiURLMain:String! = apiURL.replacingOccurrences(of: " ", with: "%20")
            
            let finalUrl:URL! = URL(string: apiURLMain)
            var urlRequest = URLRequest(url:finalUrl!)
            urlRequest.httpMethod = "LS_GET_Exception".localized
            urlRequest.timeoutInterval = TimeInterval(kTimeOut)
        //    urlRequest.setValue(Constant.kApiKey, forHTTPHeaderField: "apiKey")
            
            let task = URLSession.shared.dataTask(with: urlRequest) {
                (data: Data?, response: URLResponse?, error: Error?) in
                //print(data)
                
                DispatchQueue.main.async {
                    guard error == nil else {
                        CallBack(nil,ApiError.ServerError(message: "LS_ServerError_Exception".localized))
                        return
                    }
                    guard let _data = data
                        else {
                            CallBack(nil,ApiError.ServerError(message: "LS_ServerError_Exception".localized))
                            return
                    }
                    
                   
                    
                    CallBack(_data, nil)
                }
                
            }
          
            task.resume()
        }
        else {
            DispatchQueue.main.async {
                CallBack(nil,ApiError.NoInternet(message: "LS_NoInternet_Exception".localized))
            }
        }
    }
    
    /**********************------This is for Post request------**********************/
    class func callWebAPIPostRequest(apiURL: String,requestParam: [String : AnyObject],CallBack: @escaping ( _ jsonResponse: Data?, _ error : ApiError?)->Void) {
        if Reachability.isConnectedToNetwork(){
            let finalUrl = URL(string: apiURL);
            var request = URLRequest(url:finalUrl!)
            
            request.httpMethod = "LS_POST_Exception".localized
            request.httpBody = self.getParam(params: requestParam).data(using: String.Encoding.utf8)
            //request.setValue(kAccessToken, forHTTPHeaderField: "LS_Authorization_Exception".localized)
            request.setValue("LS_ApplicationJson_Exception".localized, forHTTPHeaderField: "LS_Content-Type_Exception".localized)
      //      request.setValue(Constant.kApiKey, forHTTPHeaderField: "apiKey")

            request.timeoutInterval = TimeInterval(kTimeOut)

            let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                
                DispatchQueue.main.async {
                    guard error == nil else {
                        CallBack(nil,ApiError.ServerError(message: "LS_ServerError_Exception".localized))
                        return
                    }
                    guard let _data = data
                        else {
                            CallBack(nil,ApiError.ServerError(message: "LS_ServerError_Exception".localized))
                            return
                    }
                    CallBack(_data,nil)
                }
            }
            task.resume()
        }
        else{
            DispatchQueue.main.async {
                CallBack(nil,ApiError.NoInternet(message: "LS_NoInternet_Exception".localized))
            }
        }
    }

    /**********------This is the method for converting the dictionary into string format------**********/
    class func getParam(params: [String : AnyObject]) -> String{
        var passparam : String!
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: JSONSerialization.WritingOptions.prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            let theJSONText = String(data: jsonData,
                                     encoding: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
            passparam = theJSONText!
        } catch let error as NSError {
            Util.dp("getParam() \(error)" as AnyObject)
            passparam = ""
        }
        Util.dp("getParam() \(passparam!)" as AnyObject)
        return passparam
}
    */
}
