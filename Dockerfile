FROM python:3.9

RUN apt-get update && apt-get install -y sudo

# Install required system libraries 
RUN sudo apt-get update \
  && sudo apt-get install -y \
  libgl1-mesa-glx \
  libgtk2.0-0 libsm6 \
  libxext6 \
  ffmpeg \
  && sudo rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip3 install -r requirements.txt


ENTRYPOINT [ "python3" ]
CMD [ "-m", "openpifpaf.video", "--source", "50waystofall.mp4", "--video-output", "--json-output" ]
