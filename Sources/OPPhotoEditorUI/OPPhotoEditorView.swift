//
//  File.swift
//  
//
//  Created by Thanh Hai Khong on 5/7/24.
//

import SwiftUI
import Combine
import HXPhotoPicker

public typealias OPAsset = EditorAsset

public struct OPPhotoEditorView: UIViewControllerRepresentable {
    
    // MARK: - Properties
    
    private let asset: OPAsset
    private var didFinish: ((OPAsset) -> Void)?
    private var didCancel: (() -> Void)?
    
    // MARK: - Init
    
    init(asset: EditorAsset, didFinish: ((OPAsset) -> Void)? = nil, didCancel: (() -> Void)? = nil) {
        self.asset = asset
    }
    
    // MARK: - UIViewControllerRepresentable
    
    public func makeUIViewController(context: Context) -> EditorViewController {
        var config: EditorConfiguration = .init()
        config.languageType = .english
        config.cancelButtonTitleColor = UIColor.systemBlue
        config.toolsView.toolOptions.removeAll { $0.type == .music || $0.type == .chartlet || $0.type == .graffiti }
        config.isWhetherFinishButtonDisabledInUneditedState = true
        
        let editorViewController = EditorViewController(asset, config: config, delegate: context.coordinator)
        
        return editorViewController
    }
    
    public func updateUIViewController(_ uiViewController: EditorViewController, context: Context) {
        
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    // MARK: - Coordinator
    
    public class Coordinator: NSObject, EditorViewControllerDelegate {
        
        // MARK: - Properties
        
        private let parent: OPPhotoEditorView
        private var subscriptions = Set<AnyCancellable>()
        
        // MARK: - Init
        
        init(_ parent: OPPhotoEditorView) {
            self.parent = parent
        }
        
        // MARK: - EditorViewControllerDelegate
        
        public func editorViewController(_ editorViewController: EditorViewController, didFinish asset: EditorAsset) {
            parent.didFinish?(asset)
        }
        
        public func editorViewController(didCancel editorViewController: EditorViewController) {
            parent.didCancel?()
        }
    }
}
