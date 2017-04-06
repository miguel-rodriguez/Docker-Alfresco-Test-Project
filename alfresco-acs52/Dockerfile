FROM centos:7.2.1511

# Install Alfresco using unattended installation
ADD install_opts /tmp/install_opts
ADD alfresco-content-services-installer-5.2.0-linux-x64.bin /tmp/alfresco-content-services-installer-5.2.0-linux-x64.bin
RUN chmod +x /tmp/alfresco-content-services-installer-5.2.0-linux-x64.bin 
RUN /tmp/alfresco-content-services-installer-5.2.0-linux-x64.bin --optionfile /tmp/install_opts
ADD mysql-connector-java-5.1.40-bin.jar /opt/alfresco-acs52/tomcat/lib
RUN sed -i 's/dir.root=\/opt\/alfresco-acs52\/alf_data/\/opt\/alf_data/' /opt/alfresco-acs52/tomcat/shared/classes/alfresco-global.properties
RUN rm /tmp/alfresco-content-services-installer-5.2.0-linux-x64.bin	

# Remove CSRF
ADD share-config-custom.xml /opt/alfresco-acs52/tomcat/shared/classes/alfresco/web-extension/

# Run as alfresco user
RUN cd /opt/alfresco-acs52/ && sed -i '/# Allow only root execution/,/^\s*$/{d}' alfresco.sh

# Configure routing via LBs
RUN sed -i 's/alfresco.host=127.0.0.1/alfresco.host=lb-server/' /opt/alfresco-acs52/tomcat/shared/classes/alfresco-global.properties
RUN sed -i 's/share.host=127.0.0.1/share.host=lb-server/' /opt/alfresco-acs52/tomcat/shared/classes/alfresco-global.properties

# Relocate alf_data
ADD alf_data.sh /tmp/
RUN chmod +x /tmp/alf_data.sh
# Install libreoffice dependencies
RUN yum -y install libreoffice
RUN yum -y remove libreoffice
# Add alfresco user
RUN useradd alfresco
RUN echo "alfresco:alfresco" | chpasswd
RUN chown -R alfresco:alfresco /opt/alfresco-acs52

ENTRYPOINT /tmp/alf_data.sh && runuser -l alfresco -c '/opt/alfresco-acs52/alfresco.sh start' && /bin/bash
