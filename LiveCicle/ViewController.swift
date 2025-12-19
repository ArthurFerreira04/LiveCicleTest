//
//  ViewController.swift
//  LiveCicle
//
//  Created by Arthur Ferreira on 27/03/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager:CLLocationManager = CLLocationManager()
    var landscapeConstraints: [NSLayoutConstraint] = []
    var portraitConstraints: [NSLayoutConstraint] = []
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Título da Tela"
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite alguma coisa"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clique Aqui", for: .normal)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var advancedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Avançar >", for: .normal)
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        tableView.separatorStyle = .none
        tableView.layer.cornerRadius = 18
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
#warning("nesse metodo voce confiro a heraquia da visualizacao quando utilizado uma arquivo de interface(StoryBoard ou xib)")
    
    override func loadView() {
        super.loadView()
        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(advancedButton)
        view.addSubview(tableView)
    }
#warning("Esse metodo e chamado apos a heraquia de visualizacao, este e um local que voce configura elementos na interface como os dados de inicializacao")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //tableView.delegate = self
        //tableView.dataSource = self
        setupConstraintsForLandscape()
        navigationController?.setNavigationBarHidden(true, animated: false)
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
    
#warning("Este metodo e chamado quando a controler esta preste a ser inibida e um bom metodo a visualizacao para o usuario sempre atualizada")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
#warning("Este metodo e chamado apos a controller ter sido retirado da tela, e um bom local para voce limpar recursor ou interromper tarefas em segundo plano")
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
#warning("Este este metodo apos a controller ter sido retirado totalmente da tela e um bom lugar para concluir tarefas quando a tela nao esta mais visivel")
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
#warning("Este metodo e chamado quando a interface esta preste a ser redimensionada , util para executar acoes antes da mudanca de layout")
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
#warning("Este metodo e chamado quando a interface e redimensionado")
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
#warning("Este metodo e chamado quando ocorre a transicao de tamanho, voce pode atualizar a interface com base em um novo tamanho de tela")
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    func setupConstraintsForLandscape() {
        
        NSLayoutConstraint.deactivate(portraitConstraints)
        
        // Configurar as constraints no modo paisagem (horizontal)
        landscapeConstraints = [
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            
            advancedButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            advancedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: advancedButton.bottomAnchor, constant: 20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        // Ativar as constraints no modo paisagem
        NSLayoutConstraint.activate(landscapeConstraints)
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
    }
}
