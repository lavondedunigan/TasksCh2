import Foundation
import SwiftData

@Model
final class Investment: Identifiable {
    var id: UUID // auto generated
    var title: String
    var stock: String
    var stockPrice: Decimal // money
    var ammount: Decimal // money
    var shares: Int
    var createdAt: Date // auto generated
    
    // relationship: Each task belong to/has a category
    var category: Category
    
    init(title: String, stock: String, stockPrice: Decimal, ammount: Decimal, shares: Int, category: Category) {
        self.id = UUID()
        self.stock = stock
        self.createdAt = Date() // now
        self.title = title
        self.stockPrice = stockPrice
        self.ammount = ammount
        self.shares = shares
        self.category = category
    }
}
