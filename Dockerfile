FROM ubuntu 
RUN apt update 
RUN apt install apache2 
RUN apt install apache2-utils 
RUN apt clean 
EXPOSE 8080 
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
