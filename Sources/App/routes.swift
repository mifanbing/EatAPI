import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.post(Dish.self, at: "api/dish") { request, dish -> Future<Dish> in
        return dish.save(on: request)
    }
    
    router.get("api/dishes") { request -> Future<[Dish]> in
        return Dish.query(on: request).all()
    }
    
    
}
