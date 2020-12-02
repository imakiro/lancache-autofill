FROM cm2network/steamcmd
WORKDIR /home/steam/lancache-autofill
USER root
RUN apt update -y \
    && apt install -y \
    php7.3 php7.3-sqlite php7.3-curl php7.3-bcmath php7.3-cli php7.3-xml php7.3-mbstring composer expect zip unzip git curl vim \
    && apt-get clean autoclean \
          && apt-get autoremove -y \
          && rm -rf /var/lib/apt/lists/* && git clone https://github.com/zeropingheroes/lancache-autofill.git /home/steam/lancache-autofill \
          && cd /home/steam/lancache-autofill && composer install
#/home/steam/lancache-autofill/install.sh
