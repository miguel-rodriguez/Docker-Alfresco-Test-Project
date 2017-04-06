FROM centos:7.2.1511
RUN adduser alfresco
RUN mkdir -p /opt/alf_data
RUN chown -R alfresco:alfresco /opt/alf_data
VOLUME /opt/alf_data
ENTRYPOINT /usr/bin/tail -f /dev/null
