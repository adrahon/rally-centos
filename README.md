## Openstack Rally CentOS Dockerfile

A **Dockerfile** for [OpenStack Rally](https://wiki.openstack.org/wiki/Rally/) on **CentOS 7**. The resulting Docker image is published on the Docker Hub Registry using their automated build service at https://registry.hub.docker.com/u/adrahon/rally-centos/.

### Usage

1. Install the image on your host with `docker pull adrahon/rally-centos`.

2. Run the container in interactive mode `docker run -ti adrahon/rally-centos`.

3. Use rally as you usually would, eg. `rally --version` ... 
 
### Future plans

Currently this is just a duplication of the official Dockerfile based on Ubuntu, with some dependencies pulled from RPM packages instead of the Python repository. There's more work to do on dockerising Rally, using a volume for data, avoiding the use of a bash console...

