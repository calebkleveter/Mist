import Vapor
import Fluent
import Foundation

final class Post: Model {
    var id: Node?
    var content: String
    var name: String
    var contentCard: String!
    
    init(content: String, name: String) {
        self.content = content
        self.name = name
        
        if self.content.characters.count > 500 { self.contentCard = self.content.substring(to: content.index(content.startIndex, offsetBy: 497)) + "..." } else { self.contentCard = self.content }
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        content = try node.extract("content")
        name = try node.extract("name")
        contentCard = try node.extract("contentCard")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "content": content,
            "name": name,
            "contentCard": contentCard
        ])
    }
}

extension Post: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}
