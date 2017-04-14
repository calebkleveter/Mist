import Vapor
import Fluent
import Foundation
import Slugify

final class Post: Model {
    var id: Node?
    var content: String
    var name: String
    var contentCard: String!
    var slug: String
    
    init(content: String, name: String) {
        self.content = content
        self.name = name
        self.slug = name.slugify()
        
        if self.content.characters.count > 500 { self.contentCard = self.content.substring(to: content.index(content.startIndex, offsetBy: 497)) + "..." } else { self.contentCard = self.content }
        self.contentCard = self.contentCard.replacingOccurrences(of: "\n", with: "")
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        content = try node.extract("content")
        name = try node.extract("name")
        contentCard = try node.extract("contentCard")
        slug = try node.extract("slug")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "content": content,
            "name": name,
            "contentCard": contentCard,
            "slug": slug
        ])
    }
}

extension Post: Preparation {
    static func prepare(_ database: Database) throws {
        try database.create("posts", closure: { (post) in
            post.id()
            post.string("content", length: 10000)
            post.string("name")
            post.string("contentCard", length: 500)
            post.string("slug")
        })
    }

    static func revert(_ database: Database) throws {
        try database.delete("posts")
    }
}
