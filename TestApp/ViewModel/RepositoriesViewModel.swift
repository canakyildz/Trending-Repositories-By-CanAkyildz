//
//  RepositoriesViewModel.swift
//  TestApp
//
//  Created by Can Akyıldız on 4.11.2021.
//

import Foundation

class RepositoriesViewModel: NSObject, BaseViewModel {
    
    var disposable: DisposeBag = DisposeBag()
    let showLoading = BehaviorSubject<Bool>(value: false)
    
    var showMessage: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
    var isLoad: BehaviorRelay<Bool> = BehaviorRelay<Bool>(value: false)
    var dataSource: BehaviorRelay<Repositories> = BehaviorRelay<Repositories>(value: Repositories())
    let myGroup = DispatchGroup()
    
    func viewDidLoad() {
        questRepositories()
    }
    
    func updateScreen(){
        questRepositories()
    }
    
    func questRepositories(){
        isLoad.accept(true)
        
        let client = APIClient.shared
        
        do {
            try client.questRepositories()
                .asObservable()
                .subscribe(
                    onNext: { result in
                        self.isLoad.accept(false)
                        
                        var repos = [Repository]()
                        
                        self.myGroup.enter()
                        for item in result.items {
                            let repo = Repository(codable: item)
                            repos.append(repo)
                        }
                        self.myGroup.leave()
                        
                        self.myGroup.notify(queue: .main) {
                            self.dataSource.accept(repos)
                        }
                    }, onError: { error in
                        self.isLoad.accept(false)
                        
                        if let error = error as? APIError {
                            let message = APIErrorMessageHelper.instance.returnsAPIErrorMessage(error: error)
                            self.showMessage.accept(message)
                        }else {
                            self.showMessage.accept("not_mapped_api_error")
                        }
                    }
                ).disposed(by: disposable)
        } catch {
            debugPrint(error)
        }
    }
}
