FROM pytorchlightning/pytorch_lightning
RUN apt-get update && apt-get install -y libsndfile1 ffmpeg
RUN pyton3 -m pip install librosa pydub
CMD ["sh","-c", "jupyter lab --no-browser --ip=0.0.0.0 --allow-root --notebook-dir='/code' --port=8888 --LabApp.token='' --LabApp.allow_origin='*' --LabApp.base_url=$OCTOPUS_JPY_BASE_URL"]
