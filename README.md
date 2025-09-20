# caldarium_med_parsing_start
Project framework for students to start working on

Setup Instructions

Clone the repo:

git clone <repo-url>
cd caldarium_med_parsing_start


Build helper container:

docker compose build helper


Start main services:

docker compose up -d


Enter helper container:

docker compose run helper bash


To Restore data:

./bootstrap.sh


To Export data (after changes):

./export_data.sh


Access Label Studio: http://localhost:8080
Access MinIO: http://localhost:9000
