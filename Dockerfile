FROM ubuntu 
RUN apt update 
RUN apt install –y apache2 
RUN apt install –y apache2-utils 
RUN apt clean 
EXPOSE 8080 
CMD [“apache2ctl”, “-D”, “FOREGROUND”]
