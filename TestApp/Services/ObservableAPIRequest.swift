//
//  APIClient.swift
//  TestApp
//
//  Created by Can Akyıldız on 3.11.2021.
//

import Foundation
import RxCocoa
import RxSwift

public class ObservableAPIRequest {
    
    private lazy var jsonDecoder = JSONDecoder()
    private var urlSession: URLSession
    public init(config:URLSessionConfiguration) {
        urlSession = URLSession(configuration:
                                    URLSessionConfiguration.default)
    }
    public func callAPI<T: Codable>(request: URLRequest)
    -> Observable<T> {
        return Observable.create { observer in
            let task = self.urlSession.dataTask(with: request) { (data,
                                                                  response, error) in
                if let httpResponse = response as? HTTPURLResponse{
                    let statusCode = httpResponse.statusCode
                    do {
                        let _data = data ?? Data()
                        self.printJSON(_data)
                        if (200...399).contains(statusCode) {
                            self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                            let objs = try self.jsonDecoder.decode(T.self, from:
                                                                    _data)
                            observer.onNext(objs)
                        }
                        else {
                            observer.onError(error!)
                        }
                    } catch {
                        observer.onError(error)
                    }
                }
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    public func printJSON(_ data: Data?){
        guard  let data = data else {
            print("JSON: nil")
            return
        }
        do {
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                print("JSON: nil")
                return
            }
            print("JSON: ", json)
        } catch let err {
            print("JSON ERROR: ", err.localizedDescription)
        }
    }
}



