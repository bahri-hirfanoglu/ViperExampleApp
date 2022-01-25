//
//  Api.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import Foundation

public enum ApiError: Int, Error {
    case NilResponse = 0,
    ErrorHttpStatus,
    NilBody,
    failedParse
}

protocol ApiProtocol {
    func request(url: URL, onSuccess: @escaping (Data, URLResponse?) -> Void, onError: @escaping (Error) -> Void)
}


class ApiTask : ApiProtocol
{
    public init() {}
    public func request(url: URL, onSuccess: @escaping (Data, URLResponse?) -> Void, onError: @escaping (Error) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [self] data, response, error in
            if let error = error {
                onError(error)
                return
            }
            if let responseError = self.checkResponse(response: response) {
                onError(responseError)
                return
            }
            guard let data = data else {
                onError(ApiError.NilBody)
                return
            }
            onSuccess(data, response)
        }
        task.resume()
    }
    
    func createError(_ code: ApiError, _ info: [String: Any]?) -> NSError {
        return NSError(domain: "ApiError", code: code.rawValue, userInfo: info)
    }

    func checkResponse(response: URLResponse?) -> NSError? {
        guard let notNilResponse = response else {
            return createError(.NilResponse, nil)
        }

        let httpResponse = notNilResponse as! HTTPURLResponse
        guard (200..<300) ~= httpResponse.statusCode else {
            return createError(.ErrorHttpStatus, ["statusCode": httpResponse.statusCode])
        }
        return nil
    }
}
