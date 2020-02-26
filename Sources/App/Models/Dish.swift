import Foundation
import Vapor
import FluentSQLite

final class Dish: Content {
    var id: Int?
    var title: String
    var price: Double
    var imageURL: String
    
    init(title: String, price: Double, imageURL: String) {
        self.title = title
        self.price = price
        self.imageURL = imageURL
    }
}

extension Dish: SQLiteModel {
    static let entity: String = "dishes"
}

extension Dish: Migration { }
