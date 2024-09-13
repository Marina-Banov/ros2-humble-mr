FROM osrf/ros:humble-desktop
RUN useradd -ms /bin/bash student && usermod -aG sudo student
RUN echo "student ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER student
WORKDIR /home/student
COPY ./install_docker.sh ./install.sh
RUN sudo chown student:student /home/student/install.sh
RUN chmod +x /home/student/install.sh
RUN /home/student/install.sh
RUN sudo apt install nano
CMD ["bash"]
