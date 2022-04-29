FROM pytorchlightning/pytorch_lightning
RUN apt-key del 7fa2af80 && apt-key del A4B469963BF863CC \
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb && \
dpkg -i cuda-keyring_1.0-1_all.deb && \
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb && \
dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt-get update && apt-get install -y libsndfile1 ffmpeg
RUN pyton3 -m pip install librosa pydub
CMD ["sh","-c", "jupyter lab --no-browser --ip=0.0.0.0 --allow-root --notebook-dir='/code' --port=8888 --LabApp.token='' --LabApp.allow_origin='*' --LabApp.base_url=$OCTOPUS_JPY_BASE_URL"]
