import Foundation

class NetworkingService {
    let url = URL(string: "https://api.themoviedb.org/3/authentication")!
    let apiKey = ProcessInfo.processInfo.environment["api_key"] ?? ""
    
    func fetch(endpoint: String, completion: @escaping (Result<Data, any Error>) -> Void) { //antiga
        let fullURLString = "https://api.themoviedb.org/3/\(endpoint)?api_key=\(apiKey)"
        
        guard let url = URL(string: fullURLString) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            
            guard let data = data else {
                completion(.failure(URLError(.dataNotAllowed)))
                return
            }
            
            completion(.success(data))
            
        }
        
        task.resume()
    }
    
    func fetch(endpoint: String, name: String) async throws -> Data { //Moderna
        let fullURLString = "https://api.themoviedb.org/3/\(endpoint)?api_key=\(apiKey)&query=\(name)"

        guard let url = URL(string: fullURLString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
}

//enum GenericData {
//    case string(String)
//    case number(Double)
//    case bool(Bool)
//    case object([String: GenericData])
//    case array([GenericData])
//    case empty
//}



//class TMDBParser {
//
//    func mapValueToGenericData(_ value: Any) -> GenericData {
//        if let string = value as? String {
//            return .string(string)
//        } else if let number = value as? Double {
//            return .number(number)
//        } else if let intValue = value as? Int {
//            return .number(Double(intValue))
//        } else if let bool = value as? Bool {
//            return .bool(bool)
//        } else if let array = value as? [Any] {
//            let genericArray = array.map { mapValueToGenericData($0) }
//            return .array(genericArray)
//        } else if let dict = value as? [String: Any] {
//            var genericObject: [String: GenericData] = [:]
//            for (key, val) in dict {
//                genericObject[key] = mapValueToGenericData(val)
//            }
//            return .object(genericObject)
//        } else {
//            return .empty
//        }
//    }
//
//    func normalize(json: [String: Any]) -> [DataSection] {
//        var sections: [DataSection] = []
//
//        for (key, value) in json {
//            let genericValue = mapValueToGenericData(value)
//
//            if case let .array(items) = genericValue {
//                sections.append(DataSection(name: key, items: items))
//            } else {
//                sections.append(DataSection(name: key, items: [genericValue]))
//            }
//        }
//
//        return sections
//    }
//}
