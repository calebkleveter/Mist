import Vapor
import AdminPanel
import Routing
import HTTP
import VaporPostgreSQL
import Flash
import BCrypt
import Foundation

class MistDashboardController {
    
    func createNewPage(_ request: Request)throws -> ResponseRepresentable {
        guard let pageName = request.data["page-name"]?.string,
            let pageContent = request.data["page-content"]?.string else {
                throw Abort.badRequest
        }
        
        var newPage = BlogPage(title: pageName, content: pageContent)
        do {
            try newPage.save()
        } catch let error {
            return Response(redirect: "/admin/dashboard/new-page").flash(.error, "An error occured while saving the page: \(error)")
        }
        
        return Response(redirect: "/admin/dashboard/new-page").flash(.success, "Page succesfully created!")
    }
    
    func createNewPost(_ request: Request)throws -> ResponseRepresentable {
        guard let posteName = request.data["post-name"]?.string,
            let postContent = request.data["post-content"]?.string else {
                throw Abort.badRequest
        }
        
        var newPost = Post(content: postContent, name: posteName)
        
        do {
            try newPost.save()
        } catch let error {
            return Response(redirect: "/admin/dashboard/new-post").flash(.error, "An error occured while saving the blog post: \(error)")
        }
        
        return Response(redirect: "/admin/dashboard/new-post").flash(.success, "Post succesfully created!")
    }
    
    
    func createNewAdmin(_ request: Request)throws -> ResponseRepresentable {
        guard let email = request.data["email"]?.string,
            let password = request.data["password"]?.string,
            let name = request.data["name"]?.string else {
                throw Abort.badRequest
        }
        
        var admin = try BackendUser(node: [
            "name": name,
            "email": email,
            "password": BCrypt.digest(password: password),
            "role": "admin",
            "updated_at": Date().toDateTimeString(),
            "created_at": Date().toDateTimeString()
            ])
        
        do {
            try admin.save()
        } catch let error {
            return Response(redirect: "/admin/dashboard/settings").flash(.error, "Admin creation failed with error: \(error)")
        }
        
        return Response(redirect: "/admin/dashboard/settings").flash(.success, "Admin created!")
    }
}

extension MistDashboardController: AdminPanelController {
    func addRoutes(to group: RouteGroup<Droplet.Value, (RouteGroup<Droplet.Value, Droplet>)>) {
        group.post("new-page", handler: createNewPage)
        group.post("new-post", handler: createNewPost)
        group.post("new-admin", handler: createNewAdmin)
    }
}
