**Проєкт: Spring Petclinic**

**Опис проєкту**

Цей проєкт демонструє повний **pipeline** для розгортання веб-застосунку Spring Petclinic з використанням сучасних інструментів та хмарної інфраструктури.

Застосунок контейнеризовано за допомогою Docker, автоматична збірка виконується через GitHub Actions, а інфраструктура створюється за допомогою Terraform у хмарі AWS.

**Архітектура системи**

Процес роботи системи:

Виконання git push → GitHub запускає CI pipeline → створюється Docker image → образ публікується в Docker Hub → Terraform створює інфраструктуру в AWS → Docker контейнер запускається на EC2 сервері.

**Використані технології**

*   Git-репозиторій: GitHub
    
*   CI/CD: GitHub Actions
    
*   Контейнеризація: Docker
    
*   Infrastructure as Code: Terraform
    
*   Хмарна платформа: AWS EC2
    
*   Веб-застосунок: Spring Petclinic
    

**Структура проєкту**

spring-petclinic-devops

│

├── .github/workflows

│   └── ci.yml

│

├── terraform

│   ├── main.tf

│   ├── variables.tf

│   └── outputs.tf

│

├── Dockerfile

├── deploy.sh

└── README.md

**CI Pipeline**

CI pipeline реалізований за допомогою GitHub Actions.

Основні етапи pipeline:

1.  Отримання коду з репозиторію
    
2.  Збірка Docker образу
    
3.  Авторизація у Docker Hub
    
4.  Публікація Docker образу
    

**Створення інфраструктури**

Інфраструктура створюється за допомогою Terraform.

Створюються наступні ресурси:

*   EC2 сервер у AWS
    
*   Security Group (порти 22 та 8080)
    
*   SSH ключ для підключення
    

Команди для створення інфраструктури:

terraform init

terraform apply

**Розгортання застосунку**

Після створення сервера Docker контейнер запускається на EC2 інстансі.

Завантаження Docker образу:

docker pull georgiygal/petclinic:latest

Запуск контейнера:

docker run -d -p 8080:8080 --name petclinic georgiygal/petclinic:latest

**Доступ до застосунку**

Після запуску контейнера веб-застосунок доступний за адресою:

https://petclinic-ggal.duckdns.org/

Архітектура моніторингу

Petclinic container

│

│ metrics

▼

Prometheus

│

▼

Grafana

│

▼

Dashboard у браузері

https://3.127.214.153:3000/

https://3.127.214.153:9090/

Див. папку screenshots
