# Docker-POPFile
An unofficial docker container for POPFile 1.1.3 [Multi Platform]

POPFile automatically sorts your email messages and fights spam. See:
http://getpopfile.org/

## Source Build
Based on the Docker file created by Kris Nelson
https://github.com/krisnelson/Docker-POPFile

## Example Docker Containers
(persist data is docker volume, interface at port 7070, POP not exposed)
docker run -d \
  -p 7070:8080 \
  -v /etc/localtime:/etc/localtime:ro \
  -v /home/popfile/popfile-data/:/data \
  --name "popfile" \
  popfile

(persist data on local filesystem)
docker run -d \
   --restart unless-stopped \
   -p 8080:8080 \
   -p 110:110 \ 
   -v /etc/localtime:/etc/localtime:ro \
   --mount type=bind,source=C:/ProgramData/POPFile,target=/Data \
   --name "popfile" \
   popfile
