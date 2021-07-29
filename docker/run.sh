 docker run \
    -it \
    --rm \
    --gpus all \
    -p 8888:8888 \
    -v /home/matsuda/stats_env/workdir:/home/jovyan/workdir \
    python_ubuntu_t:v1.0 \
    jupyter lab --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser --allow-root --port=8888 --NotebookApp.token='' --NotebookApp.password='' --NotebookApp.allow_origin='*'