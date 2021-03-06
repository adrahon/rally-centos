FROM centos:latest
MAINTAINER Alex Drahon <adrahon@gmail.com>
COPY rally/ /tmp/rally
RUN yum install -y git wget bash-completion python-devel libffi-devel gmp-devel \
        gcc libxml2-devel libxslt-devel openssl-devel postgresql-devel \
        babel python-decorator python-jinja2 python-netaddr python-six \
        PyYAML python-psycopg2 python-requests python27-python-sqlalchemy \
        python-sphinx python-virtualenv pyOpenSSL python-lxml &&\
    cd /tmp &&\
    curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" &&\
    python get-pip.py &&\
    cd /tmp/rally &&\
    ./install_rally.sh &&\
    sed 's|#*connection *=.*|connection = sqlite:////home/rally/.rally.sqlite|' -i /etc/rally/rally.conf &&\
    yum remove -y openssl-devel python-devel gmp-devel libxml2-devel libxslt-devel postgresql-devel git gcc cpp glibc-devel glibc-headers kernel-headers keyutils-libs-devel krb5-devel libcom_err-devel libgcrypt-devel libgpg-error-devel libselinux-devel libsepol-devel libverto-devel pcre-devel zlib-devel &&\
    yum autoremove -y &&\
    yum clean all &&\
    mv doc /usr/share/doc/rally &&\
    rm -rf /tmp/* &&\
    useradd -u 65500 -m rally &&\
    ln -s /usr/share/doc/rally /home/rally/rally-docs
USER rally
CMD bash --login
ENV HOME /home/rally
WORKDIR /home/rally
