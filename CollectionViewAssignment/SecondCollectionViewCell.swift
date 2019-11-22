//
//  SecondCollectionViewCell.swift
//  CollectionViewAssignment
//
//  Created by Ankur Baranwal on 18/10/2019.
//  Copyright © 2019 Ankur Baranwal. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    @IBOutlet weak var labelOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.red
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    fileprivate func setupViews() {
        contentView.addSubview(labelOutlet)
        labelOutlet.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        labelOutlet.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        labelOutlet.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }

    }
}
