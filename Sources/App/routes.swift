import Vapor
import FluentSQLite

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.post(Dish.self, at: "api/dish") { request, dish -> Future<Dish> in
        return dish.save(on: request)
    }
    
    router.delete("api/dishes", Dish.parameter) { request -> Future<Dish> in
        return try request.parameters.next(Dish.self).delete(on: request)
    }
    
    router.get("api/dishes") { request -> Future<[Dish]> in
        return Dish.query(on: request).all()
    }
    
    router.get("api/dishes", String.parameter) { request -> Future<[Dish]> in
        let title = try request.parameters.next(String.self)
        
        return Dish.query(on: request).filter(\.title == title).all()
    }
    
    router.get("api/dish", Dish.parameter) { request -> Future<Dish> in
        return try request.parameters.next(Dish.self)
    }
}
