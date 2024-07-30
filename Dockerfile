# Usa una imagen base de Ubuntu
FROM ubuntu:bionic

# Actualiza e instala dependencias
RUN apt-get update && apt-get install -y \
    python3-venv \
    python3-pip \
    zip \
    && apt-get clean

# Deshabilita los servicios apt-daily eliminando el cron job
RUN rm -f /etc/cron.daily/apt-compat

# Crea un alias para python3
RUN touch /root/.bash_aliases && \
    echo "# PYTHON_ALIAS_ADDED" >> /root/.bash_aliases && \
    echo "alias python='python3'" >> /root/.bash_aliases

# Configura el directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto al contenedor
COPY . /app

# Copia específicamente el archivo requirements.txt al contenedor
COPY requirements.txt /app/requirements.txt

# Instala las dependencias del proyecto
RUN pip3 install -r /app/requirements.txt

# Expone el puerto 8000
EXPOSE 8000

# Comando por defecto para ejecutar el servidor de Django
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
