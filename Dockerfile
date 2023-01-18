FROM python:3.10
ENV TZ="Asia/Shanghai"
COPY . /app
WORKDIR /app
RUN pip config set global.index-url 'https://pypi.tuna.tsinghua.edu.cn/simple' && \
    pip install --no-cache -r requirements.txt
ENTRYPOINT ["python", "main.py"]