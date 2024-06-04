//
//  ViewController.swift
//  MusicTable
//
//  Created by Siran Li on 6/4/24.
//

import UIKit

struct Music {
    var imageUrl: String
    var albumName: String
    var artist: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var musicList: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            musicList.append(Music(imageUrl: "photo", albumName: "Album name", artist: "Artist"))
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 170
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return TableViewCell() }
        
        cell.musicImageView.image = UIImage(systemName: musicList[indexPath.row].imageUrl)
        cell.albumLabel.text =  musicList[indexPath.row].albumName
        cell.artistLabel.text = musicList[indexPath.row].artist
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .white
        
        let label = UILabel()
        label.text = "Top Songs"
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
        ])
        
        return headerView
    }
}

extension ViewController: UITableViewDelegate {
    
}
