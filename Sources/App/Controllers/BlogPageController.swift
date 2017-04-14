import Vapor
import VaporPostgreSQL
import HTTP

class BlogPageController {
    func addRoutes(to drop: Droplet)throws {
        
        for page in try BlogPage.all() {
            drop.get(page.slug, handler: { (request) -> ResponseRepresentable in
                return try drop.view.make("Themes/Default/page", [
                    "pages": try BlogPage.all().makeNode(),
                    "name": page.title,
                    "content": page.content
                    ])
            })
        }
    }
}
