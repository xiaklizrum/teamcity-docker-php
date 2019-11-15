FROM jetbrains/teamcity-agent
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# php
RUN chown root:root /tmp && chmod ugo+rwXt /tmp
RUN add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y curl unzip php5.6-cli php5.6-dev php5.6-curl \
    php5.6-mbstring php5.6-xml php5.6-zip php5.6-gd php5.6-mysql php5.6-xdebug \
    && apt-get autoremove -y --purge \
    && apt-get clean \
    && rm -Rf /tmp/*
# composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo