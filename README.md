# caldarium_med_parsing_start
Project framework for students to start working on

Setup Instructions

Clone the repo:

git clone https://github.com/j-sh-park/caldarium_med_parsing_start/

cd caldarium_med_parsing_start


Build services:

docker compose up -d --build


Enter helper container:

docker compose run --rm helper bash


To Restore data:

(Windows)
./bootstrap.sh

(Mac)
bash bootstrap.sh

To Export data (after changes):

(Windows)
./export_data.sh

(Mac)
bash export_data.sh

Access Label Studio: http://localhost:8080

Access MinIO: http://localhost:9000
