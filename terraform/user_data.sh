#!/bin/bash

set -e

apt-get update

apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Jenkins Terraform Deployment</title>
</head>

<body>

    <h1>Jenkins + Terraform Deployment Successful</h1>

    <h2>AWS EC2 Web Server</h2>

    <p>This application was deployed automatically.</p>

    <p>
        Deployment Flow:
        GitHub → Jenkins → Terraform → AWS EC2 → Nginx
    </p>

</body>
</html>
EOF

systemctl restart nginx
