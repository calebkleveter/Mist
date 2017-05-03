import Vapor
import VaporPostgreSQL
import HTTP
import SwiftMark

class BlogPostController {
    let renderer = MarkdownRenderer()
    
    func addRoutes(to drop: Droplet)throws {
        let posts = drop.grouped("posts")
        
        for post in try Post.all() {
            posts.get(post.slug, handler: { (request) -> ResponseRepresentable in
                return try drop.view.make("Themes/Default/post", [
                        "title": post.name,
                        "pages": try BlogPage.all().makeNode(),
                        "name": post.name,
                        "content": try self.renderer.render(post.content)
                    ])
            })
        }
    }
}
