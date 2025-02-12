FROM python:3.9.1

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2

# RUN sudo apt-get install -y gnupg software-properties-common
# RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
# gpg --dearmor | \
# sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# RUN sudo apt-get install terraform


# wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
# sudo apt update && sudo apt install terraform

WORKDIR /app
COPY ingest_data.py ingest_data.py

ENTRYPOINT ["python", "ingest_data.py"]
