ARG PARENT_IMAGE
ARG USE_GPU
FROM $PARENT_IMAGE

ENV CODE_DIR /root/code
ENV VENV /root/venv
COPY requirements.txt /tmp/


RUN mkdir -p ${CODE_DIR}/rl_zoo
RUN pip install -r /tmp/requirements.txt
RUN apt-get -y update && apt-get install wget # buildkit
RUN mkdir -p /root/.mujoco \
    && wget https://mujoco.org/download/mujoco210-linux-x86_64.tar.gz -O mujoco.tar.gz \
    && tar -xf mujoco.tar.gz -C /root/.mujoco \
    && rm mujoco.tar.gz
ENV LD_LIBRARY_PATH=/root/.mujoco/mujoco210/bin

RUN pip install Cython==0.29.34 && pip install protobuf==3.20.0
RUN apt-get -y install libosmesa6-dev
RUN pip install hydra-core==0.11.0 librosa==0.7.2 omegaconf==1.4.1
RUN apt-get update -y   && apt-get install -y patchelf
RUN pip install dm_control
RUN apt-get install unzip

RUN mkdir -p /root/.mujoco \
    && wget https://www.roboti.us/download/mujoco200_linux.zip -O mujoco200.zip \
    && unzip mujoco200.zip -d /root/.mujoco \
    && rm mujoco200.zip

RUN apt-get install -y libglfw3 libglew2.1
RUN wget https://www.roboti.us/file/mjkey.txt -O /root/.mujoco/mjkey.txt
RUN pip install git+https://github.com/denisyarats/dmc2gym.git
RUN pip install git+https://github.com/Farama-Foundation/Metaworld.git@04be337a12305e393c0caf0cbf5ec7755c7c8feb
RUN pip install wandb
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117 --upgrade --force-reinstall
RUN pip install loralib
RUN pip install box2d-py

COPY . /root/code/rl_zoo
COPY docker/entrypoint.sh /tmp/
RUN chmod +x /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]

CMD /bin/bash



