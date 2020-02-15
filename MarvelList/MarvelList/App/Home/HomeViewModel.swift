//
//  HomeViewModel.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewModel {
    private var service: HomeService
    private var comicList: [Comic] = []
    
    var selectedComic: Comic?
    
    var rows: Int {
        return comicList.count
    }
    
    let didSelectedRow = PublishSubject<Void>()
    
    let isSuccess : Variable<Bool> = Variable(false)
    let isLoading : Variable<Bool> = Variable(false)
    let errorMsg  : Variable<String> = Variable(String.Empty)
    
    init() {
        service = HomeService()
        requestList()
    }
    
    func requestPagination() {
        if !isLoading.value {
            requestList()
        }
    }
    
    func setSelectedItem(by index: Int) {
        selectedComic = comicList[index]
        didSelectedRow.onNext(Void())
    }
    
    func requestList() {
        isLoading.value = true
        
        service.get(offset: rows) {
            responseSuccess, responseError in
            if let error = responseError {
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value = error.description()
            }
            if let marvelResponse =  responseSuccess,
                let marvelResponseData = marvelResponse.data,
                let comicResponseList = marvelResponseData.results {
                // persist info
                self.setComicList(with: comicResponseList)
                self.isSuccess.value = true
                self.isLoading.value = false
                
            }
            else {
                let parseError = CustomError(with: .parserError)
                self.isSuccess.value = false
                self.isLoading.value = false
                self.errorMsg.value =  parseError.description()
            }
        }
        
    }
    
    func setComicList(with comicResponseList: [Comic]) {
        self.comicList.append(contentsOf: comicResponseList)
    }
    
    func getComicBy(_ index: Int) -> Comic? {
        if index > comicList.count-1 {
            return nil
        }
        else {
            return comicList[index]
        }
    }
    
}
