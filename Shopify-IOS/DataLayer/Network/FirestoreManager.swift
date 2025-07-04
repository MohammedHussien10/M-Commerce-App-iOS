//
//  FirestoreManager.swift
//  Shopify-IOS
//
//  Created by Aya Emam on 26/06/2025.
//

import Foundation
import Firebase
import Combine
import FirebaseFirestore

final class FirestoreManager {
    static let shared = FirestoreManager()
    private init() {}

    private let db = Firestore.firestore()

    // MARK: - Add Favorite
    func addFavorite(email: String, productID: String) {
        let cleanID = extractNumericID(from: productID)

        db.collection("favorites")
            .document(email)
            .collection("items")
            .document(cleanID)
            .setData([
                "productID": cleanID
            ]) { error in
                if let error = error {
                    print("❌ Error saving favorite: \(error.localizedDescription)")
                } else {
                    print("✅ Favorite saved: \(cleanID)")
                }
            }
    }

    // MARK: - Remove Favorite
    func removeFavorite(email: String, productID: String) {
        let cleanID = extractNumericID(from: productID)

        db.collection("favorites")
            .document(email)
            .collection("items")
            .document(cleanID)
            .delete { error in
                if let error = error {
                    print("❌ Error removing favorite: \(error.localizedDescription)")
                } else {
                    print("🗑️ Removed favorite: \(cleanID)")
                }
            }
    }

    // MARK: - Fetch Favorites (Combine)
    func fetchFavoritesPublisher(email: String) -> AnyPublisher<[[String: Any]], Error> {
        let subject = PassthroughSubject<[[String: Any]], Error>()

        db.collection("favorites")
            .document(email)
            .collection("items")
            .getDocuments { snapshot, error in
                if let error = error {
                    subject.send(completion: .failure(error))
                } else if let documents = snapshot?.documents {
                    let data = documents.map { $0.data() }
                    subject.send(data)
                    subject.send(completion: .finished)
                } else {
                    subject.send([])
                    subject.send(completion: .finished)
                }
            }

        return subject.eraseToAnyPublisher()
    }

    // MARK: - Check if a Product is Favorited
    func isFavorited(email: String, productID: String, completion: @escaping (Bool) -> Void) {
        let cleanID = extractNumericID(from: productID)

        db.collection("favorites")
            .document(email)
            .collection("items")
            .document(cleanID)
            .getDocument { doc, _ in
                completion(doc?.exists ?? false)
            }
    }

    // MARK: - Helper
     func extractNumericID(from gid: String) -> String {
        return gid.components(separatedBy: "/").last ?? gid
    }
}
