import Vapor
import VaporPostgreSQL
import HTTP

class BlogPostController {
    func addRoutes(to drop: Droplet)throws {
        let posts = drop.grouped("posts")
        
        for post in try Post.all() {
            posts.get(post.slug, handler: { (request) -> ResponseRepresentable in
                return try drop.view.make("Themes/Default/post", [
                        "name": post.name,
                        "content": post.content
                    ])
            })
        }
    }
}
