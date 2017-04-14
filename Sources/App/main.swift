import Vapor
import VaporPostgreSQL
import AdminPanel

AdminPanel.customController = MistDashboardController()

let drop = Droplet()

try drop.addProvider(VaporPostgreSQL.Provider.self)
try drop.addProvider(AdminPanel.Provider.self)

drop.preparations.append(BlogPage.self)
drop.preparations.append(Post.self)

let postController = BlogPostController()
let pageController = BlogPageController()

drop.get { req in
    try postController.addRoutes(to: drop)
    try pageController.addRoutes(to: drop)
    
    return try drop.view.make("Themes/Default/index",  [
            "pages": try BlogPage.all().makeNode(),
            "posts": try Post.all().makeNode()
        ])
//    return try drop.view.make("welcome", [
//    	"message": drop.localization[req.lang, "welcome", "title"]
//    ])
}

drop.resource("posts", PostController())

drop.run()
