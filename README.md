# nginx-ssl-auto

Automatically built Nginx image with a self-signed SSL certificate. The image is refreshed weekly via GitHub Actions.

## Features

- Nginx with automatically generated self-signed SSL certificate
- Automatic HTTP to HTTPS redirection
- Weekly certificate renewal
- Manual build trigger option via GitHub Actions

## Usage

### Running Locally

1. Clone the repository:
```bash
git clone git@github.com:piotrowskimichalwfis/nginx-ssl-auto.git
cd nginx-ssl-auto
```

2. Build the image:
```bash
docker build -t nginx-ssl-auto:latest .
```

3. Run the container:
```bash
docker run -d -p 80:80 -p 443:443 nginx-ssl-auto:latest
```

4. Access in browser:
- http://localhost (will redirect to https)
- https://localhost (accept the self-signed certificate)

### Using Docker Hub Image

You can pull the pre-built image from Docker Hub:

```bash
docker pull Tatarinho/nginx-ssl-auto:latest
docker run -d -p 80:80 -p 443:443 piotrowskimichalwfis/nginx-ssl-auto:latest
```

## Docker Images

All images are available on Docker Hub at:
https://hub.docker.com/u/piotrowskimichalwfis

## Automated Builds

The image is automatically built:
- Every Sunday at midnight
- Can be manually triggered via GitHub Actions (using the "Run workflow" button)

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── docker-build.yml    # GitHub Actions configuration
├── Dockerfile                  # image definition
├── nginx.conf                  # Nginx configuration
└── README.md                  # this file
```

## SSL Certificates

Certificates are generated during image build and are self-signed. For production environments, it's recommended to use proper SSL certificates.