//
//  JCPLayerViewController.swift
//  Ciber-Test
//
//  Created by johann casique on 25/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit
import Kingfisher
import AVFoundation

class JCTrackViewController: UIViewController {
    
    // MARK: - Variables and Iboutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var playeButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    public var collectionModel: JCCollections?
    fileprivate var trackArray = [JCTrack]()
    var player: AVAudioPlayer?
    
    //margins
    @IBOutlet weak var playerHeight: NSLayoutConstraint!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        if let collection = collectionModel, let albumID = collection.albumID {
            getTracks(withCollectionID: albumID)
        }
        
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        playerHeight.constant = 0
    }
    
    // MARK: - Get Data
    private func getTracks(withCollectionID ceollectionID: Int) {
        
        JCTrackService.shared.getTracks(withID: ceollectionID) { (response) in
            switch response {
            case .Success(let data):
                self.trackArray = data
                self.tableView.reloadData()
            case .Error(let err):
                print(err)
                self.showAlert(title: JCLanguage.Home.errorTitle, message: JCLanguage.Home.errorMessage)
            }
        }
    }
    
    func downloadFileFromURL(url:URL){
        
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { [weak self](URL, response, error) -> Void in
            self?.play(url: URL!)
        })
        
        downloadTask.resume()
    }
    
    func play(url:URL) {
        print("playing \(url)")
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.volume = 1.0
            player?.play()
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }

}

extension JCTrackViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return trackArray.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: JCTrackTableViewCell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath) as! JCTrackTableViewCell
        
        cell.configTrackCell(withModel: trackArray[indexPath.row], index: indexPath)
        
        return cell
        
    }
}

//extension JCTrackViewController: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        playerHeight.constant = 140
//        
//        UIView.animate(withDuration: 0.8) {
//            self.view.layoutIfNeeded()
//        }
//        
//         let model = trackArray[indexPath.row]
//        if let image = model.artWork {
//            thumbnail.kf.setImage(with: URL(string: image))
//        }
//        trackNameLabel.text = model.trackName != nil ? model.trackName : ""
//        albumNameLabel.text = collectionModel?.albumName
//        downloadFileFromURL(url: URL(string:model.previewTrackURL!)!)
//    
//    }
//    
//    
//}

