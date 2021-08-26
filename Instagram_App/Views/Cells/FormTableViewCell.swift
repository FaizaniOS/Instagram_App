  //
//  FormTableViewCell.swift
//  Instagram_App
//
//  Created by ZMQ MAC3 on 21/06/21.
//  Copyright © 2021 ZMQ MAC3. All rights reserved.
//

import UIKit
  
  @available(iOS 13.0, *)
  protocol FormTableViewCellDelegate:AnyObject {
    func formTableViewCell(_ cell:FormTableViewCell, didUpdateField updatedmodel: EditProfileFormModel)
  }

  @available(iOS 13.0, *)
  class FormTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    public weak var delegate:FormTableViewCellDelegate?
    static let identifier = "FormTableViewCell"
    private var model:EditProfileFormModel?
    
    private let formLabel:UILabel = {
        let label = UILabel()
         label.textColor = .label
        //if #available(iOS 13, *){
        //}else{
        //label.textColor = .black
        //}
        label.numberOfLines = 1
        return label
    }()
    
    private let field:UITextField = {
        let field = UITextField()
        field.returnKeyType = .done
        return field
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }
    
    public func configure(with model:EditProfileFormModel){
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        //Assign Frames
        formLabel.frame = CGRect(x: 5, y: 0, width: contentView.width/3, height: contentView.height)
        
        field.frame = CGRect(x:formLabel.right+5, y: 0, width: contentView.width-10-formLabel.width, height: contentView.height)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {return true }
        delegate?.formTableViewCell(self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  }
