FROM ghost
MAINTAINER Tim Bennett

# Setup nc
RUN \
  apt-get update && \
  apt-get install -y netcat

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY wait-mysql.sh /wait-mysql.sh
RUN chmod +x /wait-mysql.sh

ENV MYSQL_PORT=3306

ENTRYPOINT ["/wait-mysql.sh"]

CMD ["npm", "start"]