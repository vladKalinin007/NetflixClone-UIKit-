//
//  DataPersistanceManager.swift
//  Netflix
//
//  Created by Владислав Калинин on 06.12.2022.
//

import UIKit
import CoreData

class DataPersistenceManager {
    
// MARK: - PROPERTY
    
    enum DatabaseError: Error {
        case failedToSaveData
        case failedToFetchData
        case failedToDeleteData
    }
    
    static let shared = DataPersistenceManager()
    
// MARK: - LIFECYCLE
    
    
// MARK: - FUNCTION
    
    func downloadTitleWith(model: Title, completion: @escaping(Result<Void, Error>) -> Void) {
        
        //UIApplicationDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //NSManagedContext
        let context = appDelegate.persistentContainer.viewContext
        
        //NSManagedObject
        let item = TitleItem(context: context)
        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.poster_path = model.poster_path
        item.media_type = model.media_type
        item.release_date = model.release_date
        item.vote_average = model.vote_average
        item.vote_count = Int64(model.vote_count)
        
        //NSManagedContext.commit
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print("DEBUG: Error \(error)")
            completion(.failure(DatabaseError.failedToSaveData))
        }
        
    }
    
    func fetchingTitlesFromDataBase(completion: @escaping (Result<[TitleItem], Error>) -> Void) {
        
        //UIApplicationDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //NSManagedContext
        let context = appDelegate.persistentContainer.viewContext
        
        //NSFetchRequest
        let request: NSFetchRequest<TitleItem>
        
        //NSManagedObject
        request = TitleItem.fetchRequest()
        
        //NSManagedContext.pull
        do {
            let titles = try context.fetch(request)
            completion(.success(titles))
        } catch {
            completion(.failure(DatabaseError.failedToFetchData))
            print("DEBUG: Error \(error)")
        }
    }
    
    func deleteTitleWith(model: TitleItem, completion: @escaping (Result<Void, Error>) -> Void) {
        //UIApplicationDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //NSManagedContext
        let context = appDelegate.persistentContainer.viewContext
        
        //NSManagedContext.update
        context.delete(model)
        
        //NSManagedContext.commit
        do {
            try context.save()
            completion(.success(()))
        } catch {
            print("DEBUG: Error \(error)")
            completion(.failure(DatabaseError.failedToDeleteData))
        }
    }
}