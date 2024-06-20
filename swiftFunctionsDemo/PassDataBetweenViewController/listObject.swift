import Foundation


struct MovieEntity: Codable {
    let id: Int
    let title: String
}

struct ListMovies: Codable {
    let page: Int
    let results: [MovieEntity]
    let totalResults: Int64?
    let totalPages: Int64?
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

extension Notification.Name {
    static let listMoviesNotification = Notification.Name("listMoviesNotification")
}
