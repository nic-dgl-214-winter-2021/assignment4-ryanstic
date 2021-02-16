//
//  CustomCollectionViewCell.swift
//  viewer
//
//  Created by Ryan Stich on 2021-02-09.

// handing this in very rough shape, didnt budget myself enough time this week & i'm not sure
// what was taking place but for a good couple hours i had struggled with the first video
// i could NOT under any circumstances get images to appear within my collectionview. the concept
// seemed simple to follow & i even made sure to  follow the youtube tutorial line for line and my app would just open up a blank screen every single time. i eventually just gave up trying to make it work and immediately had success with the following video. not really sure if it was a weird xcode issue on my end or what, because im using the same exact array of images. very strange.

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifer = "CustomCollectionViewCell"
    
    private let myImageVIew: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(systemName: "house")//
        
        let images = [
        
            UIImage(named:"i1"),
            UIImage(named:"i2"),
            UIImage(named:"i3"),
            UIImage(named:"i4"),
            UIImage(named:"i5"),
            UIImage(named:"i6"),
            UIImage(named:"i7"),
            UIImage(named:"i8"),
            UIImage(named:"i9"),
            UIImage(named:"i10"),
        ].compactMap({$0})
        
        imageView.image = images.randomElement()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel  = {//
        let label = UILabel()
        label.text = "hello"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageVIew)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 5, y: 0, width: contentView.frame.size.width-10, height: 20)//
        
        myImageVIew.frame = CGRect(x: 5, y: contentView.frame.size.height-80, width: contentView.frame.size.width-10, height: contentView.frame.size.width-10)//
    }
    
    public func configure(label:String) {
        myLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
    
    
}
