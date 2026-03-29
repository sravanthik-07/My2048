# Use Amazon Linux
FROM amazonlinux:2

# Install Apache
RUN yum update -y && \
    yum install -y httpd && \
    yum clean all

# Set ServerName to suppress warning
RUN echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf

# Copy project files
COPY . /var/www/html/

# Expose port
EXPOSE 80

# Run Apache in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
