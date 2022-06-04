//
//  EmployeeViewTableViewCell.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-24.
//

import UIKit
import SwiftUI
//import SDWebImage

class EmployeeTableViewCell: UITableViewCell {
    
    static let identifier: String = "EmployeeTableViewCell"

    
    var employee: Employee? {
        didSet { configureEmployee() }
    }
    //MARK: - Views
    private let sfSymbolConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .bold, scale: .default)
    
    private var backGroundView: UIView = {
        let bv = UIView()
        bv.backgroundColor = .gray.withAlphaComponent(0.4)
        bv.layer.cornerRadius = 20
        return bv
    }()
    
    private lazy var userimageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 50, height: 50)
        iv.layer.cornerRadius = 50 / 2
        iv.backgroundColor = UIColor.gray
        return iv
    }()
     
    private var nameLabel: UILabel = {
       let nl = UILabel()
        nl.font = UIFont.boldSystemFont(ofSize: 20)
        nl.textColor = .white
        return nl
    }()
    
    private var teamLabel: UILabel = {
       let tl = UILabel()
        tl.font = UIFont.systemFont(ofSize: 16)
        tl.textColor = .white
        return tl
    }()
 
    private lazy var emailButton: UIButton = {
        let eb = UIButton()
        eb.setImage(UIImage(systemName: "envelope", withConfiguration: sfSymbolConfig), for: .normal)
        //eb.backgroundColor = .blue
        return eb
    }()
    
    private lazy var callButton: UIButton = {
        let cb = UIButton()
        cb.setImage(UIImage(systemName: "phone.circle", withConfiguration: sfSymbolConfig), for: .normal)
        return cb
    }()
    
    
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureEmployee()
        configureViewAndConstraints()
        // Do any additional setup after loading
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Configure Methods
    
    func configureViewAndConstraints() {
        contentView.backgroundColor = .black
        contentView.addSubview(backGroundView)
        
        
        backGroundView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor,  bottom: contentView.bottomAnchor, right: contentView.rightAnchor,paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4)
        
        
        let nameStack = UIStackView(arrangedSubviews: [nameLabel, teamLabel])
        nameStack.axis = .vertical
        nameStack.distribution = .fillProportionally
        nameStack.alignment = .leading
        nameStack.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

        
        let employeeStack = UIStackView(arrangedSubviews: [userimageView, nameStack, emailButton, callButton])
        employeeStack.axis = .horizontal
        employeeStack.spacing = 2
        employeeStack.distribution = .fill
        employeeStack.alignment = .center
        employeeStack.setCustomSpacing(6, after: userimageView)
        employeeStack.setCustomSpacing(10, after: emailButton)
        
        backGroundView.addSubview(employeeStack)
        
        
        
        employeeStack.anchor(top: backGroundView.topAnchor, left: backGroundView.leftAnchor, bottom: backGroundView.bottomAnchor, right: backGroundView.rightAnchor, paddingLeft: 6, paddingRight: 6)
        employeeStack.centerY(inView: backGroundView)        
       
    }
    
    
    func configureEmployee() {
        guard let employee = employee else { return }
        nameLabel.text = employee.fullName
        teamLabel.text = employee.team
        userimageView.sd_setImage(with: URL(string: employee.photoUrlSmall))
    }

}
