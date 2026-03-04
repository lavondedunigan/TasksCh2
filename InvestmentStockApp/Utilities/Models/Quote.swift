import Foundation

// Finnhub /quote response fields:
// c: Current price
// d: Change
// dp: Percent change
// h: High price of the day
// l: Low price of the day
// o: Open price of the day
// pc: Previous close price
// t: Timestamp
public struct Quote: Codable, Equatable, Sendable {
    public let c: Double?
    public let d: Double?
    public let dp: Double?
    public let h: Double?
    public let l: Double?
    public let o: Double?
    public let pc: Double?
    public let t: Int?
}
