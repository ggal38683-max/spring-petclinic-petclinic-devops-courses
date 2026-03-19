\# �� Spring PetClinic DevOps Project\
\
This project demonstrates a full DevOps pipeline for deploying the
Spring PetClinic application using modern tools and practices.\
\
\-\--\
\
\## �� Project Overview\
\
The application is containerized using Docker and deployed on AWS
infrastructure provisioned with Terraform.\
\
The project includes:\
- Infrastructure as Code (Terraform)\
- CI/CD pipeline (GitHub Actions)\
- Dockerized application\
- PostgreSQL database\
- Monitoring (Prometheus + Grafana + Node Exporter)\
- Reverse proxy (Nginx)\
- Zero-downtime deployment approach\
\
\-\--\
\
\## ��️ Architecture\
\
\![Architecture Diagram\](./architecture.png)\
\
\### Components:\
\
- \*\*AWS EC2 (App Server)\*\*\
Runs:\
- PetClinic application (Docker)\
- Nginx (reverse proxy)\
\
- \*\*AWS EC2 (Database Server)\*\*\
Runs:\
- PostgreSQL (Docker + volume)\
\
- \*\*AWS EC2 (Monitoring Server)\*\*\
Runs:\
- Prometheus\
- Grafana\
- Node Exporter\
- Loki + Promtail (logs)\
\
\-\--\
\
\## ⚙️ Technologies Used\
\
- Java 17\
- Spring Boot\
- Docker\
- Docker Compose\
- Terraform\
- Nginx\
- PostgreSQL\
- Prometheus\
- Grafana\
- GitHub Actions\
\
\-\--\
\
\## �� CI/CD Pipeline\
\
Implemented using GitHub Actions:\
\
\### Flow:\
\
1. Code push to \`main\`\
2. Build Docker image\
3. Push image to Docker Hub\
4. Deploy to server via SSH\
5. Restart container\
\
\-\--\
\
\## �� Deployment\
\
Application is deployed using Docker:\
\
\`\`\`bash\
docker run -d \\\
-p 8080:8080 \\\
\--name petclinic \\\
-e SPRING_DATASOURCE_URL=jdbc:postgresql://\<DB_HOST\>:5432/petclinic
\\\
-e SPRING_DATASOURCE_USERNAME=petclinic \\\
-e SPRING_DATASOURCE_PASSWORD=petclinic \\\
georgiygal/petclinic:latest
