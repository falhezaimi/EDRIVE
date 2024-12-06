import CloudKit

class RewardsManager {
    let container = CKContainer.default()
    let privateDatabase = CKContainer.default().privateCloudDatabase

    func saveRewardsData(points: Int, completion: @escaping (Error?) -> Void) {
        let record = CKRecord(recordType: "Rewards")
        record["points"] = points
        privateDatabase.save(record) { (_, error) in
            completion(error)
        }
    }

    func fetchRewardsData(completion: @escaping (Int?, Error?) -> Void) {
        let query = CKQuery(recordType: "Rewards", predicate: NSPredicate(value: true))
        privateDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let record = records?.first, let points = record["points"] as? Int {
                completion(points, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
