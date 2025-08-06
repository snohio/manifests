# nginx.pp

# Detect OS family and install NGINX accordingly
case $facts['os']['family'] {
  'Debian': {
    package { 'nginx':
      ensure => installed,
    }

    service { 'nginx':
      ensure => running,
      enable => true,
    }

    file { '/var/www/html/index.nginx-debian.html':
      ensure  => file,
      content => @("EOF"),
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chef Courier - Puppet Deployment</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    margin: 0;
                    padding: 20px;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
                .container {
                    background: white;
                    padding: 40px;
                    border-radius: 10px;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    text-align: center;
                    max-width: 600px;
                }
                h1 {
                    color: #333;
                    margin-bottom: 20px;
                }
                .info {
                    font-size: 18px;
                    color: #666;
                    line-height: 1.6;
                }
                .highlight {
                    color: #667eea;
                    font-weight: bold;
                }
                .tech-stack {
                    background: #f8f9fa;
                    padding: 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🚀 Hello Chef!</h1>
                <div class="info">
                    <p>This is <span class="highlight">NGINX</span> installed using a Puppet Manifest</p>
                    <p>Executed by <span class="highlight"><a href="https://www.chef.io/products/job-orchestration">Chef Courier</a></span></p>
                    
                    <div class="tech-stack">
                        <h3>Technology Stack</h3>
                        <ul style="list-style: none; padding: 0;">
                            <li>🐧 <strong>OS:</strong> ${facts['os']['name']} ${facts['os']['release']['full']}</li>
                            <li>🌐 <strong>Web Server:</strong> NGINX</li>
                            <li>🤖 <strong>Configuration Management:</strong> Puppet</li>
                            <li>👨‍🍳 <strong>Orchestration:</strong> Chef Courier</li>
                        </ul>
                    </div>
                    
                    <p style="margin-top: 20px; font-size: 14px; color: #999;">
                        Server: ${facts['networking']['fqdn']}
                    </p>
                </div>
            </div>
        </body>
        </html>
        | EOF
      require => Package['nginx'],
    }
  }

  'RedHat': {
    package { 'nginx':
      ensure => installed,
    }

    service { 'nginx':
      ensure => running,
      enable => true,
    }

    file { '/usr/share/nginx/html/index.html':
      ensure  => file,
      content => @("EOF"),
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Chef Courier - Puppet Deployment</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                    margin: 0;
                    padding: 20px;
                    min-height: 100vh;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                }
                .container {
                    background: white;
                    padding: 40px;
                    border-radius: 10px;
                    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                    text-align: center;
                    max-width: 600px;
                }
                h1 {
                    color: #333;
                    margin-bottom: 20px;
                }
                .info {
                    font-size: 18px;
                    color: #666;
                    line-height: 1.6;
                }
                .highlight {
                    color: #667eea;
                    font-weight: bold;
                }
                .tech-stack {
                    background: #f8f9fa;
                    padding: 20px;
                    border-radius: 5px;
                    margin-top: 20px;
                }
            </style>
        </head>
        <body>
            <div class="container">
                <h1>🚀 Hello Chef!</h1>
                <div class="info">
                    <p>This is <span class="highlight">NGINX</span> installed using a Puppet Manifest</p>
                    <p>Executed by <span class="highlight">Chef Courier</span></p>
                    
                    <div class="tech-stack">
                        <h3>Technology Stack</h3>
                        <ul style="list-style: none; padding: 0;">
                            <li>🐧 <strong>OS:</strong> ${facts['os']['name']} ${facts['os']['release']['full']}</li>
                            <li>🌐 <strong>Web Server:</strong> NGINX</li>
                            <li>🤖 <strong>Configuration Management:</strong> Puppet</li>
                            <li>👨‍🍳 <strong>Orchestration:</strong> Chef Courier</li>
                        </ul>
                    </div>
                    
                    <p style="margin-top: 20px; font-size: 14px; color: #999;">
                        Server: ${facts['networking']['fqdn']}
                    </p>
                </div>
            </div>
        </body>
        </html>
        | EOF
      require => Package['nginx'],
    }
  }

  default: {
    notify { 'Unsupported OS family for this manifest.':
      message => 'This manifest supports only Debian and RedHat families.',
    }
  }
}
