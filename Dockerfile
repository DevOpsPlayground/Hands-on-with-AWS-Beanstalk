FROM ubuntu:18.04

# Update packages
RUN apt-get update -y

# Install Python Setuptools
RUN apt-get install -y python-setuptools ca-certificates

#  Updating the bundled CA Certificates
RUN update-ca-certificates

# Install pip
RUN python /usr/lib/python2.7/dist-packages/easy_install.py pip

# Add and install Python modules
ADD requirements.txt /src/requirements.txt
RUN cd /src; pip install -r requirements.txt

# Bundle app source
ADD . /src

# Expose ports
EXPOSE 5000

# Run
CMD ["python", "/src/application.py"]