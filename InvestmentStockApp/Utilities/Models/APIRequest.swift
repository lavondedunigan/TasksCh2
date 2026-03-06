import Foundation

class APIRequest {
    // Finnhub /quote response model
    struct FinnhubQuote: Decodable, CustomStringConvertible {
        let c: Double? // Current price
        let d: Double? // Change
        let dp: Double? // Percent change
        let h: Double? // High price of the day
        let l: Double? // Low price of the day
        let o: Double? // Open price of the day
        let pc: Double? // Previous close price
        let t: Int? // Timestamp

        var description: String {
            "FinnhubQuote(c:\(c ?? .nan), d:\(d ?? .nan), dp:\(dp ?? .nan), h:\(h ?? .nan), l:\(l ?? .nan), o:\(o ?? .nan), pc:\(pc ?? .nan), t:\(t?.description ?? "nil"))"
        }
    }

    static let shared = APIRequest()
    
    // variables api
    private let baseURL = URL(string: "https://finnhub.io")!
    private let token: String = "d6jl61hr01qkvh5qcc5gd6jl61hr01qkvh5qcc60"
    
    public func getSymbolQuote(symbol: String) {
        var components = URLComponents(string: "https://finnhub.io/api/v1/quote")!
        components.queryItems = [
            URLQueryItem(name: "symbol", value: symbol),
            URLQueryItem(name: "token", value: token)
        ]
        guard let url = components.url else {
            print("APIRequest error: Failed to build URL for symbol: \(symbol)")
            return
        }

        print("Requesting: \(url.absoluteString)")

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("APIRequest error: \(error.localizedDescription)")
                return
            }

            if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
                print("APIRequest error: HTTP \(http.statusCode)")
            }

            guard let data = data else {
                print("APIRequest error: No data returned")
                return
            }

            do {
                let decoder = JSONDecoder()
                let quote = try decoder.decode(FinnhubQuote.self, from: data)
                print("Decoded quote: \(quote)")
            } catch {
                let nsError = error as NSError
                print("APIRequest decode error: \(nsError.localizedDescription) [code: \(nsError.code)]")
                if let body = String(data: data, encoding: .utf8) {
                    print("Response body: \(body)")
                }
            }
        }.resume()
    }
}

