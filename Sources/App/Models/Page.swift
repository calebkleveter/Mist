import Vapor
import VaporPostgreSQL

class BlogPage {
    var title: String
    var content: String
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}
