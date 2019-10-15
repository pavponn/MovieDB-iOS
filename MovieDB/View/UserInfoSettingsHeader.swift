//
//  UserInfoSettingsHeader.swift
//  MovieDB
//
//  Created by Павел Пономарев on 14/10/2019.
//  Copyright © 2019 pavponn. All rights reserved.
//

import UIKit

class UserInfoSettingsHeader: UIView {
    
    let userPictureImageView: UIImageView = {
        let profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFit
        profileImage.clipsToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.image = UIImage(named: "defaultUserImage")
        return profileImage;
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Default User"
        label.font = UIFont.systemFont(ofSize: 20) // TODO move constants
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        return label;
    }()
    
    let userEmailLabel : UILabel = {
        let label = UILabel()
        label.text = "default@user.com"
        label.font = UIFont.systemFont(ofSize: 16) // TODO move to constants
        label.translatesAutoresizingMaskIntoConstraints = false;
        label.textColor = .lightGray
        return label;
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let USER_IMAGE_PIC_SIZE: CGFloat = 70 //
        let USER_IMAGE_LEFT_CONSTRAINT: CGFloat = 30;
        
        // User's picture
        addSubview(userPictureImageView)
        userPictureImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        userPictureImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: USER_IMAGE_LEFT_CONSTRAINT).isActive = true
        userPictureImageView.widthAnchor.constraint(equalToConstant: USER_IMAGE_PIC_SIZE).isActive = true
        userPictureImageView.heightAnchor.constraint(equalToConstant: USER_IMAGE_PIC_SIZE).isActive = true
        userPictureImageView.layer.cornerRadius = USER_IMAGE_PIC_SIZE / 2;
        //
        
        // User's name
        addSubview(userNameLabel)
        userNameLabel.centerYAnchor.constraint(equalTo: userPictureImageView.centerYAnchor, constant: -10).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: userPictureImageView.rightAnchor, constant: 12).isActive = true
        
        // User's email
        addSubview(userEmailLabel)
        userEmailLabel.centerYAnchor.constraint(equalTo: userPictureImageView.centerYAnchor, constant: 10).isActive = true
        userEmailLabel.leftAnchor.constraint(equalTo: userPictureImageView.rightAnchor, constant: 12).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
