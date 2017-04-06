/bin/mv /opt/alfresco-acs52/alf_data/* /opt/alf_data/
/bin/rm -rf /opt/alfresco-acs52/alf_data
ln -s /opt/alf_data/ /opt/alfresco-acs52/
chown -R alfresco:alfresco /opt/alf_data
