FROM python:3.10-alpine
ENV TZ="Asia/Shanghai"
COPY . /app
WORKDIR /app
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add build-base && \
    pip config set global.index-url 'https://pypi.tuna.tsinghua.edu.cn/simple' && \
    pip install --no-cache -r requirements.txt && \ 
    apk del build-base
ENTRYPOINT ["python", "main.py"]