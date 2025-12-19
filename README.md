# LiveCicleTest

LiveCicle – UIViewController Lifecycle na prática (Swift + UIKit)

Este repositório apresenta um exemplo prático do ciclo de vida de um UIViewController no iOS, utilizando UIKit com ViewCode, Auto Layout, rotação de tela e integração com CoreLocation.
O foco do projeto é demonstrar, de forma didática, quando e por que utilizar cada método do lifecycle, aplicando boas práticas de organização, performance e gerenciamento de recursos do sistema.

Tecnologias utilizadas

Swift

UIKit (ViewCode)

Auto Layout (NSLayoutConstraint)

CoreLocation

UINavigationController

Conceitos abordados
UIViewController Lifecycle

O projeto utiliza os principais métodos do ciclo de vida de um UIViewController, respeitando a responsabilidade de cada um:

loadView: criação e definição da hierarquia de views quando se trabalha sem Storyboard ou XIB

viewDidLoad: configuração inicial da tela, delegates, aparência e dados iniciais

viewWillAppear: atualização de informações antes da tela ser exibida ao usuário

viewWillDisappear: ponto adequado para preparar a saída da tela

viewDidDisappear: interrupção de tarefas em segundo plano e liberação de recursos

viewWillLayoutSubviews: ajustes antes do layout ser recalculado

viewDidLayoutSubviews: ações após o layout final ser aplicado

viewWillTransition(to:with:): tratamento de mudanças de tamanho e rotação de tela

ViewCode e Hierarquia de Views

Toda a interface é construída programaticamente, sem o uso de Storyboards ou arquivos XIB.
O projeto demonstra:

Criação manual de componentes visuais

Organização clara da hierarquia de views

Uso correto de translatesAutoresizingMaskIntoConstraints = false

Maior controle e previsibilidade do layout

Auto Layout e suporte à rotação

O layout é preparado para diferentes orientações de tela utilizando arrays de constraints:

Constraints específicas para modo Landscape

Estrutura preparada para modo Portrait

Ativação e desativação dinâmica de constraints

Essa abordagem evita conflitos de Auto Layout e facilita a manutenção do layout em diferentes tamanhos de tela.

CoreLocation e gerenciamento de recursos

O projeto demonstra boas práticas no uso de localização no iOS:

Solicitação de permissão de uso de localização

Implementação do CLLocationManagerDelegate

Início da atualização de localização apenas quando a tela está visível

Interrupção da atualização de localização ao sair da tela

Esse controle evita consumo desnecessário de bateria e uso indevido de recursos do sistema.

Boas práticas aplicadas

Uso correto do ciclo de vida do UIViewController

Separação clara entre criação de views, layout e lógica

Gerenciamento adequado de tarefas em segundo plano

Código simples, legível e voltado para manutenção e estudo

Objetivo do projeto

Este repositório possui caráter educacional e de portfólio, sendo indicado para:

Estudo do lifecycle no iOS

Referência para projetos UIKit utilizando ViewCode

Demonstração de boas práticas em entrevistas técnicas

Base para artigos técnicos sobre iOS e Swift

Autor

Arthur Ferreira
Desenvolvedor iOS
Swift, UIKit, SwiftUI, MVVM, Clean Architecture
