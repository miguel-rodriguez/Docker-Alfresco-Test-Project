FROM mysql:5.7.17

# Create alfresco db
ADD create-alfresco-db /
RUN chmod +x /create-alfresco-db
ENTRYPOINT /etc/init.d/mysql start && /entrypoint.sh && mysql -uroot -padmin < /create-alfresco-db && /bin/bash
