FROM ubuntu

MAINTAINER Y Laizet <y.laizet@bordeaux.unicancer.fr>

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libjpeg8 \
    libjpeg8-dev \
    zlib1g-dev \
    openslide-tools \
    python-pip \
    python-dev \
    python-pil

RUN pip install --upgrade pip
RUN pip install openslide-python flask

RUN git clone https://github.com/ylaizet/openslide-python.git
RUN cd openslide-python && git checkout

WORKDIR openslide-python/examples/deepzoom

RUN mkdir /slides

EXPOSE 5000

CMD ["python", "deepzoom_multiserver.py", "-l", "0.0.0.0", "/slides/"]
