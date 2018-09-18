FROM httpd:2.4-alpine

RUN sed -i 's/\(^IndexOptions.*\)/\1 Charset=UTF-8 NameWidth=*/g' /usr/local/apache2/conf/extra/httpd-autoindex.conf \
    && sed -i 's|#Include conf/extra/httpd-autoindex.conf|Include conf/extra/httpd-autoindex.conf|g' /usr/local/apache2/conf/httpd.conf 
