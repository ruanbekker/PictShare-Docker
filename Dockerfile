FROM ruanbekker/pictshare-backend:base

WORKDIR /usr/share/nginx/html

# AUTO_UPDATE=true so will fetch pictshare-data
# https://github.com/HaschekSolutions/PictShare-Docker/blob/master/Dockerfile#L84-L91
#ADD pictshare-data /tmp/pictshare-data

RUN set -x \
    && mv /tmp/pictshare-data/* . \
    && chown -R nginx:nginx /usr/share/nginx/html \
    && chmod +x bin/ffmpeg

VOLUME /usr/share/nginx/html/data

EXPOSE 80

ENTRYPOINT ["bash", "/pictshare.sh"]
